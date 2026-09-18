Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2E5C982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E70B260F0A;
	Fri, 18 Sep 2026 13:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3vu_k1wJNcWb; Fri, 18 Sep 2026 13:08:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AC2DF60D88
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736905;
	b=KqTZNdbYbN8FNi6IxNxM21jS+WGh5/NGucftfhENOaA9bH9ZwX4OHtXXqZN26eQ/siqk
	 A/iJ85BAeH+vIM4wyZaRnjY4VqLl7UUKBx7CwT3zWhOoaAQD/7FIcrx9dSxJd++mTezo8
	 8FYrUNJ+0mGtTkH25tKr10bz/jqb2I3CF2MaEVI+yylCXobVyX5RCIoKNohSNUzMnfYUl
	 2aZO1Kb8s5sETIx+qm2TnWBvR/GqQkmmrWPU9gVt/sic4LBBtUXmyN6JKYeDAQ9dHed7x
	 qj2Vx4ufb6Orff7uT14K/9Bfv4O9MIaeoyWL1us9f530Su3VyLjx0qdUXzrR02ehuww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736905;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0vB+W8LmOKctcy1LMaPs7TafX7UJQ+Rv0CeK91o41oQ=;
	b=EXb/MlafYr+8bNccykIbGjVAHNWNEZr3VBFwcoPVr8lxuRPoff/6cX56bWLzUh9vkNRa
	 ShGa/8gjxTev0PQI4CE0DRA2atfHDw12xT9efV4ZUFaJMOBoGymnQxxq+b+7nWIe69swh
	 VoWuB9xXfqCuI9yeEgnsQ841XsZZtlPXeCwFl3R+2Hl96d18Q3v2VyoAenG0XbgWtoptt
	 TnutPFchqImSCA36BSOk0/Xdpgtj9xgE9AEtyK5sxXz+ZNAST+Z8zpjjKypj6+jQe4i4D
	 Rt9HFRyYQwJVL7WNdh/zOwCwLt5cPW6nhqP+qvHWBaNT+xeCYlu2S1uU0jLcIX5XRaA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736905;
	bh=0vB+W8LmOKctcy1LMaPs7TafX7UJQ+Rv0CeK91o41oQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HBEHWIBNwGXat45WDuVFJX6dGZEHXP4d8nlDjX+3Pnbxrw1SVF68KgTdlqsQjFhEb
	 FivZmJVdvtjuouHuIaEDRBKTQqjgIhJBckShnU4+CzacSO5V4QXWMru0etpYUEtOj2
	 cu/4PqbjCfRRetRb1kOnPu4B9U0q6eRPiCn9B4CYQbM87TzH7yVxbc9eHSjwKGQ81E
	 AgxraDNYX+zXzRF2BOQCM/c7tiq6qOgOTK34P68I1QoWZXChq1zWf6RY78Cfx47qYZ
	 GkyBuWAYvM7Nrvf91MxWXtEidyFXYDZBvAVni5qCLOeH1ONbgpuFThhr5DEILQXIaN
	 G3sE/Gi4NJGeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC2DF60D88;
	Fri, 18 Sep 2026 13:08:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30877224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BC7F8124B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPy8T1YX6mLA for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:08:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 05EE78116B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736896;
 b=eetvZdgAy56AVZBhvvypNbcEnPTeLh9aK0Jh3kXu04IzemK6oqZDiJyFUjeXRgrBIqFV
 dYZOdmhr9HGLEarBlMFdmr6QhbJK3aRZ6ul4ZMxsLcvaOKYLTwX1evG7EA5SiUfC3TzRU
 7g6t5vnI00ETlTBTKiTCKOtvYGm/z8SEHchhfFP9m2TkzX93/0eitZD4CARxDPkH+y0B9
 23lhDIGovwtjxiTtiE+wZ08VL/zxda+6box1EE35P8xSAJnoH/YdGb7Lu+hiPIPfimdir
 qEltOZUAhI+TWBHXSsIaGfGRqbK7WFRGw6PWHC9ShSIwbzxe40q5U7AyQPmX7lZgTFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736896;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=RX+lAEGTA/ovVUsJ4bwdkorotxcZtSX3e/3vpYZTM8Q=;
 b=I4JwyC0jvjW0cMeXn4NPxaVpui5kzHw4SWinruT3LoMWN76n2LBvHX29XwUakDNJd5lB
 DjVz4URS7H40r4jI6bDu9nrjq/of4WiyNPjKlF47/PR75CvajIfTmpzqqricGV/SuZipH
 6i4mJH/T6yFs7l6IZu5i6jK/ht9H+nM3MquAILbGef+H/5msBN4F454vDY2JIOAhdeIkP
 wJ4tuvT3Rsbg6xcnnhRcn3eT2wWEG9RZe51/1DswbRJH+MifBiXyLQSPoW1gRoy92vPwN
 25Z4l9MtoM1CNgNVujEvCLDjE322pTl7FWDYQqwnVz+eItdGroQCFwYrGpuSY327trA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ik421V3C; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05EE78116B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:15 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b965f447cso6238405e9.3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736894; x=1790341694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RX+lAEGTA/ovVUsJ4bwdkorotxcZtSX3e/3vpYZTM8Q=;
 b=MuWdnDOSCgB24anbXtECWkw6ML8NfWETJV/RY3A1dzQFnPJozs2tSUQYD7lsJOsIAg
 qESVAQgZuN8NwbtCSJMdeLt4sYll886aEFe511iQEruBo7vm3EcR6/Vpwq5NSesOznqn
 80oeQ2Tp9B0G6wyDlBOa0c0wyeGZ16xd36io1827zZ7TeGtSFV8exZsvxT7C2B9U8OQN
 k7RWBZrM2ZVQZwD2wXzN6xxVyV60H80gqC0jZqR+gBdlDOCn0MSH4isNHiKNEFWrMNYX
 tOkvKcnxvNvYtYFJqxGDkqGkZSn6qaNTPwKhvGcJgkBuPBQC3VoB/ON6o0rkUfR2+WGq
 PerQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBysTALZBBJKmXxOldNDoTS/0aGQ9Gvih21hlyo14MA1XpX3v45VsHQpRif9BDlCgTmTZxUNwKWswE8=@buildroot.org
X-Gm-Message-State: AFuF++nzuhUKttqEWB58NMV6pjhdi6tVgwImvj8shN3amqJiCMFEuOcm
 K/aN1xt2+lRcs5gGLUh4ijbASUOEHU7xdbF+7+70LgiKxQhhSfc1VLDAtb1i4s0jG34=
X-Gm-Gg: AYBFou08M6psJga2RElg2equmz2EgXX/jEJMdBML1YlD+cAT7Qiruv50FAk/a/WWE/l
 PYP16T9r4/8GFsIcVLWNV71TZSBTm74nTbMK+TKJh9GkczjMLOob9FNIkgX3FMqglsHBl40hCBL
 zf0U+stvaqnK0RgmbPhUL+KagYAY7xQLBCRBMKOeXTp/c8/LoW+FdL44VNaBz9jRg0rOdjEu/WA
 JoJgw010v3xiAJ7Y8ciMbGsr1xFmSxQpNs8q5rg4m9BBerSXClyx8OHbAR4gH7wGBdGk4nTKkSU
 mwB16Gc2cD50Xl9Bhov5OMlOlLzsb/WNTt5X4BYENMXSwgL58QDvevo+l0KUMVyBA/5oi8Uej8A
 MjCTwFe/bShvHR3oAmI8y8MI9+LH7ElMBP9B+85xPiNKfJzwTMx6xEv1PYkb3vl8n4rjYEQEwnE
 XKuPu/Za08yEhxLXEeVZZhYYWhThpbdKIfOg4tvCGQTjVT0pvMsFE0oVbIIiJPXsd7VlAWukjQA
 Ps=
X-Received: by 2002:a05:600c:3ba9:b0:49c:f504:2af5 with SMTP id
 5b1f17b1804b1-49fc566939emr35728585e9.1.1789736893685; 
 Fri, 18 Sep 2026 06:08:13 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd204d89sm182785695e9.3.2026.09.18.06.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:08:13 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:08:12 +0200
Message-ID: <20260918130812.161542-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909102955.3878896-1-bernd@kuhls.net>
References: <20260909102955.3878896-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/turbolua: security bump version
 to 2.1.5
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
> https://github.com/kernelsauce/turbo/releases/tag/v2.1.5
> 
> https://github.com/kernelsauce/turbo/releases/tag/v2.1.4
> Security fixes:
> 
> HTTP header injection: header values were only checked for a literal
>  \r\n, so a lone \r or \n could still split a header. Now rejected on
>  either character.
> 
> Transfer-Encoding requests are now rejected with 501 instead of silently
>  mishandled, closing a request smuggling avenue.
> 
> A real default request body size cap (128 MB) with a 413 response,
>  previously unbounded.
> 
> Secure cookie signature now binds the cookie name, so a value signed for
>  one cookie can no longer be replayed under a different name.
>  Verification failures return the default value instead of raising.
> 
> Constant-time comparison for the secure cookie HMAC, previously a
>  timing-leaky ==.
> 
> util.secure_random_bytes reads real OS entropy (/dev/urandom,
>  BCryptGenRandom on Windows) for WebSocket masks and util.rand_str,
>  previously math.random.
> 
> WebSocket: unmasked client frames are rejected per RFC 6455, and
>  fragmented message reassembly is capped to max_buffer_size to close a
>  memory exhaustion path.
> 
> StaticFileHandler decodes the request path before the traversal check,
>  closing a bypass.
> 
> Fixed a 32-byte-per-malformed-request memory leak in the C header parser
>  wrapper (found via libFuzzer).
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/50623b5bc818c308c34ebe6dd1c3b6b85bc99901
> 
>  package/turbolua/turbolua.hash | 2 +-
>  package/turbolua/turbolua.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/turbolua/turbolua.hash b/package/turbolua/turbolua.hash
> index 12c41c6e5c..253b12e47b 100644
> --- a/package/turbolua/turbolua.hash
> +++ b/package/turbolua/turbolua.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  4dbfbe4919118977c2ca40a4da81054ffe407d09f38bf5420eec5ae1449299d3  turbolua-2.1.3.tar.gz
> +sha256  65b602ae0638bd14405567de999ef57e8d49f0c8ebfa3561952f4ae7242e9d0c  turbolua-2.1.5.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
> index a85256a3e1..6765654afa 100644
> --- a/package/turbolua/turbolua.mk
> +++ b/package/turbolua/turbolua.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TURBOLUA_VERSION = 2.1.3
> +TURBOLUA_VERSION = 2.1.5
>  TURBOLUA_SITE = $(call github,kernelsauce,turbo,v$(TURBOLUA_VERSION))
>  TURBOLUA_DEPENDENCIES = luajit
>  TURBOLUA_LICENSE = Apache-2.0
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
