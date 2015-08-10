From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Aug 2015 15:42:25 +0200
Subject: [Buildroot] [git commit] tinc: disable PIE on ARC
Message-ID: <20150810134253.CAE1E81D64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38ea889ed07b29bd68b17b2629869588b27536e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though ARC gcc understands "-pie" option and attempts to generate
PIE binaries as of today PIE is not really supported for user-space
applications.

So we disable PIE detection if building for ARC.
That fixes http://autobuild.buildroot.net/results/2b1/2b1aa474fc432f3f79b03c4577d68642bb7e0f9c
and also prevents execution of non-supported PIE binary in runtime.

[Thomas: fix indentation.]

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tinc/tinc.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
index b8d4ca7..f7edd79 100644
--- a/package/tinc/tinc.mk
+++ b/package/tinc/tinc.mk
@@ -11,4 +11,10 @@ TINC_LICENSE = GPLv2+ with OpenSSL exception
 TINC_LICENSE_FILES = COPYING COPYING.README
 TINC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
+ifeq ($(BR2_arc),y)
+TINC_CONF_ENV += \
+	ax_cv_check_cflags___fPIE=no \
+	ax_cv_check_ldflags___pie=no
+endif
+
 $(eval $(autotools-package))
