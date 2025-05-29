Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDDFC5AD49
	for <buildroot@archiver.kernel.org>; Thu, 29 May 2025 22:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5991281544;
	Thu, 29 May 2025 22:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2B2wI39QDcy; Thu, 29 May 2025 22:20:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9D9A81545
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9D9A81545;
	Thu, 29 May 2025 22:20:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB53E236
 for <buildroot@buildroot.org>; Thu, 29 May 2025 22:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1E7641FE6
 for <buildroot@buildroot.org>; Thu, 29 May 2025 22:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SGQnSgSAK82Q for <buildroot@buildroot.org>;
 Thu, 29 May 2025 22:20:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3976441FC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3976441FC6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3976441FC6
 for <buildroot@buildroot.org>; Thu, 29 May 2025 22:20:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 447BD5FFAF;
 Fri, 30 May 2025 00:20:43 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 30 May 2025 00:20:43 +0200
MIME-Version: 1.0
Date: Fri, 30 May 2025 00:20:43 +0200
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250529155807.3656157-1-james.hilliard1@gmail.com>
References: <20250529155807.3656157-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <00099663aa057ed0fad2acae1e18048b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748557244;
 bh=JmDGB1evvq7YIyrTktzKD4PINGvIQrD+nsaZK69Ti+g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NKaJQ1O5QRht2eSVMvXjQB1UmobjJ1e1kkSOTAp+k5WCUPqdoyBGoNKS9RfqmAIig
 5EVj861YopAOAX8mZogGnwTcKvJPhtI6Fj2lBgxmGc70hoU948DshTUA1fcZwQMOfx
 GyoOKmFsTf2Nbnur6ChIskZ4ItfLs90TH869tWOLH2lLiCAc93XupxXVzQzTDAbY+W
 0vBC2jThQ5Mqs2iCiuG/4NQNZmgmcUKWJQSpvjFnm8aUSfvUCGFF0Q/HRuZ9WsYRev
 h7CZOwXj2IFUVYTnAzBKh1t/YAU1y9rW3VO0O5D91EwNl7whj11a+toj/isIr9JnCl
 6hsXwAz//3jAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NKaJQ1O5
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aerich: bump to version
 0.9.0
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

On 29/05/2025 17:58, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
