From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 22:42:31 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/localedef: fix
 dependencies
Message-ID: <20200327213456.21F7B88690@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79f1c0cd18cca0d8c3c691be0d03c3c466b01f52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit af90a104c06542a1bf5545eaf9b9c7beb7176e80)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
