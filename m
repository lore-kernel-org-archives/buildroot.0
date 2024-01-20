Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B547C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 20:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1EE660F31;
	Sat, 20 Jan 2024 20:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1EE660F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yc-pbsg_jQEP; Sat, 20 Jan 2024 20:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05C1660F25;
	Sat, 20 Jan 2024 20:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05C1660F25
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABBC61BF31E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 20:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8563382D12
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 20:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8563382D12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fc4sLvnzcDxL for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 20:34:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9987882C35
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 20:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9987882C35
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D3A4861C4; Sat, 20 Jan 2024 20:34:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 21:24:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a59c3a4d4fd70b08ec6e9d1d54a3308d2a39281
X-Git-Newrev: 37809258fc014d743f7becbc5ba256234d807bd7
X-Patchwork-Hint: ignore
Message-Id: <20240120203441.6D3A4861C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-sdk-bin/Config.in.host:
 change flutter-pub-cache location
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

commit: https://git.buildroot.net/buildroot/commit/?id=37809258fc014d743f7becbc5ba256234d807bd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/flutter-sdk-bin/flutter-sdk-bin.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 5e5042bea8..2e37e6f036 100644
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
@@ -104,4 +101,4 @@ HOST_FLUTTER_SDK_BIN_DART_BIN = \
 $(eval $(host-generic-package))
 
 # For target packages to locate said pub-cache
-FLUTTER_SDK_BIN_PUB_CACHE = $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
+FLUTTER_SDK_BIN_PUB_CACHE = $(DL_DIR)/br-flutter-pub-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
