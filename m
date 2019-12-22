From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 22 Dec 2019 14:18:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/alsa-lib: add
 BR2_PACKAGE_ALSA_LIB_UCM
Message-ID: <20191222131817.2334170-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ucm needs mixer since version 1.2.1 and
https://github.com/alsa-project/alsa-lib/commit/5c88b183718ce3df11bc4753c76d95f3e9de6c7e

So add a BR2_PACKAGE_ALSA_LIB_UCM option that selects
BR2_PACKAGE_ALSA_LIB_MIXER and selects this new option in
BR2_PACKAGE_ALSA_UTILS_ALSAUCM to avoid a build failure

Fixes:
 - http://autobuild.buildroot.org/results/aaa615d4e38d100bb9001ecdf7357e755ef42a87

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/alsa-lib/Config.in   | 5 +++++
 package/alsa-lib/alsa-lib.mk | 3 +++
 package/alsa-utils/Config.in | 1 +
 3 files changed, 9 insertions(+)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index 995d379167..94c37a7f03 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -66,6 +66,11 @@ config BR2_PACKAGE_ALSA_LIB_SEQ
 	bool "seq"
 	default y
 
+config BR2_PACKAGE_ALSA_LIB_UCM
+	bool "ucm"
+	select BR2_PACKAGE_ALSA_LIB_MIXER
+	default y
+
 config BR2_PACKAGE_ALSA_LIB_ALISP
 	bool "alisp"
 	default y
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 72e6c34282..954cbfb241 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -45,6 +45,9 @@ endif
 ifneq ($(BR2_PACKAGE_ALSA_LIB_SEQ),y)
 ALSA_LIB_CONF_OPTS += --disable-seq
 endif
+ifneq ($(BR2_PACKAGE_ALSA_LIB_UCM),y)
+ALSA_LIB_CONF_OPTS += --disable-ucm
+endif
 ifneq ($(BR2_PACKAGE_ALSA_LIB_ALISP),y)
 ALSA_LIB_CONF_OPTS += --disable-alisp
 endif
diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 012f28aef4..2d7062b0ca 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -41,6 +41,7 @@ comment "alsamixer needs a toolchain w/ wchar"
 
 config BR2_PACKAGE_ALSA_UTILS_ALSAUCM
 	bool "alsaucm"
+	select BR2_PACKAGE_ALSA_LIB_UCM
 
 config BR2_PACKAGE_ALSA_UTILS_ALSATPLG
 	bool "alsatplg"
-- 
2.24.0
