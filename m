Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4E9C61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9824A60BE7;
	Fri,  4 Sep 2026 12:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zVTtxlVngyr; Fri,  4 Sep 2026 12:17:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 07D0B60D97
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524278;
	b=Yp6iT0RG4NA1wwyXKu7Yfx+wDhdsVf+Hs6PExi5aFJMrcLfZDEt9yZRShi3lXoNJiOpo
	 g35CiuJ/nCrs518d15+MvGtWGCD6Pt661EQOHFXVOvuZ2CXmQ3s68PHSi5hgBHmt4rTgR
	 Qg9ap9y5IYf+A5TagHx3IFnwKy/skLODLWfB1Lv1WuMZe1TRI3TGownpue7pWFxgT7BPJ
	 ZnzPA6optv1lWJSEZaFX7Y5SRImlq+MS0/XFYul/4WoI7lyChlfcoVASDvIBu0BU3dG5C
	 Rxat2uwYXWwLKvobwxPmf6URlKoSw1eczw3STZmzxmhr9PFSz8fX/InszAOQcB214TA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524278;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aWYJoX8AQorMOyRJ59fTiCS4FPaJDxsxZ+WGiFwhjI4=;
	b=KDCzxdfu+tKutCeq98aXApYTLt5Jo05oFIl1Ev2s0LgO84BoCHuIl9RxY0S2I6DfGuJ3
	 Uxs/19b7B47Qrup5rTgIUXGPdAXjmViwQXOLom83JbipGBGJzMw3z5FHMgflE6AobLyhD
	 GCcYRv7i9+LsDr1r73Ck7wD566JEcdAFOhOytgRjauqxekjxSWlvmolDCCzcNvX3vjCb+
	 VX4FRB3dsF5i0HTQlGGDCmzIzEkKWxutVmjuyvyF84brB9hwBSFgxvO6pjr+fueLyUPzi
	 R/MfcT39K7VgI86XuHGEgUvLUnp2gHv7mUZQkQ39B/TzrbQl4rOXYth2GojeBf8/cNA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524278;
	bh=aWYJoX8AQorMOyRJ59fTiCS4FPaJDxsxZ+WGiFwhjI4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j+ZaxLuGpJdR0PaRKQolJo24H907HneQmFm1DE+49ldaOXuJa6pcFQCio5wumBP7H
	 NKqXS7E0dj0k7RdnDQdHbdJmh/A8ayRYp1EzUtKST/Q6qMGmtLjK41kiCpVh9xea0y
	 UQy+sUzYoWTc70VAlFtsM9mDWhsQQHshauSOjWZxZAVNoI8yvDaZPWpbhqs2v2tUZe
	 QU2138RIZGC2tCTKah/z5fD2uUYlvXHWXFxDqnOqjOKNwmVhXYs1UOuaeNY/j5znZd
	 hakcX3U2+phi+7XMEGRAMBmV8P4tJeH1V9r/at8aM+nObZTVoyn9IY3lsy/MxWLzHL
	 DmCCoYGNjXHZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07D0B60D97;
	Fri,  4 Sep 2026 12:17:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ADBF3F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9351B60D88
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ib7wLLHW4-GJ for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1924360BEC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524269;
 b=aVzIRYPXcH4SAHc2Ycrmw5j9/xAVbW2GxNQ71+gZTf52QrKb4LkfMyQp2hGlGzkg48Nd
 Vy3O4j8ibGfQlS4dT+3CQyRLyu6/NndcLBpz6Cp4qjmQEp+QnNtdkF3U0bu5qrl0OSqP1
 Xd/gsJAi0ykSUYvxwz2JBW/hd2C8U9pbp4ni8AHYA/rOE7Jm1vVwRMpHCm4duGdNMgd3W
 1UDhg/MLyQGMLPUtentxa/evBuqjl8m3Jr5UBNPl9aJNWXTbG1Z2IaB6Ff7rNuN1H3lV0
 V/2vp1EnDAnaSMjf1Nv5LEGHUzKrSNcimdQlEPxEkMopkKqEwat2Tx79Do939OWzZHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524269;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=plLz4nUEEOUswrUt2jZ1+6cp1Jjl1bNCoLzrNo2TvOY=;
 b=HnOdnvwwPFlB3nZudu6iEkIvQp87tsjM9diPnJ0njzQh0bT9ifcl1+m2YxsdorSfVufp
 LU+B6NBrM5CBF7eIR19fUfHags8HYTKdDlHj1phbxh6Mz+J/Ppkr1JjdMsQfpYT9S0ewW
 2rbrPtjKwCxlqG7HLFlAc1l+Gnj7SctZYKv7bw6YMyPXc5OQPS+H3yASnZxEHU/qqdead
 2BXP4yycp3IUvTn3gEgWdUbnaiq08qPbIZIBOMANDlKtuBwe6xRS37nw/7SYC8C1nXNC5
 LeZfebTxoJ4tRpMQdGFsJEwH2xZWOA5T5yktzHT4+iIjlav3lgL6o6+/ewmtSzEONEQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HoNxfqFP; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1924360BEC
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-485850cbac3so600795f8f.3
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524267; x=1789129067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=plLz4nUEEOUswrUt2jZ1+6cp1Jjl1bNCoLzrNo2TvOY=;
 b=rxTwWwFI66cO8xvGAAX9b8GSO3y7x4WSKyNXqeHkcp4Ok0QM8zvqPHMFz3yFiPAQsb
 FJrgQkiVQCb8uaDs0ZxQCiDPcrnl4vyG4vDOVy51fCl5cMgrfeIB5PU1KeRI3aDrl3OG
 58NjJjCU+ORoLSeDbZZaOVKaT/4lqh18nWuvMWimFsnU2DaT94kbufGe99vtFIe7Cyg2
 tQMOFuwi4tM+89WCq0ZFKZ2Mjtctx2dajJoG8RvETRxs8uUt8ftztM4ljNf8Xu3kdBAW
 trWkwz4SY3IX/rdz3CswQN0FDMhy65+2iiDFL7a63QggraN1hYgaUq4F8Cg+kTI3x5wU
 f7WA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwpPSDGbqYsbs10XvPJAohxjy9Z5w8WGsRonzMjjzxI9EHk4AGNp6FPzg/5smavLzgQZf2RqF/eVeE=@buildroot.org
X-Gm-Message-State: AFuF++ma4V4sWWmNyAWVY3Ff8LLpNkM51ArQkmUOaHLvhsc8L/Q8wuee
 U+J7ABvTdWhQBdRORcsYMyXHn92nwI4LTqFNGB1oWPv385lr96VcJleSjxaRDiIpvPz0VDU7cio
 wi2vW
X-Gm-Gg: AYBFou3W23oB4cSmoDdJ3IYnIOVQtmtsbKel1tDA4sh1DOwlt78JU/LJKvm7sQ6NHyf
 LjYHPEjDGZhZr94Mv2fcN+vbULIvraBSVRsQmhjMuxBG7D85+bymTdDNCllgQrc8lDyxtpI3IYs
 JhB0+aMq55YGlNS/1FOVa3qrCMaYbB8fRTjI69uIsAzM1t4oCC7+dcZRJx3qSRlH3vS4eGrXEG+
 odZ800p16HcJ44TJrYw+R0FNZarUsSylU5uSGGYZdLhu7l9nipZOBvALbFuuo1rOLpZY8rhOgqt
 xPUE9upODYipqnxSEwLGxgHnzEtYfMc1lsCVFJJf4nMBE37hLRf1Wj6IInbhcoQSkJHHS0eyQv/
 tGVJSue8qJW1m4sTfM3KT2GUlBPioPI6g/6wKH4rlNANa7LUVcIgrftujhbHWuR8toQ3UDlhC+c
 7A9j+fgcckWroIRQr9KdklnMBKMZ+5Aq5XmN+pEhiR0ewjZJR1+4w1qA+QZ9iNmLtbZNM=
X-Received: by 2002:a05:600c:310d:b0:49c:dc14:d681 with SMTP id
 5b1f17b1804b1-49cf81e5449mr58687475e9.3.1788524266631; 
 Fri, 04 Sep 2026 05:17:46 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf772bd2asm60436315e9.11.2026.09.04.05.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:46 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:45 +0200
Message-ID: <20260904121745.404318-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902123905.192515-1-titouan.christophe@mind.be>
References: <20260902123905.192515-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 for 2026.05.x] package/{glibc,
 localedef}: security bump to v2.43-61
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
> This fixes the following known vulnerabilities:
> - CVE-2026-19499
> - CVE-2026-77117
> - CVE-2026-80489
> 
> (alternative to commit be382f6061216ca82a735d0992894c4e6fe5173a)
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2026.05.x. Thanks

> ---
> Changes v1-v2:
>     - Also bump version in localedef (forgotten in v1)
> ---
>  package/glibc/glibc.hash       |  2 +-
>  package/glibc/glibc.mk         | 11 ++++++++++-
>  package/localedef/localedef.mk |  2 +-
>  3 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 237b56ee48..cff188ab52 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from git)
> -sha256  6c6ec86c66f0484c6916e849e20433ebc67869649c72a772cdf1bb6ca408d516  glibc-2.43-49-g8017bcfc4d9bd16083cb7f3d8eda7d07b4593b09-git4.tar.gz
> +sha256  221a59fb35cad9435481bf7e79cbc4edd0ded70fb0ccf7e57d5478fb169dcdf6  glibc-2.43-61-g8dad0ee453a9bd9d24e55daba85e70915b29e19d-git4.tar.gz
>  
>  # Hashes for license files
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 29b0639cb1..bdf26a0f95 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.43-49-g8017bcfc4d9bd16083cb7f3d8eda7d07b4593b09
> +GLIBC_VERSION = 2.43-61-g8dad0ee453a9bd9d24e55daba85e70915b29e19d
>  GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
>  GLIBC_SITE_METHOD = git
>  
> @@ -61,6 +61,15 @@ GLIBC_IGNORE_CVES += CVE-2026-6238
>  # Fixed by glibc-2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
>  GLIBC_IGNORE_CVES += CVE-2026-6791
>  
> +# Fixed in glibc-2.43-54-713998bf001027c2507cb56f9d1c73e46a6bad0b
> +GLIBC_IGNORE_CVES += CVE-2026-19499
> +
> +# Fixed in glibc-2.43-55-138c43f0180945b014e284a87b332d4d8237f537
> +GLIBC_IGNORE_CVES += CVE-2026-77117
> +
> +# Fixed in glibc-2.43-56-3ad1bbd8f94a207efb108a38d434695eab8a1831
> +GLIBC_IGNORE_CVES += CVE-2026-80489
> +
>  # This CVE is considered as not being security issues by
>  # upstream glibc:
>  #  https://security-tracker.debian.org/tracker/CVE-2010-4756
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index 026146bb09..ad7b809578 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION, SITE, and LICENSE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.43-49-g8017bcfc4d9bd16083cb7f3d8eda7d07b4593b09
> +LOCALEDEF_VERSION = 2.43-61-g8dad0ee453a9bd9d24e55daba85e70915b29e19d
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
>  LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
>  LOCALEDEF_SITE_METHOD = git
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
