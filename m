From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 16:53:24 +0200
Subject: [Buildroot] [git commit] toolchain-external: allow downloading a
	custom toolchain
Message-ID: <20120722151730.5BEEA96A99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df0c12599487e49a6fe390a89f2f9ee5ee93222e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds the possibility to download a custom external
toolchain, in addition to the existing support of preinstalled custom
external toolchains.

With the modified configuration, the user is presented with the
following options:
- Toolchain type: Buildroot toolchain | External toolchain | Ct-ng toolchain

In case of External toolchain:
- Toolchain: the CodeSourcery toolchains | Custom toolchain
- Toolchain origin: Toolchain to be downloaded and installed | Pre-installed toolchain

In case of Toolchain to be downloaded, the user is presented with:
- Toolchain URL
In case of Pre-installed toolchain, the users sees:
- Toolchain Path

For CodeSourcery toolchains, the toolchain URL field is not used (the
URLs are directly coded in ext-tool.mk).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   29 ++++++++++++++++++++++-------
 toolchain/toolchain-external/ext-tool.mk |    6 ++++++
 2 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 172e3e3..dceeed2 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -492,22 +492,37 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 endchoice
 
+choice
+	prompt "Toolchain origin"
+
 config BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
-	bool "Download toolchain automatically"
-	default y
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CUSTOM
+	bool "Toolchain to be downloaded and installed"
+	help
+	  Select this option if you want Buildroot to download and install the
+	  toolchain. If you have selected a custom toolchain, specify the URL
+	  in BR2_TOOLCHAIN_EXTERNAL_URL.
+
+config BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED
+	bool "Pre-installed toolchain"
 	help
-	  When enabled, Buildroot will automatically download and
-	  install the selected external toolchain. When disabled,
-	  Buildroot will use a pre-installed toolchain.
+	  Select this option if you want to use a pre-installed toolchain.
+	  Specify the path to this toolchain in BR2_TOOLCHAIN_EXTERNAL_PATH.
+
+endchoice
 
 config BR2_TOOLCHAIN_EXTERNAL_PATH
 	string "Toolchain path"
 	default "/path/to/toolchain/usr"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
+	depends on BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED
 	help
 	  Path to where the external toolchain is installed.
 
+config BR2_TOOLCHAIN_EXTERNAL_URL
+	string "Toolchain URL"
+	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM && BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
+	help
+	  URL of the custom toolchain tarball to download and install.
+
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 	string "Toolchain prefix"
 	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 3f58aad..49dd0e2 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -252,11 +252,17 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
 TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0.git;a=blob;h=71e031ae990e063a5718f90d30cf97ad85e2f565;hb=569081301f0f1d8d3b24335a364e8ff1774190d4;f=
 TOOLCHAIN_EXTERNAL_SOURCE=microblaze-unknown-linux-gnu.tgz
 else
+# Custom toolchain
+TOOLCHAIN_EXTERNAL_SITE=$(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
+TOOLCHAIN_EXTERNAL_SOURCE=$(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
+
 # A value must be set (even if unused), otherwise the
 # $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) rule would override the main
 # $(DL_DIR) rule
+ifeq (,$(TOOLCHAIN_EXTERNAL_SOURCE))
 TOOLCHAIN_EXTERNAL_SOURCE=none
 endif
+endif
 
 # Special handling for Blackfin toolchain, because of the split in two
 # tarballs, and the organization of tarball contents. The tarballs
