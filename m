Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C25AC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 05:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4E11403B7;
	Tue, 16 Jul 2024 05:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uD_pNWc65JV9; Tue, 16 Jul 2024 05:26:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97E3D403BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97E3D403BD;
	Tue, 16 Jul 2024 05:26:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1839C1BF312
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 055B0403BD
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 05:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wtxcb5U0WSpi for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 05:25:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D5601403B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5601403B7
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5601403B7
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 05:25:57 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2eeb2d60efbso61386341fa.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 22:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721107555; x=1721712355;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eeUUF023Rx5OHPxJ5Pajd8E3q5mtWzHYKw7GiY9ibWQ=;
 b=E8rerBG6c1aPRua/8s3qxl4cPbUJAjrZod0J6Hp/X+L2w5o7g0pXzAvyZRv/mEMc4T
 w6BRdLTmha2bQ41GvaBUbfeKJhGWAnO2USaFt7zxKVLPxDwhM7j+KpNZuXjBWotBjVRu
 33MEBmUuhUSflyGEdib9IoOuc3oFfinwtzm14w1eK9yTWUMW9pZtewFIa4v/Td+LLEbv
 fx5MZcBMTTxT4XClGDqM3Tz/sSpk37Y8i/RNFxr+KpQSW/e3TKy279RXwBtpwa2uJkim
 IfGsUfX2JS5hQsG2t/ervTcHAlmoRuYyMqkctNLKU1QSstP9l56+xufiwXjzBQi+ARKb
 1QbA==
X-Gm-Message-State: AOJu0YzpFJWFoEmrfodg57qnY/NsjdgqSKMEClqEHYXu1r3qYgkiGNMY
 c5hP4uGI8p5tdKZ6w6Yuw02qhvjkAeu7/KXsBKEULKfsOIS4VvRZlibPyWWv8G+nLi9w9LxObxU
 rkV3jsDucqIPaEBvweypVDdj5pRGM3A==
X-Google-Smtp-Source: AGHT+IF7B29NUAYh8wq72XHcpqNqX/IQjicw4VRf1QYionUaMCs2WS/D69diER/Rn4MzWq8OI5XcxBwXl7RMAJC3+gY=
X-Received: by 2002:a2e:9c90:0:b0:2ee:4e67:85ec with SMTP id
 38308e7fff4ca-2eef4159599mr6985691fa.5.1721107554713; Mon, 15 Jul 2024
 22:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240715-uboot-default-env-v2-1-8a585679ba0a@bootlin.com>
In-Reply-To: <20240715-uboot-default-env-v2-1-8a585679ba0a@bootlin.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 16 Jul 2024 07:25:42 +0200
Message-ID: <CAEyMn7b+hgXwpjQKt6Y8KGFb=+CdF+EDxW_=rPhbpWRkCh_mRQ@mail.gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721107555; x=1721712355; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eeUUF023Rx5OHPxJ5Pajd8E3q5mtWzHYKw7GiY9ibWQ=;
 b=hQ2uVyoJ4OAYurS9W5X/4kQ6XUA99ByuMmfeVg3Zl5XGVZMsy+XDFKLtC8F8THyj4c
 UdO2dg0ggZlvIMSXFPpCnc1clug9tjy+wRCNf85Nge/9Ez/DLzrICsIwo8V2tQ6xNK77
 6c1gP49caa5SxxRsIwqmoR+CnSt8CKUdrpGfxkbxD574wWGiwnCReU+/uKV73QkOr6tQ
 f9I+bgVpBjKlaPa3rM8q/Ks/z24XNQpxROnvRjfcvbAKhI2DGiDgFKV0f6ejprSKmWGI
 bynwVyv/nyuN5oLCfqGb2S+ynUwqQw36gOeMw5NqwDF4Lbba8H1fDI6m0OHvtT1r7cEP
 Ue9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hQ2uVyoJ
Subject: Re: [Buildroot] [PATCH v2] uboot: allow taking the entire default
 environment from a text file
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
Cc: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca, Hi Arnout,

Am Mo., 15. Juli 2024 um 15:53 Uhr schrieb Luca Ceresoli
<luca.ceresoli@bootlin.com>:
>
> By default U-Boot builds a default environment from its own configuration
> and a board-specific set of variables. However it also allows to bypass
> this entirely and define the entire default environment from a text file.
>
> Expose this feature to Buildroot. This allows to have a file e.g. in
> board/.../uboot.env which contains an easy to maintain text file with the
> wanted default environment, without patching the U-Boot source code.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I was too slow to test this. Arnout, as you mentioned, this is the
more elegant solution rather than mine.

Thanks
-- 
Heiko

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
