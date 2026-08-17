Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70584C5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 03:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22F8160611;
	Mon, 17 Aug 2026 03:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUVo2xnCEh9N; Mon, 17 Aug 2026 03:27:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DF6060632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786937261;
	bh=ELlCJ3KuqJcEETqhYvk1v5kYsCkqEZ30m2RgTU4/3dM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cPg2wj5Bqi/9LgYt2Rp8E9109StMXifCz4Qp/ET/EHMgjs9aY98Z4wjupkLK2V5pi
	 9zQpz3wP/o3Acb/XxDy+46BnoM0GzjEyrNG6UI2AyI3F9TZmMji4Nre26D/ibLyyhK
	 W876iCJRPix/wYkBSFh4oEVknk+347FeMmTCvr6E0dTmLyZfCmm22bJq++2j+F8e+h
	 9yQjVnLKwiBND/M8mbaOCEJbhI/MyH8gcokAs93rjFIVGTk6rrVIqtl+dVQ337ZMdd
	 wGejq60YW6hOdqKpLAoMklAaICi52yEHxlLKc/jAAILx1RyDadxh5X2K6WZBiv++wu
	 92bnIgV/0hxsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DF6060632;
	Mon, 17 Aug 2026 03:27:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86722336
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 03:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 840FC60632
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 03:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tp3KW6lC4AK for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 03:27:39 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA55760611
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA55760611
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=LylxjRnv
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA55760611
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 03:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1786937256; bh=hbOohFSpJjAX6uNk20OMGTpLz2al08SXMVLPjyKi6uo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=LylxjRnvZZmL7wPUrmJVUdoDx2xDiPETckf0LOAO22hsMwxtBhwxN4xKyv9NWSZaK
 ia+XC1z3nkFWIlbOCXujW+3ll+UUU6poC9ugdAugKMumWoJcD0P4FFYUVGiksVni7X
 mFLVLcDUS9wDTGKWp5pO96b2YKjYC5VRtiRwvqPU=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id BBF4FBDE0F0B;
 Mon, 17 Aug 2026 05:27:36 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 17 Aug 2026 03:27:36 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
In-Reply-To: <aoC_d9SXLJGYRqR4@windsurf>
References: <20260709110822.305873-1-br025@umbiko.net>
 <20260709110822.305873-3-br025@umbiko.net> <aoC_d9SXLJGYRqR4@windsurf>
Message-ID: <e35f8cc7da4cd9603ae104e957795646@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH v2 02/11] package/mpd: remove duplicated
 dependencies from sub-options
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

Hi Thomas, Everyone,

On 2026-08-15 19:37, Thomas Petazzoni wrote:
> Hello Andreas,
> 
> Thanks for your patch!
> 
> On Thu, Jul 09, 2026 at 01:08:06PM +0200, Andreas Ziegler wrote:
>> After various updates since version 0.20, most dependencies placing
>> restrictions on sub-components are now superseded by restrictions 
>> placed on
>> MPD itself. Example: io_uring needs kernel headers > 5.1; MPD needs 
>> kernel
>> headers > 5.6.
>> 
>> Remove dependencies from sub-options if they are already imposed on 
>> MPD.
>> 
>> Signed-off-by: Andreas Ziegler <br025@umbiko.net>
> 
> Actually the general policy in Buildroot is somewhat the opposite of
> what you're proposing here, even though I admit our general policy may
> not be applied anywhere.

OK, if this is the general policy, I will just drop this change.

> The reasoning for this policy is that it is either to review/verify
> when an option "select" another one, that all "depends on" have
> properly been replicated. Yes, this means potentially some duplication
> of "depends on" between the main package option and the sub-options,
> but it also allows to ensure that if we remove/change one of those
> "depends on" from the main package option, we don't forget to have it
> on the sub-option.
> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
