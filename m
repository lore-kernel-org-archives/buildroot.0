From: Andrew Burgess <andrew.burgess@embecosm.com>
Date: Fri, 21 Nov 2014 23:32:36 +0000
Subject: [Buildroot] [PATCH] binutils: Add user support for fetching from
	git.
References: <cover.1416611974.git.andrew.burgess@embecosm.com>
Message-ID: <cf100033200a99097708adfd4f4c065b5e6fbe3b.1416611974.git.andrew.burgess@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change adds a new option "from git repository" to the list of
available binutils versions.  Selecting this allows the user to input
the URL of a git repository, and the version to use from the
repository.

The ARC target, which previously was hard coding a git URL and version
into binutils.mk switches to this new scheme, moving the URL and
version into Config.in.host.

This is my first buildroot patch, I don't know if this is a change
that will be useful to others, but it's been helpful for me.

Feedback, comments welcome.

Thanks,
Andrew


Signed-off-by: Andrew Burgess <andrew.burgess@embecosm.com>
---
 package/binutils/Config.in.host | 29 ++++++++++++++++++++++++-----
 package/binutils/binutils.mk    |  8 ++++----
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 45f604a..e2b8e11 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -2,7 +2,6 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
-	depends on !BR2_arc
 	default BR2_BINUTILS_VERSION_2_24 if BR2_microblaze || BR2_powerpc64le
 	default BR2_BINUTILS_VERSION_2_22
 	help
@@ -13,25 +12,45 @@ choice
 		bool "binutils 2.18-avr32-1.0.1"
 
 	config BR2_BINUTILS_VERSION_2_22
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le && !BR2_arc
 		bool "binutils 2.22"
 
 	# bfin disabled for newer binutils due to
 	# https://sourceware.org/bugzilla/show_bug.cgi?id=17334
 	config BR2_BINUTILS_VERSION_2_23_2
-		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_bfin && !BR2_microblaze && !BR2_powerpc64le
+		depends on !BR2_avr32 && !BR2_aarch64 && !BR2_bfin && !BR2_microblaze && !BR2_powerpc64le && !BR2_arc
 		bool "binutils 2.23.2"
 
 	config BR2_BINUTILS_VERSION_2_24
-		depends on !BR2_avr32 && !BR2_bfin
+		depends on !BR2_avr32 && !BR2_bfin && !BR2_arc
 		bool "binutils 2.24"
 
+	config BR2_BINUTILS_VERSION_GIT
+		bool "from git repository"
+
 endchoice
 
+if BR2_BINUTILS_VERSION_GIT
+
+config BR2_BINUTILS_CUSTOM_REPO_URL
+	string "URL of binutils repository"
+	default "git://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb" if BR2_arc
+	help
+	  URL for git repository to use.
+
+config BR2_BINUTILS_CUSTOM_REPO_VERSION
+	string "Version of binutils repository"
+	default "arc-2014.08"	if BR2_arc
+	help
+	  Revision to use in the typical format used by Git/Mercurial
+	  E.G. a sha id, a tag, branch, ..
+
+endif
+
 config BR2_BINUTILS_VERSION
 	string
+	default BR2_BINUTILS_CUSTOM_REPO_VERSION if BR2_BINUTILS_VERSION_GIT
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
-	default "arc-2014.08"	if BR2_arc
 	default "2.22"		if BR2_BINUTILS_VERSION_2_22
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_2
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index b8dab5d..16c542b 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -19,10 +19,10 @@ endif
 ifeq ($(ARCH),avr32)
 BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
 endif
-ifeq ($(BR2_arc),y)
-BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
+ifeq ($(BR2_BINUTILS_VERSION_GIT),y)
+BINUTILS_SITE = $(call qstrip,$(BR2_BINUTILS_CUSTOM_REPO_URL))
+BINUTILS_SITE_METHOD = git
 BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
-BINUTILS_FROM_GIT = y
 endif
 BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.bz2
@@ -33,7 +33,7 @@ HOST_BINUTILS_DEPENDENCIES =
 BINUTILS_LICENSE = GPLv3+, libiberty LGPLv2.1+
 BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
 
-ifeq ($(BINUTILS_FROM_GIT),y)
+ifeq ($(BR2_BINUTILS_VERSION_GIT),y)
 BINUTILS_DEPENDENCIES += host-texinfo host-flex host-bison
 HOST_BINUTILS_DEPENDENCIES += host-texinfo host-flex host-bison
 endif
-- 
1.9.3
