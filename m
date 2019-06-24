From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Jun 2019 06:23:33 +0200
Subject: [Buildroot] [PATCH] package/icu: adjust version information
Message-ID: <20190624042333.1946-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The icu upstream developers have a strange way of labelling their versions:

 - The Github tags are named release-XX-Y, and therefore the versions
   referenced by by Release Monitoring look like 60-2 or 64-1.

 - The tarballs contain the version with an underscore separator, i.e
   60_2 or 64_1.

 - The directories on http://download.icu-project.org/files/icu4c/
   contain the version with a dot separator, i.e 60.2 or 64.1.

In order to have our <pkg>_VERSION match the one on Release
Monitoring, we adjust it to use the underscore separator, and then
further tweak the ICU_SOURCE and ICU_SITE definitions to keep
everything working.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/icu/icu.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index a9466c8322..7bc1b97624 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -4,9 +4,12 @@
 #
 ################################################################################
 
-ICU_VERSION = 60.2
-ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz
-ICU_SITE = http://download.icu-project.org/files/icu4c/$(ICU_VERSION)
+# Git tags (and therefore versions on release-monitoring.org) use the
+# XX-Y format, but the tarballs are named XX_Y and the containing
+# directories XX.Y.
+ICU_VERSION = 60-2
+ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
+ICU_SITE = http://download.icu-project.org/files/icu4c/$(subst -,.,$(ICU_VERSION))
 ICU_LICENSE = ICU License
 ICU_LICENSE_FILES = LICENSE
 
-- 
2.21.0
