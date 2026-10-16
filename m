Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177C7CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D50D540C73;
	Fri, 16 Oct 2026 15:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGgcTFugRfrq; Fri, 16 Oct 2026 15:06:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E3C0240D14
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163187;
	b=HgYdZm3BUob3FoE4O8TDcfnD+SDKTpWSKDbNIypkA8TFfVD2znLbmD4/QHsM9z4UjSpZ
	 gRtP+7i0erN4sUMg0r6bPSRWfuBZS+wHixro1BJyJ4JtkRtXQk7Jb5+lSpDMlQ8z/mpFP
	 BKD6BS9G+qwICsIu0Lx8OpuMaPMypMz79zXF8P6rMVem5V8QHTMnXgjjgjx5ujkKMuoFi
	 QanKTM1gDRgk65clxSTQfV3D7oGXu0AjyqYuF1BCNXd1lbgzILr7+fHwXkGQdF6/olMO6
	 bc8bCKynFV9RQZmpI2uxIEHADUpoWMjur/j2YVouHKCSpiOGjFZUhk+6EECm9en9zEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163187;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AdL4/f/XUnznJfkKIoQRqIRJbZ0x6imsD/yZyBKorEQ=;
	b=HUjQju7UNd4QCfoNH7aHweg0rpEDic8oA4tkORr8ihC/4KsrNm1pv14c11MPj7dHw2aD
	 Hc0l0iVd8t0MoNgdr3kah+1v9C1BnckPkt/w59jDGLhXcfgFAsXXrj7DA5kbkFFCcHc8e
	 Mns2lkI7BEPvll7hTncr6CrF3G58GeJMSiyWcLbfWMSrB6UBIHEGebqz5NOGMZpCngBls
	 fHTPPJKBSnA4FkR/MRiPUiGhWjzy+4sm0XEEE4s5AVL39XkXNvXZmzI+D1GhM1zbQJ0Z5
	 IYEJDFJSxezoQ1PwHNfefSFY5KiP0oi3mIRgUlC7xHpamxHIyrH98wyRUbDX3a3g50A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163187;
	bh=AdL4/f/XUnznJfkKIoQRqIRJbZ0x6imsD/yZyBKorEQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OJI4b3XW3X8BbHGKYHOr/KlsJvXkl12040dCTdEdA8QzNTQGB5urOahUBy5BWzE/5
	 xdkiMXGAz5AUyC1uzOlsHdzze81EPYRHnOI+KZfZBxJo0fcWP/x4cCun7h3kAmmHSD
	 8ZMGaRVpzAe2Qz1MPWzepG7raAanMBPoaSybjMm8rrQi1Ialyen6u4g/nNbDMqDu2S
	 TvSEjypst9QMDgirRSbDy4tPTCwOXFp2wYbMkSgLw3FJl8iZgFxyiwcnhQX9K6qCKp
	 dEg95FaEDrP4aNOLnRxd840QN8caUHdkBr9SZLK1skfoUK1MFbJ10bN1bdsEMmEEom
	 Fo1/PbxiM6QTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3C0240D14;
	Fri, 16 Oct 2026 15:06:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D3B3255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F4B34016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dc9feeSJQieJ for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:06:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E3DA540042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163183;
 b=ssPXrmF+NqIuk/rsWO9ZNpPN0SySkiziHDAOjE5Zze6cdzIiQQ9EomvAtRh6pXa1dDwe
 R1WvKnnUxg+0iDSyWM1noDK2buw4GvVi9CmM0iKWXHh35ffUiFT/oY3gehbFwrhFhDB7o
 siC+NWLoE7Pu66I2FX6nxJNfQxBRMxjXn+oMYhAtPR4OToIpDdT9NpXg5CGdjaPRwmZva
 Dd73Bb+VLOpq0PXCdljFL/giaOulBUQ5p0JXlv3jf5oWoF34LvuPKz9pxiEcwSzgayONx
 vPazWG6gV8intD0mG0okfPO0hrNhF48JiV4ClHNTRCgwEJJlyT1bTvCla42UgcXNVHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163183;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=cF+qfRqqXXeWiKepUMPV3JgRFjWsDzpDHGmTtJd/CiE=;
 b=gkcXC48zKPZnUivw4d/nupbK0EJBZLZcaUhTKNi7kLUQfAYwt4qcgdaM4p3Nw9x3OLQ0
 0AoLciQg50mg7u8FArLEZUcxxpF5lDu7gmLluyrDRpuAcVztF1cU54HXHTF9YYA/W/kzI
 Ba7+p3JxyJS+bwJpPqGK4KOucKn4wIQup7/eKTBycTKI9bHxojgIpWrpuE7ghOzj4+pGc
 Qy42uMsLJCirhsWZ9GrrHW1rOP42/x+WNunT38syJXoZ3/EjjD9i/K5bWfj50lU7NmBCD
 7K5ISsjnLjPnOhgI7JVbTkD/SoIilYx8jeZic6sqnl1Xxcln62U70kqjAlb7UpaB7zA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DDe564sf; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3DA540042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:22 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so439315e9.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163181; x=1792767981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cF+qfRqqXXeWiKepUMPV3JgRFjWsDzpDHGmTtJd/CiE=;
 b=d1Sc85Hl+J+PmacwaPYkkHOt4Q0Sx4ECKpthkGLmQAxfKvKcxXW7GJwDI3n1Xtj9Bg
 FUgEbRj76WPWAyKtt6UzLjiFuC4AsrTkxP38phMp8vWlR22LWcMA2QrUMPaGBvbPBvY+
 /wVUel2sL4E+ASwN5P2kzpD6w0qEhxzkV8DReMo0P9NifHvEU5UmnWJYQETkQBGVu/Oq
 FZvTdl9K+IBZtP2jzCNb6NpbH4gRyqz7ypOhoPpIoqZvx4YFkZLX3kecSn2jy2Hp1hPT
 1S9sTAt8bp45yEFj6XOrwkZnc2T2pZCslb0IXsvwgkFWs6Ow2sGOH6hMF5JLNCaDyT9R
 DRRA==
X-Gm-Message-State: AFq9FYL9Hx26VR0ieTxKcJbcdox+9ABIpISU5ReFhnCMHhrX26AVq79m
 vhsRUjTUXFOEhzJ2QDLrQ157W5iOhvth6ys7bgMlQK9bT8zKmfRcf7TJ7h4jfSHIbu2la1LPVeW
 GIpgFAkU=
X-Gm-Gg: AYBFou0YpybmyAdYbk986hbgeqn2ZuMBQaUY9gHatmrR3/5GALL3DdBe3ZCYrm/QhNi
 KbKhsU2lIWduNxSJI+Gcb2J9wsHU8gP7ZslrG/AH99wCvqkf8JBhxci1dTFqPzfnJO6ZEWaPP11
 8UnApuJ6NUep8Ht3Fw7oE+zvJZu0dezxVc4hOzR47UnLL2Qi/z506KA9EdtZHtUsof0u0IQ1EJL
 KU1kg7OrsyQCm8CBIzRuFGDIqeWjCwuWeMMSSgvcLNBNjFY6YZwuNXe3N7R6xEVKG22G7a+i8SC
 yLiH3XB/qZePzWsH8qs8e5alGVfb3UVZ8pg9jFdBQbIT9hZOclFbwTaSAjtajpSevfhz5B8eQRu
 bfaop/c+87pT5nmCK+plRUUkg3ziWFoBKpvX7pPjU9Z65kE/SEkUk0vHllemREJV1I7c2Ho59xc
 OAyqaTR0SVCFwN+tE4Etjarbvn2RJsHO+f41m4k5a9tCfW4Y53bBMNSQcN2ue3dcjzXF6RSmLCY
 zBRxhiefUgQwqOp+Qd20Ax9mahkRmF4z9ctmfxksQ==
X-Received: by 2002:a05:600c:4e94:b0:4a1:93fd:8f2 with SMTP id
 5b1f17b1804b1-4a1d75e3c4dmr1942635e9.6.1792163180729; 
 Fri, 16 Oct 2026 08:06:20 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f5b2dsm5978769f8f.31.2026.10.16.08.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:06:20 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:06:17 +0200
Message-ID: <20261016150619.76717-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261011094214.682647-2-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/3] utils/generate-cyclonedx: improve
 help text
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
> The argparse has a set of arguments you can pass to the ArgumentParser
> object to improve the looks of the help message.
> 
> The example usage used to be defined in the "description" but a "usage"
> field exists [1].
> 
> Also link to the documentation in the epilog [2].
> 
> [1] https://docs.python.org/3/library/argparse.html#usage
> [2] https://docs.python.org/3/library/argparse.html#epilog
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/generate-cyclonedx | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index c292ef7840..9d3baa23f1 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -529,9 +529,9 @@ def br2_root_deps(show_info_dict, virtual=False) -> list:
>  
>  def main():
>      parser = argparse.ArgumentParser(
> -        description='''Create a CycloneDX SBoM for the Buildroot configuration.
> -            Example usage: make show-info | utils/generate-cyclonedx > sbom.json
> -        ''',
> +        description="Create a CycloneDX SBoM for the Buildroot configuration.",
> +        usage="make show-info | utils/%(prog)s > sbom.json",
> +        epilog="For more information see https://buildroot.org/downloads/manual/manual.html#_generating_cyclonedx_sbom",
>          formatter_class=argparse.ArgumentDefaultsHelpFormatter
>      )
>      parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
