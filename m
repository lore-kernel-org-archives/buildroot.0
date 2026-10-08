Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83EECA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 901574094D;
	Sat, 10 Oct 2026 09:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3LMnA-0cgir; Sat, 10 Oct 2026 09:21:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D636440952
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624115;
	b=WmzAKfUhfsCIxL4pO7z9NR2d5K38L8ZU6cgy+rQy/ZZW6wJtwk7/qVclovHfsQYV2Kms
	 Qu1aIKWVj0LC/tR1LjWofcUiKJuanbQqMQuITviFKO5hOQspn3YA/9x1hFozxwt5ZRBai
	 JprGl78YeMMlwU9TPoBbTpq2xgzm+yZ39z4dtPLuSTRXbWJmCb9X7EEgBUZxq/EToSSGx
	 g2C+Y/8bxnciNjWV7r78mU3RuFTenTUA5DJGdRewfVhDqII/WvN/lHOoFDr8ZefQUjNHh
	 d8HjG5h4hjGsEd7crzSo3ryixpkHPfEwBN56P/9bVbEGgm+VSuPv0OD77GxWLjGViOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624115;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=aEbJDWXO+WyGAQZC5nkq83dScS3Gs0UKpwXBour4pbU=;
	b=C8ZFNgU7vbAgUgntwchudj7Lx4MShCmO7oFbrP6MCWHwJTarGfUcrNOXUeWU+Bs33wSK
	 nCwN8NQ074WOoQjlQCkMIUiZLNEISCkZ0+Ogptm7fBu+twP8z3XnSJssZegyMeI1Zs9VZ
	 +dkuyZXtXVzzn+6KaxsUOZRZ20eiyv+aoirjN2eVaXur9RJmgUr8E3Pc/82UwQG6Z3OcP
	 vUgBkyHWnsi6K7F88qvn9fr7GLGuhn7f3gsdNtnT1VE4zcnA9LVnP2vlgSgTsxbaM/uhS
	 ntSg6iMMhE+OCa5HNQrl0ZQ7BrjuiU8pGqo8ERSiw9mH6DsCUz3rzgr6YoVJMtM1WEg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624114;
	bh=aEbJDWXO+WyGAQZC5nkq83dScS3Gs0UKpwXBour4pbU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pjXvsHfhzloXdTIoxBn5PgAQUfsJDFfL/Bf3TQEEVlT6+oZJW+XLUY6GnObL1YF1p
	 NDRzi6sZ7Ry5p6ENtOipPSYbuOxmEcULclh6/YIfahyJjQjeBYCgaG9OrqEYlLU/dF
	 y/ODyhYHDMNQnGcUGP1WqouJqss7+ykkDvSMpOvxMhV3WygzEKlNw4KAS/RxJ9e7W8
	 NJvQrFmBAdMVmMp+wi0xJF4qGX/CIn92DJnkcRHZnVm4+7BNdh5xWI+8DvzGEsKnEi
	 oRfH5Py9Ai/TgtYtz1r0nJwf8BiMrgNT84t77YoMQejThQbo7NMcEgzjxvFobr0BgD
	 sUaY3JPUzG6yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D636440952;
	Sat, 10 Oct 2026 09:21:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2914DDDF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0853B608B4
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdvkUxPiClYP for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B1C2F6066F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624086;
 b=BjliStCe+6bvqplIRynmUITIIB9582oYoU6nCweFIgMEwujBMiULCyB1Byb/dmsiZuIm
 nf8g5HvDj95EJwlWrIjnnyBV2Ej9IcsfM6Pxx3j9rLr4hSI94mOSlT7abT/i5FjGuWMtz
 42jvUUdcWjjFn3dvuGMWejH14B1M0ZWu5x4EnqMsO3sdKRWyKYpbOKfuIpYuFUE/yQZRr
 jc2wdW1tJy+UPw+bLIh9yHZUw0olqJPFrW0LZ3JBoUO8ESHKNVIwnRu5C/HgU7qls9/Ke
 C0BzvndUIIxjCXaQwwgYxznKH62djThkZ47tziFR6OvQ1kJsj3XbtuzDAF2A1mAtAtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624086;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PhM6qWMWuW1h0n8Kpicol02J2dVZxjOUeyJqACm0x6A=;
 b=UmJGk5wfj/5SBaaop0Ac1xlDSxN7kEEvaZ+o8Z7+pRwCHvcHZ6yPvldvMtrX4X7QGhh9
 q1xkE7MFA7qPrMQJLcNmlNOsH6lT4chjrZHHLCCnaZIYe5cMZ++misxzgFCGnRvOsRMkS
 hRXccnuLzRZ0osoT9gq88lOZxQio7xH1Z6ZlsTX/GrZTnirfJu98v8q/ZanMGtR82p3Xw
 CjOT9i3PR5+F+WyulUuGFccs2CoYgTPcAMkNGO9dYtK01O7eM7qfbmFenEceVRrAOQTKV
 ZfV0hKrVRcEh28ocqbmjH+0ycPTQtaaESi0mWhFWz1xUkkpe7BJbjFBXNL0rYiiuvyA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1C2F6066F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B7AC8F065; Sat, 10 Oct 2026 09:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:01:37 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: a6fb2719ec561c3e4b0f7f5a645e9909c4c49bb8
X-Git-Newrev: 09c50a9f977fabc932cabb2a2338697f1138ed45
X-Patchwork-Hint: ignore
Message-Id: <20261010092008.9B7AC8F065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/lvm2: set
 unconditional dependency with "=", not "+="
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
Content-Type: multipart/mixed; boundary="===============1709201198720489296=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1709201198720489296==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/09c50a9f977fabc932cabb2a2338697f1138ed45
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

This is a simple style fix.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d236b45fc43c3979eecb183bf2995dddc4b3aec0)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/lvm2/lvm2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 8db1899ed4..21fd5134c1 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -25,7 +25,7 @@ LVM2_CONF_OPTS += \
 	--disable-nls \
 	--with-symvers=no
 
-LVM2_DEPENDENCIES += host-pkgconf
+LVM2_DEPENDENCIES = host-pkgconf
 
 # LVM2 uses autoconf, but not automake, and the build system does not
 # take into account the toolchain passed at configure time.

--===============1709201198720489296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1709201198720489296==--
