Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3DAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 20:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45F8360AC1;
	Tue, 25 Jan 2022 20:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69v-OslYvXna; Tue, 25 Jan 2022 20:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACC0C607FF;
	Tue, 25 Jan 2022 20:49:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A92B1BF5A1
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 20:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6A1041484
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 20:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FG90r6foIcka for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 20:49:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F01CF409D3
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 20:49:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CCA6182627; Tue, 25 Jan 2022 20:42:37 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 21:37:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba48bb937bf4499e2be122bf15d0d4a1f9714143
X-Git-Newrev: b06294e9897e90862656416e8b67fdace15488d7
X-Patchwork-Hint: ignore
Message-Id: <20220125204237.CCA6182627@busybox.osuosl.org>
Subject: [Buildroot] [git commit] core/pkg-generic: fixup all PPD paths in a
 generic fashion
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b06294e9897e90862656416e8b67fdace15488d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some files contain hard-coded absolute paths that point to the host
and/or staging directories.

With per-package directories (aka. PPD), these paths point to the PPD
of the package that created the files, when we want them to point to the
PPD of the package that uses them.

Up until now, we had two hooks that attempted to fix those files:

  - a libtool-specific hook that searches for all .la files and seds
    them with the proper PPD,

  - a python-specific hook that tweaks just the sysconfigdata and
    removes the byte-compiled version of the sysconfigdata.

But now, we also have a few other kinds of files for which we need to
fix the PPD: .cmake, .pc, or .pri files, and probably a bunch of others
as well.

We solve this issue by just replacing any PPD in text files, with the
current package's PPD.

This is very similar to, and inspired from what is done when relocating
the SDK. However, we can't use the existing relocate-sdk script, because
that needs to know the original location, which we do not have when we
aggregate the PPD (we could store it, but we can easily do without it).

Furthermore, we use a construct that is way more efficient than
relocate-sdk. First, we skip binary files with grep, which means we have
way less files to check with 'file' [0]. Second, we use xargs to sed
multiple files at once: printf is a shell built-in, so it's fast, and so
we do not have to spawn a sed for each file to fixup.

[0] We still keep using 'file' as a safety net, to avoid mangling a
binary file that grep would have missed.

Finally, the existing python-specific macro is simplified to just remove
the pre-compiled sysconfigdata files. And we rename it accordingly.

And as for some timings, to see the impact, with the defconfig below,
and with the downloads already local, and with a PC mostly idle (mail
and IRC activity only):

                    Before      Now         Delta
  - without PPD :   7min 27s    7min 23s    -0.9%
  - with PPD    :   7min 51s    7min 59s    +1.7%
  - with PPD -j8:   5min 51s    5min 56s    +1.4%

So we can see a slight increase in time, but it is mostly in the noise
(some builds without this change did exceed some builds with this
change, due to background noise). Also, depending on scheduling, there
can be less parallelism; for example, python3 does not build in
parallel, and with this special defconfig, python is on the critical
path of a lot of packages that are python modules, which can negatively
impact a parallel build too. A more realistic, bigger defconfig would
probably be more parallel... YMMV...

Delta without PPD is also due to background noise, as those hooks are
not used when PPD is not enabled.

Defconfig used:
    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_PYTHON3=y
    BR2_PACKAGE_PYTHON_AIOBLESCAN=y
    BR2_PACKAGE_PYTHON_AIOCOAP=y
    BR2_PACKAGE_PYTHON_AIOFILES=y
    BR2_PACKAGE_PYTHON_AIOHTTP_CORS=y
    BR2_PACKAGE_PYTHON_AIOHTTP_DEBUGTOOLBAR=y
    BR2_PACKAGE_PYTHON_AIOHTTP_MAKO=y
    BR2_PACKAGE_PYTHON_AIOHTTP_REMOTES=y
    BR2_PACKAGE_PYTHON_AIOHTTP_SECURITY=y
    BR2_PACKAGE_PYTHON_AIOHTTP_SESSION=y
    BR2_PACKAGE_PYTHON_AIOHTTP_SSE=y
    BR2_PACKAGE_PYTHON_AIOJOBS=y
    BR2_PACKAGE_PYTHON_AIOLOGSTASH=y
    BR2_PACKAGE_PYTHON_AIOMONITOR=y
    BR2_PACKAGE_PYTHON_AIOPROCESSING=y
    BR2_PACKAGE_PYTHON_AIOREDIS=y
    BR2_PACKAGE_PYTHON_AIORWLOCK=y
    BR2_PACKAGE_PYTHON_AIOZIPKIN=y
    BR2_PACKAGE_LIGHTTPD=y
    BR2_PACKAGE_LIGHTTPD_OPENSSL=y
    BR2_PACKAGE_LIGHTTPD_ZLIB=y
    BR2_PACKAGE_LIGHTTPD_BZIP2=y
    BR2_PACKAGE_LIGHTTPD_PCRE=y
    BR2_PACKAGE_LIGHTTPD_WEBDAV=y
    # BR2_TARGET_ROOTFS_TAR is not set

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Louis-Paul CORDIER <lpdev@cordier.org>
Cc: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-generic.mk | 45 ++++++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6a5fe5507b..78226ee266 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -90,21 +90,24 @@ endif
 #######################################
 # Helper functions
 
-# Make sure .la files only reference the current per-package
-# directory.
-
-# $1: package name (lower case)
-# $2: staging directory of the package
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define fixup-libtool-files
-	$(Q)find $(2) \( -path '$(2)/lib*' -o -path '$(2)/usr/lib*' \) \
-		-name "*.la" -print0 | xargs -0 --no-run-if-empty \
-		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$(1)/:g"
+
+# Ensure files like .la, .pc, .pri, .cmake, and so on, point to the
+# proper staging and host directories for the current package: find
+# all text files that contain the PPD root, and replace it with the
+# current package's PPD.
+define PPD_FIXUP_PATHS
+	$(Q)grep --binary-files=without-match -lrZ '$(PER_PACKAGE_DIR)/[^/]\+/' $(HOST_DIR) \
+	|while read -d '' f; do \
+		file -b --mime-type "$${f}" | grep -q '^text/' || continue; \
+		printf '%s\0' "$${f}"; \
+	done \
+	|xargs -0 --no-run-if-empty \
+		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
 endef
-endif
 
-# Make sure python _sysconfigdata*.py files only reference the current
-# per-package directory.
+# Remove python's pre-compiled "sysconfigdata", as it may contain paths to
+# the original staging or host dirs.
 #
 # Can't use $(foreach d, $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python*, ...)
 # because those directories may be created in the same recipe this macro will
@@ -113,19 +116,15 @@ endif
 # fail.
 # So we just use HOST_DIR as a starting point, and filter on the two directories
 # of interest.
-ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define FIXUP_PYTHON_SYSCONFIGDATA
+define PPD_PYTHON_REMOVE_SYSCONFIGDATA_PYC
 	$(Q)find $(HOST_DIR) \
 		\(    -path '$(HOST_DIR)/lib/python*' \
 		   -o -path '$(STAGING_DIR)/usr/lib/python*' \
 		\) \
-		\(    \( -name "_sysconfigdata*.pyc" -delete \) \
-		   -o \( -name "_sysconfigdata*.py" -print0 \) \
-		\) \
-	| xargs -0 --no-run-if-empty \
-		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
+		\( -name "_sysconfigdata*.pyc" -delete \)
 endef
-endif
+
+endif  # PPD
 
 # Functions to collect statistics about installed files
 
@@ -278,8 +277,6 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call pkg_size_before,$(STAGING_DIR),-staging)
 	@$(call pkg_size_before,$(BINARIES_DIR),-images)
 	@$(call pkg_size_before,$(HOST_DIR),-host)
-	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
-	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
 	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
@@ -836,7 +833,9 @@ $(2)_EXTRACT_CMDS ?= \
 		$$(TAR_OPTIONS) -)
 
 # pre/post-steps hooks
-$(2)_POST_PREPARE_HOOKS += FIXUP_PYTHON_SYSCONFIGDATA
+$(2)_POST_PREPARE_HOOKS += \
+	PPD_FIXUP_PATHS \
+	PPD_PYTHON_REMOVE_SYSCONFIGDATA_PYC
 
 ifeq ($$($(2)_TYPE),target)
 ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
