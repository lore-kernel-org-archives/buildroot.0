From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Oct 2015 14:48:58 +0200
Subject: [Buildroot] [PATCH 6/9 v2] toolchain/external: allow user to
	exclude files from custom toolchains
In-Reply-To: <cover.1445690712.git.yann.morin.1998@free.fr>
References: <cover.1445690712.git.yann.morin.1998@free.fr>
Message-ID: <6223ee9be26db809c8bf54069277c4067066fc82.1445690712.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similarly as what we do for the toolchain's own locales (i.e. the
locales of the tools in the toolchain, not the locales for the target),
and an option so that users using a custom toolchain may pass a list of
globs to exclude when extracting the toolchain (to save some space).

Reported-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 toolchain/toolchain-external/Config.in             | 8 ++++++++
 toolchain/toolchain-external/toolchain-external.mk | 4 +++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 4291394..2609e41 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -913,6 +913,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 	default "$(ARCH)-linux"
 
+config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_EXCLUDES
+	string "Files not to extract"
+	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM && BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
+	help
+	  If you want to omit some files when extracting your custom
+	  toolchain, you may enter here a list of globs to be passed
+	  to tar's --exclude option.
+
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
 	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12 && BR2_arcle
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 90faf3b..0ba2fd2 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -460,7 +460,9 @@ TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
 
 # Normal handling of downloaded toolchain tarball extraction.
 ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
-TOOLCHAIN_EXTERNAL_EXCLUDES = usr/lib/locale/*
+TOOLCHAIN_EXTERNAL_EXCLUDES = \
+	usr/lib/locale/* \
+	$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_EXCLUDES))
 define TOOLCHAIN_EXTERNAL_MOVE
 	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
 	mv $(@D)/* $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/
-- 
1.9.1
