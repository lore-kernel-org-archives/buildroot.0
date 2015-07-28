From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 23:06:57 +0200
Subject: [Buildroot] [git commit branch/next] libiscsi: Force configure to
	use gcc for LD
Message-ID: <20150808105649.390757FD56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84471f1e4b531a262e8f4d2423baf5257ecd29fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes
http://autobuild.buildroot.org/results/0a9/0a96f3654983ed2efc851522352dec43c1df0077/

[Thomas:
  - pass the CC variable in <pkg>_CONF_ENV instead of <pkg>_CONF_OPTS
  - add comment in the code explaining why we are doing this.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiscsi/libiscsi.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index 7877cd9..adb94bd 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -10,4 +10,8 @@ LIBISCSI_LICENSE = GPLv2+ LGPLv2.1+
 LIBISCSI_LICENSE_FILES = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
 LIBISCSI_INSTALL_STAGING = YES
 
+# Force libiscsi to use gcc as the linker, otherwise it uses directly
+# ld, which doesn't work for certain architectures.
+LIBISCSI_CONF_ENV = LD="$(TARGET_CC)"
+
 $(eval $(autotools-package))
