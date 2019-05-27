From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 28 May 2019 00:28:58 +0200
Subject: [Buildroot] [git commit] package/suricata: fix pcap static build
Message-ID: <20190527222251.A735F8E642@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ce2db1090c494f57019af4f29691e0f86b48330
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - no autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...2-configure.ac-fix-static-build-with-pcap.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/suricata/0002-configure.ac-fix-static-build-with-pcap.patch b/package/suricata/0002-configure.ac-fix-static-build-with-pcap.patch
new file mode 100644
index 0000000000..3312550620
--- /dev/null
+++ b/package/suricata/0002-configure.ac-fix-static-build-with-pcap.patch
@@ -0,0 +1,29 @@
+From 2660123b0c16d7f6a49747711be676c4119561c9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 24 Apr 2019 20:35:20 +0200
+Subject: [PATCH] configure.ac: fix static build with pcap
+
+pcap can depends on nl-3 so use pkg-config to find these dependencies
+otherwise all AC_CHECK_LIB calls will fail when building statically
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index ee59c9d8e..5ec341231 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1331,6 +1331,7 @@
+     AC_CHECK_HEADERS([pcap.h pcap/pcap.h pcap/bpf.h])
+ 
+     LIBPCAP=""
++    PKG_CHECK_MODULES([PCAP],libpcap,[CPPFLAGS="${CPPFLAGS} ${PCAP_CFLAGS}" LIBS="${LIBS} ${PCAP_LIBS}"],[])
+     AC_CHECK_LIB(${PCAP_LIB_NAME}, pcap_open_live,, LIBPCAP="no")
+     if test "$LIBPCAP" = "no"; then
+         echo
+-- 
+2.20.1
+
