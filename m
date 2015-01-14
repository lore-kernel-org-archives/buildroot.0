From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 16:48:56 +0100
Subject: [Buildroot] [git commit] linux/linux.mk: added https:// pattern for
	kernel patches
Message-ID: <20150114154902.3613D80142@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc6ee4cadbe39fc5803f3d603b7ab4c3948b1bbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches located at https:// scheme URL were threated as directories,
causing build failures.

Fixed by adding https:// pattern.

Signed-off-by: Ivo Slanina <ivo.slanina@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 680521c..d02b02b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -147,7 +147,7 @@ endif # BR2_LINUX_KERNEL_VMLINUX
 define LINUX_DOWNLOAD_PATCHES
 	$(if $(LINUX_PATCHES),
 		@$(call MESSAGE,"Download additional patches"))
-	$(foreach patch,$(filter ftp://% http://%,$(LINUX_PATCHES)),\
+	$(foreach patch,$(filter ftp://% http://% https://%,$(LINUX_PATCHES)),\
 		$(call DOWNLOAD,$(patch))$(sep))
 endef
 
@@ -155,7 +155,7 @@ LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
 
 define LINUX_APPLY_PATCHES
 	for p in $(LINUX_PATCHES) ; do \
-		if echo $$p | grep -q -E "^ftp://|^http://" ; then \
+		if echo $$p | grep -q -E "^ftp://|^http://|^https://" ; then \
 			$(APPLY_PATCHES) $(@D) $(DL_DIR) `basename $$p` ; \
 		elif test -d $$p ; then \
 			$(APPLY_PATCHES) $(@D) $$p linux-\*.patch ; \
