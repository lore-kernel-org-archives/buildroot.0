Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6325ECAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 12:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 143B5605B3;
	Sun, 28 Sep 2025 12:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibha3oaTlsW7; Sun, 28 Sep 2025 12:04:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 382CC60625
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 382CC60625;
	Sun, 28 Sep 2025 12:04:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6407197
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 12:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C36060625
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 12:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEoIRNci2lAg for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 12:04:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C5DA605B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C5DA605B3
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C5DA605B3
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 12:04:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C2189B0053E;
 Sun, 28 Sep 2025 14:04:23 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Sep 2025 14:04:23 +0200
MIME-Version: 1.0
Date: Sun, 28 Sep 2025 14:04:23 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, faessler@was.ch
In-Reply-To: <20250829073344.73052-1-thomas.perale@mind.be>
References: <20250829073344.73052-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <57c37dafaa6c5b6046fcb2f6350ce4de@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759061066;
 bh=kSHzFCc3/UOesZbTcOVTpXprjVa/TLAkhc2hBKuPEDI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tA2BUs+m4FYQ+bGKDABMZRBNgykUK2VTFILA7ebm3iiJshd1voBZq0wNyCZiK4wQQ
 xUV59WVy/fjs1BUBeYG+horRx0AaHq17PSOWUsB+4bOU94dIy3POCud84HZ+Q0QBGN
 F6f8RxP1KYM4HNV712chaTzjhFgn8oEyuIewXV543mloRm0DUp2Pwvt8A83hj4YK4L
 n3tUlyuhsKHtYXuZnERDRdKVnX88J7/B8VooDIJvotb+3ySZc0Qg6iQN+rmTqub4Ng
 66RgwjLfXmYk8cT2YnHw6KhWda6OQ8KFC7mh9koKlEfxQhXrkCWaKfK+/+khV5YAr1
 UreZrDg75mW5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tA2BUs+m
Subject: Re: [Buildroot] [PATCH 1/1] package/logsurfer: remove package
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

On 29/08/2025 09:33, Thomas Perale via buildroot wrote:
> The logsurfer package has not received updates since 2011 according to
> its website [1].
> 
> It also fails on the autobuilder when building with GCC14.
> 
> Package author did a single contribution to buildroot by adding this
> package.
> 
> [1] https://crypt.gen.nz/logsurfer/
> 
> Fixes: 
> https://autobuild.buildroot.org/results/ed9/ed906670ab7b901d95289b388262d9eded8b2c18
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
