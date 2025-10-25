Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AEDCCF9E3
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 17:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49AB6811EE;
	Sat, 25 Oct 2025 17:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wgG59SvzervN; Sat, 25 Oct 2025 17:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C10A8120D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C10A8120D;
	Sat, 25 Oct 2025 17:16:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 98B7A43F
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A7DA4046B
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQMeCdJd4SeJ for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 17:16:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8773F4033D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8773F4033D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8773F4033D
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:16:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 644C213F8AE;
 Sat, 25 Oct 2025 19:16:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Oct 2025 19:16:36 +0200
MIME-Version: 1.0
Date: Sat, 25 Oct 2025 19:16:36 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251022163225.18079-1-dario.binacchi@amarulasolutions.com>
References: <20251022163225.18079-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e4e319df012852674d52008ad1c74e81@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761412597;
 bh=SDQ4FZ8ojjbLGdn/o9KW5ppn1zCddYNQmlcKaohm7yo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cS6jsNfWrL9e9B5SrLMIf+KbyD+J2fhAgQ9nPX8vnFDHw6CAWIXs/HlUFIO7HdsAE
 JxhhJh4wU/5so81uI6L4kKUAAr81qyxuxATTcubbAIBol18M9kJyGIATbS4dlzbJxG
 qTad9eennROXdrA1/Dz89Y9YiT0nRms7wz85aOIt17WHkvI3H/1kYCvJa1x7+/rs9z
 2CKg81Qz2rEjDu1YYvKQD+x1gljO1j32cu4T5dbdXqZc9gV+zQw0cDh/F0A2WEZlwE
 xBVWnePoCjCNxtlMV/jxYtgknKM/g5F6+CEiBdNyTnRWnK1nU566GXCDarlbQ95jO1
 g+hRCIckj6gug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cS6jsNfW
Subject: Re: [Buildroot] [PATCH 1/1] package/libglvnd: bump to version 1.7.0
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

On 22/10/2025 18:32, Dario Binacchi wrote:
> Release notes:
> https://gitlab.freedesktop.org/glvnd/libglvnd/-/releases
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
