Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBFDCD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 20:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB73860F38;
	Wed,  6 May 2026 20:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfwZlajwTEyD; Wed,  6 May 2026 20:38:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 831E660F2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778099888;
	bh=cAQcbESvyMwfda83BQehzPlWk1iv7M3FzNmzHFyrIOI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OF5j4hc01W3GM3prWvnwZIJie1vcnRAo7xTDrLNNcPMqdkhBr9G8hWcyHj0GATMmk
	 Q9mob6R+V7DBg0Dotxwkt4dJE2zIRF72q4JWNhIwQVYuvXzSSvhKfg5rD9X+P+1VTV
	 lrwbR3S+OqeUVjdrYqLKyAi/J44+wzP08JjUDMpmERUv5c2hj7BHiH9bdUntrNjxk4
	 XU19r95oWhRngZQ9c8nU2SMF60okfeCu3BSb3SoT7Pmv+Bh5bmQjqmxSyVIWTR9OaV
	 QY+tVh1n4rcdIotiMXiPTZA9czKibsaYe3G5vi7+KsDChT2Uv3RR4aC7qhxQMexwxx
	 GHFe38bKApJ+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 831E660F2C;
	Wed,  6 May 2026 20:38:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52325317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 20:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43EFA406CA
 for <buildroot@buildroot.org>; Wed,  6 May 2026 20:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZV7XODczUg6 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 20:38:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3EB3B40101
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EB3B40101
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EB3B40101
 for <buildroot@buildroot.org>; Wed,  6 May 2026 20:38:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6118A60132;
 Wed,  6 May 2026 22:38:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 06 May 2026 22:38:03 +0200
MIME-Version: 1.0
Date: Wed, 06 May 2026 22:38:03 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260506190239.655752-1-peter@korsgaard.com>
References: <20260506190239.655752-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <fcf01491a790ae04cdf6b5dbe13d15ac@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778099884;
 bh=FYYleDmjV+dZsVCzk7uTpUi4hPBFPtskTQwGKqbQrSY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HIYKz2aC192Cdc0qkh0j/jyuT1c4x1xXoqHSw5Qyki2mMd4qkTNuwep144P49MPv/
 6bWQuagU4LELdn0NPtkxv3Cx6zBnVxfsmikfEeOU6Y1bG8wBok9gtO9kbNYdcO5+w9
 mP7ll104iphKlilNkcxNRNavJ3MIeXhGoPBdnEZs7EnDYoz1rK8G8b9PiwX5ArIP3l
 FFKkSvHLJKbixjmx5SAmezI+FD1UKZpweltkmimPVY8sLA5j0n1hAqanRdHoK9b7fo
 90MAYFhAYGpoWaaOI5iT+tmvkhbivW1GQwwHepyaErvB2CuixshZpdXeum1SpSLfyS
 HZIDbh7s5+Hkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HIYKz2aC
Subject: Re: [Buildroot] [PATCH] package/xlib_libXpm: security bump to
 version 3.5.19
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 06/05/2026 21:02, Peter Korsgaard wrote:
> Fixes the following vulnerability:
> 
> CVE-2026-4367: libXpm Out-of-bounds read in xpmNextWord()
> 
> libXpm uses a number of internal helper functions to parse the XPM file
> format.
> One of these internal functions, xpmNextString(), checks for the NULL
> terminator when looking for the end of the current string but not when
> looking for the beginning of the next string.
> A small XPM file with a malformed color table definition may cause the
> function xpmNextWord(), called from xpmParseColors() following a call 
> to
> xpmNextString(), to start past the actual end of the file, causing an
> out-of-bound read.
> 
> Advisory:
> https://lists.x.org/archives/xorg-announce/2026-April/003690.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
