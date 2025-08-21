Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F19CA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 18:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E355561727;
	Thu, 21 Aug 2025 18:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5clXeuE1iUn; Thu, 21 Aug 2025 18:57:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9D6B616F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9D6B616F0;
	Thu, 21 Aug 2025 18:57:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CC9C1C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34386418CC
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lztfBWtUcMzI for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63306418BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63306418BB
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53AEB813AF; Thu, 21 Aug 2025 18:57:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 16:27:46 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 84164861c929b43a29ae0f029e02e096c1a1467f
X-Git-Newrev: cbf3ead4c8d8fdb8787a4a4c74221687b1dfe5cf
X-Patchwork-Hint: ignore
Message-Id: <20250821185709.53AEB813AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/setserial: apply
 patches from setserial_2.17-45.3.diff.gz
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0516507785833497497=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0516507785833497497==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cbf3ead4c8d8fdb8787a4a4c74221687b1dfe5cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since 64ac7199525f ("apply-patches.sh: add recursivity when scanning
patchdir"), patches with the .dpatch file extension are simply ignored.

Unfortunately, setserial package stopped applying the patches after that
commit.

Sadly, 0002-tiocghayesesp-build-fix.patch is breaking the patch context
for patch 18 in the debian diff because we are currently applying
patches from within Buildroot tree before applying the ones we download
from Debian. Instead of doing some hacks, let's apply Debian patches
before Buildroot's. However, this requires a few changes. First, we need
to migrate away from the SETSERIAL_PATCH mechanism because currently
_PRE_PATCH_HOOKS runs before this is applied and _POST_PATCH_HOOKS runs
after the Buildroot patches are applied.
Instead, let's use an _EXTRA_DOWNLOADS we manually extract à-la
package/android-tools/android-tools.mk. Then in the _PRE_PATCH_HOOKS, we
apply the big diff the _EXTRA_DOWNLOADS contains so that the patches
from within can be applied afterwards.

Because the big diff still contains only patches with the *.dpatch
extensions that are not supported anymore, we need to either rename all
patches or use the 00list file that lists all patches in the order they
need to be applied. Fortunately, Buildroot already supports applying
patches with `patch` regardless of their extension if they are within
such a file. Unfortunately, it needs to be called "series", hence the
renaming.

Because patch 18 from the big diff is now applied before
0002-tiocghayesesp-build-fix.patch from Buildroot tree, the latter will
fail if left unmodified, so this commit also rebases it.

Finally, we keep the removal of 01_makefile.dpatch for now even though
it only exists because it generates a conflict with
0001-build-system-fix.patch from Buildroot tree. It'll be rebased in a
later commit though.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 534147af946dab2013398f6bd50df903c0276ef7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |  1 -
 .../setserial/0002-tiocghayesesp-build-fix.patch   |  7 ++++--
 package/setserial/setserial.mk                     | 26 ++++++++++++++++++----
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 589a635a38..92e18eb515 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1090,7 +1090,6 @@ package/sentry-native/0001-sentry.h-include-ucontext.h.patch lib_patch.Upstream
 package/ser2net/S50ser2net Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch lib_patch.Upstream
 package/setserial/0001-build-system-fix.patch lib_patch.Upstream
-package/setserial/0002-tiocghayesesp-build-fix.patch lib_patch.Upstream
 package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netfilter_conntr.patch lib_patch.Upstream
 package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch lib_patch.Upstream
 package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch lib_patch.Upstream
diff --git a/package/setserial/0002-tiocghayesesp-build-fix.patch b/package/setserial/0002-tiocghayesesp-build-fix.patch
index 176a0c9e15..670be34c28 100644
--- a/package/setserial/0002-tiocghayesesp-build-fix.patch
+++ b/package/setserial/0002-tiocghayesesp-build-fix.patch
@@ -6,6 +6,9 @@ define the TIOCGHAYESESP ioctl, breaking the build.
 It's very unlikely to be of interest anymore, so just undef it.
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+[rebased on top of Debian's setserial_2.17-45.3.diff]
+Upstream: N/A only for compatibility with Linux kernels [2.6.33;2.6.36[
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
 ---
  setserial.c |    5 +++++
  1 file changed, 5 insertions(+)
@@ -14,9 +17,9 @@ Index: setserial-2.17/setserial.c
 ===================================================================
 --- setserial-2.17.orig/setserial.c
 +++ setserial-2.17/setserial.c
-@@ -24,6 +24,11 @@
+@@ -39,6 +39,11 @@
+ #include "safety.h"
  #endif
- #include <linux/serial.h>
  
 +/* linux/hayesesp.h got removed in 2.6.33 but some archs (like x86)
 +   still define TIOCGHAYESESP. It's very unlikely to be of interest
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 66ca59d79d..002bf21161 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -5,23 +5,41 @@
 ################################################################################
 
 SETSERIAL_VERSION = 2.17
-SETSERIAL_PATCH = setserial_2.17-45.3.diff.gz
 SETSERIAL_SOURCE = setserial_$(SETSERIAL_VERSION).orig.tar.gz
 SETSERIAL_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/setserial
+SETSERIAL_EXTRA_DOWNLOADS = setserial_2.17-45.3.diff.gz
 SETSERIAL_LICENSE = GPL-2.0
 SETSERIAL_LICENSE_FILES = debian/copyright
 # make all also builds setserial.cat which needs nroff
 SETSERIAL_MAKE_OPTS = setserial
 
+# Extract the Debian tarball inside the sources
+define SETSERIAL_DEBIAN_EXTRACT
+	$(call suitable-extractor,$(notdir $(SETSERIAL_EXTRA_DOWNLOADS))) \
+		$(SETSERIAL_DL_DIR)/$(notdir $(SETSERIAL_EXTRA_DOWNLOADS)) > $(@D)/setserial_2.17-45.3.diff
+endef
+
+SETSERIAL_POST_EXTRACT_HOOKS += SETSERIAL_DEBIAN_EXTRACT
+
 define SETSERIAL_APPLY_DEBIAN_PATCHES
-	# Touching gorhack.h is needed for the Debian patch 18 to work
+	# - Applying diff gotten from SETSERIAL_EXTRA_DOWNLOADS
+	# - Touching gorhack.h is needed for the Debian patch 18 to work
+	# - Rename 00list which contains the list of patches to "series" so
+	#   Buildroot knows in which order the patches need to be applied. This
+	#   is necessary because their file extension is dpatch, which isn't
+	#   supported by the APPLY_PATCHES script outside of the series
+	#   mechanism.
+	$(APPLY_PATCHES) $(@D) $(@D) setserial_2.17-45.3.diff
+
 	if [ -d $(@D)/debian/patches ]; then \
 		touch $(@D)/gorhack.h; \
 		rm $(@D)/debian/patches/01_makefile.dpatch; \
-		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches *.dpatch; \
+		mv $(@D)/debian/patches/00list $(@D)/debian/patches/series; \
+		sed -i '/01_makefile.dpatch/d' $(@D)/debian/patches/series; \
+		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches series; \
 	fi
 endef
 
-SETSERIAL_POST_PATCH_HOOKS += SETSERIAL_APPLY_DEBIAN_PATCHES
+SETSERIAL_PRE_PATCH_HOOKS += SETSERIAL_APPLY_DEBIAN_PATCHES
 
 $(eval $(autotools-package))

--===============0516507785833497497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0516507785833497497==--
