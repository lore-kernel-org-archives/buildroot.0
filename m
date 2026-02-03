Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D788E87845
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 16:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D34924087D;
	Tue,  3 Feb 2026 16:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TcbjG2Cpydet; Tue,  3 Feb 2026 16:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E96C4409A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770136411;
	bh=sTR7sy6eIjnIL36LeIKOl/w/8Azlyqfohc/5PPEn8DM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VUqZX6Mve6T2ZRWZAm5Qb1BOAqEyRDl/DPF7a3l2wE9fW3VRxwk7cVNolZ6L3xYx6
	 EDNiXYz7ERU/+k9fdDnXSZY3Pm0Hnm2IeA6POZ7FxR8pnrL+A4Wpeooj7yZPS26wiW
	 rBHWJ2pf3fwZk2XIFBV0B4msJNcYv9eWdDWT4r6rEXmUbwc2t9N1hZomoL0f5TfWvx
	 CKxFW74QEcvbCGD6wYcDpYFO2Lj+XPmeB9N0EAfvLCNfVxn+yAxU/+oUuUBIfgZxBR
	 Ep2UWDJ8A6Ouw0ypNrxWtTooxeFhprtK6UV1hURNesxQ7+kjK//jxOIFmod+ouz51K
	 lXBdxsbydnewQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E96C4409A6;
	Tue,  3 Feb 2026 16:33:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C2DFF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5894560897
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5c9AwS3am7mK for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 16:33:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 758C76064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 758C76064A
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 758C76064A
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:33:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4B7C21A2BBF
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:33:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 219CE60728;
 Tue,  3 Feb 2026 16:33:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CEEF9119A8888; Tue,  3 Feb 2026 17:33:23 +0100 (CET)
Date: Tue, 3 Feb 2026 17:33:23 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aYIjKZudbKiSBHc5@windsurf>
References: <20251201192849.3195425-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251201192849.3195425-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770136405; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=K2ZgkRUE/qaTPpkU2cHdH1azFzv9wvTCC/TjIEPhzYY=;
 b=gTHLxqEnnt3o6+AY0qsbT5SqM7G8G1yiU/j2XjxeijeOUlPnnCA07NiOcHUDDGCVBbfADU
 hnBrx5j6UabTOs59UvzEguqSG1TQki5s5wUi3LgKPtXQne3VL5K3u8uMUnUf7ZohT9rbhy
 xfJa1++pOC7HxZftdHHkrxZXQOmjlttAuPh2QUiH/7ykGdmJ5i5lAuvodoln7926llQZ0M
 Lma9Ai095VzNEfE91dY1NvirIVg7EnV1EklIaZXGVvdpW1SRgXLOTrzESxUT0SS50zKwYK
 7sn5bNgA2e29GgeKvvDN6MFrP6cOHiPjop0lQwpkotuNH49x2/SjaMMbqAdcxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=gTHLxqEn
Subject: Re: [Buildroot] [PATCH 1/1] package/parprouted: fix build with gcc
 15.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Dec 01, 2025 at 08:28:49PM +0100, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/572/572669fe1f9a77083a361fee7c8acdf38d7375ae/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, applied!

To be honest, I'm wondering if this package shouldn't be removed. Last
release in 2008 for a network-facing daemon, that isn't really great.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
