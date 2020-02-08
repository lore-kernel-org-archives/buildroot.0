From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2020 19:56:12 +0100
Subject: [Buildroot] [git commit] package/localedef: relax required
 toolchain version
Message-ID: <20200208184737.A09DF8D46A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=281bfbcaea855c2f6f73ec13a6c050fcf2c602a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The glibc package has been updating the toolchain version
dependency since 2.28.x. The dependencies don't currently
apply to the localedef build of the package, so this
patchset relaxes the restriction such that builds can still
occur on older host machines.

The current supported minimum versions after this patch
is applied are:
GCC 4.8
Binutils 2.24

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ndency-on-GCC-to-4.8-and-binutils-to-2.24.patch | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
new file mode 100644
index 0000000000..a6e87cc317
--- /dev/null
+++ b/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
@@ -0,0 +1,64 @@
+From 313e04bfbd281f9b46fdde097aacb59d501820a3 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Thu, 6 Feb 2020 14:36:21 -0600
+Subject: [PATCH] relax dependency on GCC to 4.8 and binutils to 2.24
+
+The glibc package has been updating the toolchain version
+dependency since 2.28.x. The dependencies don't currently
+apply to the localedef build of the package, so this
+patchset relaxes the restriction such that builds can still
+occur on older host machines.
+
+Here's a related post from 2018 for a similar patchset.
+http://lists.busybox.net/pipermail/buildroot/2018-December/237949.html
+
+Timeline of relevant commits that adjust the dependency upstream.
+GCC 4.9+
+ https://sourceware.org/git/?p=glibc.git;a=commit;h=4add86749a31f302674599b69d2eea691d69341a
+Binutils 2.25+
+ https://sourceware.org/git/?p=glibc.git;a=commit;h=073e8fa7739ed453d6854b834f290c263a6cdb9f
+ https://sourceware.org/git/?p=glibc.git;a=commit;h=b4396163aa8666f970aaf43eaca25f3a92b18c1b
+GCC 5+
+ https://sourceware.org/git/?p=glibc.git;a=commit;h=192963be49678b48f60218f1f794991cdd9fe472
+GCC 6.2+
+ https://sourceware.org/git/?p=glibc.git;a=commit;h=4dcbbc3b28aaeafe23e1a30db84055aa6f6fa987
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ configure | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure b/configure
+index 6d26b824..9ac2e5e9 100755
+--- a/configure
++++ b/configure
+@@ -4601,7 +4601,7 @@ $as_echo_n "checking version of $AS... " >&6; }
+   ac_prog_version=`$AS --version 2>&1 | sed -n 's/^.*GNU assembler.* \([0-9]*\.[0-9.]*\).*$/\1/p'`
+   case $ac_prog_version in
+     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
+-    2.1[0-9][0-9]*|2.2[5-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
++    2.1[0-9][0-9]*|2.2[4-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
+        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
+     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
+ 
+@@ -4731,7 +4731,7 @@ $as_echo_n "checking version of $LD... " >&6; }
+   ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
+   case $ac_prog_version in
+     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
+-    2.1[0-9][0-9]*|2.2[5-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
++    2.1[0-9][0-9]*|2.2[4-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
+        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
+     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
+ 
+@@ -5140,7 +5140,7 @@ int
+ main ()
+ {
+ 
+-#if !defined __GNUC__ || __GNUC__ < 6 || (__GNUC__ == 6 && __GNUC_MINOR__ < 2)
++#if !defined __GNUC__ || __GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 8)
+ #error insufficient compiler
+ #endif
+   ;
+-- 
+2.18.0
+
