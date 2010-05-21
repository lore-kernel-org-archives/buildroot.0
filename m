From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 May 2010 16:19:11 +0200
Subject: [Buildroot] [git commit master] Makefile: move filesystem stuff
	after u-boot build again
Message-ID: <20100521141957.5454E8F6D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=319a4751c4a3a0209f628a7470a6d8e400d3479d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise u-boot tools / kernel modules are only added to target AFTER
the filesystems are built.

Long term u-boot/kernel stuff should get splitted from target/device,
but this is the safest solution for now.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile           |    2 --
 target/Makefile.in |    2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index a4bf4b5..d59ea45 100644
--- a/Makefile
+++ b/Makefile
@@ -320,8 +320,6 @@ ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 TARGETS+=target-purgelocales
 endif
 
-include fs/common.mk
-
 # target stuff is last so it can override anything else
 include target/Makefile.in
 
diff --git a/target/Makefile.in b/target/Makefile.in
index afe96a7..ffcdbb6 100644
--- a/target/Makefile.in
+++ b/target/Makefile.in
@@ -62,6 +62,8 @@ ifeq ($(BR2_TARGET_UBOOT),y)
 include target/u-boot/Makefile.in
 endif
 
+include fs/common.mk
+
 # kernel rules
 # We already did add the kernel target to TARGETS and now just pull in the rules
 # to actually build this target.
-- 
1.6.3.3
