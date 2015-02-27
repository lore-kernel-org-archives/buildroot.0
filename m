From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 27 Feb 2015 14:20:00 +0200
Subject: [Buildroot] [PATCH] gpm: avoid use of host emacs
Message-ID: <5cc51818c93e8e6c44ac6e47e61a858d9f9295da.1425039600.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

configure looks for emacs installation to byte compile .el files. This may
break the build if the host installed emacs is missing needed dependencies.
Since we don't (yet?) package emacs for target, just disable detection of
emacs.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gpm/gpm.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index dcf075a9c636..dee620811308 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -15,7 +15,8 @@ GPM_DEPENDENCIES = host-bison
 # if not already installed in staging dir, gpm Makefile may fail to find some
 # of the headers needed to generate build dependencies, the first time it is
 # built. CPPFLAGS is used to pass the right include path to dependency rules.
-GPM_CONF_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) -I$(@D)/src/headers/"
+GPM_CONF_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) -I$(@D)/src/headers/" \
+			   ac_cv_path_emacs=no
 
 # For some reason, Microblaze gcc does not define __ELF__, which gpm
 # configure script uses to determine whether the architecture uses ELF
-- 
2.1.4
