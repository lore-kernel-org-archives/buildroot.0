Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AECEE77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 22:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FC4B607AF;
	Thu, 26 Dec 2024 22:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlC5mwwuy_Xo; Thu, 26 Dec 2024 22:20:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CE09607A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CE09607A9;
	Thu, 26 Dec 2024 22:20:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2763EF1B
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D60880C7D
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPHhDQhRQ7dz for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 22:20:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 051E180C75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 051E180C75
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 051E180C75
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:20:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5590A60004;
 Thu, 26 Dec 2024 22:20:44 +0000 (UTC)
Date: Thu, 26 Dec 2024 23:20:43 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241226232043.3e222abc@windsurf>
In-Reply-To: <42c2a4da95f981e2a32af74502c4673b@free.fr>
References: <20241226201920.2233441-1-thomas.petazzoni@bootlin.com>
 <42c2a4da95f981e2a32af74502c4673b@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735251644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZQtEzd5pPSVoQ/pqfuozYGiZQxBYUxntXcBRyLuloE=;
 b=lEiGVKLz0LPotjj6meuh+smMZOMOY28naO0LWlrjz8S5fLWFj63fjaFZYYNCQfUgHPkE8x
 4FuYMkFIQIKPBmOV1IbTv+xXqma0f2/YLoQyoogbaJFUja/HD+TD/t//0ZrqqtGDpnndqa
 2KXfYlNl5zByhn8ZezQhrmY3WUHGwkYfOT0Y0HWH8kOZ2d9b7JFnq0/ONHmgccHmxAodgX
 R3ZNOz1ixIil6DUV0qPDMciitKE1ybeztmKbUbPjvtpT6IxHeo/OMZGlm6Z+upZQ5oopPE
 /4dUI+PFrLrstnNvbsguhTS7xRQfRpMXHsbCMP2Vryonne2DWHH031o8yE36tQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lEiGVKLz
Subject: Re: [Buildroot] [PATCH] package/log4cxx: bump to version 1.3.1
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

Hello Julien,

On Thu, 26 Dec 2024 22:45:28 +0100
Julien Olivain <ju.o@free.fr> wrote:

> This bump seems to introduce a build failure, detected by
> "utils/test-pkg -a -p log4cxx". In my Gitlab CI:
> 
> Without the bump (log4cxx-1.1.0), see:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1603545610
> 
> With the bump (log4cxx-1.3.1), see:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1603537890
> 
> The failure is with the br-powerpc-603e-basic-cpp toolchain and
> seems to be related with wchar support:
> https://gitlab.com/jolivain/buildroot/-/jobs/8728007916
> 
> Can you have a look, please?

Thanks for having spotted this issue. I investigated, and I'm doing a
test-pkg test to verify. I'll send a v2 once it's ready.

Again, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
