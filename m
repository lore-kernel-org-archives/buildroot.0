From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 11:00:45 +0200
Subject: [Buildroot] [git commit] lvm2: disable PIE on ARC
Message-ID: <20150702090455.C106C818E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c51fed1ff2e7ab66900fa26732ea63dbf148462
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though ARC gcc understands "-pie" option and attempts to generate
PIE binaries as of today PIE is not really supported for user-space
applications.

So we disable PIE detection if building for ARC.
That first fixes http://autobuild.buildroot.net/results/988/9888a7a30538c9851f4910c16674d8dbb8edeb8f/
and also prevents execution of non-supported PIE binary in runtime.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index bae0d54..6a3aec3 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -43,4 +43,8 @@ else
 LVM2_CONF_OPTS += --disable-applib
 endif
 
+ifeq ($(BR2_arc),y)
+LVM2_CONF_ENV += ac_cv_flag_HAVE_PIE=no
+endif
+
 $(eval $(autotools-package))
