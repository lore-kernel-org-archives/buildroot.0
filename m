Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F72ACCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EABC40A34;
	Fri, 16 Oct 2026 15:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKy-voNBIeJn; Fri, 16 Oct 2026 15:02:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 77A9F40A23
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162935;
	b=pYOlPmsC/Hhuc+2nxK2LDGZcLtAh+hl5T2W749/RwJTvkB1blHhurc+1AjQZ+6yf8p/R
	 3ZMRPN4aToeOrOsgdEMLowR+kbUGB/IEGrUb/HjhoacQmtyPG8dWmhPeUtkZjJWAqiRGk
	 OEmlrFsM0EYExhMCJiDhCtXNGq4MJ/JU0JXBSTSy4xck198ws1TeZroLsNgGFimyPv0mi
	 +LUukrRDOn2p0DLi1F8A2/JM+xC9av3fsJ61H9xlReoziuxiSltQPy/Y5D1WwJXJBgWVC
	 q9ZADocNwg2IAI3Von5S4yqoqrbG1Emro0iyV0z1eX/rfEypF7Awr3EUYvalx1jpQtA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162935;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=P/h3W10Fe/g/hxopxNiJONjdvbr7uy5QLnwbqvNRI+k=;
	b=VRft47FMZsaOWftcZttmO9Dv3NDRDQo8lxV1RdtCeNZ9sRix8YxZP+9pBUP0msuqKyLk
	 CxUDz1yyGnXcAMy+ReF5KINi9lKnvKiA/rLJm3YCDn7eBFnO1yWbn46Dg1dcmGX9UamqU
	 fwMNbqDoART0SygR5huNH5N1cq69IRI6JW0hT/kG0FswOTznH8uHuOSzG55jB5P66HmvV
	 IovOAVhoogI89pGnsZdTdANllCGv+Y59VthNLR79/9udYD/Cq5+AXb5a5qCBJdpJEOzR2
	 CkUOoHW1e7N08BKguLl+mxli5hJXgzJrQwPHWigrSOA/F3FY9//vWJNCZjaKk0+QKOA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162935;
	bh=P/h3W10Fe/g/hxopxNiJONjdvbr7uy5QLnwbqvNRI+k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kTMCAsR0O8iOjXh19QYA7N0a5TV6N0erZTgzY7ZQAcQQZFx2Wi7bxTieSw1n/lrpq
	 FvcrdYa9cc7Zuu9gwfOnkyrErCcT9AoyIUB5HtOU8HxEBOVhB4a9vpCdtCtd/fi4Es
	 WxScl0b72ejlSah+Agdn0OAiAHI7dc7Sy/+/QZo2aTaOByu+1Xs8f70ZpV9SOx5ijD
	 VGou65YqwPcVLo8PQ2L4nWm5nmaUXZ/s0VY4bBnEa2D2wDC30kFpjiCPWIPoxF3IgB
	 Mr6PZ7kU1VFK9tEPMtwJLFS5janst8merEoUFDJSw91v0KMWRFlCTd7VBPVFEJVxWF
	 D1ahEJyr2m/sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77A9F40A23;
	Fri, 16 Oct 2026 15:02:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BBB0D255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1E6540A34
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UxDpxyDdd0_e for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:02:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6710240A16
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162932;
 b=N1SvSjDKEiYO77fRHxdMi5BNyk8+5W5tTZRnXMlw1JOAwQFRGGrDRiMc9ar+eDDwzn0C
 BG3ACTFGKZ0uSDW9vAZoatBrhHrY3KYFjzkupziTq3gw/7wpcm4ZUkwzIarXTeqW5VdDB
 YxmM7NQjR/GkMGnso82x14cjdW5HFPjRBV2ZyKGVrUEy7UvqIcr+3N3F40Wtn/q2YD/HP
 MGenh6egImSfzAV/bH2B0eHo6nO3F/GrXhQOFn1mpAszsYpNr5IIFFsKi2ucS5xVBJewq
 MBfh8L59PvuBDalkg9N6FsZ9R81PN5UlhjPFBdwPq82gS0IeEWvOr64xaFEURt/SZXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162932;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=7O7XWE9J4iojVzDwYmg70GlA04qOplu+MQ6RUytFuvQ=;
 b=NJSscv8VCk5g9zsP2vhuxhkaBS7QzThWfefZ2r2hFtElLGVC+1f+9+qPdzKIxfbqEWjy
 U7u4ADUi17oSHMTp6XqFM+Ir4PUg77Majc3jUQ8J6PRPQGWq/15HE153lYC3EX37LQVra
 S31FeSwwH0j6Smq+vaLdlGSUKwnCnIobxB2/tmhWyBkBNVPDpDNvRJdfnUNr+U93Vo8OZ
 KmaLA81CrvAWa8dO/4kdM8WiYqd4qYZcj0azFw7H5iGaxOXK/n4ZlEStbhZVxb+a17VPQ
 i2vaSsiSe/kyZhubjH4cQOE+1QI24gyBhAnD7MnUXjALxY6xYaCGwmlHiHqYsfNPd5Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FIuo0e3O; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6710240A16
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:12 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso376185e9.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162930; x=1792767730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7O7XWE9J4iojVzDwYmg70GlA04qOplu+MQ6RUytFuvQ=;
 b=EEh8fH1iDMA8vOrgqPfjvZZDZojKeWrCBr7W3K9cfDiOP/VToXiwFjBWa7wyVwd7ii
 L+ZFfF+asDP1J+5laOlwfi8njVnvsqB0u28Edc9oRnKZSWlzlb12t2jdAMbWsAY14vxo
 2hih2u+3TbhL3vc+duiTcTfxMjJ8Ys3ksGu/U5e7jVxFGopiJc4HJ+NRQv5/qilW2mNr
 bek2Zex86dj/7jyAHQbZUpcxtldQ4umi2PFZCgp7uLjh7fL8XK1eLTMghuHuYX3eBXmc
 tsvHuK7ewQ2YEoJbhztEEZvm0jI2sMAiZxqxK3bhO7UjwtG8iByq9P3DN3367C/Uf725
 O78g==
X-Gm-Message-State: AFq9FYI5GmaU6djJ0lpTIZBlwy5NiK0y6BTcS54b4Js20mVTuUx/tJSi
 oBjSgchEaCyeDhIka7IfRQqT0efkaEIFTkIDP4eQRBhNBWSZfMuRQtPnOqgDxVVogcVS5gpB31y
 B7eCfQpE=
X-Gm-Gg: AYBFou3f9F5AB8T1GwaqaXf3QYnexVwKzwL0OAJ+zkv4BvE9d+FToqNdedwHyvz2Xy7
 h3z5ZcWjmJ5UsVsCfHJTgeWJitmH6GXmj5C+AXZv5jLj4YtDwhHcXAWF2b5VdJKgZ+d/taYXygs
 S3jOOpHdn16Epkr9zKGx/zXojD06QdyOnE9rIP3QnrG19pHBrKiidpWWslJMGkBUcDZ4L5PO/gQ
 clMF2SggVIzMu+HWd5R4ZGwaaOfzXvyOvCYoRwWEJd9FPTqguoraYBQ4ttBZQ0fWy0W0enrkp5M
 I7pIXghOz9oGe1L0ONKlSWokkB1z8ChzkcVTsyLsK0yZKkF/j2vZ8k6b6woB/bX33f1u4EI/sjM
 2HCO+ioIGGHJphI2YN7nWORQil2QbBOn850OBdtrtGfNp/jOnWRPdWF0GrwhA6sp3Eg8iZEl55s
 rJnhR8/7J9/9r9vTVmIDVEsICC46N944HoxsNIXF+ui+E2Wns6790VPAk+Pvr91L/p7x2ZTu1+O
 VtTN0q2asTHmV4Pq+OzIo1lo3vEycWL0jml/fmEoA==
X-Received: by 2002:a05:600c:3508:b0:49f:e772:6ddf with SMTP id
 5b1f17b1804b1-4a1d762251bmr1152885e9.32.1792162928749; 
 Fri, 16 Oct 2026 08:02:08 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1ce02d619sm38011395e9.3.2026.10.16.08.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:02:07 -0700 (PDT)
To: buildroot@buildroot.org,
 =?iso-8859-1?q?S=E9bastien_Guillaume?= <sebastien.guillaume@vendeeconcept.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:02:04 +0200
Message-ID: <20261016150206.60364-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612121516.1634-5-sebastien.guillaume@vendeeconcept.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 04/11] package/kbd: add CPE
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
> Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/kbd/kbd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
> index 953adccd0b..24516a8dbd 100644
> --- a/package/kbd/kbd.mk
> +++ b/package/kbd/kbd.mk
> @@ -15,7 +15,7 @@ KBD_DEPENDENCIES = \
>  	host-pkgconf
>  KBD_LICENSE = GPL-2.0+
>  KBD_LICENSE_FILES = COPYING CREDITS
> -
> +KBD_CPE_ID_VENDOR = kbd-project
>  KBD_INSTALL_TARGET_OPTS = MKINSTALLDIRS=$(@D)/config/mkinstalldirs DESTDIR=$(TARGET_DIR) install
>  
>  $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
