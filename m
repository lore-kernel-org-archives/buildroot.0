Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D46C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CEE360DBD;
	Fri, 25 Sep 2026 14:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQSyCV1Oks3i; Fri, 25 Sep 2026 14:44:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6E27C60D90
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347491;
	b=mixkWgXz7ztKRl4AgnucKs22fEZwzvG3+Tg26921S0eSIpgh/Q1v5p6IJER5qbOxcxUA
	 RsIfnzo9qICNp8plB2CS+uCIiwzJPinBcYLpq/e41wYl6t2mR3Pwb8X3T+h2mhDXLNqWX
	 /ZPGAFkwQuXU4Vp1YQpmaoZLI4Lx4o5kVb0my2F1pVCIix1gpf0UfL58WY0MB6RW1jV2h
	 Iv/t67TlfGqwljOHYKtEi5ikR7b2lUPQ61Adt7HXKhUt/rmloMa8zykhhUcfX3NSPWwg/
	 ZgIS4RkelLFM7RpGvjlEgUbjwJSPboAkiaRbD6k4kzpk+1ih2Xp0gX5pRuryq92ShAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347491;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=U/F1e993wVykdydNEVwEkFDJhQFcfGdaNz+aJf0G7k0=;
	b=sLVOapXTX6v1lT40s50KE/ouddvg2SZ3tEB1N10m0D4+uuPKt+TBdLjuPRGQateHdD9g
	 Qec3j37qKD7BZZwxYbWvXuE1VZTuJe6PKHfRTZI92Cwotk1727Xb9lRvoAiyCt6w8MTtw
	 hfMO8Z388LpSJdmu7ECxjGay+jmuujc3yONSb7TIhgoKeKYbJOxnUC8faksx51Vylyo0h
	 iLCp1nTSh5LOzh/keErn7/O9i27qPSeF2KoiNZXvZJbA7Na6/gjUk6Z02RT8z52rLDH0I
	 uRq9T9HZe8nDUGUpmPeAZCCJv3o0xb5CuxdeaTNsNuS5CzjfqnSXnsV3EPf9g897a3A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347491;
	bh=U/F1e993wVykdydNEVwEkFDJhQFcfGdaNz+aJf0G7k0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DzOTJUIyUys+oQalKevLpvdOnDpPqQRk7gAjbUA2SzopZeOLu7TyTZAx889fBOC1O
	 z39syNNkk0bL+zNEnF41LQ5l88JFyQkLnnS7qeYgbj4veiJFEmIP1BugDRW/T25b12
	 tKG9hAxNo//0MmPdDIMd+SeC6w8aYKWLSHt0oqAPfNvrW/0bTDjZKm2rNAs80N9IM4
	 V4qEb1TnXtenLAUCVCnRuDa5Nrq35r/4NOjqOiVg7bka2Jz/aSna/Y/ql2viSrsjsS
	 BayXj8LzO2wRHbj9kr4IE4jOxjXwfOFPgvS/szd/ICOTA1QTceJ8WVKgycuivPMbcr
	 +KpW4R7E3SUvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E27C60D90;
	Fri, 25 Sep 2026 14:44:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 95806334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C17540BD4
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yzp_bAgsvrBn for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:44:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A0C5F40790
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347488;
 b=l1V0jXt3yCbhYWA4BHSSu6NtjU8U/8zFtqfl/Dsy5RgqFEeON8I9AVh3famYFH3FkQiR
 UQIePxlw6hYppbzgGnjDtI1BMkhZru3tCmt3FB4Y5fjf3wezavFjBesfI+ZiXloYBU5h1
 J3uC8fW3aDuqGiTG7VHx++9LKP0xTX+G3qI2YGW+no65ycLsIAuacpbzIZzGLYMhV/Twx
 mHujpukYlx4j9kwqwwZowrFwKWrOgei9XwuaTCfYq3+hcQNBogQtfqU7ZviIaL1+qLCmS
 z2RJHH8bTULiTYIDpD/sRbTZcLBfUD9fqNgb/0ur8Bw5hMgR/Ro/i0dOnIKQ2NNlMdw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347488;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=gdxsthJ0NTmo0vDDz2Q45XhPxyLKFEDAexipinhxNgs=;
 b=maxHvwVgCy1NpxmeQrapnLAEg/VLOhGPUa6+2xDDLlCuKjOli+sfwiCRUrAnE+5oe1r1
 rfHcST8w9L0LgfA+c6oviozghnBR+57fxZu0ndEW4/Xj6ZLJVUDOSQ+dUidLjXgpXYc2T
 fVUil3sPVpdEExNyF0DSLbWaVXz/XSKs0adij/nSD9JsahScRtJnkxUyJJXqPcE3z/+FL
 8bw0G5Gd/JwLiqKwoKVL3aoMTfejDlNDZT28WyenfvLcR4ZZXi9Vl37JmkXj6BK5ZIlEa
 pJGMHCTdeO8QYI7nAihnqclAUhZ6A2CCvYXBjdSkOw148KYtvDMGoa116HnLKLtUImg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ICZFuEzN; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::19"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::19; helo=mail-wr2-x19.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x19.google.com (mail-wr2-x19.google.com
 [IPv6:2a00:1450:4864:30::19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0C5F40790
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:47 +0000 (UTC)
Received: by mail-wr2-x19.google.com with SMTP id
 ffacd0b85a97d-4843378fb37so590133f8f.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347485; x=1790952285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gdxsthJ0NTmo0vDDz2Q45XhPxyLKFEDAexipinhxNgs=;
 b=fDtZcee2lbxcKWNjYGWVj+GUDOcpIAJqazNtOR+96zOaG4Q2JYA9gvhJbUjImJOyDU
 dg4y0NuG3r9ICn/4rv8uTwWUNgBCzQFc67BaSKi5NcYWe56q4Wlck6unD9gqOqKrbeN6
 okZohTdCdwH9HR/J3hom+qpf23QPpulQVcvXkHZGtGPgRGIe5SqPMNsTg+2QGpwxZcXM
 bMzunzT76D3c/Dth/68mN6pMzVC+YZx3qckdjdJHEzydpjHB+iK41MpBIzVYXkxKCTaz
 9P8O3TnpPSwjk8xGE4a7Ks1Td9fSuWrpYkvvSeYhS7L4Zv6kdQijLovEsMq40As+Q5Op
 P85g==
X-Gm-Message-State: AFuF++nGhwNai/ILKWDiyJLPanrIboytG+tzaeQqrPvj77wcT299vpHA
 P+gKWQ3A31b6PqaT4J3YdslJTEpNirDzlWNYW5sM19QPiCCHH2OrLla8IXYHJqS5AvvR2Y+jw5t
 DSkpnC48uuQ==
X-Gm-Gg: AYBFou1r19XAHm2WuJlEh4p0u7qA9ROFkq6zfX8D66hIxLsCSxOYP8G2eNvG2Vm+HlL
 wN03n/hyou0uAOkUJDGb61wenPMBf0tbRsQ6fAdYqMT3mlukWWP7NeGfRiYfn6Kl9v4lmMWkwnB
 upHHIMcE++1TMGhgvbHMXzwTKVz8imH47Nh3S90E0aMvFtoXRwTPCE8znSIZCTpykCgyY57rxHN
 b4WEQGiaMceo4MLSwJtEmkmgaFPev6ob8UdKMNgjGvbz4R0SZos8xrsDK/2E7mKr9RUmA7XCv9g
 SGeCF+hpglJK9+pvTF/aIOAFU6ROWEHOJMwsWTCovIMIBpPZQMtOh1pFF9FfArVM3iI6caynrQO
 c083tfuplbA7aArcdjVQ03MFAkA2lRncrf/BAeSfoBwKEvTuCSSS+3is4pE+l7DjjMCm9mvT7iK
 nHk7FaJQVdHr68VptnQUFTrKEGiFZlyR10bsaCNL2tTvinhRc/X6j6uPz3ZgF79C57ufaxFc0w9
 /uJpbiNncolZ9LJYS0x3wgoei29FlDLxuQl/eb/Lw==
X-Received: by 2002:a05:6000:2283:b0:488:7fdb:46ba with SMTP id
 ffacd0b85a97d-4887fdb4c57mr4058959f8f.18.1790347485454; 
 Fri, 25 Sep 2026 07:44:45 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a3625ccsm7967562f8f.22.2026.09.25.07.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:44:45 -0700 (PDT)
To: buildroot@buildroot.org,
	Joachim Wiberg <troglobit@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:44:42 +0200
Message-ID: <20260925144444.4096659-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260914155352.1331991-2-troglobit@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/lldpd: security bump to version
 1.0.22
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://github.com/lldpd/lldpd/releases/tag/1.0.22
> https://github.com/lldpd/lldpd/releases/tag/1.0.21
> 
> Fixes CVE-2026-46433, an out-of-bound read access when removing the
> VLAN tag.  1.0.21 fixes path traversal vulnerabilities and arbitrary
> file deletion in the privileged process.
> 
> GPG signature verified with key AEF2348766F371C689A7360095A42FE8353525F9,
> LICENSE hash unchanged.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/lldpd/lldpd.hash | 6 +++---
>  package/lldpd/lldpd.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
> index f3cefe7b73..46f2b9b476 100644
> --- a/package/lldpd/lldpd.hash
> +++ b/package/lldpd/lldpd.hash
> @@ -1,6 +1,6 @@
>  # Locally computed after checking gpg key
> -# https://media.luffy.cx/files/lldpd/lldpd-1.0.20.tar.gz.gpg
> +# https://media.luffy.cx/files/lldpd/lldpd-1.0.22.tar.gz.gpg
>  # using key AEF2348766F371C689A7360095A42FE8353525F9
> -# gpg --verify lldpd-1.0.20.tar.gz.gpg lldpd-1.0.20.tar.gz
> -sha256  61b8cb22d4879e68f7825a2fb8e1e92abb4aba4773977cf0258bc32ed9f55450  lldpd-1.0.20.tar.gz
> +# gpg --verify lldpd-1.0.22.tar.gz.gpg lldpd-1.0.22.tar.gz
> +sha256  9587940ed2314a86774c5499f3dfb13a8eb86232a62d243a83a1f09886848e03  lldpd-1.0.22.tar.gz
>  sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
> diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
> index a3015e9e7d..f0cbc7e436 100644
> --- a/package/lldpd/lldpd.mk
> +++ b/package/lldpd/lldpd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LLDPD_VERSION = 1.0.20
> +LLDPD_VERSION = 1.0.22
>  LLDPD_SITE = https://media.luffy.cx/files/lldpd
>  LLDPD_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_CHECK),check) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
