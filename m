From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 10 Aug 2015 16:36:36 +0300
Subject: [Buildroot] [PATCH] tinc: disable PIE on ARC
Message-ID: <1439213796-31805-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though ARC gcc understands "-pie" option and attempts to generate
PIE binaries as of today PIE is not really supported for user-space
applications.

So we disable PIE detection if building for ARC.
That fixes http://autobuild.buildroot.net/results/2b1/2b1aa474fc432f3f79b03c4577d68642bb7e0f9c
and also prevents execution of non-supported PIE binary in runtime.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tinc/tinc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
index b8d4ca7..73cceaf 100644
--- a/package/tinc/tinc.mk
+++ b/package/tinc/tinc.mk
@@ -11,4 +11,8 @@ TINC_LICENSE = GPLv2+ with OpenSSL exception
 TINC_LICENSE_FILES = COPYING COPYING.README
 TINC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
+ifeq ($(BR2_arc),y)
+TINC_CONF_ENV += ax_cv_check_cflags___fPIE=no ax_cv_check_ldflags___pie=no
+endif
+
 $(eval $(autotools-package))
-- 
2.4.3
