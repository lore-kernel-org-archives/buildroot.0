From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 19 Apr 2011 23:02:21 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/crosstool-NG: fix sysroot name
In-Reply-To: <1303246942-26415-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1303246942-26415-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1303246942-26415-2-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have to ensure that the sysroot created while building the
toolchain will be the one we later search for libraries. So:
 - hide the sysroot name prompt from the ct-ng menu.
 - force the sysroot name to be 'sysroot'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 .../002-no-sysroot-prompt-in-backend.patch         |   12 ++++++++++++
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |    1 +
 2 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/toolchain-crosstool-ng/002-no-sysroot-prompt-in-backend.patch

diff --git a/toolchain/toolchain-crosstool-ng/002-no-sysroot-prompt-in-backend.patch b/toolchain/toolchain-crosstool-ng/002-no-sysroot-prompt-in-backend.patch
new file mode 100644
index 0000000..4c3426a
--- /dev/null
+++ b/toolchain/toolchain-crosstool-ng/002-no-sysroot-prompt-in-backend.patch
@@ -0,0 +1,12 @@
+diff --git a/config/toolchain.in b/config/toolchain.in
+--- a/config/toolchain.in
++++ b/config/toolchain.in
+@@ -20,7 +20,7 @@
+ 
+ config SYSROOT_NAME
+     string
+-    prompt "sysroot directory name"
++    prompt "sysroot directory name" if ! BACKEND
+     depends on USE_SYSROOT
+     default "sysroot"
+     help
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 2c5829c..c57876e 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -257,6 +257,7 @@ endif
 # And the specials for paths
 CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_PREFIX_DIR)=.*:\1="$(HOST_DIR)/usr":;
 CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LOCAL_TARBALLS_DIR)=.*:\1="$(DL_DIR)":;
+CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_NAME)=.*:\1="sysroot":;
 CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_DIR_PREFIX)=.*:\1="":;
 
 #--------------
-- 
1.7.2.3
