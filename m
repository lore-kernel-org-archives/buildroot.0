From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Mar 2020 22:11:02 +0100
Subject: [Buildroot] [PATCHv2] package/localedef: fix dependencies
Message-ID: <20200317211102.12842-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

localedef needs bison to satisfy a .y.c rule to generate a parser for
plural forms, to ultimately generate data for the target. So we do not
want to depend on the host-provided bison; we want to build our own (for
reproducibility).

localedef is a host-only package, and dependencies are not inherited
from the target variant, so we need to make them explicit host
dependencies.

And move the assignment after all the download-related variables.

Reported-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - do not depend on the host provided bison
---
 package/localedef/localedef.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 10a1929044..3e22f68039 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -10,9 +10,12 @@
 LOCALEDEF_VERSION = 2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
-LOCALEDEF_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
 HOST_LOCALEDEF_DL_SUBDIR = glibc
 
+HOST_LOCALEDEF_DEPENDENCIES = \
+	$(BR2_MAKE_HOST_DEPENDENCY) \
+	host-bison
+
 HOST_LOCALEDEF_CONF_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"
 
 # Even though we use the autotools-package infrastructure, we have to override
-- 
2.20.1
