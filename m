From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 1 Oct 2016 11:59:47 +0200
Subject: [Buildroot] [PATCH] gcc: enable _REENTRANT for bfin when -lpthread
	is used
Message-ID: <20161001095947.GA26848@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See here, why this should be always enabled:
https://lists.gnu.org/archive/html/autoconf-archive-maintainers/2016-06/msg00001.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
This might be a good addition to the patch series for gcc bfin,
which Thomas Petazzoni is handling :)
---
 package/gcc/6.2.0/895-bfin-define-REENTRANT.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 package/gcc/6.2.0/895-bfin-define-REENTRANT.patch

diff --git a/package/gcc/6.2.0/895-bfin-define-REENTRANT.patch b/package/gcc/6.2.0/895-bfin-define-REENTRANT.patch
new file mode 100644
index 0000000..e2828a5
--- /dev/null
+++ b/package/gcc/6.2.0/895-bfin-define-REENTRANT.patch
@@ -0,0 +1,17 @@
+enable _REENTRANT when -lpthread is used
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-6.2.0.orig/gcc/config/bfin/linux.h gcc-6.2.0/gcc/config/bfin/linux.h
+--- gcc-6.2.0.orig/gcc/config/bfin/linux.h	2016-01-04 15:30:50.000000000 +0100
++++ gcc-6.2.0/gcc/config/bfin/linux.h	2016-09-30 20:48:17.446636819 +0200
+@@ -38,6 +38,9 @@
+   "%{static:--start-group} %{mfast-fp:-lbffastfp} %G %L %{static:--end-group} \
+    %{!static:%{mfast-fp:-lbffastfp} %G}"
+ 
++#undef CPP_SPEC
++#define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
++
+ #undef LINK_SPEC
+ #define LINK_SPEC "\
+   %{mfdpic: -m elf32bfinfd -z text} %{shared} %{pie} \
-- 
2.1.4
