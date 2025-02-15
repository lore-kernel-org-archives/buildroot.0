Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12788C021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 20:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4FDB40DC4;
	Sat, 15 Feb 2025 20:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VA_Rb-yIbGz; Sat, 15 Feb 2025 20:00:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70F3A412B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70F3A412B9;
	Sat, 15 Feb 2025 20:00:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0802872
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 20:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC3E0403C0
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 20:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5k9eiT-GFPz for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 20:00:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AD7434016B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD7434016B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AD7434016B
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 20:00:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7CCAF7804FD;
 Sat, 15 Feb 2025 21:00:42 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Feb 2025 21:00:42 +0100
MIME-Version: 1.0
Date: Sat, 15 Feb 2025 21:00:42 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Stefan Ott <stefan@ott.net>
In-Reply-To: <20250215104125.125263-1-peter@korsgaard.com>
References: <20250215104125.125263-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <f3e427d8849a708f36afaedc3400f94e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739649644;
 bh=oc+HFb/AMBdWfa345i6rfmqbaujNQYJwp/ltyRA3g/g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uinS0F3AhlGwh1L9LGI+Nhc8drjXpnadQa1HzYWrEBDjs1HzGi5yPClpDKyGFn6vN
 1V/vp3PqARQReby5BlPrEhSILSxA15D3XiRqdUnJ1h48lRFz3gvatudq44DGRgGLNd
 GheYxtUuxJmKiames1IOmWKqdzimAMYFqfdwL7DLfoZgWTixCbMGI/zugRHKpA2XGp
 4hWTTL1dmEfjFhNwGct/jkuccDRLwf2aZgv9Tr280d/69G3gvvmh8KXDW4TZYsiYzz
 X5kZfq+LKj0uSRH5Zu+lSsRRQvvXDunzVLcps25Uq/S0OrPJZri11H/BniRp2aULLR
 up2ec0sk2YVYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uinS0F3A
Subject: Re: [Buildroot] [PATCH] package/unbound: security bump to version
 1.21.1
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

On 15/02/2025 11:41, Peter Korsgaard wrote:
> Fixes the following security vulnerability:
> 
> CVE-2024-8508: A vulnerability has been discovered in Unbound when 
> handling
> replies with very large RRsets that Unbound needs to perform name
> compression for.
> 
> https://nlnetlabs.nl/downloads/unbound/CVE-2024-8508.txt
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master. For info I updated the pgp key id
which has changed for this version signature.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
