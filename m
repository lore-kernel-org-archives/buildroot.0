From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 22 Jun 2012 07:42:38 +0200
Subject: [Buildroot] [PATCH 5 of 6 resend] toolchain-external: allow
 downloading a custom toolchain
In-Reply-To: <patchbomb.1340343753@beantl019720>
References: <patchbomb.1340343753@beantl019720>
Message-ID: <e1ec959a929032d75c76.1340343758@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---

This feature was proposed previously [1] with some comments by Thomas
Petazzoni. At that time, the proposed split was to have 'custom pre-
installed toolchain' and 'custom downloadable toolchain' sit alongside
the CodeSourcery ones, as such providing a clear distinction between
pre-installed and downloaded custom toolchains. However, during
implementation I felt that this structure makes the code more complex
than it needs to be and so I choose for an alternative solution that
IMO still creates a clear distinction. Any comments are of course
welcome.

[1] http://lists.busybox.net/pipermail/buildroot/2011-September/045912.html


 toolchain/toolchain-external/Config.in   |  29 ++++++++++++++++++++++-------
 toolchain/toolchain-external/ext-tool.mk |   6 ++++++
 2 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
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
 	help
-	  When enabled, Buildroot will automatically download and
-	  install the selected external toolchain. When disabled,
-	  Buildroot will use a pre-installed toolchain.
+	  Select this option if you want Buildroot to download and install the
+	  toolchain. If you have selected a custom toolchain, specify the URL
+	  in BR2_TOOLCHAIN_EXTERNAL_URL.
+
+config BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED
+	bool "Pre-installed toolchain"
+	help
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
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -252,11 +252,17 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILI
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
