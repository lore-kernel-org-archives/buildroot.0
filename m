Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1339AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 11:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CAFB60BD5;
	Sat, 12 Mar 2022 11:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LkgTBlSHm9zn; Sat, 12 Mar 2022 11:03:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 529856080B;
	Sat, 12 Mar 2022 11:03:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B41751BF30E
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 11:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFB6060784
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 11:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NXLslMzlIzjN for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 11:03:37 +0000 (UTC)
X-Greylist: delayed 00:19:05 by SQLgrey-1.8.0
Received: from ruschival.de (mail.rolf-dv.de [168.119.71.121])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4DEA6080B
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 11:03:36 +0000 (UTC)
Received: from i59f4be88.versanet.de ([89.244.190.136]
 helo=VillaStraylight.fritz.box)
 by rolf-dv.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <thomas@ruschival.de>)
 id 1nSzEa-0007NO-HM; Sat, 12 Mar 2022 11:44:28 +0100
From: Thomas Ruschival <thomas@ruschival.de>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 11:44:01 +0100
Message-Id: <20220312104402.33075-1-thomas@ruschival.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/1] Bump pistache,
 switch to meson build (test-pkg fails)
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
Cc: Thomas Ruschival <thomas@ruschival.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The pistache project has moved to meson build and cmake build seems to be
neglected e.g. the cmake build on host did no longer install header files.

This patch switches to meson build. As a nice side effect newer upstream
versions already include the patches by Fabrice Fontaine so the buildroot
package does no longer need the patch files.

The upstream project now has a hard dependency to RapidJSON. While I tested it
with a full build for Raspberry Pi Zero W and BananaPi, I can't get it to work
with utils/test-pkg.

I set in pistache.cfg:

BR2_PACKAGE_PISTACHE=y
BR2_PACKAGE_RAPIDJSON=y

and ran
./utils/test-pkg -c ./pistache.cfg -p pistache -d br-test

The meson-build fails complaining about missing rapidjson.

I am not sure if my patch is broken or if I am just don't use the tools
correctly. Any help appreciated.

regards
Thomas

Thomas Ruschival (1):
  package/pistache: bump version & switch to meson build

 ...-add-C-language-to-project-statement.patch | 70 --------------
 ...eLists.txt-respect-BUILD_SHARED_LIBS.patch | 95 -------------------
 ...de-pistache-typeid.h-include-cstddef.patch | 38 --------
 package/pistache/Config.in                    |  9 +-
 package/pistache/pistache.hash                |  2 +-
 package/pistache/pistache.mk                  |  9 +-
 6 files changed, 11 insertions(+), 212 deletions(-)
 delete mode 100644 package/pistache/0001-CMakeLists.txt-add-C-language-to-project-statement.patch
 delete mode 100644 package/pistache/0002-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch
 delete mode 100644 package/pistache/0003-include-pistache-typeid.h-include-cstddef.patch

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
