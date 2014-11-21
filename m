From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Nov 2014 21:50:35 +0100
Subject: [Buildroot] [git commit] Makefile: use more sensible names for
	locale related variables
Message-ID: <20141121205146.6D8017FE1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=404f4933c9350d4244e4ca3fd8e574082276aa3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The GENERATE_LOCALE variable is used for the qstripped version of
BR2_GENERATE_LOCALE. It was used by both the glibc locale generation
code (in the main Makefile), and by the uClibc logic in
package/uclibc/uclibc.mk. However, since commit
33de7401701e5242196a86b0695ee4ae9a4c4082 ("Makefile: convert
"target-generatelocales" to a hook"), this code has been moved around
in the main Makefile, and the definition of GENERATE_LOCALE is now
*after* uclibc.mk is included, and therefore this variable is always
empty when uclibc.mk looks at it for its conditionals. Moreover, it is
now only defined in the main Makefile is BR2_TOOLCHAIN_USES_GLIBC is
'y', which obviously isn't the case for uClibc toolchains.

Since it's anyway not very clear to have this variable shared between
the glibc locale generation logic in the main Makefile and the uClibc
configuration code in uclibc.mk, this commit:

 - Renames the GENERATE_LOCALE variable in the main Makefile to
   GLIBC_GENERATE_LOCALES.

 - Renames the GENERATE_LOCALES hook to GENERATE_GLIBC_LOCALES, since
   it's specific to glibc.

The fix for the uClibc case is part of a followup commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 3d8283b..b66bea0 100644
--- a/Makefile
+++ b/Makefile
@@ -514,13 +514,13 @@ endif
 # not have them (Linaro toolchains), we use the ones available on the
 # host machine.
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
-GENERATE_LOCALE = $(call qstrip,$(BR2_GENERATE_LOCALE))
-ifneq ($(GENERATE_LOCALE),)
+GLIBC_GENERATE_LOCALES = $(call qstrip,$(BR2_GENERATE_LOCALE))
+ifneq ($(GLIBC_GENERATE_LOCALES),)
 TARGETS += host-localedef
 
-define GENERATE_LOCALES
+define GENERATE_GLIBC_LOCALES
 	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
-	$(Q)for locale in $(GENERATE_LOCALE) ; do \
+	$(Q)for locale in $(GLIBC_GENERATE_LOCALES) ; do \
 		inputfile=`echo $${locale} | cut -f1 -d'.'` ; \
 		charmap=`echo $${locale} | cut -f2 -d'.' -s` ; \
 		if test -z "$${charmap}" ; then \
@@ -535,7 +535,7 @@ define GENERATE_LOCALES
 			$${locale} ; \
 	done
 endef
-TARGET_FINALIZE_HOOKS += GENERATE_LOCALES
+TARGET_FINALIZE_HOOKS += GENERATE_GLIBC_LOCALES
 endif
 endif
 
