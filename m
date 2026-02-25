Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA28EFD23F
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 09:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 679BB81A95;
	Wed, 25 Feb 2026 09:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ycbWZlJl90qs; Wed, 25 Feb 2026 09:57:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7703184688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772013470;
	bh=DHthFYtb0EwbZwEhKU9Fi719T9MS0KNIS1GXPBu2dqQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MGfqKolD+yR5C77dAN/pWib7ccOTO2kQBefOLxYKtVSZQVZz+zV9RvcvJfi8nxySO
	 Y6hUgDI75c4UEqVtZtp6ZSozrfok0AInnce1LPSll9G6GrdwJXjjRFQt7YSPBdfjmY
	 uZK//1HRdPBP5i6khvUE8QiQrsi6Xp4HKhbrDwf8j4mshiXTjHGFI+gGwE+WKK8vW+
	 WQrIeN0R3CJUZmKoB4LN+udi75dG4k0bwGNsNXVAQiHs/nJn59vDYxZGoU8tjXskn0
	 GWcUAC5xXveoJKQ5MGw1RbwA6Js7k7u0pZPd++ghzR9/OL11qL6VxXT19bjxZcMsi/
	 EKuvT2lGGdsew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7703184688;
	Wed, 25 Feb 2026 09:57:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B9F6A23D
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 09:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C9F984688
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 09:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCsUASyxEGaf for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 09:57:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 886DC81A95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 886DC81A95
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 886DC81A95
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 09:57:47 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48336a6e932so39552795e9.3
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 01:57:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772013465; x=1772618265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nyKPjmnhGkGSBd3r34r5HRVSfiwNP1C/D1m7VwSY7bc=;
 b=B2uxgb2O3s9P3aD+T/iX+QUMWOxF6yBRXT4qqETh3H7vckiINJVPw8dr8i6WB0pDFZ
 wgII0WxdZugytm3VfklsNK+edWmNA64D9jrbiIfB15b6OlY48SSpG3/kXZwr5u+rbnti
 h0yHAadP9m5Q2Pu9E22RuIU7MNoU+WGyQq8mSjrd56eMJ02fMyTHqGOedupzvuEQ2zcO
 wWESR/Tk4EUpW7aiUUpijCGQ7vIrTcYhGo+06XulZb5VU8jDak+5yW2R21epc5hZ2og5
 0FHfK5pvuNk3BVBPbd3VYS7mbH3zAe2Dzw2PkyOAJUuWDzYuGiLoaerm3ORVLYtiQPno
 RtCA==
X-Gm-Message-State: AOJu0YwXLXrSkDpFKNVMpJZr/XS6tmgkv+pIoE1LZPwZUeR2mkBaHfqQ
 RcIkFrVKcICvG/b05sUnW9VJ4gb+O0D1Kt3y9QSiz2RIiOMnp4LyxVTx7pFc+4ONKkcb8wW1iQv
 6F/9e
X-Gm-Gg: ATEYQzw2ErP4cSRNCxQGuqxPpDOUTvcqwddbjfnEiixzzwo7hRyLepHxOszcC6snm7m
 lv/o3dyvEcjrQtIkbq4gYfYyse6UJyqYhWLVsglDWlz9pFJNq/9WVsnkiba8PA7KfX+KdS/d6vE
 1R2YxOrGC5K0J2oR3+B0K7tbkE6xGfU3rsgeauTZsYEIKLc7AI0WTW8JZhwG/bb/i068hX0c21F
 KupXgDpgxso2TL6GjlvQstC52Jr+8iquJ5zrBFspnYmx58jP87jYRqVLiuuTUjEXfHb4eOkvlE7
 VI1qmNMa0jJBOAxzJyH3cPV8N6YysrkuPF26pbJ7iBlqoVeksls3e6sC5sEFZSheXjgi2xDZCQg
 FotUpDg9STiR/Yp++BM1pfzyXCEn1Jx2r0TCX8iJna1qZP9Tvonvj3MnG80Kpk60k4GEp0r+mQN
 2RLtNdRky1L+m4Z5U=
X-Received: by 2002:a05:600c:81c5:b0:483:5310:dc67 with SMTP id
 5b1f17b1804b1-483bef49998mr25151155e9.20.1772013465160; 
 Wed, 25 Feb 2026 01:57:45 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd733706sm57801405e9.13.2026.02.25.01.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 01:57:44 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org,
	Christian Stewart <christian@aperture.us>
Date: Wed, 25 Feb 2026 10:57:44 +0100
Message-ID: <20260225095744.273615-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225094824.270893-2-thomas.perale@mind.be>
References: <20260225094824.270893-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772013465; x=1772618265; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nyKPjmnhGkGSBd3r34r5HRVSfiwNP1C/D1m7VwSY7bc=;
 b=ejRtD7v24w0h8Tg6NME2JGXmWw4y8MfTWU4+KRICxiCUF0NilFu1cGo5AGvTUISMKy
 a6WQ2vTGboEZqU4eMV1snaEv5Xl8SellB9UClcjZZgqEu2lZ4fEqDkbEl0+hbo5KEQSB
 o5S3VF6v8wnXtKND52DaFSe/7NxNKK3Gj+PHIEczUhUBb5bwsa6W+Rv0Xd0TBsYahquI
 CSiGa0bqz5adlzqzXr1jTxHt/cgt7Z8xt+t7ZRqmeZ6tZyLw8bpqCSvHByf+OlnhSYHb
 b3cZYpiSjQlFzq5jZb7Lg94G+Z6wxrcMRt9NWEjlmRIZJYF5SIQSBh/FqaYzUHgqWwme
 VIdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ejRtD7v2
Subject: Re: [Buildroot] [PATCH] package/wireshark: security bump to v4.4.13
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

The wireshark bump is a resend by mistake nothing has changed from the previous
iteration. It has been removed from patchwork.

In reply of:
> For more information on the version bump, see:
>   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.13.html
>   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.12.html
>   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.11.html
>   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.10.html
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2025-11626:
>     MONGO dissector infinite loop in Wireshark 4.4.0 to 4.4.9 and 4.2.0 to
>     4.2.13 allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-11626
> 
> - CVE-2025-13499:
>     Kafka dissector crash in Wireshark 4.6.0 and 4.4.0 to 4.4.10 allows
>     denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-13499
> 
> - CVE-2025-13946:
>     MEGACO dissector infinite loop in Wireshark 4.6.0 to 4.6.1 and 4.4.0
>     to 4.4.11 allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-13946
> 
> - CVE-2026-0959:
>     IEEE 802.11 protocol dissector crash in Wireshark 4.6.0 to 4.6.2 and
>     4.4.0 to 4.4.12 allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-0959
> 
> - CVE-2026-0960:
>     HTTP3 protocol dissector infinite loop in Wireshark 4.6.0 to 4.6.2
>     allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-0960
> 
> - CVE-2026-0961:
>     BLF file parser crash in Wireshark 4.6.0 to 4.6.2 and 4.4.0 to 4.4.12
>     allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-0961
> 
> - CVE-2026-0962:
>     SOME/IP-SD protocol dissector crash in Wireshark 4.6.0 to 4.6.2 and
>     4.4.0 to 4.4.12 allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-0962
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

> ---
>  package/wireshark/wireshark.hash | 6 +++---
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
> index 88eb7ef494..87d5781eed 100644
> --- a/package/wireshark/wireshark.hash
> +++ b/package/wireshark/wireshark.hash
> @@ -1,6 +1,6 @@
> -# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.9.txt
> -sha1  dc91c68b03b389645fa6dade92960863d74bca1d  wireshark-4.4.9.tar.xz
> -sha256  60551dc787f41e87aeaa1e9c33304f9008037e3baf9fa11aef9c2d584cc0b54b  wireshark-4.4.9.tar.xz
> +# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.13.txt
> +sha1  2e85bc1231775283d3e1593ce700566e0dc4efb9  wireshark-4.4.13.tar.xz
> +sha256  cdaaf455954b45990651ba334ddcc691ee446fcfb332e78d27b0a8451f22dc0f  wireshark-4.4.13.tar.xz
>  
>  # Locally calculated
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index 9ccd8f9a9e..196ac63271 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WIRESHARK_VERSION = 4.4.9
> +WIRESHARK_VERSION = 4.4.13
>  WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
>  WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
>  WIRESHARK_LICENSE = wireshark license
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
