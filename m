From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 08:55:32 +0200
Subject: [Buildroot] [PATCH 2 of 5] toolchain-external: allow downloading a
 custom toolchain
In-Reply-To: <patchbomb.1316588130@localhost6.localdomain6>
References: <patchbomb.1316588130@localhost6.localdomain6>
Message-ID: <d181fc061658f56665ec.1316588132@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Custom external toolchains currently already have to be extracted by the user.
This patch adds support for downloading a custom toolchain in the form of a
tarball, which will be extracted by buildroot.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---

 toolchain/toolchain-external/Config.in   |  13 ++++++++++++-
 toolchain/toolchain-external/ext-tool.mk |   9 +++++++++
 2 files changed, 21 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -193,12 +193,23 @@
 config BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
 	bool "Download toolchain automatically"
 	default y
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 	help
 	  When enabled, Buildroot will automatically download and
 	  install the selected external toolchain. When disabled,
 	  Buildroot will use a pre-installed toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_SITE
+	string "Toolchain download site"
+	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM && BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
+	help
+	  Base URL at which the custom toolchain can be downloaded.
+
+config BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	string "Toolchain filename"
+	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM && BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
+	help
+	  Filename of the toolchain package to download.
+
 config BR2_TOOLCHAIN_EXTERNAL_PATH
 	string "Toolchain path"
 	default "/path/to/toolchain/usr"
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -160,6 +160,10 @@
 TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(STAMP_DIR)/ext-toolchain-checked
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CUSTOM),y)
+TOOLCHAIN_EXTERNAL_DEPENDENCIES += $(STAMP_DIR)/ext-toolchain-checked
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/arm/portal/package4571/public/arm-none-linux-gnueabi/
 TOOLCHAIN_EXTERNAL_SOURCE=arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
@@ -197,11 +201,16 @@
 TOOLCHAIN_EXTERNAL_SOURCE_2 = blackfin-toolchain-uclibc-full-2010R1-RC4.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_SOURCE   = $(TOOLCHAIN_EXTERNAL_SOURCE_1) $(TOOLCHAIN_EXTERNAL_SOURCE_2)
 else
+# Custom toolchain
+TOOLCHAIN_EXTERNAL_SITE=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_SITE))
+TOOLCHAIN_EXTERNAL_SOURCE=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_SOURCE))
 # A value must be set (even if unused), otherwise the
 # $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) rule would override the main
 # $(DL_DIR) rule
+ifeq (,$(TOOLCHAIN_EXTERNAL_SOURCE))
 TOOLCHAIN_EXTERNAL_SOURCE=none
 endif
+endif
 
 # Special handling for Blackfin toolchain, because of the split in two
 # tarballs, and the organization of tarball contents. The tarballs
