From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 19:46:10 +0100
Subject: [Buildroot] [git commit] linux: stop if one linux patches doesn't
	apply
Message-ID: <20150316184626.15930817EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=540e14a81c9caae52adb8482b6d73c7f716694ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If you have several linux patches directories, Buildroot does not stop
if one patches of the first directories don't apply. This patch fixes
this.

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index b1aca41..5a0ba01 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -162,11 +162,11 @@ LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
 define LINUX_APPLY_PATCHES
 	for p in $(LINUX_PATCHES) ; do \
 		if echo $$p | grep -q -E "^ftp://|^http://|^https://" ; then \
-			$(APPLY_PATCHES) $(@D) $(DL_DIR) `basename $$p` ; \
+			$(APPLY_PATCHES) $(@D) $(DL_DIR) `basename $$p` || exit 1; \
 		elif test -d $$p ; then \
-			$(APPLY_PATCHES) $(@D) $$p linux-\*.patch ; \
+			$(APPLY_PATCHES) $(@D) $$p linux-\*.patch || exit 1; \
 		else \
-			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` ; \
+			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
 		fi \
 	done
 endef
