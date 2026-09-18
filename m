Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430D7C982E0
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB80160D80;
	Fri, 18 Sep 2026 13:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDV3LJEzVl6g; Fri, 18 Sep 2026 13:06:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CE39F60D76
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736801;
	b=ZEyzs0FOeVqiXxQE0JDlygyCLhNWorzrTqHrmnqv8UK+B0DFnJS6/mQzxNToDOlOt4X0
	 MgY5DbMjljJVzapZzSax7ofIMmet6Ypwiu4Oi47kuM4w1uZ8D7W9vrGJLn1o6cLqHHvMz
	 mfvZOozbzrIdn/F2Ybpe85exvTmXNn2lhaJ45kQNMnYNhgKAiKf0SbRJ3OVRFGOd1grmz
	 efswFbEyuOofPBWQOWFA76stODo35+vHLjoq1XEy0raGLDHAgAAYH3QbsoldQx2WMr33l
	 Uzv34ZUUWYpiX9p1hOO7X5H0sorYXREUyWCrqZuffbL8mR15ifFtPV5vZ99jouFHcEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736801;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fTvYFoxsoSy0IjLe8LN9+y+RTd0fjnL/k/a6uIjr6Xs=;
	b=p3B7InXiBmugRWyOfbexsIIpYKQzJGVRjaLhgvucRZCPhHSOKx0Bxxbx/d9iMOZndMvX
	 epg2CKh3cEsgw+1uiP3IjJmtoNne8qZBusawWFmqsReOMG1PeM6EMFXYsbfgDZ0SzjLNW
	 fdCIFrg08QeTmK/HUwZukMSJ1mLxdcLcTk/Ta3IBKcT6Ci/zkQJwZJ8xFPJODrIBzKd2R
	 KosKxJ6JkOdo+Rb4O/5Ik2jnYI2d/LtyMBEx+T8pS+M8lsjCnaqZ8A69SjZxk6UFbgObF
	 hPYTKpIDNFI9FtMvrU+0gWeoJJj02qUsOxWzFKv4sYqv8lvhbvZ3dgdap+uP8S2aqmg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736801;
	bh=fTvYFoxsoSy0IjLe8LN9+y+RTd0fjnL/k/a6uIjr6Xs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Pv13scwtIQtg5zTCoc9v0u/YKwxAaiEopIdayexaVI3zIRQKt8GcL43wCdH7W+UCe
	 zP5WEc7prI6IwTkqpOqv7SQz/x4y6PFMm2sydwF03qyq3+wxEv5xmPXlF9NlZ0u/a4
	 63CDhigkz78h91FXX8ENNHU/RHMqJUwuUzhwDhVG93Aefn9AFMOyKxRaDZrJ30C0Ba
	 JT63gkrc0sm1NCIDFGpHxjWDURE0K6j5wQwBRn/EQ72zmiaUFv2fxq01BP3K6oQl3Z
	 CSdsDGrmy3QnBF0/i1beFqB6P/eMdF+utOgYU1scv9INy0OA9WgxnrJ5K1B5psP3K/
	 R1Q7RUsC9I3jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE39F60D76;
	Fri, 18 Sep 2026 13:06:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53C6FA29
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4310A40B71
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mg96Ne9niUt1 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EDAE240B90
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736748;
 b=TnVf3Uy6z0ZIHTYN2Wk6A55DqgY1qEzRLgL8h81L+llTwnM6Z2PxhKDVY/KOmdeLpESM
 +B6E1LtTEN6EbUGeQ67bIXNBgwj/v34Ry4iB0C5tpjniMy4lf0+0bVs+LRgZ8c9uY2Drw
 pCYAzlFs0eX0KYcWii3Q1rJPd3LfvXk8wIJQ1UZSuBRdeKJ9B2PtXTrRMs7PLiLInPSgB
 uoYsmi47EUCsUJFaJrWcsKs+ImIE1Ul3FPbBe4YvbMeRmEhrw3I9kGMa43X3LDTgvH/hU
 JYq03zByDeusyHE10ZGU/hjr+xhlbgqD+och7O4aHZn7y/mPEukoNno1ZipF6DERtxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736748;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=U8sDDgG+lhpWmPuisWIawN83QguQ0GfyMxXADMPYrUc=;
 b=OipcLibJH87qLsVlWuJwmodqyf+RZtZi+dkjpYEau/Uq6ARqyBZKfX0ht2WGrzW0qjdh
 B7YKvj883lSGtlAdbb9UV4dIvXNhbFPd8PRDmVzBHwuS+HZSWWpph46yYjgjNYaw0c2dr
 XeVVLikTZabp5QUDqQxxzZVYXuB1S1WHk+fIRWPKe2NO/Ck+ajLUnqzBdQ8s65AmrF3Zr
 zhb//bknoUxafngNPgZKc/WBQ6BD5gzNBbqboVIkRg2m4OuouXTPcqExXPNvmPt2tW98i
 EZGMqcz8OTo/verh8CO9IIHB7x3dHHn4Lu/51FHWyRHvpehBpNHz97U/UJhAorPAapQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDAE240B90
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6CEA97698; Fri, 18 Sep 2026 13:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 11:19:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d5525434313c49de48ff75e218964fdc01605ebc
X-Git-Newrev: 84ef784c425b7f1a63edcf1a874acc528437c8ef
X-Patchwork-Hint: ignore
Message-Id: <20260918130440.A6CEA97698@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ivi-homescreen:
 add missing BR2_USE_MMU dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/84ef784c425b7f1a63edcf1a874acc528437c8ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS selects gstreamer1, which
  has a depends on BR2_USE_MMU, but does not propagate it

- BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN selects
  libsecret, which has a depends on BR2_USE_MMU, but does not propagate
  it

In practice there is no problem since ivi-homescreen depends on glibc,
and glibc doesn't support any noMMU architecture. But just by walking
the chain of option dependencies, this is not something that is
theoretically guaranteed (making automated verification of
dependencies difficult).

The other "depends on" from gstreamer1 and libsecret, BR2_USE_WCHAR
and BR2_TOOLCHAIN_HAS_THREADS are on the other hand already handled by
the top-level BR2_PACKAGE_IVI_HOMESCREEN option, so there is no
ambiguity.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 90aeea08bb685ac38b74799d830aff4023698cd0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ivi-homescreen/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
index a4f5f6835f..d7cc4ce04e 100644
--- a/package/ivi-homescreen/Config.in
+++ b/package/ivi-homescreen/Config.in
@@ -187,6 +187,7 @@ config BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN
 comment "plugins with external dependencies"
 config BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS
 	bool "Audio Players"
+	depends on BR2_USE_MMU # gstreamer1
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
@@ -201,6 +202,7 @@ config BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS
 
 config BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN
 	bool "Flutter Secure Storage"
+	depends on BR2_USE_MMU # libsecret
 	select BR2_PACKAGE_LIBSECRET
 	help
 	  Store data in secure storage
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
