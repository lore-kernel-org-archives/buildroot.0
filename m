Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C83C61DD3
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 21:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEE1240A26;
	Tue,  1 Sep 2026 21:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJgDBLTR5jDZ; Tue,  1 Sep 2026 21:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788298940;
	bh=c0Cn5yQjCsBLiD5dxNMje6SHPbiGZMlIKFcixP123pA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YQ9wuoe8XCvVfQoCOsOAVb43NOFpNUAju+AB4tT77X1oCCmm333gbOBNI77ay/gBM
	 1qvPBG1NS5+OEJNL77g9X0T0gB9jvCxlmobHpV9zyOSmM5u8OD5Y9x6bwsjVoRs2I1
	 t65kJs1nKLgk10sO6aVgC352RQEAWopNAR/PfmPUJY39iHdhAFuoVKEp2KeurRhSN7
	 KyU48kJbfxSgNygzGmM1mogTrrCvB/+cOkunjuR7KZm2rC+rdtFxbVIoeIzFeP2BdT
	 fcpf1tK1Hbrt+a9FM0xZ68mmEY9aF2czEx+jEFArKFV6IwQ+wtcgDyPZUGE2BmJp77
	 yT+tgX2XOV9KQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C997407FD;
	Tue,  1 Sep 2026 21:42:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A1042279
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A6FE607B8
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qwsDY-yjnV3M for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 21:42:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Sk4lURc4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64C1160649
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:42:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Sk4lURc4TWAHvQsBO65oG1i94UXG1xlOgkEaoG8NGY5NCm3vgV974ubwwfW0w2EUFeIifGp6HyxaUHFOSvOtNe8HYNNxC6Nsv+QZB+cWOndY6nMj4SWF3vTZY5tMx1tTR07piU1Dy2qIJltHJzCrZ6gJJUpOmUvQUinG0sCowp67nekgSgb+6i9MzDiRQ6AfV7WlJW50M/llJ9Zqoa2ay2lY6N110XO6V69YVoHj4gm01AmS6Ks+3kx942JqTYClQ8AutZ7n6Qq8UUFAqYGn1JikA30ayfusRalryY4u9zPXAie+9Y8Aex/ZGkXfLgyWvpbxO+FP3Ii0Xj3fNV5lAg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=Wwxgdz+A8zuM7dqUgXHwY5CUs5xZNWNgwiQtt4jaqtM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1149669990; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Sep 2026 21:42:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x1WF1-00000004YGP-1pvV;
 Tue, 01 Sep 2026 23:42:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260901-newt-fix-site-v1-1-da060d60e30f@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Tue, 01 Sep 2026
 17:44:32 +0200")
References: <20260901-newt-fix-site-v1-1-da060d60e30f@armadeus.com>
Date: Tue, 01 Sep 2026 23:42:03 +0200
Message-ID: <87jyp4wswk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/newt: update _SITE
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlPDqWJhc3RpZW4iID09IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5
bWFuc2tpQGFybWFkZXVzLmNvbT4gd3JpdGVzOgoKID4gT2xkIFVSTCByZXR1cm5zIDQwNCwgdXBk
YXRlIF9TSVRFIHRvIGh0dHBzOi8vcmVsZWFzZXMucGFndXJlLm9yZy9uZXd0CiA+IFNpZ25lZC1v
ZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
LmNvbT4KCkNvbW1pdHRlZCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
