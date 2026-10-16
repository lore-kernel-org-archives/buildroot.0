Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405BBCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0994681628;
	Fri, 16 Oct 2026 15:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXIdAJIS96n5; Fri, 16 Oct 2026 15:03:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 403B3815AD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163009;
	b=QYdXd7d7HaRyKmTiqACB7Hwgc1uEGMV0YnobRWMherb2g6RHOwSXXhTZvKiweG+K8gss
	 sfn5xxFuQeOtYLoeDnww7FWH+lgx4Q4K9iJOW7f/sHYMkRBkrg7+2W98GSQHRIBNnql3g
	 Tc8u9ejvu45LboWhA54s6PjCO1vUXSKTkSluY+X9NgumIarGGrb+p4URW6n43owdUg5xg
	 IUuBOlgCX1Y5I9BAEuqLhWZUzTXNpR8pLKuQqmHKBvEctFNzfWxl6aIImBdQhJClsMHTg
	 ePVD8MGG0Im6ztTgXJldWLEmXQ3y19HWM0AL3tNX0R6goEwoYxyvwz2OF+28EfDDn7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163009;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=msXM4KV1lrqjXTiO06Ydkb64meiRx6IAN4I+MqZ0RWY=;
	b=rCEjMArxrw1ih6pl38ExUnaWOoDIQe3LZcDFYvlcZUNdxw+LglLJDOINCbrhL+04GOAT
	 25g0l6BvXcF34Y3dTtTmsdm/VZRVWokiVkxjv+ylaCJbBzMwfXE/xsJwdcEcFK1jHSy4J
	 7KltjPQl+ntGp8kteDefSXO4OLQi7OwayonL5E+jpA6t6QUj/RovCWqIH4Gj5/FJ2tjET
	 p0QFR2ud0mdkahs1Jpq6G+YuAkkH9LwWcTk4wf4fNeUY9DmZ64/Fth02VHRwZVl46RCdg
	 wd0aIqZrE69FHLzHxkYxnliD9yMM9kxvcAtzDRC/IE7Kn4QvE8+HkFKFpI1JpTFirwA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163009;
	bh=msXM4KV1lrqjXTiO06Ydkb64meiRx6IAN4I+MqZ0RWY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F0lFDP87sTkaqjC0KvJKORQg0b808RHKHPdWPSgMepRLineeOv5G0xx7j84ImrtaY
	 tnWNyF2eu/zyfUvqCXh1JEIkzgBPZSdJf3zlaG0m6kzAl5R6ol6bNEbBLUCe3DWIQw
	 DsOrwe8Bxo6s3ZWwA/WXXBcRP3Zu1sKMwfdYpchLpUcPwleYaqmGRsitpQ3k61vL7q
	 QhlRm07sK7phCDrJqhg2Des5jL6PQqzmz8atW4WQJOHuRF9XK/WnidYsMh4h7sLY41
	 T7bDwlbbLwJEkFoxMx2D4xppjFPhQ2mLXHZzDvGsV0YcIsZJNPKR2OO68XNEgw5aIS
	 i755dHW3zKaww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 403B3815AD;
	Fri, 16 Oct 2026 15:03:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7711D255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D3E04016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZ4AEj9YgY3X for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:03:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9746940042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163004;
 b=Uu5tCmQKAusDGPzywQP8n/U2GLwyYd2a51cF8DAMbmjMXm0ib7s6wnyDmZz+FCdI8k3H
 BhtAoR3Kd+uqL9bhYJk8e3j9L9NoOGTgVGuYrsw3cmDKtmviFNNai1x8apsn6CDv93An2
 n4aU1nEZb+NH5VUb7H2bIvV762NU8OO9ZZJ/BIIcLFhSc2FsNIy5MtHAAr8VCmdZMWGuh
 nuL3t3qMwMXnaVcwsTRxlS0DEISsYs3/yBYviaOybQBVyORti1bCoylquwtD5Wl9Yep8H
 ZgLhSw308I94g8tcjfvFnBr/nWqwAJj9h0wX2+JL4K7FQSA1rtYi7Ci0q6/rhftNbBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163004;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=q+LW9jwvYDIU7mima1YhZfBrzD4oKgY1FM7eAsyLufs=;
 b=jNpCy7QBXZQkHlqRtLvOd7yKux2s9aN7eZFK6lhhpoVQ87RsUpDJ01CrYcxI5GsuCBzz
 LDGw3S3sAlKd7O93V4vmw2tLgG6i2puyctZSCW49+vHUf1tgwvcCEqcRY5EYg2Df1LguB
 QFF3iMN80nNixAfT/QtO6+y1zP+PE5FWoxUhGW47t3vcDVbq1Zh6UQVEkkwmCK5akNRRH
 ysbeFRFCGsHFjiuemzqT28aoOtL+QJOwRuYw//EkqHzQKVj9ie3RvObtM8Sg3lkJp+dFv
 vWJ/cJmxGA0DnW94El7o04F5KUt6jSGhk9GcecxcPPfYRYpLdZ4j3p+poKiUGxMEIKw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=gy8ggh1m; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9746940042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:24 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a16c399641so419955e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163002; x=1792767802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=q+LW9jwvYDIU7mima1YhZfBrzD4oKgY1FM7eAsyLufs=;
 b=I638n8/ckdM7zoEkzLWOCAa2JwoCy4lHVc9fepW22wznbCjYj7+s+8jmYRvmmzZ+8B
 JTOxN4YxImqGIQwSFN2Pqd48+RMYzmWONr4rOY4SllaO9DQEbU2QUTETEJkm0L8ilVrz
 e99u1mx2+73RogThX4SaIz0aqR+WU5WlrKvS+YDrYaNSEEEdz3p2Fjp+7dd1kd7ovM0j
 zJhvSbLylDX80cIapK08lzCLD4A6hDH4VzpVKj6m/Gr1Us3aXmiGN9DeV99scR83UAEZ
 1p3fK2c53iw6GFW+A7EDe2eH0XfMUj5U3o9qFEwE3gpuiHRGDWKJ1Hdax6ZUedAbRTau
 Vh0w==
X-Gm-Message-State: AFq9FYJyppnQi5kRnojnRNX8Ol5uU9xygdhvdm8ucE2Ru0++ANEOfgoH
 Ll4IW8wHn66Q5QPpEkR4AoGeUbCsbd5CChFj+wVLiWyFoOo8/OjT2HEWZMt+kC7xddYFn484Sni
 4fAFoqDw=
X-Gm-Gg: AYBFou1fgQLPZJyF5xS4pDnW8/r0YEqgH5qrs16qcEY6yaaNHmj92AJXdedJXDMUTJ/
 w0PXKvJejZlq5XybsuMj7EqUd+C5B2Nwej22/sHnb7A1yVi4gDszUy/SUUH8XXU44CFChXvBsM8
 +ejOHMIavXYiOJ7ehlyr9qte4mNZgi7jGPdhhybxh0lgQ5WbOTEmwh1au25mH4yf+wHq3xAjbL9
 J+jth8eOM1v2BfT7F0RQvl8gVlD/A19BwcRKzZxHLv64XqOSAdn0x0FK1L/xYiA7axNPBoQnozF
 MdHIOD8JSkywe9/cC+QgvDD805Z4IEza0jwdzRCcHYx3Sn3r0KOFBuJIJsOdDVFrdDAqyj7Thu4
 SNVJfSoxDO4hoRtmYdtB+bEIeW8Avqdc/Fp8peY538vuuhBWjiIDrroR6+tM1AaZ/tNh5Ddego+
 NfjHglcfmld92VRpiRnWf9DgY1Vq1K77Lib/q9xANXE2xzwwj/hy0dyIH+8zmSSdwb4QrfiFX8O
 K65eNFeRHNThPSkmSbejUK6PsAtNaTViJgllQcRkQ==
X-Received: by 2002:a05:600c:8709:b0:4a1:813f:2a60 with SMTP id
 5b1f17b1804b1-4a1d75e3eb5mr1933575e9.11.1792163002681; 
 Fri, 16 Oct 2026 08:03:22 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8abfae7sm27569805e9.0.2026.10.16.08.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:03:21 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:03:19 +0200
Message-ID: <20261016150321.65320-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260918091142.62239-1-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] utils/checkpackagelib: remove unused
 variable
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
> The `self.pending_patch` is set but unused.
> 
> Fixes: b00ac4e346 utils/checkpackagelib: add new check MissingCVEPatch
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> Acked-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/checkpackagelib/lib_mk.py | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index eb5fbf474c..065733d464 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -130,7 +130,6 @@ class MissingCVEPatch(_CheckFunction):
>      def check_patch_files(self):
>          for patch_lineno, patch_name, patch_text in self.pending_patches:
>              patch_file = self.package_dir / patch_name
> -            self.pending_patch = None
>  
>              if not patch_file.is_file():
>                  return ["{}:{}: patch file '{}' mentioned for ignored CVEs is missing"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
