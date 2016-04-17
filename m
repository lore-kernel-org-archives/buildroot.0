From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Apr 2016 10:55:23 +0200
Subject: [Buildroot] [git commit] Revert "core: also display the custom help
	with our main help"
Message-ID: <20160417085733.4BFCD818DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a49b81ed69e3da1f7854efcab8133081ee367556
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 0a767deba004c920e7824543380cffbb298507f8.

Turns out that the custom help is not available when the $(O) directory
has not been configure yet (i.e. when there is no .config already
filled).

Rather than trying to work around this limitation with dirty hacks, just
revert this feature. After all, this will not prevent an external.mk
from providing custom help anyway; it's just not gonna be advertised nor
displayed with the main help.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 55735ea..d205ac9 100644
--- a/Makefile
+++ b/Makefile
@@ -895,9 +895,7 @@ endif
 	rm -rf $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
 		$(CONFIG_DIR)/.auto.deps $(BR2_EXTERNAL_FILE)
 
-help: help-internal help-custom
-
-help-internal:
+help:
 	@echo 'Cleaning:'
 	@echo '  clean                  - delete all files created by build'
 	@echo '  distclean              - delete all non-source files (including .config)'
@@ -970,6 +968,7 @@ endif
 	@echo '  source-check           - check selected packages for valid download URLs'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
+	@echo '  help-custom            - print help about custom actions (if any)'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
