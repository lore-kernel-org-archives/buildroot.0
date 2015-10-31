From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 31 Oct 2015 22:54:34 +0100
Subject: [Buildroot] [PATCH v1] wireshark: fix inet_pton detection
Message-ID: <1446328474-11255-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch configure.ac to not assume broken inet_pton in case of cross
compiling (avoids double definition), similare patch is used
for OpenEmbedded (see [1]).

Fixes [2]:

  host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(ntop.os): In function `inet_pton':
  ntop.c:(.text+0x4b4): multiple definition of `inet_pton'
  wsutil/.libs/libwsutil.a(inet_pton.o):inet_pton.c:(.text+0xe0): first defined here
  collect2: error: ld returned 1 exit status

[1] http://cgit.openembedded.org/openembedded/tree/recipes/wireshark/files/fix-configure.patch
[2] http://autobuild.buildroot.net/results/b35/b354ba668ca9476c143f5f7ef1b727b0b5672b04

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...o-not-assume-broken-inet_pton-in-case-of-.patch | 32 ++++++++++++++++++++++
 package/wireshark/wireshark.mk                     |  3 ++
 2 files changed, 35 insertions(+)
 create mode 100644 package/wireshark/0001-configure-do-not-assume-broken-inet_pton-in-case-of-.patch

diff --git a/package/wireshark/0001-configure-do-not-assume-broken-inet_pton-in-case-of-.patch b/package/wireshark/0001-configure-do-not-assume-broken-inet_pton-in-case-of-.patch
new file mode 100644
index 0000000..4d1f680
--- /dev/null
+++ b/package/wireshark/0001-configure-do-not-assume-broken-inet_pton-in-case-of-.patch
@@ -0,0 +1,32 @@
+From a0657feeb2b349ffda895a53e36ea5c992d871cf Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 31 Oct 2015 22:38:48 +0100
+Subject: [PATCH] configure: do not assume broken inet_pton in case of cross
+ compiling
+
+Patch configure.ac to not assume broken inet_pton in case of cross
+compiling.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index aec0548..d640e0c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2646,8 +2646,8 @@ int main()
+ #endif
+ }], [AC_MSG_RESULT(ok);
+ have_inet_pton=yes], [AC_MSG_RESULT(broken);
+-have_inet_pton=no], [AC_MSG_RESULT(cross compiling, assume it is broken);
+-have_inet_pton=no])],
++have_inet_pton=no], [AC_MSG_RESULT([cross compiling, assume it is broken... not here]);
++have_inet_pton=yes])],
+ have_inet_pton=no)
+ if test "$have_inet_pton" = no; then
+   INET_PTON_LO="inet_pton.lo"
+-- 
+2.1.4
+
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 045fad3..ffadf80 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -14,6 +14,9 @@ WIRESHARK_CONF_ENV = \
 	LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
 	ac_cv_path_PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
 
+# patch touching configure.ac
+WIRESHARK_AUTORECONF = YES
+
 # wireshark adds -I$includedir to CFLAGS, causing host/target headers mixup.
 # Work around it by pointing includedir at staging
 WIRESHARK_CONF_OPTS = \
-- 
2.1.4
