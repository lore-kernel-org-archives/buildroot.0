Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FFEC5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 03:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4561F606C9;
	Mon, 17 Aug 2026 03:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mw7g0P3E9Cpv; Mon, 17 Aug 2026 03:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93A58606B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786937480;
	bh=YFTuUhi9sp46zPtfuZyUWmHZBZgc3drGH2Qg8y/nhrs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h05Q+9pw3ODQeHbjRB+YpUrT+U58XjdIMinLaB12seJyJTJdhpADkGC0NzdDOJO6u
	 GylFPlqxgTXyKLSWXGCFyF90K6g8Tpig0i5rCyyq4pP3RPZdhTJjzyMZjhXe1FGlab
	 beDLWM2F6bwq6nGV4q9qRbJQZwKaxbhx+o7HJTRdgFIVKaPH1k3gbPFfidn9VFPiiQ
	 IL7jVrndU7Z10RF0fg/TuNvCyToLGdqlPrmakB2E12LjZhYi7e+um6DdSHNZZwno31
	 1B98ib0fsQ2dgqZ79qL8PkfTjKBysEhzGkScdZHxBJvsqYlXx2P19Ho541d97HrFot
	 0uLLzQA2VFl9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93A58606B9;
	Mon, 17 Aug 2026 03:31:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AECC2EF
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 03:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50F1480DCC
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 03:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6TUl7HBGWHZ for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 03:31:17 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8197B80DC0
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8197B80DC0
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=q/GUGUxk
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8197B80DC0
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 03:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1786937474; bh=f833Yk1lI6nLhoafNnTIwjii452SeWN1qXV6It7fgLE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=q/GUGUxkRdn3X14LJwAnCoCP6K9oizCF1PbiuYMOSt/Xy/n5DMTc+ny+14nqEDCAF
 a91dzR7F48KQadol43zIQg4DvGsCTCqrBsD8PdB3itOON3L41p5aQl8Xow5bVD+LP7
 KIlC/M+MLKGNvuAHMDJIkO2Ji8hPsCnwrKn4L5qk=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 3509CBDE1031;
 Mon, 17 Aug 2026 05:31:14 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 17 Aug 2026 03:31:14 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
In-Reply-To: <aoC_d9SXLJGYRqR4@windsurf>
References: <20260709110822.305873-1-br025@umbiko.net>
 <20260709110822.305873-3-br025@umbiko.net> <aoC_d9SXLJGYRqR4@windsurf>
Message-ID: <7a39e5bd8a0aa90c003ee00047cc5401@umbiko.net>
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

[resend due to missing CC]

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
