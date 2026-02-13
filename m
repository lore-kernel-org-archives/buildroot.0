Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3B7EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCD8C8490E;
	Fri, 13 Feb 2026 19:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bob1VWu2PZWD; Fri, 13 Feb 2026 19:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB7458490F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011598;
	bh=hLBVEeMFlGrkUgbsWcvbbN0lBxL+G6IuPWOLXq185BI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rj524hjDjkoCRY/5bONIOcgY6rdu+i17cu6jH/2W1P35FrPxirnQEXFx6YmGMpmKA
	 fluTtZJcz04XOqB4w+FDU1W4MCkRXsaeRKCPc8Hwp3/ZqrVMYcNxo/vXX78da+5ED5
	 SR/s5oTkwGQxlazVWf+/ynRbFvAP15vmX2J1gqPNIy8WNluQvLTyLlD14CUGN3kdDs
	 LpnpcrlE6Q8mhdMnLxYeFeqn+fG8GKiYdhASoweH7Ekb2dLzn4ezuictz0JWeXhL5P
	 1E40fIqpIzPN4SoGtDTE6Kr7YlI5LKFqVu6MXKnsNZKkcbUBkboIxdtXBf+4e8MMnC
	 FoB4kahImIhyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB7458490F;
	Fri, 13 Feb 2026 19:39:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F907EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBB4F847D3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20iukeGZ6cD7 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D9CA847CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D9CA847CC
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D9CA847CC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:27 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so11686995e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011505; x=1771616305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/DnDjfoLPcY5py3+zhHYhFMvr3sGt7gJOh89x1Ie6zc=;
 b=VQXoWVWbZBQudikIxUGiuJ4eeIbHcoFFYK8fuc3sCRFBIBy063n/ZyPPuEQKaQA6h9
 j3j+MX/2WaISNlvmXALeba9xmH0i5H6Q6lsNMwPggQYfr0IrjOsyyEcUokrGdDJQrJQ3
 dt77lKVPs/26Ibr5sndAR33+SjquFzaYooMbCRzltbkulDbN4INY6lLxN/eb/8oApPz1
 mIE/M//2U6ra0CwVHhVHk7B43OOQD1eSX7Vvf49tkIoVOE4Q4JVa2P5d+PJ+lRydqJq5
 XGof5cvKTF15SmDLIlLitBotwHUejZXAfbKRSc2Eh+2YtRPT8VF2BUCd6GQlYYjy6FpX
 lz6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjeUCKMd3hIPDQH7vSWLEkGhtD1OoUPMR3m1LV2LeWOgvj1KTBtEk7CLDstqltvPSBZANPVaeMHqs=@buildroot.org
X-Gm-Message-State: AOJu0YwhbKIGFn8OKEWRe2Iz4sT3cgRRyPKZQ359EhRWxes+YjDUWQUr
 NKf/COgieGo6jVsmUTJ5NuR+j9g5oIz8sWcokhnRDtXUAJASGNqZydh3cjwZfck9FSo=
X-Gm-Gg: AZuq6aLgrp3SUrxn7Sp70t29kQLxjKY/9UKR+8KY3bFi4rNsuZkJ8flBkgXSbWvNPdq
 CPx/myWOzleuWMDpaQZC7LNltXG5oJkKHJRLrQUDSrREtUZvN39rvYoCAXXr12n9PACyVWOAw4p
 dZomUJZNoJ8A4iHNgj7Nu3DXEEHLDouCKJaCKXc/K/dKG013cRkjSVm4A2l7qstIgjiqYfm4A7O
 IvbvYxtFD1PqiYG9mblB6UK8utSYCmlP1c+/jrsIg3euwN/4qN4BycWFRrANcLxvYziJ/97up6q
 5mtneiPE+FAOtmhxm/qVTPJzYB4Z/CQPYWmNVjgtRAgLpAbQwkdDyZzN8GXQsTX32IuYSfZSRyc
 0n6pv00trE/xqzUnchBL/uLIghoxNtIFsM7/+N3hpJWLGZ+AtuXcD1WCZyOFAylOiBSBjbropmp
 7WLH7ts84r78u91YQ=
X-Received: by 2002:a05:600c:1908:b0:479:1b0f:dfff with SMTP id
 5b1f17b1804b1-48373a1bbb9mr54285325e9.10.1771011505522; 
 Fri, 13 Feb 2026 11:38:25 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a2392bsm45587615e9.6.2026.02.13.11.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:38:25 -0800 (PST)
To: Michael Nosthoff <buildroot@heine.tech>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:38:24 +0100
Message-ID: <20260213193824.42354-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203130610.1891941-2-buildroot@heine.tech>
References: <20260203130610.1891941-2-buildroot@heine.tech>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011505; x=1771616305; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/DnDjfoLPcY5py3+zhHYhFMvr3sGt7gJOh89x1Ie6zc=;
 b=N15cm1wWow9U2TGA7Lk66wnpiWs7bjVgYXDdUbue1sUkD7RJ7902pH82201gN80wY5
 2q1vSloQI/eRhMTUukkONn9q+/W/UVOet4QzRSHLXyNIpYX3zOXLxUlDR3h0CPAx9jqx
 7ld3I9evsPf9cFuXg4I60bbcKLkwHMKbOmI0Gapm4TjbwgaV/rPEmahbYGO9s6JC15bZ
 UJ3rIRzkLLyZ8vHNT1UWh5dfcvD3cFqYfyuP2D+h1M7By267lhr3mDEw/G5TP03dd2pJ
 NUVGg9OuJJyOAKgPBU1ulcHiN/D2M6Ac2ADftMg3OU7CpSE/OiatzO39bWndukd9tmde
 69UQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=N15cm1wW
Subject: Re: [Buildroot] [PATCH] package/bitcoin: drop dependencies on Boost
 Libraries
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
> The dependencies on Boost.System, Boost.Filesystem were removed in
> v23.0 [0][1] and Boost.Thread in v21.99 [2].
> 
> This was never reflected in the Buildroot package so do it now.
> 
> [0] https://github.com/bitcoin/bitcoin/commit/07269321f38e46e9e02f16d7cd135ea90692638d
> [1] https://github.com/bitcoin/bitcoin/commit/b87f9c5edf3895df9650131fcf8551c3ad1d7301
> [2] https://github.com/bitcoin/bitcoin/commit/06e1d7d81d5a56d136c6fc88f09a2b0654a164f9
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/bitcoin/Config.in | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
> index eedb0897a5..66c8ebbfda 100644
> --- a/package/bitcoin/Config.in
> +++ b/package/bitcoin/Config.in
> @@ -21,9 +21,6 @@ config BR2_PACKAGE_BITCOIN
>  	depends on BR2_USE_WCHAR
>  	select BR2_HOST_CMAKE_AT_LEAST_3_22
>  	select BR2_PACKAGE_BOOST
> -	select BR2_PACKAGE_BOOST_SYSTEM
> -	select BR2_PACKAGE_BOOST_FILESYSTEM
> -	select BR2_PACKAGE_BOOST_THREAD
>  	select BR2_PACKAGE_LIBEVENT
>  	help
>  	  Bitcoin Core is an open source project which maintains and
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
