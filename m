From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Apr 2011 15:13:13 +0200
Subject: [Buildroot] [git commit] toolchain/crosstool-NG: fix sysroot name
Message-ID: <20110420131407.A8B3C82813@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d9124d0da9caa35b1b99f11b14131ad3428f8eb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have to ensure that the sysroot created while building the
toolchain will be the one we later search for libraries. So:
 - hide the sysroot name prompt from the ct-ng menu.
 - force the sysroot name to be 'sysroot'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
