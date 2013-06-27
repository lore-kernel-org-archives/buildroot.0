From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 11:24:16 +0200
Subject: [Buildroot] [git commit] pv: bump to version 1.4.6
Message-ID: <20130627093155.202B79B226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b7e53d3616bcceb6c298d954b811e82d30481e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop patch and instead pass LD= on the make cmdline]
Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pv/pv-1.2.0-fixld.patch |   21 ---------------------
 package/pv/pv.mk                |    5 +++--
 2 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/package/pv/pv-1.2.0-fixld.patch b/package/pv/pv-1.2.0-fixld.patch
deleted file mode 100644
index 9df279d..0000000
--- a/package/pv/pv-1.2.0-fixld.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-[PATCH] fix linker variable
-
-The linker variable LD was always set to 'ld' instead of the value from
-the environment. This breaks any linking, especially when dealing with
-a cross-compiler toolchain.
-The fix takes the CC variable and changes the 'gcc' extension to 'ld'.
-
-Signed-off-by: Roeland Van Praet <roelvp@mind.be>
----
-diff -ruN a/autoconf/make/vars.mk b/autoconf/make/vars.mk
---- a/autoconf/make/vars.mk	2010-03-11 00:43:19.000000000 +0100
-+++ b/autoconf/make/vars.mk	2011-10-06 15:47:18.000000000 +0200
-@@ -30,7 +30,7 @@
- @SET_MAKE@
- SHELL = /bin/sh
- CC = @CC@
--LD = ld
-+LD = $(CC:gcc=ld)
- DO_GZIP = @DO_GZIP@
- INSTALL = @INSTALL@
- INSTALL_DATA = @INSTALL_DATA@
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 1aa95f6..261f213 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PV_VERSION = 1.2.0
+PV_VERSION = 1.4.6
 PV_SOURCE = pv-$(PV_VERSION).tar.bz2
-PV_SITE = http://pipeviewer.googlecode.com/files
+PV_SITE = http://www.ivarch.com/programs/sources
+PV_MAKE_OPT = LD=$(TARGET_LD) # otherwise 'ld' is used
 
 $(eval $(autotools-package))
