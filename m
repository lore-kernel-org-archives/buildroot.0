Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DBDC83F03
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 20:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D12583C72;
	Thu,  3 Jul 2025 20:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UaSkV4IP9_hb; Thu,  3 Jul 2025 20:56:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD44783C62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD44783C62;
	Thu,  3 Jul 2025 20:56:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7C0815F
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D972F615CD
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HvqIHUENiXK for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 20:56:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13593615CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13593615CB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13593615CB
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:56:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id BFC9C19F740;
 Thu,  3 Jul 2025 22:56:49 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 03 Jul 2025 22:56:49 +0200
MIME-Version: 1.0
Date: Thu, 03 Jul 2025 22:56:49 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250703200917.4054251-3-thomas.perale@mind.be>
References: <20250703200917.4054251-3-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <5fe3a6b105ce05e2f796aedd686460ab@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751576210;
 bh=UFZybUqa281rR7prLM6t55fSq7vNVSSrOMKRPXG2qF0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CDVhPnBKSZhiQbRHTP5wYI7Kc4ciPy1iix5gGqpG7RRpZdX5SYS/o8hgZnONBOQTe
 QPW38c9NFEkA8NfuqunSvxoVTPmF453NBbpQMb4pz+Q2vW/QQHSJ0IMKjRby2O2w8u
 8/aONfoMeJuCaqSC41DTqpmQFT2cNrRIVRL1t4/qbILDoXyFA1lSxgFClUAhw3gNDz
 nScOswRtpC2GKaqegKH3VgG4G/ephaLwFT56Cospse+8GEnUbJcMlpkzObBQNFMNUy
 mUuDict+eWPIlyq1nrU6LTUA1Vp4WC1HP1IHRshaDhSMsOk3s2uAEhKwukJKmo7ZXW
 0SH5cex1VQUGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CDVhPnBK
Subject: Re: [Buildroot] [PATCH] package/python-future: add CPE identifier
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

On 03/07/2025 22:09, Thomas Perale via buildroot wrote:
> The cpe:2.3:a:pythoncharmers:python-future:*:*:*:*:*:*:*:* is
> valid for this package.
> 
> See 
> https://nvd.nist.gov/products/cpe/detail/6E3F033B-5565-461B-8450-D23E68419313
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
