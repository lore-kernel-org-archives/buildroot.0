Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923EFC28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 650FB4241F;
	Fri, 28 Mar 2025 18:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWBAvj8ckx6K; Fri, 28 Mar 2025 18:54:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA10242EEF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA10242EEF;
	Fri, 28 Mar 2025 18:54:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A94CE1B7
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6275851F1
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmVC1Nm2Ftz1 for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:54:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BAF9A8577F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAF9A8577F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAF9A8577F
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:54:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 85A7413F88D;
 Fri, 28 Mar 2025 19:54:08 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47098])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Mar 2025 19:54:08 +0100
MIME-Version: 1.0
Date: Fri, 28 Mar 2025 19:54:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250328162509.923423-1-peter@korsgaard.com>
References: <20250328162509.923423-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <790c050307c396257d9ab63e11e8c8c1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743188050;
 bh=0/HMpUKraTwr9NYY2MezV5Y9ytNEZZsAhV/mAsMyQvk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lO+pJkcZQ3bI2DBEGy2Eissbtr8ONKblme+wbcS7vdmLijJLnMb0iatzie6Z0/dwL
 VcCwIk4i2SKUrBOiSGqo6C885WriCuUBRKW++NravZ7wG904x8Shr/U4wNqBvXkUfh
 kAZSmBAdgEGD7jDESCViFExrhdlSZoZJl/KzhOQtZnGJIABvTUJo923Ksb4cXrro/f
 edHK3kIFnIihets+Nwlh7t7qi4PEUgkYSeXJtB+d1Zwf55KTBbLANbwmfgm91e+BgF
 0dmaZaaDgAr6Su7CRZXGLBeofHmP3Uhd4OkuuaaI6GHy4MlrMfXw+wHVJnkf1FP+6C
 vH86diCzo7qOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lO+pJkcZ
Subject: Re: [Buildroot] [PATCH] package/libopenh264: security bump to
 version 2.5.1
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

On 28/03/2025 17:25, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> CVE-2025-27091: OpenH264 Decoding Functions Heap Overflow Vulnerability
> 
> A vulnerability in the decoding functions of OpenH264 codec library 
> could
> allow a remote, unauthenticated attacker to trigger a heap overflow.
> 
> This vulnerability is due to a race condition between a Sequence 
> Parameter
> Set (SPS) memory allocation and a subsequent non Instantaneous Decoder
> Refresh (non-IDR) Network Abstraction Layer (NAL) unit memory usage.  
> An
> attacker could exploit this vulnerability by crafting a malicious 
> bitstream
> and tricking a victim user into processing an arbitrary video 
> containing the
> malicious bitstream.  An exploit could allow the attacker to cause an
> unexpected crash in the victim's user decoding client and, possibly, 
> perform
> arbitrary commands on the victim's host by abusing the heap overflow.
> 
> https://github.com/cisco/openh264/security/advisories/GHSA-m99q-5j7x-7m9x
> https://github.com/cisco/openh264/releases/tag/2.5.1
> 
> The upstream tag now has no 'v' prefix, so drop it from _SITE.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
