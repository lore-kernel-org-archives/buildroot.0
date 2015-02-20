From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 09:45:51 +0100
Subject: [Buildroot] [git commit] uclibc: cleanup handling of ARC uClibc
	version
Message-ID: <20150302222720.C4FF6807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c39ba6af851c3ce66f2a2ef5d45f3e9d1306f5ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit makes the ARC uClibc version handling explicit by adding a
BR2_UCLIBC_VERSION_ARC_GIT option, rather than only relying on the
selected architecture. This is needed in preparation to the
introduction of uClibc-ng support, which also supports the ARC
architecture: so we will now have two uClibc versions capable of
handling ARC.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/uclibc/Config.in |    8 ++++++--
 package/uclibc/uclibc.mk |    2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index aa99a6f..a20b002 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -17,6 +17,10 @@ choice
 		bool "uClibc 0.9.33.x"
 		depends on !(BR2_arc || BR2_xtensa)
 
+	config BR2_UCLIBC_VERSION_ARC_GIT
+		bool "uClibc Git ARC"
+		depends on BR2_arc
+
 	config BR2_UCLIBC_VERSION_XTENSA_GIT
 		bool "uClibc Git Xtensa"
 		depends on BR2_xtensa
@@ -37,14 +41,14 @@ config BR2_USE_UCLIBC_SNAPSHOT
 config BR2_UCLIBC_VERSION_STRING
 	string
 	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
-	default "arc-2014.12" if BR2_arc
+	default "arc-2014.12" if BR2_UCLIBC_VERSION_ARC_GIT
 	default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if BR2_UCLIBC_VERSION_XTENSA_GIT
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
 	string "uClibc configuration file to use?"
 	default "package/uclibc/uClibc-0.9.33.config" if BR2_UCLIBC_VERSION_0_9_33
-	default "package/uclibc/uClibc-snapshot.config" if BR2_arc
+	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_ARC_GIT
 	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
 	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_XTENSA_GIT
 	help
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 40e6c6c..b29cff4 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -11,7 +11,7 @@ UCLIBC_LICENSE_FILES = COPYING.LIB
 
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE = http://www.uclibc.org/downloads/snapshots
-else ifeq ($(BR2_arc),y)
+else ifeq ($(BR2_UCLIBC_VERSION_ARC_GIT),y)
 UCLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,uClibc,$(UCLIBC_VERSION))
 UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.gz
 else ifeq ($(BR2_UCLIBC_VERSION_XTENSA_GIT),y)
