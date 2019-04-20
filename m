From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 16:30:31 +0200
Subject: [Buildroot] [git commit] package/dhcp: bump to version 4.4.1
Message-ID: <20190420142602.614958EE99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8df8cb98471098ad39e1904786e354a0d423e71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use --with-bind-extra-config option to:
  - add --without-zlib otherwise static build will fail if zlib is found
    on host
  - Add --without-dlopen otherwise static build will fail
- Drop all patches (already in version)
- Drop autoreconf (not needed anymore)
- Update license to MPL-2.0:
  https://www.isc.org/blogs/isc-dhcp-moves-to-mpl-2-0-license
- Update hash of license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dhcp/0001-bind-cross-compile.patch         | 24 ---------
 ...3-Plugs-a-socket-descriptor-leak-in-OMAPI.patch | 51 -------------------
 ...ect-buffer-overrun-in-pretty_print_option.patch | 59 ----------------------
 ...4-Corrected-refcnt-loss-in-option-parsing.patch | 40 ---------------
 package/dhcp/dhcp.hash                             |  6 +--
 package/dhcp/dhcp.mk                               | 26 +++++-----
 6 files changed, 16 insertions(+), 190 deletions(-)

diff --git a/package/dhcp/0001-bind-cross-compile.patch b/package/dhcp/0001-bind-cross-compile.patch
deleted file mode 100644
index f7c42c6ce2..0000000000
--- a/package/dhcp/0001-bind-cross-compile.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-bind cross compile support integration
-
-Pass system types from dhcp configure to bind configure.
-
-This patch is submitted upstream as part of a cross compiling enhancement
-suggestion to dhcp-suggest at isc.org. Reference ISC-Bugs #41502.
-
-Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
-
-Index: dhcp-4.3.3-P1/bind/Makefile.in
-===================================================================
---- dhcp-4.3.3-P1.orig/bind/Makefile.in
-+++ dhcp-4.3.3-P1/bind/Makefile.in
-@@ -30,7 +30,9 @@ bindconfig = --disable-kqueue --disable-
- 	--without-openssl --without-libxml2 --enable-exportlib \
- 	--with-gssapi=no --enable-threads=no @BINDCONFIG@ \
- 	--with-export-includedir=${binddir}/include \
--	--with-export-libdir=${binddir}/lib
-+	--with-export-libdir=${binddir}/lib \
-+	--target=@target_alias@ --host=@host_alias@ \
-+	--build=@build_alias@
- 
- @BIND_ATF_FALSE at cleandirs = ./lib ./include
- @BIND_ATF_TRUE at cleandirs = ./lib ./include ./atf
diff --git a/package/dhcp/0002-v4_3-Plugs-a-socket-descriptor-leak-in-OMAPI.patch b/package/dhcp/0002-v4_3-Plugs-a-socket-descriptor-leak-in-OMAPI.patch
deleted file mode 100644
index df294651fb..0000000000
--- a/package/dhcp/0002-v4_3-Plugs-a-socket-descriptor-leak-in-OMAPI.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 5097bc0559f592683faac1f67bf350e1bddf6ed4 Mon Sep 17 00:00:00 2001
-From: Thomas Markwalder <tmark@isc.org>
-Date: Thu, 7 Dec 2017 11:39:30 -0500
-Subject: [PATCH] [v4_3] Plugs a socket descriptor leak in OMAPI
-
-        Merges in rt46767.
-
-[baruch: drop RELNOTES hunk]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream commit 5097bc0559f
-
- omapip/buffer.c  | 9 +++++++++
- omapip/message.c | 2 +-
-
-diff --git a/omapip/buffer.c b/omapip/buffer.c
-index f7fdc3250e82..809034d1317b 100644
---- a/omapip/buffer.c
-+++ b/omapip/buffer.c
-@@ -566,6 +566,15 @@ isc_result_t omapi_connection_writer (omapi_object_t *h)
- 			omapi_buffer_dereference (&buffer, MDL);
- 		}
- 	}
-+
-+	/* If we had data left to write when we're told to disconnect,
-+	* we need recall disconnect, now that we're done writing.
-+	* See rt46767. */
-+	if (c->out_bytes == 0 && c->state == omapi_connection_disconnecting) {
-+		omapi_disconnect (h, 1);
-+		return ISC_R_SHUTTINGDOWN;
-+	}
-+
- 	return ISC_R_SUCCESS;
- }
- 
-diff --git a/omapip/message.c b/omapip/message.c
-index 59ccdc2c05cf..21bcfc3822e7 100644
---- a/omapip/message.c
-+++ b/omapip/message.c
-@@ -339,7 +339,7 @@ isc_result_t omapi_message_unregister (omapi_object_t *mo)
- }
- 
- #ifdef DEBUG_PROTOCOL
--static const char *omapi_message_op_name(int op) {
-+const char *omapi_message_op_name(int op) {
- 	switch (op) {
- 	case OMAPI_OP_OPEN:    return "OMAPI_OP_OPEN";
- 	case OMAPI_OP_REFRESH: return "OMAPI_OP_REFRESH";
--- 
-2.15.1
-
diff --git a/package/dhcp/0003-Correct-buffer-overrun-in-pretty_print_option.patch b/package/dhcp/0003-Correct-buffer-overrun-in-pretty_print_option.patch
deleted file mode 100644
index aad20ff93f..0000000000
--- a/package/dhcp/0003-Correct-buffer-overrun-in-pretty_print_option.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From b8c29336bd5401a5f962bc6ddfa4ebb6f0274f3c Mon Sep 17 00:00:00 2001
-From: Thomas Markwalder <tmark@isc.org>
-Date: Sat, 10 Feb 2018 12:15:27 -0500
-Subject: [PATCH 1/2] Correct buffer overrun in pretty_print_option
-
-    Merges in rt47139.
-
-[baruch: drop RELNOTES and test; address CVE-2018-5732]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: backported from commit c5931725b48
----
- common/options.c | 15 ++++++++++++---
- 1 file changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/common/options.c b/common/options.c
-index 5547287fb6e5..2ed6b16c6412 100644
---- a/common/options.c
-+++ b/common/options.c
-@@ -1758,7 +1758,8 @@ format_min_length(format, oc)
- 
- 
- /* Format the specified option so that a human can easily read it. */
--
-+/* Maximum pretty printed size */
-+#define MAX_OUTPUT_SIZE 32*1024
- const char *pretty_print_option (option, data, len, emit_commas, emit_quotes)
- 	struct option *option;
- 	const unsigned char *data;
-@@ -1766,8 +1767,9 @@ const char *pretty_print_option (option, data, len, emit_commas, emit_quotes)
- 	int emit_commas;
- 	int emit_quotes;
- {
--	static char optbuf [32768]; /* XXX */
--	static char *endbuf = &optbuf[sizeof(optbuf)];
-+	/* We add 128 byte pad so we don't have to add checks everywhere. */
-+	static char optbuf [MAX_OUTPUT_SIZE + 128]; /* XXX */
-+	static char *endbuf = optbuf + MAX_OUTPUT_SIZE;
- 	int hunksize = 0;
- 	int opthunk = 0;
- 	int hunkinc = 0;
-@@ -2193,7 +2195,14 @@ const char *pretty_print_option (option, data, len, emit_commas, emit_quotes)
- 				log_error ("Unexpected format code %c",
- 					   fmtbuf [j]);
- 			}
-+
- 			op += strlen (op);
-+			if (op >= endbuf) {
-+				log_error ("Option data exceeds"
-+					   " maximum size %d", MAX_OUTPUT_SIZE);
-+					   return ("<error>");
-+			}
-+
- 			if (dp == data + len)
- 				break;
- 			if (j + 1 < numelem && comma != ':')
--- 
-2.16.1
-
diff --git a/package/dhcp/0004-Corrected-refcnt-loss-in-option-parsing.patch b/package/dhcp/0004-Corrected-refcnt-loss-in-option-parsing.patch
deleted file mode 100644
index c79bbc7f82..0000000000
--- a/package/dhcp/0004-Corrected-refcnt-loss-in-option-parsing.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 93b5b67dd31b9efcbfaabc2df1e1d9d164a5e04a Mon Sep 17 00:00:00 2001
-From: Thomas Markwalder <tmark@isc.org>
-Date: Fri, 9 Feb 2018 14:46:08 -0500
-Subject: [PATCH 2/2] Corrected refcnt loss in option parsing
-
-    Merges in 47140.
-
-[baruch: drop RELNOTES and tests; address CVE-2018-5733]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: backported from commit 197b26f25309
----
- common/options.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/common/options.c b/common/options.c
-index 2ed6b16c6412..25b29a6be7bb 100644
---- a/common/options.c
-+++ b/common/options.c
-@@ -3,7 +3,7 @@
-    DHCP options parsing and reassembly. */
- 
- /*
-- * Copyright (c) 2004-2017 by Internet Systems Consortium, Inc. ("ISC")
-+ * Copyright (c) 2004-2018 by Internet Systems Consortium, Inc. ("ISC")
-  * Copyright (c) 1995-2003 by Internet Software Consortium
-  *
-  * Permission to use, copy, modify, and distribute this software for any
-@@ -177,6 +177,8 @@ int parse_option_buffer (options, buffer, length, universe)
- 
- 		/* If the length is outrageous, the options are bad. */
- 		if (offset + len > length) {
-+			/* Avoid reference count overflow */
-+			option_dereference(&option, MDL);
- 			reason = "option length exceeds option buffer length";
- 		      bogus:
- 			log_error("parse_option_buffer: malformed option "
--- 
-2.16.1
-
diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
index ce5f995a55..df07a32557 100644
--- a/package/dhcp/dhcp.hash
+++ b/package/dhcp/dhcp.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/dhcp/4.3.6/dhcp-4.3.6.tar.gz.sha256.asc
-sha256 a41eaf6364f1377fe065d35671d9cf82bbbc8f21207819b2b9f33f652aec6f1b  dhcp-4.3.6.tar.gz
+# Verified from https://ftp.isc.org/isc/dhcp/4.4.1/dhcp-4.4.1.tar.gz.sha256.asc
+sha256 2a22508922ab367b4af4664a0472dc220cc9603482cf3c16d9aff14f3a76b608  dhcp-4.4.1.tar.gz
 # Locally calculated
-sha256 dd7ae2201c0c11c3c1e2510d731c67b2f4bc8ba735707d7348ddd65f7b598562  LICENSE
+sha256 18add1790d1ed47d6ef6f3ed5945aa0cb2f7785fa8bc7fd859f8ae2f9f78567d  LICENSE
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index a1285184d3..812e4870b9 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-DHCP_VERSION = 4.3.6
+DHCP_VERSION = 4.4.1
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
-DHCP_LICENSE = ISC
+DHCP_LICENSE = MPL-2.0
 DHCP_LICENSE_FILES = LICENSE
 DHCP_CONF_ENV = \
 	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
@@ -15,6 +15,7 @@ DHCP_CONF_ENV = \
 	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
 
 DHCP_CONF_OPTS = \
+	--with-bind-extra-config="$(DHCP_BIND_CONF_OPTS)" \
 	--with-randomdev=/dev/random \
 	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
 	--with-srv6-lease-file=/var/lib/dhcp/dhcpd6.leases \
@@ -27,17 +28,6 @@ DHCP_CONF_OPTS = \
 	--with-relay-pid-file=/var/run/dhcrelay.pid \
 	--with-relay6-pid-file=/var/run/dhcrelay6.pid
 
-# The source for the bind libraries used by dhcp are embedded in the dhcp source
-# as a tar-ball. Extract the bind source to allow any patches to be applied
-# during the patch phase.
-define DHCP_EXTRACT_BIND
-	cd $(@D)/bind; tar -xvf bind.tar.gz
-endef
-DHCP_POST_EXTRACT_HOOKS += DHCP_EXTRACT_BIND
-
-# The patchset requires configure et.al. to be regenerated.
-DHCP_AUTORECONF = YES
-
 # bind does not support parallel builds.
 DHCP_MAKE = $(MAKE1)
 
@@ -54,6 +44,16 @@ ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
 DHCP_CONF_OPTS += --enable-delayed-ack
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+DHCP_BIND_CONF_OPTS += --with-zlib
+else
+DHCP_BIND_CONF_OPTS += --without-zlib
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+DHCP_BIND_CONF_OPTS += --without-dlopen
+endif
+
 ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
 define DHCP_INSTALL_SERVER
 	mkdir -p $(TARGET_DIR)/var/lib
