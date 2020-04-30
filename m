From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 30 Apr 2020 21:42:46 +0200
Subject: [Buildroot] [PATCH 2/2] package/suricata: security bump to version
 4.1.8
In-Reply-To: <20200430194246.2076437-1-fontaine.fabrice@gmail.com>
References: <20200430194246.2076437-1-fontaine.fabrice@gmail.com>
Message-ID: <20200430194246.2076437-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- This is the first release after Suricata joined the Oss-Fuzz program,
  leading to discovery of a number of (potential) security issues:
  https://suricata-ids.org/2020/04/28/suricata-4-1-8-released
- Drop first, second and fourth patches (already in version)
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...figure.ac-fix-static-build-with-pcap.patch | 29 --------------
 ...re-proper-shabang-on-python-scripts.patch} |  0
 .../0002-configure.ac-fix-disable-geoip.patch | 33 ---------------
 ...004-stream-reject-broken-ACK-packets.patch | 40 -------------------
 package/suricata/suricata.hash                |  6 +--
 package/suricata/suricata.mk                  |  7 +---
 6 files changed, 5 insertions(+), 110 deletions(-)
 delete mode 100644 package/suricata/0001-configure.ac-fix-static-build-with-pcap.patch
 rename package/suricata/{0003-python-ensure-proper-shabang-on-python-scripts.patch => 0001-python-ensure-proper-shabang-on-python-scripts.patch} (100%)
 delete mode 100644 package/suricata/0002-configure.ac-fix-disable-geoip.patch
 delete mode 100644 package/suricata/0004-stream-reject-broken-ACK-packets.patch

diff --git a/package/suricata/0001-configure.ac-fix-static-build-with-pcap.patch b/package/suricata/0001-configure.ac-fix-static-build-with-pcap.patch
deleted file mode 100644
index 3312550620..0000000000
--- a/package/suricata/0001-configure.ac-fix-static-build-with-pcap.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 2660123b0c16d7f6a49747711be676c4119561c9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 24 Apr 2019 20:35:20 +0200
-Subject: [PATCH] configure.ac: fix static build with pcap
-
-pcap can depends on nl-3 so use pkg-config to find these dependencies
-otherwise all AC_CHECK_LIB calls will fail when building statically
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index ee59c9d8e..5ec341231 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1331,6 +1331,7 @@
-     AC_CHECK_HEADERS([pcap.h pcap/pcap.h pcap/bpf.h])
- 
-     LIBPCAP=""
-+    PKG_CHECK_MODULES([PCAP],libpcap,[CPPFLAGS="${CPPFLAGS} ${PCAP_CFLAGS}" LIBS="${LIBS} ${PCAP_LIBS}"],[])
-     AC_CHECK_LIB(${PCAP_LIB_NAME}, pcap_open_live,, LIBPCAP="no")
-     if test "$LIBPCAP" = "no"; then
-         echo
--- 
-2.20.1
-
diff --git a/package/suricata/0003-python-ensure-proper-shabang-on-python-scripts.patch b/package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch
similarity index 100%
rename from package/suricata/0003-python-ensure-proper-shabang-on-python-scripts.patch
rename to package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch
diff --git a/package/suricata/0002-configure.ac-fix-disable-geoip.patch b/package/suricata/0002-configure.ac-fix-disable-geoip.patch
deleted file mode 100644
index 7dae57a875..0000000000
--- a/package/suricata/0002-configure.ac-fix-disable-geoip.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 4e8b006cdd30e43f3ab11296710170488fd5b5de Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 6 Oct 2019 09:53:23 +0200
-Subject: [PATCH] configure.ac: fix --disable-geoip
-
-$enableval should be used to know if the user has passed --enable-geoip
-or --disable-geoip
-
-Fixes:
- - http://autobuild.buildroot.org/results/a7a34f760ae5fe0922fdb720b8234dbcd85ed222
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream status: https://github.com/OISF/suricata/pull/4278
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3df576d54..fa671024d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2143,7 +2143,7 @@
-   # libmaxminddb
-     AC_ARG_ENABLE(geoip,
- 	        AS_HELP_STRING([--enable-geoip],[Enable GeoIP support]),
--	        [ enable_geoip="yes"],
-+	        [ enable_geoip="$enableval"],
- 	        [ enable_geoip="no"])
-     AC_ARG_ENABLE(libgeoip,
-     AS_HELP_STRING([--disable-libgeoip], [Disable libgeoip support]),
--- 
-2.23.0
-
diff --git a/package/suricata/0004-stream-reject-broken-ACK-packets.patch b/package/suricata/0004-stream-reject-broken-ACK-packets.patch
deleted file mode 100644
index 9670d73158..0000000000
--- a/package/suricata/0004-stream-reject-broken-ACK-packets.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 1c63d3905852f746ccde7e2585600b2199cefb4b Mon Sep 17 00:00:00 2001
-From: Victor Julien <victor@inliniac.net>
-Date: Thu, 21 Nov 2019 16:10:21 +0100
-Subject: [PATCH] stream: reject broken ACK packets
-
-Fix evasion posibility by rejecting packets with a broken ACK field.
-These packets have a non-0 ACK field, but do not have a ACK flag set.
-
-Bug #3324.
-
-Reported-by: Nicolas Adba
-(cherry picked from commit fa692df37a796c3330c81988d15ef1a219afc006)
-[Retrieved from:
-https://github.com/OISF/suricata/commit/1c63d3905852f746ccde7e2585600b2199cefb4b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/stream-tcp.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/stream-tcp.c b/src/stream-tcp.c
-index 35e489acba..8653d670c6 100644
---- a/src/stream-tcp.c
-+++ b/src/stream-tcp.c
-@@ -4759,6 +4759,7 @@ int StreamTcpPacket (ThreadVars *tv, Packet *p, StreamTcpThread *stt,
-     /* broken TCP http://ask.wireshark.org/questions/3183/acknowledgment-number-broken-tcp-the-acknowledge-field-is-nonzero-while-the-ack-flag-is-not-set */
-     if (!(p->tcph->th_flags & TH_ACK) && TCP_GET_ACK(p) != 0) {
-         StreamTcpSetEvent(p, STREAM_PKT_BROKEN_ACK);
-+        goto error;
-     }
- 
-     /* If we are on IPS mode, and got a drop action triggered from
-@@ -6883,7 +6884,7 @@ static int StreamTcpTest10 (void)
- 
-     tcph.th_win = htons(5480);
-     tcph.th_seq = htonl(10);
--    tcph.th_ack = htonl(11);
-+    tcph.th_ack = 0;
-     tcph.th_flags = TH_SYN;
-     p->tcph = &tcph;
- 
diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index dc52999a9d..05e3593c3b 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256 cee5f6535cd7fe63fddceab62eb3bc66a63fc464466c88ec7a41b7a1331ac74b  suricata-4.1.5.tar.gz
+sha256  c8a83a05f57cedc0ef81d833ddcfdbbfdcdb6f459a91b1b15dc2d5671f1aecbb  suricata-4.1.8.tar.gz
 
 # Hash for license files:
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 48a6205eed..8dd23bf2f5 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 4.1.5
+SURICATA_VERSION = 4.1.8
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
-# We're patching configure.ac
+# We're patching python/Makefile.am
 SURICATA_AUTORECONF = YES
 
-# 0004-stream-reject-broken-ACK-packets.patch
-SURICATA_IGNORE_CVES += CVE-2019-18792
-
 SURICATA_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_JANSSON),jansson) \
-- 
2.26.2
