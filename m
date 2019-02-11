From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 09:08:48 +0100
Subject: [Buildroot] [git commit branch/next] package/googlefontdirectory:
 better solution to avoid check-package warning
Message-ID: <20190213214530.4333B8A34D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12a3bd853e9340a0d1000d5e696d505c6fff9e72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Rather than tell check-package to ignore a false-positive issue, just
avoid the issue to begin with, by using an intermediate variable to
construct the list of licenses.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/googlefontdirectory/googlefontdirectory.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/googlefontdirectory/googlefontdirectory.mk b/package/googlefontdirectory/googlefontdirectory.mk
index cf918ac4ae..8773390f0c 100644
--- a/package/googlefontdirectory/googlefontdirectory.mk
+++ b/package/googlefontdirectory/googlefontdirectory.mk
@@ -11,22 +11,21 @@ GOOGLEFONTDIRECTORY_FONTS = \
 	$(call qstrip,$(BR2_PACKAGE_GOOGLEFONTDIRECTORY_FONTS))
 
 ifneq ($(filter apache/%,$(GOOGLEFONTDIRECTORY_FONTS)),)
-GOOGLEFONTDIRECTORY_LICENSE += Apache-2.0
+GOOGLEFONTDIRECTORY_ALL_LICENSES += Apache-2.0
 GOOGLEFONTDIRECTORY_LICENSE_FILES += $(addsuffix /LICENSE.txt,$(filter apache/%,$(GOOGLEFONTDIRECTORY_FONTS)))
 endif
 
 ifneq ($(filter ofl/%,$(GOOGLEFONTDIRECTORY_FONTS)),)
-GOOGLEFONTDIRECTORY_LICENSE += OFL-1.1
+GOOGLEFONTDIRECTORY_ALL_LICENSES += OFL-1.1
 GOOGLEFONTDIRECTORY_LICENSE_FILES += $(addsuffix /OFL.txt,$(filter ofl/%,$(GOOGLEFONTDIRECTORY_FONTS)))
 endif
 
 ifneq ($(filter ufl/%,$(GOOGLEFONTDIRECTORY_FONTS)),)
-GOOGLEFONTDIRECTORY_LICENSE += UFL-1.1
+GOOGLEFONTDIRECTORY_ALL_LICENSES += UFL-1.1
 GOOGLEFONTDIRECTORY_LICENSE_FILES += $(addsuffix /LICENCE.txt,$(filter ufl/%,$(GOOGLEFONTDIRECTORY_FONTS)))
 endif
 
-# check-package OverriddenVariable
-GOOGLEFONTDIRECTORY_LICENSE := $(subst $(space),$(comma)$(space),$(GOOGLEFONTDIRECTORY_LICENSE))
+GOOGLEFONTDIRECTORY_LICENSE = $(subst $(space),$(comma)$(space),$(GOOGLEFONTDIRECTORY_ALL_LICENSES))
 
 define GOOGLEFONTDIRECTORY_INSTALL_TARGET_CMDS
 	$(foreach d,$(GOOGLEFONTDIRECTORY_FONTS), \
