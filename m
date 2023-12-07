Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08249C4167B
	for <buildroot@archiver.kernel.org>; Thu,  7 Dec 2023 12:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83C5583A76;
	Thu,  7 Dec 2023 12:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83C5583A76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DLpg73eKqts1; Thu,  7 Dec 2023 12:24:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5F98839B4;
	Thu,  7 Dec 2023 12:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5F98839B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C715E1BF3D4
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 12:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A08C1615F0
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 12:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A08C1615F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xxys-GROP-cn for <buildroot@lists.busybox.net>;
 Thu,  7 Dec 2023 12:24:44 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21EB2615E6
 for <buildroot@buildroot.org>; Thu,  7 Dec 2023 12:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21EB2615E6
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2886d445d8dso213530a91.1
 for <buildroot@buildroot.org>; Thu, 07 Dec 2023 04:24:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701951883; x=1702556683;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1TTbMDS2Z6gTgncnifIs92iHdQq33dGSWgMsN7KvLGA=;
 b=CVv2OO+RYF5JSrEZfC9eiBPxi1OO75Z9T47pFPsS/g90NQ9K4/KdIcyKWLL4DU7rIG
 cAp78Ps71diTN5DyBjxwT0iRgM4KBSoLxNzQS0uZUXDyb3ckjSdYtgW69tUuNKrPdqRl
 3iw2d64CUwGrfNYBKKwMYMVbKW0Aa64PGJCl0he0KXGleG6NI8N2WgIafJXvIb2aKNYY
 hKVy+5JxL7b270vo0RlrFK213zmzxAjGptivDQP+LFraemX+2hliCgqafLZMUhv1oe6b
 LPXo1RtXtcvbFs4AHKcfTMH7uFNalV/9uWQcvTJPx4cuNmJKmqcj9KZlULaBjO8/oHmA
 z83Q==
X-Gm-Message-State: AOJu0Yx7x6k5Sgs9pgZbHflAu950ZWqT81sAX57dQKDpvO6Ic9Yn1jXJ
 EbsdvqbHdBgehaRv9MAI/jNuVOn90Tr2g7LjC1AxXDwn
X-Google-Smtp-Source: AGHT+IGB34n+b44MdY4WLHEXSTTXXGKpoFamw4nC2jh3MpHWkD/LdRS5ds2mdxYpGDz35tk592/DMTnAXNK7p1zm2Us=
X-Received: by 2002:a17:90b:3791:b0:286:5726:6ef6 with SMTP id
 mz17-20020a17090b379100b0028657266ef6mr4745330pjb.1.1701951883313; Thu, 07
 Dec 2023 04:24:43 -0800 (PST)
MIME-Version: 1.0
References: <20231207120704.47607-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20231207120704.47607-1-giulio.benetti@benettiengineering.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 7 Dec 2023 09:24:30 -0300
Message-ID: <CAOMZO5Aep2H+s03sVrH9drMNfYGXN-LAcOdD8HbrUrJnmurrBA@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701951883; x=1702556683; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1TTbMDS2Z6gTgncnifIs92iHdQq33dGSWgMsN7KvLGA=;
 b=ay1ZTgA5HXBmI0pqlUYZffbh6ZLECWunyi5g0r5OgpfXE68nnJ3+sPo6VcoYVh2jlr
 6rNlm3WLMdMLtCpsibdppOI+hDabV+/5AdRdZOlC4UjTatxaO4Bz8kqYZvGEbe4Rzggm
 QKVymhl1Lyv39bYAj2jorczTgwcJjcK9/Wdn5e/20u+wLxrVwnKjUESIqiVPro5myIN0
 t15Oaz2JpvAM2R/pae6UgIFB4JFSeS+lXxpHdUd3+GL6hbdlCwwJhQbyI241HnDTuPjV
 67wO0FxgZRiXqvxMFXUAl4uxdsHEmFDEuMoW/a2msRIMnTzLOSquD21TUrDjNmppcCN0
 C7XQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ay1ZTgA5
Subject: Re: [Buildroot] [PATCH] configs/imx6ullevk_defconfig: bump Linux to
 6.6.4 and U-Boot to 2023.10
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
Cc: Fabrice Goucem <fabrice.goucem@oss.nxp.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLAoKT24gVGh1LCBEZWMgNywgMjAyMyBhdCA5OjA34oCvQU0gR2l1bGlvIEJlbmV0
dGkKPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4gTGV0
J3MgYWxzbyBlbmFibGUgTlhQIGZpcm13YXJlIHBhY2thZ2UgdG8gbGV0IGxhdGVzdCBTRE1BIGZp
cm13YXJlIHRvIGJlCj4gbG9hZGVkLiBUbyBhY2hpZXZlIHRoaXMgd2UgYWxzbyBuZWVkIHRvIGVu
YWJsZSBkeW5hbWljIGV1ZGV2IHRvIGxldCBpdAo+IHRvIGxvYWQgdGhlIGZpcm13YXJlLgo+Cj4g
U2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdp
bmVlcmluZy5jb20+CgpUaGFua3MgZm9yIHRoZSBwYXRjaC4KClJldmlld2VkLWJ5OiBGYWJpbyBF
c3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
