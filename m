Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506EFC83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 15:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16D5440EE7;
	Sun,  6 Jul 2025 15:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6Hwq-iaoCG4; Sun,  6 Jul 2025 15:18:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47E8240E95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47E8240E95;
	Sun,  6 Jul 2025 15:18:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B46D315F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 15:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B00281D72
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 15:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iz31Qqo1NBtk for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 15:18:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCE0381D70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCE0381D70
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCE0381D70
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 15:18:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 187A15FFBA;
 Sun,  6 Jul 2025 17:18:35 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Jul 2025 17:18:35 +0200
MIME-Version: 1.0
Date: Sun, 06 Jul 2025 17:18:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250706123343.1582116-1-bernd@kuhls.net>
References: <20250706123343.1582116-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <304f94bc3c66b8d54111e13b3928b9f4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751815117;
 bh=/hfDGAtLXYs3p7b5rSpF5JmzBitOQSv7oq3mIiJvOxg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XpffyFWR5n3Iri80Vec9zjw64o1voB5SF9YV8X850mw87Yej1GSnEGLxs3o58oEfM
 23BPlConzKEdwDBt/CqTPUVPFx4RgqgcQfhlFnydNmVD+DsjS4NvA9mp9DuBPCTO0T
 ycfPvPKBLMPH+ekUXgE/83JqYyNVKifSU28kwFXQqu0C2/IERuJpaDnLP96ro0cSKA
 FVqMx05HmB8n1UE0YbTIDpy6JCB73x/I3OpQ0+3SbqzNowyCgYKPJvILUybP59OWUL
 TcsJeV3euLAmsztZ2uLoNCrb42BwjLOpZbrUZrDR2+ucfLJjjY8vDLPU+mwfkKxOH6
 4X4eGl85fD1qw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XpffyFWR
Subject: Re: [Buildroot] [PATCH] package/libva: fix build error
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

On 06/07/2025 14:33, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/18b/18b551ae20a2f2f40c1fb003bb701f53f5daec45/
> 
> /workdir/instance-0/output-1/host/lib/gcc/aarch64_be-buildroot-linux-gnu/14.3.0/../../../../aarch64_be-buildroot-linux-gnu/bin/ld:
>  va/libva.so.2.2200.0: version node not found for symbol 
> vaCreateSurfaces@VA_API_0.32.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
