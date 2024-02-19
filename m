Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92223C54766
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 09:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DD6240680;
	Mon, 19 Feb 2024 09:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C0W0l4sm3Zld; Mon, 19 Feb 2024 09:52:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DD9E40746
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DD9E40746;
	Mon, 19 Feb 2024 09:52:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2CB81BF5E9
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 09:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF83281FA9
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 09:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NgL2KVLkHW1Q for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 09:52:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.130.47;
 helo=dd5108.kasserver.com; envelope-from=dev@andin.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D30FC8188D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D30FC8188D
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D30FC8188D
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 09:52:29 +0000 (UTC)
Received: from wslxew206.. (ipb21bd56e.dynamic.kabel-deutschland.de
 [178.27.213.110])
 by dd5108.kasserver.com (Postfix) with ESMTPA id 064655241620;
 Mon, 19 Feb 2024 10:52:26 +0100 (CET)
From: Andreas Naumann <anaumann@ultratronik.de>
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 10:51:53 +0100
Message-Id: <20240219095155.2758428-1-anaumann@ultratronik.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=ultratronik.de
Subject: [Buildroot] [PATCH 0/2] Fix flutter build failure
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andreas Naumann <anaumann@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam, all,
I was motivated to give flutter a spin after your talk at FOSDEM,
however the recent bump to Python 3.12.1 broke some script during
the flutter-engine configure step.
Fortunately now a new major stable version has been released 3.19.0,
which contains a patch for this.

After bumping engine and sdk they successfully build again, as does
creating the flutter bundles which you provided in
https://github.com/aduskett/buildroot-fosdem2024-flutter-demos

I have not yet been able to run them using ivi-homescreen, but that's
probably due to my target display/wayland setup.

However, the flutter-gallery no longer builds with 3.19, even after
bumping to the main HEAD. Their github README says
"NOTE: The Flutter Gallery is now deprecated, and no longer being active
maintained."
I thought about including a patch for removal of the gallery package,
but that would leave us with no example for how to create a flutter
bundle.


regards,
Andreas


Andreas Naumann (2):
  package/flutter-engine: bump to version 3.19.0
  package/flutter-sdk-bin: bump to version 3.19.0

 package/flutter-engine/flutter-engine.mk     | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
