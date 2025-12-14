Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DEBD3E787
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 11:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A7C58143F;
	Sun, 14 Dec 2025 11:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZumUKJAdLi-4; Sun, 14 Dec 2025 11:07:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F319E8131D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765710478;
	bh=OvY28Lwijn+UO7viwDa3VKfcC1goRhNiDqD6x5fUs8A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i1weihXPwmfTOTk3xzJi5hsc8ywQCIeCPlFGC3/t6tOa+xC8p2V+vtD8lLgXAMhHh
	 pP9FR5IsOqz7KezZfErIa2+85aXwkVgYZZRlFDTWnFd/Z1Vahff3Rq+F7aDUTKRv75
	 6+3mBA6S0CMTCpBsGFWbanRmnWcXyFFoX5ycoBphlibfQpFHszzcKAtSSZm09k8Iun
	 kcIRk1mcSN+le0wTGnKYkzRXbG+xhM3ZWUJDahF7rdtsL2uKClTcOxoAs7GR/h4z2I
	 ysc4jn4ee/zFF9P0rkxa6h+SPgn34Qf1t1lRp3QKCPoH/9P+l7zR+cAHGz29BHB3fK
	 DzYooY6uL26pQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F319E8131D;
	Sun, 14 Dec 2025 11:07:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC7F3117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 11:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A355240807
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 11:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8m_Ob5kSjZY for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 11:07:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8CCCC40805
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CCCC40805
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CCCC40805
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 11:07:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 04480B00565;
 Sun, 14 Dec 2025 12:07:47 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Dec 2025 12:07:47 +0100
MIME-Version: 1.0
Date: Sun, 14 Dec 2025 12:07:47 +0100
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org, Simon Dawson <spdawson@gmail.com>
In-Reply-To: <3b19b7d6-cf9a-4215-960b-f3ae803896bb@rnout.be>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-22-thomas.petazzoni@bootlin.com>
 <3b19b7d6-cf9a-4215-960b-f3ae803896bb@rnout.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <fe8f4b7366a42d69db82c6deca010f51@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765710471;
 bh=3Sr6kEIeK/UfXE9f6CEciITL3Ow2Mk0f3dhqsCz5I0M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bxrhis4bZaraEMs8PRNR83h5xs42cRUOY6ZvCQfc+gUmrEnAedhV/VKYuHYn2w9j8
 yZpnIBR87EvuOV4x5GsiD+cGehkQ66C9mpMi3nYnuX2PXQ1boEqCOQo4kpEW3A6NX3
 I+hI52QzgVCaqK2ayfN1u6twY3CRwb1z5DTL7A8NvJofKPXRlPyWDViVsRaYamvdeZ
 JhDPc2OpriJEDrtaluGBltjZsXcl9CsrRVJtaCr1uIOgwtQ+b459xyAiWQFs+VpYsw
 cjOrYai07i1HhybT8vgE81P5YUTeEwEg3G/YVXNMqLkiTBMs9p3p07LR8KL55+WZzh
 jAKmNVHWTdyqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bxrhis4b
Subject: Re: [Buildroot] [PATCH 21/23] package/xscreensaver: remove package
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

Hi Arnout, All,

On 11/09/2025 22:30, Arnout Vandecappelle via buildroot wrote:
> On 10/09/2025 23:32, Thomas Petazzoni via buildroot wrote:
>> As we're about to remove libgtk2, we must remove xscreensaver as it
>> depends on libgtk2.
>> 
>> Cc: Simon Dawson <spdawson@gmail.com>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
>  Since both Julien and Nicolas have declared an intention to update 
> xscreensaver, I have _not_ applied this patch. I left it as New in 
> patchwork, so we can still apply it a couple of days from now if no 
> update is forthcoming.

For info, I marked this patch as "Superseded", as xscreensaver was 
updated in:
https://gitlab.com/buildroot.org/buildroot/-/commit/34a03bdba426a22c7efbbf33b68e836a88ab1740

>  Regards,
>  Arnout

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
