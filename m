From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 22:50:36 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] libseccomp: bump to
 version 2.3.3
Message-ID: <20190327214710.3B584835E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c72d419aa708a39467a5b2c2c72d24be3e9d824d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

- Update patch and sent it upstream
- Remove LIBSECCOMP_FIXUP_M4_DIR (not needed anymore)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c091a9d88b75d038c791af5425078fe2f1b9b200)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libseccomp/0001-remove-static.patch | 41 +++++++++++++++++------------
 package/libseccomp/libseccomp.hash          |  3 ++-
 package/libseccomp/libseccomp.mk            |  8 +-----
 3 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/package/libseccomp/0001-remove-static.patch b/package/libseccomp/0001-remove-static.patch
index 6fd81f96d5..9f0ac210c7 100644
--- a/package/libseccomp/0001-remove-static.patch
+++ b/package/libseccomp/0001-remove-static.patch
@@ -1,24 +1,28 @@
-Do not force static link, it breaks build with
-# BR2_STATIC_LIBS is not set
+From 8632287cf6863b580340f846ac14adf2609abdb0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 2 Jun 2018 13:45:22 +0200
+Subject: [PATCH] remove static
+
+Do not force static link of tools, it breaks build with:
 BR2_SHARED_LIBS=y
 
+Patch retrieved from
+https://git.buildroot.net/buildroot/tree/package/libseccomp/0001-remove-static.patch
+and slighly updated to work with 2.3.3
+
+[Upstream status: https://github.com/seccomp/libseccomp/pull/121]
+
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
 
-diff -uNr libseccomp-2.2.0.org/tests/Makefile.am libseccomp-2.2.0/tests/Makefile.am
---- libseccomp-2.2.0.org/tests/Makefile.am	2015-02-11 21:57:11.000000000 +0100
-+++ libseccomp-2.2.0/tests/Makefile.am	2015-03-29 16:03:49.668946652 +0200
-@@ -16,7 +16,6 @@
- # along with this library; if not, see <http://www.gnu.org/licenses>.
- #
- 
--AM_LDFLAGS = -static
- LDADD = util.la ../src/libseccomp.la
- 
- check_LTLIBRARIES = util.la
-diff -uNr libseccomp-2.2.0.org/tools/Makefile.am libseccomp-2.2.0/tools/Makefile.am
---- libseccomp-2.2.0.org/tools/Makefile.am	2015-02-11 21:57:11.000000000 +0100
-+++ libseccomp-2.2.0/tools/Makefile.am	2015-03-29 16:03:46.164992302 +0200
-@@ -33,8 +33,6 @@
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index 70b4aed..ef74270 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -35,8 +35,6 @@ scmp_bpf_disasm_SOURCES = scmp_bpf_disasm.c bpf.h util.h
  scmp_bpf_sim_SOURCES = scmp_bpf_sim.c bpf.h util.h
  
  scmp_sys_resolver_LDADD = ../src/libseccomp.la
@@ -27,3 +31,6 @@ diff -uNr libseccomp-2.2.0.org/tools/Makefile.am libseccomp-2.2.0/tools/Makefile
 -scmp_arch_detect_LDFLAGS = -static
  scmp_bpf_disasm_LDADD = util.la
  scmp_bpf_sim_LDADD = util.la
+-- 
+2.14.1
+
diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index ef390ff562..0362ce9ba4 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 09864282ae579c34bd5ef75ef3487200adfecaa51f5cffc7c7ad1ed2f89f5d6c libseccomp-v2.3.1.tar.gz
+sha256 5a52495207f00d1254707f11226e17c16ec53f5038d65bbabf1892873fa2fe5b libseccomp-v2.3.3.tar.gz
+sha256 102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b LICENSE
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 9a241a5513..afa2d36122 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,17 +4,11 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = v2.3.1
+LIBSECCOMP_VERSION = v2.3.3
 LIBSECCOMP_SITE = $(call github,seccomp,libseccomp,$(LIBSECCOMP_VERSION))
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
 LIBSECCOMP_INSTALL_STAGING = YES
 LIBSECCOMP_AUTORECONF = YES
 
-# Needed for autoreconf to work properly, see ./autogen.sh
-define LIBSECCOMP_FIXUP_M4_DIR
-	mkdir $(@D)/m4
-endef
-LIBSECCOMP_POST_EXTRACT_HOOKS += LIBSECCOMP_FIXUP_M4_DIR
-
 $(eval $(autotools-package))
