Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB91BC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFF20608C9;
	Fri, 10 Jul 2026 16:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6MI8LGp9G5F; Fri, 10 Jul 2026 16:42:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D957F606B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783701738;
	bh=uytENLOh/aMRLuVhguDLrLkPu8Evw0eqN0gT2K0YCcA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mhJFwxGXjYF9y706EgrZ8lpFTvjkmzCK8PNzdTAIlyaW8bSH0J4+tpaarvCIWS7sZ
	 zHwq88RBUGQkTJOhx1EiWh/h09Rrix1kvIJd3iexwdPJ+ZDS6reJbLaqIWnOfQrxj0
	 Op2FFMHw+zhRcHKIlGGoYVChQivsRHI9qKR6ffV50N3Yby+CJXRw8JLjmWdh7LSGT0
	 lOEQGxx228esJlrpHRbQNyNaZqlsMRJPi2M9UESD7MHnrRnkIxr1ppgGZwXhLKuZ1Y
	 d4UGG2FIExsWK549IUFBinjetrwIinJIDgEMFG8H5ptAqtpyEGXufVgX4E3UBVUOR0
	 x8N4mFnpHYqcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D957F606B4;
	Fri, 10 Jul 2026 16:42:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE00A320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B04B74033D
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMJDqbCqWxBo for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:42:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DB41A40362
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB41A40362
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB41A40362
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:42:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9B018780368;
 Fri, 10 Jul 2026 18:42:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jul 2026 18:42:12 +0200
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 18:42:12 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Semyon Kolganov <semenak94@mail.ru>
In-Reply-To: <20260708072408.19685-2-buildroot@heine.tech>
References: <20260708072408.19685-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.17
Message-ID: <82b161afe980bb89b3d2dec8c830f85f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783701734;
 bh=VkjP1+4VTwHCdUGp/9tRgsv9NP34BeDmkswAZKrVSVA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XdDtklcZUpE1NhS9dV1UxJhVBvX3PnQsU2dVPbniZcDDEFyq0Q4MbPHq8Veo2xGPQ
 sr68B9R8ShjUgg5bEX/TuHmY6a4koz2wBRtUE/HOIPxYMwQQBqLvo1mqQMxXmiBMsI
 O9GV2zhxWtCeUdm4DczgAGAtdedfCBJBOsvwn+1Y3Q6de1hOChU6FtMaWhwCAF5aYZ
 nsJfUc+Qq+rKnLMnQG+nUbqUqh/SUb0goF6MqjkyluSUJO29KsdxOiOZkSbMl4M5BC
 bR1BhgjoCyxhlNbVDV4O+iXAWhWDKYSaIVZDZAR+8k3Jwo7QYxODYHg1Xd1mNPqP71
 0+nhZphd45MzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XdDtklcZ
Subject: Re: [Buildroot] [PATCH] package/fmt: fix 32-bit builds
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

On 08/07/2026 09:23, Michael Nosthoff via buildroot wrote:
> Provide a fallback when native __int128 is not available.
> 
> Fixes:
> https://autobuild.buildroot.org/results/39df217ad5a1036d5e606ae0e8291d885e9d0e1a/
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
