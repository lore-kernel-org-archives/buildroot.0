From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed,  1 Jul 2015 15:35:51 +0300
Subject: [Buildroot] [PATCH] lvm2: disable PIE on ARC
Message-ID: <1435754151-23359-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though ARC gcc understands "-pie" option and attempts to generate
PIE binaries as of today PIE is not really supported for user-space
applications.

So we disable PIE detection if building for ARC.
That first fixes http://autobuild.buildroot.net/results/988/9888a7a30538c9851f4910c16674d8dbb8edeb8f/
and also prevents execution of non-supported PIE binary in runtime.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index a2db504..6939389 100644
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
-- 
2.4.3
