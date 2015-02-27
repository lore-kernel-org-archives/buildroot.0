From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 14:47:53 +0100
Subject: [Buildroot] [git commit] gpm: avoid use of host emacs
Message-ID: <20150227134907.79883817BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6c8fbcdf4f89100238d89d393689df1c72f1647
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure looks for emacs installation to byte compile .el files. This may
break the build if the host installed emacs is missing needed dependencies.
Since we don't (yet?) package emacs for target, just disable detection of
emacs.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpm/gpm.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index dcf075a..dee6208 100644
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
