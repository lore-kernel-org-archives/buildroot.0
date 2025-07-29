Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B080C87FC9
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 20:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED9B241974;
	Tue, 29 Jul 2025 20:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5r3u6QL61exx; Tue, 29 Jul 2025 20:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB1A841786
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB1A841786;
	Tue, 29 Jul 2025 20:02:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 20D2E194
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 20:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 126934009C
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 20:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsRoK5FheSOO for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 20:02:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C90A40514
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C90A40514
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C90A40514
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 20:02:52 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45611a6a706so28139505e9.1
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 13:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753819371; x=1754424171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Lrj5ZUJWnd7UC6/8NZR/CP+H5hyhs3qO6/6ErIA//8=;
 b=cuuwOI8iQNzGsm/6LMLfVHL9sP5IkMTgenS8VTHaVDzmfRAffdsFrZ9yrHm4p+ecPY
 AcbEtXjTzbleDywRJ7z1t08v4HCuE4YvczV1AJZL3MoWO2r/EzPguPZTSfTiz2v4HWLV
 sEdAOl8yP9iQ6j/ZX8HrvkHfiuofo8UyVOEkgZj2cnYcCrmQgszpoq/Gq4N/fZKXMZcq
 RQzZucxIf8Rlxd7LTzvvcSLD5eE/koF+sOLTfNvl77jEmSXEeZGwZuVUcOJISVHeWmDx
 LLGf/riBIURQhZXKZ3v+E3Em+TvHSAgH2sOlRVevb5ELQY8ob5/wA770SRaHlfZTgKW4
 nlMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3CdufhYlx9DepnTAC5+4vn8T2orX/EZ1/JeNUe+0UORDdth/isIb96zybo+oPoxhUz2ajBzsgB80=@buildroot.org
X-Gm-Message-State: AOJu0YzY/7Yx8YE3awkLd9b8aNQnhAcT9R5QyYWm+c+gNkIM7nGk46vX
 KAIf1jdOxPq1fnOrAc+uBmKELPPee2q6cez6clD+YSS2YHcZAdmlpATA0xdjPMvUCw09HhnC11i
 SxOEo
X-Gm-Gg: ASbGncuv7Cu5cqQr7ZOXfYykG/L2I6f7eGsmWBJetrcClEXn/8r1YClOXnCDttGdtaW
 DfuqbECxjq8v+qzubnPhwsP6Qfl1JMZi8TQy9mI6IXbfdaDRuiI5KRRE9CRO5TSJaCfefMYp8jx
 B1trpm4ZX/QxQJGZLbc/z4C/x2UQUh5hHj4WBNKgXlUCmPeM98J1Bs28LbJ2OXEIUUzMRPUUeFM
 XRoR/gnPwsO2ymCfuK1ecNOo2VaNsEbVc8a5XdfvhOwyHL9kxeLm+AQaBAVu9S4cW7DAqscP8K9
 qztxa4sA19Diigbj/89fy/7OOB1lVcHWKZlf0ln6B3tlB8KFTTunMjz+Vy2dJTR+ggGMR1P2rug
 frtbFeekpvMiDvg==
X-Google-Smtp-Source: AGHT+IGJWw/n6fN6ijQR/OqjTMFbfxCEwMcd8YW3ebJOgr6uKoYEBGi6Ra+iBCbfqYArwFz3IO96Sw==
X-Received: by 2002:a05:600c:6096:b0:456:d25:e416 with SMTP id
 5b1f17b1804b1-45892b911f7mr9049515e9.6.1753819370599; 
 Tue, 29 Jul 2025 13:02:50 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b793519ee5sm2333631f8f.62.2025.07.29.13.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 13:02:50 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale via buildroot <buildroot@buildroot.org>
Date: Tue, 29 Jul 2025 22:02:49 +0200
Message-ID: <20250729200249.1387290-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728224733.1d1727e9@windsurf>
References: <20250728224733.1d1727e9@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1753819371; x=1754424171; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Lrj5ZUJWnd7UC6/8NZR/CP+H5hyhs3qO6/6ErIA//8=;
 b=S42C/aZVJ2oLmkml89/hMKRqrHVT/1RVh2fdE6LfcEmhRGJLGETJkB91SHMhc+04RL
 siO2E6/t3F97auq4FV7fVL5iFmXCISRhAsyPNtXEDl6uq7OBtC+HBZs/uFlvRS5duZM6
 0Qsf3ILBEirlptHDLZwmLmKyuRV6M0fOMiBLI5APMM0RMbTnxCxWDFhEYAvm7VYb/4xg
 13WgYG4aWmmaX5BF5sEUd4ZYJ1wRJWrFwctybNt8ifFdmAxOZ5zHn6ccaT2iB38BGkdM
 pOupARf8+XC+J/4mIhoBtinco65Wz7FbGJQUP1SjphGnzYGMHffIkb9Ol8Wp0pOQjqXD
 z4OQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=S42C/aZV
Subject: Re: [Buildroot] [PATCH] package/aardvark-dns: add CPE identifier
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Hello,
> 
> On Sun, 27 Jul 2025 21:25:37 +0200
> Thomas Perale via buildroot <buildroot@buildroot.org> wrote:
> 
> > The cpe:2.3:a:containers:aardvark-dns:*:*:*:*:*:*:*:* is
> > valid for this package.
> > 
> > See https://nvd.nist.gov/products/cpe/detail/5F79D5CD-D716-4190-BE08-31EB5EEB233F
> > 
> > The CPE version strip the 'v' prefix from the version.
> > 
> > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> 
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> even though, I would really prefer us to be able to have the _VERSION
> field without the v prefix in the first place. Indeed your tricky with
> AARDVARK_DNS_CPE_ID_VERSION works for the CVE matching, but it doesn't
> work for release-monitoring.org matching.

Hi Thomas,

Thanks for giving a look. I saw similar trick was used in a number of other
packages (icu, tinyxml, glibc).

If I'm not missing anything there are no way yet to define both the a
<pkg>_VERSION and <pkg>_DL_VERSION variable. See the following code from
pkg-generic.mk:

https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/pkg-generic.mk#L491-500

If <pkg>_VERSION is defined it will always override <pkg>_DL_VERSION.

Defining the aardvark-dns version like this could be a solution to the issue
you raised but would require some changes in pkg-generic.mk

AARDVARK_DNS_VERSION = 1.15.0
AARDVARK_DNS_DL_VERSION = v$(AARDVARK_DNS_VERSION)

Or maybe some trick with the "<pkg>_SOURCE" variable ?

Regards,
Thomas.

> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
