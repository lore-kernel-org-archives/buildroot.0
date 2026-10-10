Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC91CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBC8F60A97;
	Sat, 10 Oct 2026 09:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSd2DKQHFs5f; Sat, 10 Oct 2026 09:22:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A648260AA5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624161;
	b=M01xO6xhmNMUwmyuduSQu5snRu/YgjD4Nxm4EmKT/herKB+55KCA06AtFKjgsKuFpIOp
	 r6UEq9q0Iz+Y2TpKio61iKcMG+vIw41n3+NjeOs6T3cGf2cWGPzEnK2DFWFy30EanUHEL
	 T15vBec48gvoZgQKffSXI5LQ4fZpSuuCj4Qt0WYWtsFL8UAQZVXk4+uckmagEZn+Q8b5Y
	 iWZ7Eo848/WVxX5ST+Y9Ngjt6qTuRXx9rBzAK6tL4/5braZCnh7zD5/e+ae4EKuu0z4jw
	 HPy3kQoCdrWQtX1nu3fuPyXI31ViPok7v10N+V7R3HxlZQTo9AQc7BlKUCFtXBYn3/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624161;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MotPQXL/td1X0j6ezJGBLKJJQ6iW1+ITASfojVVK080=;
	b=qVt72jm+nMxSgv3hvTxvE92dx/srOTLcLsmarGK9BVp2C2goMsTsZ2k2p6OH85Msdaez
	 Xy33Fifk97W27EID9uEEgLgZhHzEEbdSNDXD5TB3qy01kf53g5F5kR+83ZmlPcBUGzOw6
	 5GtD0JkjzhrRXWWMnf6ywA+OFnv4zWo7RtcHcrW4UkoPk78OKijSvcexMgjJVbVcSDuNV
	 dybp4hpwNOeGcAoa++3p+FXDnSLsoZFQEQ8tmlB17brw6N1VF3L+TUjPmiQBUd/XHZ4D5
	 bPuak2sjM/f6DkQBLatZCJRFF6lt9yyi0XKih5QpElxoiCWU5s7pplLdzEzaRVHEicw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624161;
	bh=MotPQXL/td1X0j6ezJGBLKJJQ6iW1+ITASfojVVK080=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A25PNWwNeFOpUMANn/EKHvW6BUvnvY5WVf1LRUHhBMcp+CWUjGN3gggFMpn9gVcG5
	 I2PQjdJJyMEu/tnMbZvdvClfxlsrW0E2rHLGoNHgag8ShYboDZzpPmwZwlm/SRtz3g
	 vNLx0LcjYBmAQLg94mhVGeM3u0CcRTLQJQbkscZFi27WpWhCRbNuofdyCc0vRkmCIn
	 jpKW1uPPdlgMm/b7sxi9IPAhY7G3C7KaISZiaEQEBvTpKpM9W36jV3+SW6AV5l0on9
	 arB8US0ujdFE5EjO79anribdI+aTA5/Fn/UHPP+yw055QegUOSDxctsZPstuTenzCC
	 fmVOt3jMFN16w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A648260AA5;
	Sat, 10 Oct 2026 09:22:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AA49356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50FFA400D5
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4m8n38ecPGO for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:22:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 18138400AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624144;
 b=RMBqb7LlQ+QtIb5ZO/ppmEaiwC8P7QUOJPZ1gMOnGVWSCzVkde51xXOUsKfpSM+69wlb
 uCAIYDFpq5Iu2cVN2Z0JvLANqBFp/1U0MNtONv26svICNsBwL14Smz4jXU10XOYCAFpb3
 I7qXF4Ul06WxNl6i8P486gs9/c5V3KF94nJfn1gg6NtJ2ujluyXwO4jRnsFRMDFAZpngi
 pgex5WCFR2NZ7KaGqVHCh9RuUWqPBQ4s78aSdcCbFZNKSXo5bRqfFA+AKJ4vy6yWW9kYy
 ZSZG2DW0bEZq/Pn7P7Mo2davfP9hiPUgfZVUqIrx27FPKPpLSt5Xtsy6zA5RAYFuEWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624144;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=a19s8hRMu+o6Ba1AAwJABW2whuKDvwynAHCQNVlFgyU=;
 b=pTcyHvQLj6SLRm4OB9b9T9Yu7Mp8NLrWA5Cj2tPer+le1lazZ/nWkV1wdllobvIQY0Si
 DB/KxxS/V5g+9kbfQ8SqgsgVVbRPJ9qX5WLfJFzOnV9bh/enuP+W+5qi9ptsHwASOKgHF
 EUHI046XOTqc3diZblu1amkyHwLK3ebFtkQnpXWt/typC7MHVcyjAp6e4skky6i+FyD35
 YZD5912N0oFqbTe3s1J59rgD3MGqHBMw4I/amxjTOarWpy0OhIryUU8Jgu28ggjfHq5Ff
 tvU2B8EyhGHIBb9wZECtkPJsbEyGO/7N+ynpOcY0tLCxhxbcIbsjlYk0z3SLwbuWn0Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=a+3D5NkW; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18138400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:23 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so5860925e9.1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624141; x=1792228941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=a19s8hRMu+o6Ba1AAwJABW2whuKDvwynAHCQNVlFgyU=;
 b=r3OGo86iC90h5g4WWLygMs4Gn3UP03ubLD98NaIcyWv2oBaf6Dpmn0AOCjFDNZ14lE
 +8SKZPtpKgiCU7Fj4jSZ6M8fQ9JNXfO+Vbo9BvcFBKdJfRQSeycovmnm6t6dSW3VbH/7
 EoYx2xJHxP7BdhapXkKNvHXGLljVts2UU1m7ryxs53yGFzrWHFWvyKfFNKfLrfnz5Rk9
 r4nqyGHt/ztEBOtkhnBaJ1BUfcFxqWen+E/x+0pyIEyRrqfVhcSPfZKdhbhxjU46V8KR
 T10YWUyIwJxaVQl8nWC9WGspAS74U66Me1MHlzfYSwz5QkrVRRXcJiu/+s+JOuB5vWrk
 FlYw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxmlp9GFjDRs9PNhfsx1UMzGsem4cwKdGgKxu6/Tja+PLpvg4/DjzMLNGRNelcLPTB5eF/I8xpTJIA=@buildroot.org
X-Gm-Message-State: AFq9FYLEeGHheq+00+0DQyo0kW2u1pT3kplTTepcI1LbGuInQZejaTve
 ozpcazpFsl5UG/qqdBk97a/bIqVZ6qHlRBhpyhcOH2R+KCDGC8R+x3Q93srPhJmOwxlMDzeGX9W
 bBMQop8o=
X-Gm-Gg: AYBFou3xnSxBthd+CpNzw3GuR5fyy+MUWf/DpOp9bGjpPbbpONQW/ymya+qQXFLZU8B
 W1QTIdEkykOAgbpPG2DOLHPqy5hrA5ML6oeQUhBpd1KGfp7AFtWF9W65LKdn2WGgd3W8TYGExIs
 H/X5xjyESgNwRzWpIfA3msm+inJYxhnXC7RxMy/alXCfqI+1+Rt68N79rw3Cz87RfSixqLXJ4Y9
 LTOCIodPUF3Gtq2Aih3zwWvBVBWInAxr87iQiSkaWmVp1klpxwmV+fvUmE6K/YsJXh/pH0lokWM
 nWPzXtgDX2Z8Wzreah64rYqk6egMY4aO0xn2AEZwSExdKaXhKM17OZ07XWzN467kRS2l6NDvniA
 gwKpaj5Bnsll1idwF/JPbCqrLDItz4SsRBLI3PUDg8Gx3IXSKyEIPV7s0gDMKY2LsqidDdf4/ul
 dtSBgDU2RAEu5nJqaiwUbfn8Y16rmgZ5wcH0x956wjkOV7I+/fhaaZRT2XWkYbIJw9T2ObH7Zb+
 oa/R/fNdyrcg+v2RItRSwh/syT6Yz7HznY2qq//4PamkqzAeNYwJC44
X-Received: by 2002:a05:600c:198c:b0:4a0:1c0e:b136 with SMTP id
 5b1f17b1804b1-4a18e4cdbfbmr83004865e9.29.1791624141198; 
 Sat, 10 Oct 2026 02:22:21 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e4a3b4asm205024765e9.5.2026.10.10.02.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:22:20 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:22:20 +0200
Message-ID: <20261010092220.138402-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005094556.145883-1-titouan.christophe@mind.be>
References: <20261005094556.145883-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/{glibc,
 localedef}: security bump to v2.41-167
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
> This fixes the following vulnerabilities:
> 
> - CVE-2026-89092: https://gitlab.com/gnutools/glibc/-/commit/fa3ea0362354af7370abb5fe8c6f31a32a73af8e
> - CVE-2026-97399: https://gitlab.com/gnutools/glibc/-/commit/f247c0a2fb5b3e48a771d2d23efc9a45c64e957d
> 
> (alternative to commit c71fccc7a9ed80ab38c56d54b788bfe92090df35)
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/glibc/glibc.hash       | 2 +-
>  package/glibc/glibc.mk         | 2 +-
>  package/localedef/localedef.mk | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index b4549549a0..5e7549cc42 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from git)
> -sha256  b369d2b38357104ba1b3848bfe4139c6a4dfdaea28ac31b3cf2a3985fb008a93  glibc-2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc-git4.tar.gz
> +sha256  8b3bbb074671878413901ece2b757b6196f07953f2205ba95ec1a6f79b799790  glibc-2.41-167-gf247c0a2fb5b3e48a771d2d23efc9a45c64e957d-git4.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 34a6175855..0c702cc1d4 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc
> +GLIBC_VERSION = 2.41-167-gf247c0a2fb5b3e48a771d2d23efc9a45c64e957d
>  GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
>  GLIBC_SITE_METHOD = git
>  
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index 3412db3c58..a4b871ccc7 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION, SITE and LICENSE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.41-163-gc97fdd483232a831829aaff458a212307f1bf4bc
> +LOCALEDEF_VERSION = 2.41-167-gf247c0a2fb5b3e48a771d2d23efc9a45c64e957d
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
