From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:23:06 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] spice: security bump to
 version 0.14.1
Message-ID: <20181024122123.9F1A688951@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=025ba3e580f63a157306a8be5a16156dbbe6bbb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixes CVE-2018-10873: A vulnerability was discovered in SPICE before version
0.14.1 where the generated code used for demarshalling messages lacked
sufficient bounds checks.  A malicious client or server, after
authentication, could send specially crafted messages to its peer which
would result in a crash or, potentially, other impacts.

Drop patches as they are now upstream.

Add host-pkgconf as the configure script uses pkg-config.  Drop removed
--disable-automated-tests configure flag.

Add optional opus support, as that is now supported and needs to be
explicitly disabled to not use.  Explicitly disable optional gstreamer
support for now as the dependency tree is fairly complicated.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f33f7a4f6407f624edb4b4ffe54cb09e029a49b2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sible-DoS-attempts-during-protocol-handsh.patch | 60 -----------------
 ...nt-integer-overflows-in-capability-checks.patch | 43 -------------
 ...l-Prevent-overflow-reading-messages-from-.patch | 33 ----------
 ...nect-when-receiving-overly-big-ClientMoni.patch | 75 ----------------------
 ...integer-overflows-handling-monitor-config.patch | 31 ---------
 ...buffer-overflows-handling-monitor-configu.patch | 48 --------------
 package/spice/spice.hash                           |  2 +-
 package/spice/spice.mk                             | 14 +++-
 8 files changed, 12 insertions(+), 294 deletions(-)

diff --git a/package/spice/0001-Prevent-possible-DoS-attempts-during-protocol-handsh.patch b/package/spice/0001-Prevent-possible-DoS-attempts-during-protocol-handsh.patch
deleted file mode 100644
index 57a64d96b7..0000000000
--- a/package/spice/0001-Prevent-possible-DoS-attempts-during-protocol-handsh.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 1c6517973095a67c8cb57f3550fc1298404ab556 Mon Sep 17 00:00:00 2001
-From: Frediano Ziglio <fziglio@redhat.com>
-Date: Tue, 13 Dec 2016 14:39:48 +0000
-Subject: [PATCH] Prevent possible DoS attempts during protocol handshake
-
-The limit for link message is specified using a 32 bit unsigned integer.
-This could cause possible DoS due to excessive memory allocations and
-some possible crashes.
-For instance a value >= 2^31 causes a spice_assert to be triggered in
-async_read_handler (reds-stream.c) due to an integer overflow at this
-line:
-
-   int n = async->end - async->now;
-
-This could be easily triggered with a program like
-
-  #!/usr/bin/env python
-
-  import socket
-  import time
-  from struct import pack
-
-  server = '127.0.0.1'
-  port = 5900
-
-  s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
-  s.connect((server, port))
-  data = pack('<4sIII', 'REDQ', 2, 2, 0xaaaaaaaa)
-  s.send(data)
-
-  time.sleep(1)
-
-without requiring any authentication (the same can be done
-with TLS).
-
-[Peter: fixes CVE-2016-9578]
-Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
-Acked-by: Christophe Fergeau <cfergeau@redhat.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- server/reds.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/server/reds.c b/server/reds.c
-index f40b65c1..86a33d53 100644
---- a/server/reds.c
-+++ b/server/reds.c
-@@ -2202,7 +2202,8 @@ static void reds_handle_read_header_done(void *opaque)
- 
-     reds->peer_minor_version = header->minor_version;
- 
--    if (header->size < sizeof(SpiceLinkMess)) {
-+    /* the check for 4096 is to avoid clients to cause arbitrary big memory allocations */
-+    if (header->size < sizeof(SpiceLinkMess) || header->size > 4096) {
-         reds_send_link_error(link, SPICE_LINK_ERR_INVALID_DATA);
-         spice_warning("bad size %u", header->size);
-         reds_link_free(link);
--- 
-2.11.0
-
diff --git a/package/spice/0002-Prevent-integer-overflows-in-capability-checks.patch b/package/spice/0002-Prevent-integer-overflows-in-capability-checks.patch
deleted file mode 100644
index 5bf9b89d17..0000000000
--- a/package/spice/0002-Prevent-integer-overflows-in-capability-checks.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From f66dc643635518e53dfbe5262f814a64eec54e4a Mon Sep 17 00:00:00 2001
-From: Frediano Ziglio <fziglio@redhat.com>
-Date: Tue, 13 Dec 2016 14:40:10 +0000
-Subject: [PATCH] Prevent integer overflows in capability checks
-
-The limits for capabilities are specified using 32 bit unsigned integers.
-This could cause possible integer overflows causing buffer overflows.
-For instance the sum of num_common_caps and num_caps can be 0 avoiding
-additional checks.
-As the link message is now capped to 4096 and the capabilities are
-contained in the link message limit the capabilities to 1024
-(capabilities are expressed in number of uint32_t items).
-
-[Peter: fixes CVE-2016-9578]
-Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
-Acked-by: Christophe Fergeau <cfergeau@redhat.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- server/reds.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/server/reds.c b/server/reds.c
-index 86a33d53..91504544 100644
---- a/server/reds.c
-+++ b/server/reds.c
-@@ -2110,6 +2110,14 @@ static void reds_handle_read_link_done(void *opaque)
-     link_mess->num_channel_caps = GUINT32_FROM_LE(link_mess->num_channel_caps);
-     link_mess->num_common_caps = GUINT32_FROM_LE(link_mess->num_common_caps);
- 
-+    /* Prevent DoS. Currently we defined only 13 capabilities,
-+     * I expect 1024 to be valid for quite a lot time */
-+    if (link_mess->num_channel_caps > 1024 || link_mess->num_common_caps > 1024) {
-+        reds_send_link_error(link, SPICE_LINK_ERR_INVALID_DATA);
-+        reds_link_free(link);
-+        return;
-+    }
-+
-     num_caps = link_mess->num_common_caps + link_mess->num_channel_caps;
-     caps = (uint32_t *)((uint8_t *)link_mess + link_mess->caps_offset);
- 
--- 
-2.11.0
-
diff --git a/package/spice/0003-main-channel-Prevent-overflow-reading-messages-from-.patch b/package/spice/0003-main-channel-Prevent-overflow-reading-messages-from-.patch
deleted file mode 100644
index f602d5f3b1..0000000000
--- a/package/spice/0003-main-channel-Prevent-overflow-reading-messages-from-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5f96b596353d73bdf4bb3cd2de61e48a7fd5b4c3 Mon Sep 17 00:00:00 2001
-From: Frediano Ziglio <fziglio@redhat.com>
-Date: Tue, 29 Nov 2016 16:46:56 +0000
-Subject: [PATCH] main-channel: Prevent overflow reading messages from client
-
-Caller is supposed the function return a buffer able to store
-size bytes.
-
-[Peter: fixes CVE-2016-9577]
-Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
-Acked-by: Christophe Fergeau <cfergeau@redhat.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- server/main_channel.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/server/main_channel.c b/server/main_channel.c
-index 0ecc9df8..1fc39155 100644
---- a/server/main_channel.c
-+++ b/server/main_channel.c
-@@ -1026,6 +1026,9 @@ static uint8_t *main_channel_alloc_msg_rcv_buf(RedChannelClient *rcc,
- 
-     if (type == SPICE_MSGC_MAIN_AGENT_DATA) {
-         return reds_get_agent_data_buffer(mcc, size);
-+    } else if (size > sizeof(main_chan->recv_buf)) {
-+        /* message too large, caller will log a message and close the connection */
-+        return NULL;
-     } else {
-         return main_chan->recv_buf;
-     }
--- 
-2.11.0
-
diff --git a/package/spice/0004-reds-Disconnect-when-receiving-overly-big-ClientMoni.patch b/package/spice/0004-reds-Disconnect-when-receiving-overly-big-ClientMoni.patch
deleted file mode 100644
index 070259f2bb..0000000000
--- a/package/spice/0004-reds-Disconnect-when-receiving-overly-big-ClientMoni.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From f1e7ec03e26ab6b8ca9b7ec060846a5b706a963d Mon Sep 17 00:00:00 2001
-From: Frediano Ziglio <fziglio@redhat.com>
-Date: Mon, 15 May 2017 15:57:28 +0100
-Subject: [PATCH] reds: Disconnect when receiving overly big
- ClientMonitorsConfig
-
-Total message size received from the client was unlimited. There is
-a 2kiB size check on individual agent messages, but the MonitorsConfig
-message can be split in multiple chunks, and the size of the
-non-chunked MonitorsConfig message was never checked. This could easily
-lead to memory exhaustion on the host.
-
-Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- server/reds.c | 25 +++++++++++++++++++++++--
- 1 file changed, 23 insertions(+), 2 deletions(-)
-
-diff --git a/server/reds.c b/server/reds.c
-index f439a366..7be85fdf 100644
---- a/server/reds.c
-+++ b/server/reds.c
-@@ -993,19 +993,34 @@ static void reds_client_monitors_config_cleanup(void)
- static void reds_on_main_agent_monitors_config(
-         MainChannelClient *mcc, void *message, size_t size)
- {
-+    const unsigned int MAX_MONITORS = 256;
-+    const unsigned int MAX_MONITOR_CONFIG_SIZE =
-+       sizeof(VDAgentMonitorsConfig) + MAX_MONITORS * sizeof(VDAgentMonConfig);
-+
-     VDAgentMessage *msg_header;
-     VDAgentMonitorsConfig *monitors_config;
-     RedsClientMonitorsConfig *cmc = &reds->client_monitors_config;
- 
-+    // limit size of message sent by the client as this can cause a DoS through
-+    // memory exhaustion, or potentially some integer overflows
-+    if (sizeof(VDAgentMessage) + MAX_MONITOR_CONFIG_SIZE - cmc->buffer_size < size) {
-+        goto overflow;
-+    }
-     cmc->buffer_size += size;
-     cmc->buffer = realloc(cmc->buffer, cmc->buffer_size);
-     spice_assert(cmc->buffer);
-     cmc->mcc = mcc;
-     memcpy(cmc->buffer + cmc->buffer_pos, message, size);
-     cmc->buffer_pos += size;
-+    if (sizeof(VDAgentMessage) > cmc->buffer_size) {
-+        spice_debug("not enough data yet. %d", cmc->buffer_size);
-+        return;
-+    }
-     msg_header = (VDAgentMessage *)cmc->buffer;
--    if (sizeof(VDAgentMessage) > cmc->buffer_size ||
--            msg_header->size > cmc->buffer_size - sizeof(VDAgentMessage)) {
-+    if (msg_header->size > MAX_MONITOR_CONFIG_SIZE) {
-+        goto overflow;
-+    }
-+    if (msg_header->size > cmc->buffer_size - sizeof(VDAgentMessage)) {
-         spice_debug("not enough data yet. %d", cmc->buffer_size);
-         return;
-     }
-@@ -1013,6 +1028,12 @@ static void reds_on_main_agent_monitors_config(
-     spice_debug("%s: %d", __func__, monitors_config->num_of_monitors);
-     red_dispatcher_client_monitors_config(monitors_config);
-     reds_client_monitors_config_cleanup();
-+    return;
-+
-+overflow:
-+    spice_warning("received invalid MonitorsConfig request from client, disconnecting");
-+    red_channel_client_disconnect(main_channel_client_get_base(mcc));
-+    reds_client_monitors_config_cleanup();
- }
- 
- void reds_on_main_agent_data(MainChannelClient *mcc, void *message, size_t size)
--- 
-2.11.0
-
diff --git a/package/spice/0005-reds-Avoid-integer-overflows-handling-monitor-config.patch b/package/spice/0005-reds-Avoid-integer-overflows-handling-monitor-config.patch
deleted file mode 100644
index 98740520c1..0000000000
--- a/package/spice/0005-reds-Avoid-integer-overflows-handling-monitor-config.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ec6229c79abe05d731953df5f7e9a05ec9f6df79 Mon Sep 17 00:00:00 2001
-From: Frediano Ziglio <fziglio@redhat.com>
-Date: Mon, 15 May 2017 15:57:28 +0100
-Subject: [PATCH] reds: Avoid integer overflows handling monitor
- configuration
-
-Avoid VDAgentMessage::size integer overflows.
-
-Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- server/reds.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/server/reds.c b/server/reds.c
-index 7be85fdf..e1c8c108 100644
---- a/server/reds.c
-+++ b/server/reds.c
-@@ -1024,6 +1024,9 @@ static void reds_on_main_agent_monitors_config(
-         spice_debug("not enough data yet. %d", cmc->buffer_size);
-         return;
-     }
-+    if (msg_header->size < sizeof(VDAgentMonitorsConfig)) {
-+        goto overflow;
-+    }
-     monitors_config = (VDAgentMonitorsConfig *)(cmc->buffer + sizeof(*msg_header));
-     spice_debug("%s: %d", __func__, monitors_config->num_of_monitors);
-     red_dispatcher_client_monitors_config(monitors_config);
--- 
-2.11.0
-
diff --git a/package/spice/0006-reds-Avoid-buffer-overflows-handling-monitor-configu.patch b/package/spice/0006-reds-Avoid-buffer-overflows-handling-monitor-configu.patch
deleted file mode 100644
index 212645b44f..0000000000
--- a/package/spice/0006-reds-Avoid-buffer-overflows-handling-monitor-configu.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From a957a90baf2c62d31f3547e56bba7d0e812d2331 Mon Sep 17 00:00:00 2001
-From: Frediano Ziglio <fziglio@redhat.com>
-Date: Mon, 15 May 2017 15:57:28 +0100
-Subject: [PATCH] reds: Avoid buffer overflows handling monitor
- configuration
-
-It was also possible for a malicious client to set
-VDAgentMonitorsConfig::num_of_monitors to a number larger
-than the actual size of VDAgentMOnitorsConfig::monitors.
-This would lead to buffer overflows, which could allow the guest to
-read part of the host memory. This might cause write overflows in the
-host as well, but controlling the content of such buffers seems
-complicated.
-
-Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- server/reds.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/server/reds.c b/server/reds.c
-index e1c8c108..3a42c375 100644
---- a/server/reds.c
-+++ b/server/reds.c
-@@ -1000,6 +1000,7 @@ static void reds_on_main_agent_monitors_config(
-     VDAgentMessage *msg_header;
-     VDAgentMonitorsConfig *monitors_config;
-     RedsClientMonitorsConfig *cmc = &reds->client_monitors_config;
-+    uint32_t max_monitors;
- 
-     // limit size of message sent by the client as this can cause a DoS through
-     // memory exhaustion, or potentially some integer overflows
-@@ -1028,6 +1029,12 @@ static void reds_on_main_agent_monitors_config(
-         goto overflow;
-     }
-     monitors_config = (VDAgentMonitorsConfig *)(cmc->buffer + sizeof(*msg_header));
-+    // limit the monitor number to avoid buffer overflows
-+    max_monitors = (msg_header->size - sizeof(VDAgentMonitorsConfig)) /
-+                   sizeof(VDAgentMonConfig);
-+    if (monitors_config->num_of_monitors > max_monitors) {
-+        goto overflow;
-+    }
-     spice_debug("%s: %d", __func__, monitors_config->num_of_monitors);
-     red_dispatcher_client_monitors_config(monitors_config);
-     reds_client_monitors_config_cleanup();
--- 
-2.11.0
-
diff --git a/package/spice/spice.hash b/package/spice/spice.hash
index c9b591f41d..1a25926ab2 100644
--- a/package/spice/spice.hash
+++ b/package/spice/spice.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	f901a5c5873d61acac84642f9eea5c4d6386fc3e525c2b68792322794e1c407d	spice-0.12.8.tar.bz2
+sha256	1ead5de63d06eededed4017db37240f07bef0abffbaf621899647e7e685a1519	spice-0.14.1.tar.bz2
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 7b09f39fe7..16e57441a8 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-SPICE_VERSION = 0.12.8
+SPICE_VERSION = 0.14.1
 SPICE_SOURCE = spice-$(SPICE_VERSION).tar.bz2
-SPICE_SITE = http://www.spice-space.org/download/releases
+SPICE_SITE = http://www.spice-space.org/download/releases/spice-server
 SPICE_LICENSE = LGPL-2.1+
 SPICE_LICENSE_FILES = COPYING
 SPICE_INSTALL_STAGING = YES
 SPICE_DEPENDENCIES = \
+	host-pkgconf \
 	jpeg \
 	libglib2 \
 	openssl \
@@ -20,9 +21,9 @@ SPICE_DEPENDENCIES = \
 # We disable everything for now, because the dependency tree can become
 # quite deep if we try to enable some features, and I have not tested that.
 SPICE_CONF_OPTS = \
+	--disable-gstreamer \
 	--disable-opengl \
 	--disable-smartcard \
-	--disable-automated-tests \
 	--without-sasl \
 	--disable-manual
 
@@ -42,6 +43,13 @@ else
 SPICE_CONF_OPTS += --disable-lz4
 endif
 
+ifeq ($(BR2_PACKAGE_OPUS),y)
+SPICE_CONF_OPTS += --enable-opus
+SPICE_DEPENDENCIES += opus
+else
+SPICE_CONF_OPTS += --disable-opus
+endif
+
 # no enable/disable, detected using pkg-config
 ifeq ($(BR2_PACKAGE_OPUS),y)
 SPICE_DEPENDENCIES += opus
