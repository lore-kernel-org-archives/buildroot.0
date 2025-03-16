Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E0CC28B28
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 00:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7866C817A9;
	Sun, 16 Mar 2025 00:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NAosTMOUo40; Sun, 16 Mar 2025 00:33:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24F7E81754
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24F7E81754;
	Sun, 16 Mar 2025 00:33:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79F7012C
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 00:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60FF94053E
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 00:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2w-rANdWxM2k for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 00:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE5FA40533
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE5FA40533
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE5FA40533
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 00:33:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 25624B0053D;
 Sun, 16 Mar 2025 01:33:40 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Mar 2025 01:33:40 +0100
MIME-Version: 1.0
Date: Sun, 16 Mar 2025 01:33:40 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250302215219.1276480-13-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-13-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <aacd0a14ef0fb7cd53d4bb80a69c5bf9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742085226;
 bh=k+rIMMiOV9s8y9fHOaJVHtx9m+sgFzO7/ntGmlhEQzQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=t2opBgR3gJjUpG8d5ZYzwgunWwwJ9cZ6BjSOk52odr+ljYzypW+sXWdOIUMPHkGGv
 Z18srEwp6vYPtqXQqUEfc/154tXOwvSqd7YQ7UmgEuKxkvv8ixd4pgyUnBHpU97POQ
 XMRv7w2wWRFBK+pRXi+KnLvw/zYsY+47s5BoW137FB6OHiyyDn+/xUMVWJa+OqNk4d
 4Eyo49cJw3k2VncC0GzOEyo+pir69OYDjxYAlsf/T4kZLzGwr0qXNFMY4SP84WmJKC
 X9fDY38qiRmoJmHSP93VXwYtX+rg88e5wHxaU+Qp0tAtdt3TEDksXTh0TjimZb3CsD
 /m1UzFRuynBIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t2opBgR3
Subject: Re: [Buildroot] [PATCH 12/15] package/tclap: update to tag 1.4.0-rc2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vladimir,

This patch might not be needed in this series. See below.

On 02/03/2025 22:52, Vladimir Oltean wrote:
> This was the only version which got rid of this error (nothing 
> specific,
> just moved from autotools to cmake):
> 
>  ## ----------- ##
>  ## Core tests. ##
>  ## ----------- ##
> 
>  configure:2095: checking for a BSD-compatible install
>  configure:2163: result: /usr/bin/install -c
>  configure:2174: checking whether build environment is sane
>  configure:2229: result: yes
>  configure:2267: WARNING: 'missing' script is too old or missing
>  configure:2288: checking for aarch64-buildroot-linux-gnu-strip
>  configure:2315: result: 
> /opt/buildroot/output-ls1046afrwy/host/bin/aarch64-buildroot-linux-gnu-strip
>  configure:2380: checking for a thread-safe mkdir -p
>  configure:2419: result: /usr/bin/mkdir -p
>  configure:2426: checking for gawk
>  configure:2442: found /opt/buildroot/output-ls1046afrwy/host/bin/gawk
>  configure:2453: result: gawk
>  configure:2464: checking whether make sets $(MAKE)
>  configure:2486: result: yes
>  configure:2515: checking whether make supports nested variables
>  configure:2532: result: yes
>  configure:2770: checking for C++ compiler version
>  configure:2779: no --version >&5
>  ./configure: line 2781: no: command not found
>  configure:2790: $? = 127

This error comes probably from CXX=no set here:
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02-rc2/package/Makefile.in#L435

This should not happen, because tclap can only be selected when there
is a C++ compiler available. See:
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02-rc2/package/tclap/Config.in#L6

So it would be better to understand the root cause of this issue. I 
tried on my
side few configurations with C++ toolchains, and the tclap-1.2.4 (i.e. 
without
this patch) compiles fine.

Also, this tclap-1.4.0-rc2 is marked as a release client. I would prefer 
sticking to
the v1.2.x series until 1.4.0 is released.

Could you double check if this patch is needed? If you still see the 
issue,
can you share the config that reproduces the issue?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
