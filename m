Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416921091923
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 21:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61EA06163D;
	Thu, 19 Mar 2026 21:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFEUM1C6oCG8; Thu, 19 Mar 2026 21:09:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B302E60A72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773954543;
	bh=bve83o5XEMxy6PeT86m3DpS1PYffcO1pOpGoXAieZQY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sK+lrDKkHW6Ri4xWnjvxSIgQV2TdyXSWtf0yDGzg7Di5fXW7swHFrjTc8SW8+/mS9
	 CQl3J8q9AhMUr4mAo8qoTmVu6TQA71yVqvboKfApDw69iSsNQFt3Sd6Kt6HzVlZAW4
	 K9BYoGdRYlEm1gr4H4u4iDmViRCk3PgnWhK/J8fSE36uOoKvJA4aFfi4AeRTcR0hVU
	 ViNp2wergaDPzDUyenf10Wv+QSyf8+8UK0Wz1F8vh1dXDPMyOnBUMMW0rsHgGF6Pyq
	 KGyWEfR2NjDJp+6lV7QEKVVDGmyp6rUSSSVf6WdJjJg5+zY/t83FISGYsqVZHkN6og
	 PfT5wLL8ku4IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B302E60A72;
	Thu, 19 Mar 2026 21:09:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 585EC1B6
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 21:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E260840BC
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 21:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wz1M7ZFeMp_W for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 21:09:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F33981E41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F33981E41
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F33981E41
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 21:09:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8DA1D780368;
 Thu, 19 Mar 2026 22:08:56 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 19 Mar 2026 22:08:56 +0100
MIME-Version: 1.0
Date: Thu, 19 Mar 2026 22:08:56 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260319183814.132401-1-giulio.benetti@benettiengineering.com>
References: <20260319183814.132401-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <75231d7501622618194efe8fd266af58@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773954538;
 bh=idNcw5NBrP7ZO7hEIZKClaSRduTgginEJZrNw5bZnqY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Eexv8YEVLhatiCoknDZcosxZxdzW7oSZ0lEIGHENXRud0NUXNCXM+rFdOPKKSYhhu
 WirnHU8zw+rC71GTXxt4qHmQm8jqv7D/BquutvIJqBhz1Q3xVx9EFOrof9qHrToU4f
 B6yI/jZqVAl+rFQ3cQLo5S2tLnXQq3ByyuHQ6hJ/js2cuyfdPEf72PHn7RBQ/SGucE
 AipoMIo7z1cFS8SNk5/XOyyRicrl384LFzeSzKb2gzLpCBqheYZwswMDnn3L3TquZ1
 lwEsQtd5sLTayRSuAE5tKkkBCFSMH8p3+vFqT2prhGIQddT2M00zUlS4ABs1jrRnIs
 QF3i3qQtYreQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Eexv8YEV
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 13.2.1
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

On 19/03/2026 19:38, Giulio Benetti wrote:
> https://github.com/harfbuzz/harfbuzz/blob/13.2.1/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
