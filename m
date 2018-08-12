From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 14:39:32 +0200
Subject: [Buildroot] [git commit branch/next] Makefile: introduce
 check-package target
Message-ID: <20180812123248.81DB88C062@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1290241dc694b5435c47cb7065affbfa687d98cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The snippet of code that runs a check-package on all
.mk/.hash/Config.in files is currently only available within
.gitlab-ci.yml, and isn't immediately and easily usable by Buildroot
users. In order to simplify this, this commit introduces a top-level
"check-package" make target that implements the same logic. The
.gitlab-ci.yml file is changed to use "make check-package".

Since this target is oriented towards Buildroot developers, we
intentionally do not clutter the already noisy "make help" text with
this additional make target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml    | 3 +--
 .gitlab-ci.yml.in | 3 +--
 Makefile          | 6 +++++-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a0dc0ffa21..3fc9b06a34 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -43,8 +43,7 @@ check-flake8:
 
 check-package:
     script:
-        - find . -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' \)
-            -exec ./utils/check-package {} +
+        - make check-package
 
 .defconfig: &defconfig
     # Running the defconfigs for every push is too much, so limit to
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index fb2650c5ce..38e24c8d01 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -43,8 +43,7 @@ check-flake8:
 
 check-package:
     script:
-        - find . -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' \)
-            -exec ./utils/check-package {} +
+        - make check-package
 
 .defconfig: &defconfig
     # Running the defconfigs for every push is too much, so limit to
diff --git a/Makefile b/Makefile
index f79d39fd26..c4ed45837d 100644
--- a/Makefile
+++ b/Makefile
@@ -130,7 +130,7 @@ export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlo
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig alldefconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	print-version olddefconfig distclean manual manual-%
+	print-version olddefconfig distclean manual manual-% check-package
 
 # Some global targets do not trigger a build, but are used to collect
 # metadata, or do various checks. When such targets are triggered,
@@ -1125,6 +1125,10 @@ release:
 print-version:
 	@echo $(BR2_VERSION_FULL)
 
+check-package:
+	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' \) \
+		-exec ./utils/check-package {} +
+
 .PHONY: .gitlab-ci.yml
 .gitlab-ci.yml: .gitlab-ci.yml.in
 	cp $< $@
