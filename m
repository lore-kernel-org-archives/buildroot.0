From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 10 Mar 2020 17:30:40 +0100
Subject: [Buildroot] [PATCH] package/localedef: fix dependencies
Message-ID: <20200310163040.23049-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

localedef needs bison to satisfy a .y.c rule at build time. So, we can
depend on the system bison, or use our own if needed.

localedef is a host-only package, and dependencies are not inherited
from the target variant, so we need to make them explicit host
dependencies.

Split the assignemnt or it would make the line too long. And move it
after all the download-relateed variables.

Reported-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/localedef/localedef.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 10a1929044..6f7efe9f9d 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -10,9 +10,12 @@
 LOCALEDEF_VERSION = 2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
-LOCALEDEF_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
 HOST_LOCALEDEF_DL_SUBDIR = glibc
 
+HOST_LOCALEDEF_DEPENDENCIES = \
+	$(BR2_BISON_HOST_DEPENDENCY) \
+	$(BR2_MAKE_HOST_DEPENDENCY)
+
 HOST_LOCALEDEF_CONF_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"
 
 # Even though we use the autotools-package infrastructure, we have to override
-- 
2.20.1
