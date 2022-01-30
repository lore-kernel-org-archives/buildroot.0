Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B9CC433FE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06BCC405D1;
	Sun, 30 Jan 2022 14:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9xBcrQA-GB2u; Sun, 30 Jan 2022 14:53:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16FE2405CD;
	Sun, 30 Jan 2022 14:53:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66ED41BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55A89408F1
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vdFxGWTzSJSR for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:53:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FAC8408EE
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:53:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 44537240002;
 Sun, 30 Jan 2022 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643554406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXH8eWzl9bzZqjTSZ5SACxh0MeAiW9UUanTWZUg0+oE=;
 b=nKUpAQ83ErLPB3FXTkttVZ9XURvDn+xvMFeIUk5SUiEHs2IlziS6VAcY40HrKkxu1QWZY8
 ZhfmOg4zMqE1GycPq8nnzzoJG5e/eVNIWVFDPM53aIdaiUay03nGnXeuO5vpGeHoEpz1oV
 rcRkb/Wp+KPxeTrvL2HNwuKYMwnR9AstnY3/P/4BwezD+QlGhvBfyAMfHLio757+k2Ooot
 wbQ+yRKII2ZJa5WvC7ZhRlFb+fYJR8I7Nv3t/aYsprsdU8zZ5m6oRR8EZi/JZiF4CO+MXL
 uS92nQ+A2myEPUCUtq8eqrX8KQxfaWy37Bcr9xPVDXIm0BU/TMtuqxXvjY3cWw==
Date: Sun, 30 Jan 2022 15:53:25 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220130155325.635964dc@windsurf>
In-Reply-To: <20220129231420.3470589-1-giulio.benetti@benettiengineering.com>
References: <20220129231420.3470589-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] board/andes: fix build failure with host
 gcc >= 10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Nylon Chen <nylon7@andestech.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Sun, 30 Jan 2022 00:14:20 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add patch to fix linux bug:
> ```
>   HOSTLD  scripts/dtc/dtc
> /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
> collect2: error: ld returned 1 exit status
> ```
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478164
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...ve-redundant-YYLOC-global-declaratio.patch | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 board/andes/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch

I've applied to master. However, I would have very much preferred a
kernel version bump, tested by Nylon Chen.

Nylon: could you send a patch to update this defconfig to a newer
kernel version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
