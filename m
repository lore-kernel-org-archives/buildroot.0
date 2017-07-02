From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Jul 2017 18:53:39 +0200
Subject: [Buildroot] [PATCH 17/20] systemd: don't download patches from
	Github
In-Reply-To: <20170702165342.29522-1-thomas.petazzoni@free-electrons.com>
References: <20170702165342.29522-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170702165342.29522-18-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches downloaded from Github are not stable, so bring them in the
tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-of-null-pointer-p-question-dereferencing.patch | 28 ++++++++++++
 ...-resolved-simplify-alloc-size-calculation.patch | 51 ++++++++++++++++++++++
 ...do-not-allocate-packets-with-minimum-size.patch | 48 ++++++++++++++++++++
 ...-getty-unit.patch => 0004-fix-getty-unit.patch} |  0
 ...atch => 0005-build-check-for-ln-relative.patch} |  0
 ...h => 0006-fix-am-path-libgcrypt-no-found.patch} |  0
 package/systemd/systemd.hash                       |  3 --
 package/systemd/systemd.mk                         |  5 ---
 8 files changed, 127 insertions(+), 8 deletions(-)
 create mode 100644 package/systemd/0001-resolved-bugfix-of-null-pointer-p-question-dereferencing.patch
 create mode 100644 package/systemd/0002-resolved-simplify-alloc-size-calculation.patch
 create mode 100644 package/systemd/0003-resolved-do-not-allocate-packets-with-minimum-size.patch
 rename package/systemd/{0001-fix-getty-unit.patch => 0004-fix-getty-unit.patch} (100%)
 rename package/systemd/{0002-build-check-for-ln-relative.patch => 0005-build-check-for-ln-relative.patch} (100%)
 rename package/systemd/{0003-fix-am-path-libgcrypt-no-found.patch => 0006-fix-am-path-libgcrypt-no-found.patch} (100%)

diff --git a/package/systemd/0001-resolved-bugfix-of-null-pointer-p-question-dereferencing.patch b/package/systemd/0001-resolved-bugfix-of-null-pointer-p-question-dereferencing.patch
new file mode 100644
index 0000000..81cecef
--- /dev/null
+++ b/package/systemd/0001-resolved-bugfix-of-null-pointer-p-question-dereferencing.patch
@@ -0,0 +1,28 @@
+From a924f43f30f9c4acaf70618dd2a055f8b0f166be Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Wed, 24 May 2017 08:56:48 +0300
+Subject: [PATCH] resolved: bugfix of null pointer p->question dereferencing
+ (#6020)
+
+See https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/1621396
+
+[Upstream commit: https://github.com/systemd/systemd/commit/a924f43f30f9c4acaf70618dd2a055f8b0f166be]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/resolve/resolved-dns-packet.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/resolve/resolved-dns-packet.c b/src/resolve/resolved-dns-packet.c
+index 652970284e..240ee448f4 100644
+--- a/src/resolve/resolved-dns-packet.c
++++ b/src/resolve/resolved-dns-packet.c
+@@ -2269,6 +2269,9 @@ int dns_packet_is_reply_for(DnsPacket *p, const DnsResourceKey *key) {
+         if (r < 0)
+                 return r;
+ 
++        if (!p->question)
++                return 0;
++
+         if (p->question->n_keys != 1)
+                 return 0;
+ 
diff --git a/package/systemd/0002-resolved-simplify-alloc-size-calculation.patch b/package/systemd/0002-resolved-simplify-alloc-size-calculation.patch
new file mode 100644
index 0000000..5fab905
--- /dev/null
+++ b/package/systemd/0002-resolved-simplify-alloc-size-calculation.patch
@@ -0,0 +1,51 @@
+From db848813bae4d28c524b3b6a7dad135e426659ce Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Sun, 18 Jun 2017 16:07:57 -0400
+Subject: [PATCH] resolved: simplify alloc size calculation
+
+The allocation size was calculated in a complicated way, and for values
+close to the page size we would actually allocate less than requested.
+
+Reported by Chris Coulson <chris.coulson@canonical.com>.
+
+CVE-2017-9445
+
+[Upstream commit: https://github.com/systemd/systemd/commit/db848813bae4d28c524b3b6a7dad135e426659ce]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/resolve/resolved-dns-packet.c | 8 +-------
+ src/resolve/resolved-dns-packet.h | 2 --
+ 2 files changed, 1 insertion(+), 9 deletions(-)
+
+diff --git a/src/resolve/resolved-dns-packet.c b/src/resolve/resolved-dns-packet.c
+index 240ee448f4..821b66e266 100644
+--- a/src/resolve/resolved-dns-packet.c
++++ b/src/resolve/resolved-dns-packet.c
+@@ -47,13 +47,7 @@ int dns_packet_new(DnsPacket **ret, DnsProtocol protocol, size_t mtu) {
+ 
+         assert(ret);
+ 
+-        if (mtu <= UDP_PACKET_HEADER_SIZE)
+-                a = DNS_PACKET_SIZE_START;
+-        else
+-                a = mtu - UDP_PACKET_HEADER_SIZE;
+-
+-        if (a < DNS_PACKET_HEADER_SIZE)
+-                a = DNS_PACKET_HEADER_SIZE;
++        a = MAX(mtu, DNS_PACKET_HEADER_SIZE);
+ 
+         /* round up to next page size */
+         a = PAGE_ALIGN(ALIGN(sizeof(DnsPacket)) + a) - ALIGN(sizeof(DnsPacket));
+diff --git a/src/resolve/resolved-dns-packet.h b/src/resolve/resolved-dns-packet.h
+index 2c92392e4d..3abcaf8cf3 100644
+--- a/src/resolve/resolved-dns-packet.h
++++ b/src/resolve/resolved-dns-packet.h
+@@ -66,8 +66,6 @@ struct DnsPacketHeader {
+ /* With EDNS0 we can use larger packets, default to 4096, which is what is commonly used */
+ #define DNS_PACKET_UNICAST_SIZE_LARGE_MAX 4096
+ 
+-#define DNS_PACKET_SIZE_START 512
+-
+ struct DnsPacket {
+         int n_ref;
+         DnsProtocol protocol;
diff --git a/package/systemd/0003-resolved-do-not-allocate-packets-with-minimum-size.patch b/package/systemd/0003-resolved-do-not-allocate-packets-with-minimum-size.patch
new file mode 100644
index 0000000..7509113
--- /dev/null
+++ b/package/systemd/0003-resolved-do-not-allocate-packets-with-minimum-size.patch
@@ -0,0 +1,48 @@
+From 88795538726a5bbfd9efc13d441cb05e1d7fc139 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Tue, 27 Jun 2017 14:20:00 -0400
+Subject: [PATCH] resolved: do not allocate packets with minimum size
+
+dns_packet_new() is sometimes called with mtu == 0, and in that case we should
+allocate more than the absolute minimum (which is the dns packet header size),
+otherwise we have to resize immediately again after appending the first data to
+the packet.
+
+This partially reverts the previous commit.
+
+[Upstream commit: https://github.com/systemd/systemd/commit/88795538726a5bbfd9efc13d441cb05e1d7fc139]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/resolve/resolved-dns-packet.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/resolve/resolved-dns-packet.c b/src/resolve/resolved-dns-packet.c
+index 821b66e266..d1f0f760a4 100644
+--- a/src/resolve/resolved-dns-packet.c
++++ b/src/resolve/resolved-dns-packet.c
+@@ -28,6 +28,9 @@
+ 
+ #define EDNS0_OPT_DO (1<<15)
+ 
++#define DNS_PACKET_SIZE_START 512
++assert_cc(DNS_PACKET_SIZE_START > UDP_PACKET_HEADER_SIZE)
++
+ typedef struct DnsPacketRewinder {
+         DnsPacket *packet;
+         size_t saved_rindex;
+@@ -47,7 +50,14 @@ int dns_packet_new(DnsPacket **ret, DnsProtocol protocol, size_t mtu) {
+ 
+         assert(ret);
+ 
+-        a = MAX(mtu, DNS_PACKET_HEADER_SIZE);
++        /* When dns_packet_new() is called with mtu == 0, allocate more than the
++         * absolute minimum (which is the dns packet header size), to avoid
++         * resizing immediately again after appending the first data to the packet.
++         */
++        if (mtu < UDP_PACKET_HEADER_SIZE)
++                a = DNS_PACKET_SIZE_START;
++        else
++                a = MAX(mtu, DNS_PACKET_HEADER_SIZE);
+ 
+         /* round up to next page size */
+         a = PAGE_ALIGN(ALIGN(sizeof(DnsPacket)) + a) - ALIGN(sizeof(DnsPacket));
diff --git a/package/systemd/0001-fix-getty-unit.patch b/package/systemd/0004-fix-getty-unit.patch
similarity index 100%
rename from package/systemd/0001-fix-getty-unit.patch
rename to package/systemd/0004-fix-getty-unit.patch
diff --git a/package/systemd/0002-build-check-for-ln-relative.patch b/package/systemd/0005-build-check-for-ln-relative.patch
similarity index 100%
rename from package/systemd/0002-build-check-for-ln-relative.patch
rename to package/systemd/0005-build-check-for-ln-relative.patch
diff --git a/package/systemd/0003-fix-am-path-libgcrypt-no-found.patch b/package/systemd/0006-fix-am-path-libgcrypt-no-found.patch
similarity index 100%
rename from package/systemd/0003-fix-am-path-libgcrypt-no-found.patch
rename to package/systemd/0006-fix-am-path-libgcrypt-no-found.patch
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 77a680d..17f4c0f 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,2 @@
 # sha256 locally computed
 sha256 8b3e99da3d4164b66581830a7f2436c0c8fe697b5fbdc3927bdb960646be0083  systemd-233.tar.gz
-sha256 eed8fef0045876e9efa0ba6725ed9ea93654bf24d67bb5aad467a341ad375883  a924f43f30f9c4acaf70618dd2a055f8b0f166be.patch
-sha256 43c75bd161a8ef0de5db607aaceed77220f2ba4903cf44e7e9db544980420a5e  db848813bae4d28c524b3b6a7dad135e426659ce.patch
-sha256 451f7c09332479ebe4ac01612f5f034df4524e16b5bc5d1c8ddcda14e9f3cd69  88795538726a5bbfd9efc13d441cb05e1d7fc139.patch
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index a853434..f7894b2 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,11 +19,6 @@ SYSTEMD_DEPENDENCIES = \
 SYSTEMD_PROVIDES = udev
 SYSTEMD_AUTORECONF = YES
 
-SYSTEMD_PATCH = \
-	https://github.com/systemd/systemd/commit/a924f43f30f9c4acaf70618dd2a055f8b0f166be.patch \
-	https://github.com/systemd/systemd/commit/db848813bae4d28c524b3b6a7dad135e426659ce.patch \
-	https://github.com/systemd/systemd/commit/88795538726a5bbfd9efc13d441cb05e1d7fc139.patch
-
 # Make sure that systemd will always be built after busybox so that we have
 # a consistent init setup between two builds
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
2.9.4
