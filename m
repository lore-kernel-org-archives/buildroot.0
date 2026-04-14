Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DA5F9D0D6
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58B9B42B71;
	Tue, 14 Apr 2026 15:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZ7ugWGxeyPf; Tue, 14 Apr 2026 15:46:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39F5242B90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181579;
	bh=dwqr/CeN4MWX5yNlk53/ERIZp0Nf1cejVj4L/DROCqg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=atI6YgY/xkbXoJK6PVCYmageFIwJXxc5smGEXU7qC9zcAJgDmPBwCD7sG/Khw+pLr
	 iWveOkoVRuhPuQiC003FFtt4+01/h8pLiM26pnbUJFoG3qeUqlqazLiBVM+d2H8Q2T
	 63AfqsLF4CmZPJeQoHkKTzpSyXRW5BYebrPz/QAtz1668Prc2X9w0ll3f5PWEGay1V
	 Xd0tcFQQJUxsaEN1gcQhv7uRn2/T/IY5oFji/rKDjOW09J5QpDdTj6TbYRZusoJCpJ
	 1pZWvpW2kVgMn4wu5KgCzxLNfzPAb7IX0tzfIlHIjJEYrbgzEfLJvnl0uZedf6BIEs
	 crV+tmwIyVnCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39F5242B90;
	Tue, 14 Apr 2026 15:46:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2698E237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2237B42A8B
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOgU-a7Aqq8j for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:46:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B5C642AF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B5C642AF5
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B5C642AF5
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:46:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488ad135063so56044855e9.0
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 08:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776181571; x=1776786371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rRbvhAPIKOmK/46QQZkxQW1yJSWMap5uUJj5H5NIVpM=;
 b=ntM3vYoEgVqEyTzlilgJteHL+apd/+S6qNgwOmDP60PRf6OAYJGOgHBvhv696i3sLo
 bW6PQiV4wwJ3c01ljYdtkfREkVki0q++WbxNxf1Wvwq/Do4LiTn+XYDMC1O3yOt805JL
 gRc9fIO279s9Alyl2Tl9dTVctJkFYZF8qezeR6EcpZy/E2T7hdBbB8BYRbYK7IzekL+H
 3SZqvLySRLWBjETg3bWla6eD5JVE8/RfWbsBIgm4Si7/yNnSNDg5pJsK9yQHPcSPdWtB
 3h0yNoVLuwFG7+8pJQ6V1cp/7TlnN9FA3U43J05cWkW8ZzTnJBfW5Rl3Lahpw4r2lx70
 TUuA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/dwfKDNyC2tPQw1Efpr6Flqlses86QZ8VqsF0YlRBa93Ire35/kUXF6Lqv5drKFsSsyk9FRAwiUbE=@buildroot.org
X-Gm-Message-State: AOJu0Yx7k8UmSR6MG2yvxR3eUSkOQWwhqbBcUA2IUIUlFYVUf0Jadi9N
 m9sMuts+3wO09H4Z1H3OspgnWDF1r7ZYd7t5pW1NYAhiEMNOiz86BWK/JoHSTbLhgLTlzzW+8fR
 xW8a7
X-Gm-Gg: AeBDietoaTWUeKru7MoEKvIchKU56nkIxgadIQ9LskKgU5ilgv8ZoZEiW1FN7ZmNS1l
 J7PWq6bZz0qTetSYNx3QWz6lKXNJpZNKPrer0I81LZxuOjOdbjeWknYDDzg/EQ6PzLG5cH5Wycp
 20BCpbUbwyyG7Xrn85CLFAmPsL6YbPQdZQWJJfu3XWkTfLGebX1PTY8BLHeV+0gfGISuQR/vp4n
 SWTySP+sCh8r0oVGSQV3x3JOohPqKn285hg4PsoPM++uZDoXYNY1NQgCA8gRfCT5sYh2H5R97/x
 wF7JPnAbU8pFNzUNNlqDO8WqK/x9kG24Tl5PJxBPrn7gSRpOmhACVqBe5AYrrOlcBT+AVMSwkvG
 TyW4SxYPVBHOBhs2GthN4hpQ/LXIQuN/7jVoQ1ZIE0LjpNNl33OiqaMog0OHhaLiVVYh9dGcX81
 9N4QssA34XSqQrcIwu
X-Received: by 2002:a05:600c:1507:b0:485:3a27:a961 with SMTP id
 5b1f17b1804b1-488d7f23b18mr131463715e9.0.1776181570942; 
 Tue, 14 Apr 2026 08:46:10 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d7d5812dcsm11944909f8f.32.2026.04.14.08.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 08:46:10 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 14 Apr 2026 17:46:09 +0200
Message-ID: <20260414154609.336066-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405115738.2469253-1-bernd@kuhls.net>
References: <20260405115738.2469253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776181571; x=1776786371; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rRbvhAPIKOmK/46QQZkxQW1yJSWMap5uUJj5H5NIVpM=;
 b=Xhr2jDWb/kUnHAt+sBvz8txSZYO4K4KvcIu10UiaQoZY1kUTKoTEzaz8KZm/UIPFhu
 pXlQIuLtdJgV3RXaoBsOoC27z1qD0q9t3zkA6uNw+SY6oTbr1Mn7mVR6D9du7UQ1gcQ6
 wH0SexIq/2LHopTBgukWLKlxNtNsDJZblLxy6JF4bZovcoBnhTNahHbSerP8lL3Wu0sp
 rdMHyMVNWl3sUkzgGhdK9qs0JonqJ2rau5YeqeodanDfCT7Ceh5MCQA3E6fAv+XXWGjg
 YR1waFuJ7Gp5U25EmnFyLQWQPi6zTeumqc/PK0o2gjjRocbetXOX9mlZBH5om0P6Vn5a
 ZM7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xhr2jDWb
Subject: Re: [Buildroot] [PATCH 1/1] package/luvi: update help text
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
> Buildroot commit 00317f0aff243986983650671fd220ab040af50f switched the
> package from pcre to pcre2 but forgot update the Kconfig help text.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/luvi/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/luvi/Config.in b/package/luvi/Config.in
> index 19d3307f12..04163141b0 100644
> --- a/package/luvi/Config.in
> +++ b/package/luvi/Config.in
> @@ -21,7 +21,7 @@ config BR2_PACKAGE_LUVI
>  	  The luvi core can be extended with several Lua modules by
>  	  adding its bundled Lua binding libraries.
>  	  To get the Lua module...
> -	    * 'rex' select PCRE (BR2_PACKAGE_PCRE)
> +	    * 'rex' select PCRE2 (BR2_PACKAGE_PCRE2)
>  	    * 'ssl' select OpenSSL (BR2_PACKAGE_OPENSSL)
>  	    * 'zlib' select zlib (BR2_PACKAGE_ZLIB)
>  
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
