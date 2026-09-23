Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA74C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E20F41243;
	Thu, 24 Sep 2026 18:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wgRl6IX0886Q; Thu, 24 Sep 2026 18:59:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 186D141231
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276398;
	b=kgPRWIH4FXOmeF25wMc9eigAZttGO9cAe/v4ilgNedwIH5Ac8a2hECCfDgWG1zzHS+NZ
	 aX51A34P2/zs77iJuAyPgDFDycWFQc82DfNepMeGRJ/3JHMUdxQQ5Y+OGGKs1rKwRSfrt
	 BCehZL+8zcftnLYLN9E3awlwNJe5p39YjDv+66sP7pIbBYAoI02FHWXzqmqmiRl5FMGDS
	 Ng75rAG69Hah2a9t2uCOKxw+E6BPv5xj7pHeZGUTAF3QH5VR+Pp/5bvbi7nXJbaTJphNK
	 /rPumoikKnlZ2rMS5WWhZwNlG2f99ObT22gG7ujuNJ0w2gOKYGirNGHhk4wd4Dfv9aw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276398;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+a482/Ys9tQHkmM8m/Xp6CuM6milkTWd5GJ2FQh+Wxs=;
	b=JoX7WTUvJlv7sp4nWdTBOYcwMyDdod4hClT0NSs14tPOUXuygE7znT2ubohZIZ1y6IKW
	 Ib758h8ZjY4Yu0dB2jQWW6KiTFXSpfgHS5TTByDUmak5DUv2v8jlg3mfUK5xkJ1OqPoIi
	 Gp+MqDjn1+5hOaPXhPS5CCwzaBiSr7ueEf9wwN4j2XktXJaBj0Ja1hiFfjGYn22oFIsw1
	 JayFEMqc4gWpjsNvhUPPjtTgVzZJKYUWcgnbCUEEOQm2YALDSzBN1BnFZsBU7fZW1OUyp
	 ziZrOEQPWliBOOnIWSBRDBmo5LMBHnE6Y6oJdovZh8bVF8bqtwswXEukaXuLsrdqvHQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276398;
	bh=+a482/Ys9tQHkmM8m/Xp6CuM6milkTWd5GJ2FQh+Wxs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pWF5Q2EiWBauNTsc4ZW5hHxT5NecWQiX3SXes1Ih3i3DnGVwq0nlj1yr2n6AOgV5Y
	 1lUcCHnLrLI40jl1ydtGnN/CAEAZMv2Ld58tbwEA6LXldDh/nMKks/Ij3SjI3104r1
	 POiSRqWFf/zk9oTrlF+5OGbojgj/YA7zW3IAkNQZ723OHNZBcQPAqkhLwgpgBLw8zO
	 o8dWgJKqDKKyLfpITwMSrXDeytbcTYRcn79GuftwR9CERD6HhNkviyFlRFxGL0sxmL
	 4AqFEsOpLIJfobfy0IIO8YXB99JiIHH2DU2/kEP0CjolWpzfEb7+kwU49n/9lT8d4P
	 ngc8+L0Sb8p1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 186D141231;
	Thu, 24 Sep 2026 18:59:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 211D2328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1241B81225
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c324P-0El359 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0809A81241
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276214;
 b=VpXJO8iUUTR9jtPlH0yxsDSZo1GyIGGcOG8vvKM8YsZ9CmX4e1VJKaDGZCVbHSn/Bvuc
 TOiyVbOCnRjoPmhu9J7jLPGinhYy6XHUSNG5ECFnNQbsxEq/VtMPD4xo6+uWC46YtgFEn
 2JV+2PTIoHUpMrQHYwlE83G1FZ0MBbl3x2zsbQYTl5le1bNdJjJng7todD3OFcCiRlf4A
 NTw3/uR6ApqaaeNx4pZMrXxu//x1O+JxpJ+UwLPfvArmlShKcsbpspu8DlEegCjFALvWV
 pOQtlfx17O9tiZLkhSYpj4nbL77+UeAnivkurdGOSmXHGznOyK89ZMhlK8pNlcQg5og==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276214;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ahgRDrUGUsWcKfEQgwWwAB/LGylM0ExgkV47/RsIX1c=;
 b=pe444CiLCzdNQ6zCo9lbLgbHoSzIuVneZbH1IYHMEA3mPUvYZ5p1ZdJ6SJ3C4dIA9pVS
 HswD24eBChiw8sxzvePJ7pvjzsWyK3bHqU74gMUpFmkOP+PQW9kMm9WGTjrBROEfBVQe6
 KL7pXd95LlXpBaagNDSCNEQojLb92mAb4ju0+rvkmCletRJBG7+1H5zMMcZp1GAJBak7O
 8EZ9zmSFtTvz0KnkSO7CHj2v1sFdn5lPAhiYPKDwCn9VZtAElJs8OrMoTn4hTcBuSnUI/
 85eQSpgX8TR6We/AhAOxdrrBayooEQiJfbhIBWpCsL4qAYiu/InO6ee1GwhJJkH4uGw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0809A81241
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E12698323; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:33:34 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: e776f725143d341ca42527a603e7b0264e7c61be
X-Git-Newrev: c05c6ca99a1667347b3ef5d27ad666a777075e59
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.9E12698323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/sound-theme-borealis: add missing license information
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1056215672110537850=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1056215672110537850==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c05c6ca99a1667347b3ef5d27ad666a777075e59
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9a9ed35b567cb90cbaf44a57f0a5e085de910321)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sound-theme-borealis/sound-theme-borealis.hash | 1 +
 package/sound-theme-borealis/sound-theme-borealis.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/sound-theme-borealis/sound-theme-borealis.hash b/package/sound-theme-borealis/sound-theme-borealis.hash
index 575cf31c8c..336c039892 100644
--- a/package/sound-theme-borealis/sound-theme-borealis.hash
+++ b/package/sound-theme-borealis/sound-theme-borealis.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  dd80a9c6317de29d42786ba7d95b114b64d06ec6c0c17dd18df853a5c668e727  Borealis_sound_theme_ogg-0.9a.tar.bz2
+sha256  b21ac6d124efc0a25c1f9eae9cab321fc1a41979468eb9293c1a9218a5493e9f  README
diff --git a/package/sound-theme-borealis/sound-theme-borealis.mk b/package/sound-theme-borealis/sound-theme-borealis.mk
index 9242837bec..f37b54f5f8 100644
--- a/package/sound-theme-borealis/sound-theme-borealis.mk
+++ b/package/sound-theme-borealis/sound-theme-borealis.mk
@@ -8,6 +8,8 @@ SOUND_THEME_BOREALIS_VERSION = 0.9a
 SOUND_THEME_BOREALIS_SITE = http://ico.bukvic.net/Linux/Borealis_soundtheme
 SOUND_THEME_BOREALIS_SOURCE = \
 	Borealis_sound_theme_ogg-$(SOUND_THEME_BOREALIS_VERSION).tar.bz2
+SOUND_THEME_BOREALIS_LICENSE = Artistic License (non-GPL/LGPL commercial use prohibited)
+SOUND_THEME_BOREALIS_LICENSE_FILES = README
 
 define SOUND_THEME_BOREALIS_INSTALL_TARGET_CMDS
 	for f in $(@D)/*.ogg ; do \

--===============1056215672110537850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1056215672110537850==--
