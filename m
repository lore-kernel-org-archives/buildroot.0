From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 21:27:39 +0200
Subject: [Buildroot] [git commit] package/quagga: fix build with gcc 10
Message-ID: <20200922191810.3F0727FF75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48f0548ab312d93729b9f89f819c026d7ab7587e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/82b15cff3f7b943eb93d8270790f1b8561d31d6a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-lib-prefix.h-fix-build-with-gcc-10.patch  | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/quagga/0002-lib-prefix.h-fix-build-with-gcc-10.patch b/package/quagga/0002-lib-prefix.h-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..f2fc9cc647
--- /dev/null
+++ b/package/quagga/0002-lib-prefix.h-fix-build-with-gcc-10.patch
@@ -0,0 +1,36 @@
+From 01bcd0f7411f86eea44247bf91b48882cae35519 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 21 Sep 2020 23:12:25 +0200
+Subject: [PATCH] lib/prefix.h: fix build with gcc 10
+
+Remove __packed to fix the following build failure with gcc 10 (which
+defaults to -fno-common):
+
+  CCLD     libzebra.la
+/tmp/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: .libs/sockunion.o:(.bss+0x0): multiple definition of `__packed'; .libs/vty.o:(.bss+0x6c): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/82b15cff3f7b943eb93d8270790f1b8561d31d6a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://bugzilla.quagga.net/show_bug.cgi?id=1014]
+---
+ lib/prefix.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/prefix.h b/lib/prefix.h
+index 2cf0b20b..a5306eee 100644
+--- a/lib/prefix.h
++++ b/lib/prefix.h
+@@ -44,7 +44,7 @@
+  */
+ struct ethaddr {
+     u_char octet[ETHER_ADDR_LEN];
+-} __packed;
++};
+ 
+ 
+ /*
+-- 
+2.28.0
+
