Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6627DFF8867
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 07:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D123861329;
	Wed, 29 Apr 2026 07:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78SoDPgRbkBB; Wed, 29 Apr 2026 07:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94D986132F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777449380;
	bh=hIguVBCu5gOoFO4gKvlXxBiqOBCtjzeBFOADA2Jovxo=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=LsQPDTyeXAxYM9ZK8IrOEckFFDKjUo0N2z2qiEtcor1QRnm7Q+SpaXVk24LKl5q+T
	 zsIeGgYM7aaXAx/SUjuuNLiFLOXesmA2eWSVc2L0nHW/FCqlugxFEIZUnG3CEIi5YM
	 beRQreFjeZdfoGjZPOMGydgyBGclt4wrOvmJBwjWLjhGGE35mlZcii2BoS6NTyl/kA
	 4BjK2kqCAy9QhZ7N9BQLzhRsCdQr14v9fE47zqcsCTaVxsVRG7px07iM2Wd0W1kA5J
	 tLqwcG4xRr/vOOTqpKnW/LmS2icQFkmREyXwollgj1vFvI/a+mTUqjGhCJMKLjLH1M
	 yUKS8s3OCFEzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94D986132F;
	Wed, 29 Apr 2026 07:56:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F1EB231
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 07:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7561140E3A
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 07:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxqXeffuGvMQ for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 07:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A683C40E53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A683C40E53
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A683C40E53
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 07:56:17 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5F5722C86F14;
 Wed, 29 Apr 2026 09:56:15 +0200 (CEST)
Message-ID: <fe3fb9cc-5054-4b2e-bc20-3c8fb52566be@bubu1.eu>
Date: Wed, 29 Apr 2026 09:56:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eugen Hristev <ehristev@kernel.org>, buildroot@buildroot.org
References: <20260428-maintainers-v1-1-9aa4552ce96a@kernel.org>
Content-Language: en-US
In-Reply-To: <20260428-maintainers-v1-1-9aa4552ce96a@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777449375; bh=L9F+fPIRX0vFjN8LpbTs8lPHHq2n9FJaA/k/42CzcYM=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=keMNuH5wik4Pz7TupgoU8GDbl3jRUPZ8LPxswI372h+VeugwEIUIZK8chpnOMYrZA
 GBZo++//KBA2FFInHx1oG+HSzcAcYehKS/4xkuScfmcg7vQXZOX505YO3WOtt24Lfa
 jAG/DP4l7k2lH8k6ZbpyDEzABu4F9o0YEOPWhn9AgEaEp2EES65a1XhDw9UyRhqnEQ
 IZx6NUVI5osZXYYQADtnWA3J7hJCyYKdwQlV8PZN/LUbEEkXIf6xRFYXnSSs3AMmgT
 fbffRm52F0Wi49ahp/R00cnIPxufKtjdxt0zV2ddE3Cy/zehMFz1Jcr1+4eMJDL3Ly
 ax8Auk/lMRnnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=keMNuH5w
Subject: Re: [Buildroot] [PATCH RESEND] DEVELOPERS: Update email for Eugen
 Hristev
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 4/28/26 22:50, Eugen Hristev via buildroot wrote:
> Replace old bouncing email address.
> 
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> ---
Applied to master, thanks!

Marcus

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
