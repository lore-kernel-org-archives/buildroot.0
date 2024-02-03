Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F38C4828D
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 17:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 282EE41C61;
	Sat,  3 Feb 2024 17:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 282EE41C61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T3rINMEPIFgy; Sat,  3 Feb 2024 17:45:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46F03414E5;
	Sat,  3 Feb 2024 17:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46F03414E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED3FF1BF97E
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 11:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB54260806
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 11:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qq_UF88IM-Kh for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 11:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B4D4607FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B4D4607FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B4D4607FE
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 11:28:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74A43867B3; Sat,  3 Feb 2024 11:28:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Feb 2024 12:23:28 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 710935ea5f988ed36d0184cd0eb3fcfa695a0995
X-Git-Newrev: 003d02c476b9ff88416f9cc99dbb4a3c0f78664a
X-Patchwork-Hint: ignore
Message-Id: <20240203112820.74A43867B3@busybox.osuosl.org>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 spf=fail smtp.mailfrom=osuosl.org
Subject: [Buildroot] [git commit branch/2023.11.x]
 package/flutter-sdk-bin/Config.in.host: change flutter-pub-cache location
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

commit: https://git.buildroot.net/buildroot/commit/?id=003d02c476b9ff88416f9cc99dbb4a3c0f78664a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

When running the command "flutter pub get," the plugins are stored in the
pub-cache directory along with their sha256sum hashes. The default location of
the pub-cache directory is current $(HOST_DIR)/share/flutter/sdk/.pub-cache,
which is not an acceptable choice by default because every plugin is
re-downloaded during every build of a flutter application either during a new
build or when building with the per-package-directory option enabled.

Furthermore, keeping the pub-cache in its current location prevents users from
committing the pub-cache directory to git for faster rebuilds of a
Buildroot-based system, as users cannot store the pub-cache for later use.

To fix the above issue completely, the following two changes must occur:

  - Change the hard-coded Flutter pub-cache location to
    $(DL_DIR)/br-flutter-pub-cache.

  - Remove the `rm -rf $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache` and the
    associated comment about why the build system removes the .pub-cache
    directory. After further research, the help text of the precache command
    reads, "Populate the Flutter tool's cache of binary artifacts."
    The current reasoning listed in the comments is not accurate for a
    the following reasons:

    1. We do not want to remove their directory if users already have a pub
       cache they have symlinked to.

    2. If the flutter-sdk-bin package previously set up the pub-cache, then
       the pub-cache directory is set up with the options we want, and there
       is no reason to remove the pub-cache directory.

Note that upstream considers it safe to have multiple instances of
readers/writers to the pub cache concurently, which is a situation that
can happen when two flutter-based pacakges are going to be built in
parallel. There have been reports upstream [0] [1] [2] where concurrency
was an issue, and they have always been fixed [3] [4] (or considered
fixed already). So we can assune that, if the conncurrent ccess to the
shared pub-cache causes issues, that will be an upstream bug that will
get solved.

If that turns out to be an unsolvable problem, we'll still have the
option to run the pub-get commands under flock.

[0] https://github.com/dart-lang/pub/issues/1178
[1] https://github.com/dart-lang/pub/issues/3404
[2] https://github.com/dart-lang/pub/issues/3420
[3] https://github.com/dart-lang/pub/issues/1178#issuecomment-1006489414
[4] https://github.com/dart-lang/pub/issues/1178#issuecomment-1007273739

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: add blurb about concurrent access]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 37809258fc014d743f7becbc5ba256234d807bd7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index e8e71b6ab0..35bde00b9d 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -41,11 +41,8 @@ define HOST_FLUTTER_SDK_BIN_CONFIGURE_CMDS
 	$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/dart --disable-analytics
 endef
 
-# Remove the cache, as we will run precache after setting up flutter and dart
-# with the new config options.
 define HOST_FLUTTER_SDK_BIN_BUILD_CMDS
 	mkdir -p $(HOST_FLUTTER_SDK_BIN_SDK)
-	rm -rf $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
 	cd $(@D) && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/flutter precache;
 endef
@@ -96,4 +93,4 @@ HOST_FLUTTER_SDK_BIN_DART_BIN = \
 $(eval $(host-generic-package))
 
 # For target packages to locate said pub-cache
-FLUTTER_SDK_BIN_PUB_CACHE = $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
+FLUTTER_SDK_BIN_PUB_CACHE = $(DL_DIR)/br-flutter-pub-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
