Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAEFCCD1BF
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 17:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7485A8128A;
	Sat, 25 Oct 2025 17:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3cHPC1V6Ic9; Sat, 25 Oct 2025 17:17:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7D8681255
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7D8681255;
	Sat, 25 Oct 2025 17:17:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 035D0D7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9B144037B
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmZUHl2H8_Gy for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 17:17:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2295540310
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2295540310
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2295540310
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:17:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A0D7D60136;
 Sat, 25 Oct 2025 19:17:49 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Oct 2025 19:17:49 +0200
MIME-Version: 1.0
Date: Sat, 25 Oct 2025 19:17:49 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251022164047.22401-1-dario.binacchi@amarulasolutions.com>
References: <20251022164047.22401-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <17499841fec225788abcffcf12ec2432@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761412670;
 bh=nOTNxbM/OVs5Cc9OE1KX7uqO96ONrp1Yn0MnwhDcBEQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S0kAfSYej9cw7uAzsHWyE8eIGqid/zz9TpxW3pEyY/1GgzaJglOWBRR1gl2p6poQg
 Oc5IBEp2waF+LGyrwXMXh9HiVgE/tts08TQTo9SlqZLWgd+UBXzNnf600m/oshptCG
 pZWdbNN/R8ST84R+Y2mZJLLaYbLMFOwMH2xIp+rh66npooEeWgW8sRzzptWwsmGahb
 vPsLqntplsYaV3IEdLUkoB0WmhbFkcHzeycIOZjgzScskh07DSiF8389rVgx0Njk+2
 xEhhiq9L8rUjcQBRynMjnGJZpfCqtKWfm84py7gmJmLjd7CXYdIpw2UutBltfwuxh9
 5XLfwhBEa+MtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=S0kAfSYe
Subject: Re: [Buildroot] [PATCH 1/1] package/libbytesize: bump to version
 2.11
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

On 22/10/2025 18:40, Dario Binacchi wrote:
> Release notes:
> https://github.com/storaged-project/libbytesize/blob/2.11/NEWS.rst
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
