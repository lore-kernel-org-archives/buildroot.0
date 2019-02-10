From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Feb 2019 16:48:15 +0100
Subject: [Buildroot] [PATCH] package/googlefontdirectory: better solution to
 avoid check-package warning
Message-ID: <20190210154815.25334-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rather than tell check-package to ignore a false-positive issue, just
avoid the issue to begin with, by using an intermediate variable to
construct the list of licenses.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.14.1
