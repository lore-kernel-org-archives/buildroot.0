From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 11:50:21 +0200
Subject: [Buildroot] [PATCH] gpm: fix build on Microblaze due to ELF check
Message-ID: <1400320221-7784-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/19d/19d93324caac8b4aad7abfe7b6c3d85612636368/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpm/gpm.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index 477c54a..d37b4ed 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -17,6 +17,14 @@ GPM_DEPENDENCIES = host-bison
 # built. CPPFLAGS is used to pass the right include path to dependency rules.
 GPM_CONF_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) -I$(@D)/src/headers/"
 
+# For some reason, Microblaze gcc does not define __ELF__, which gpm
+# configure script uses to determine whether the architecture uses ELF
+# binaries and therefore can build shared libraries. We fix this by
+# telling GPM that ELF is used on Microblaze.
+ifeq ($(BR2_microblaze),y)
+GPM_CONF_ENV += itz_cv_sys_elf=yes
+endif
+
 # gpm and ncurses have a circular dependency. As gpm function GPM_Wgetch()
 # (requiring ncurses) is not recommended for use by ncurses people themselves
 # and as it's better to have gpm support in ncurses that the contrary, we force
-- 
1.9.3
