Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954EFC61DBE
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 19:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A90A960621;
	Sat, 29 Aug 2026 19:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iEchWAeNuKxc; Sat, 29 Aug 2026 19:00:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788030057;
	bh=Abx8wQ2gTN6Po7ezVf5BVOd6J9cjkRuKnwSPq/iZnPg=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qNfMnLGFw1mYt+UZ1QPBkHa5v/6nA4fEoBF8IE7KgYtd5Q04jF1vTDoqNf4U+elWU
	 g/NVDUObbnZuBh/wfL9LKQ0FFfLLzPi5L5uWv2ZAWk/B8rOV4+/BAzCx/LslvQWNL1
	 pXOwXxMNKh/4dhBZqF4dmLOB6bFrDsNX3WxwNq6BwHZIES0TWJca5WbaJGh8/97Qv4
	 NddlZ5ziG+nDzfebWmHdWnoHrp682OUD43W2bIr4A8FXO0lWXyRMjher2FXy8YnLrY
	 e7sMZF9ioLskVby+8p+vwj3rVm8tPEYIrnrRwqyxNxhV3zPxvdaLL/TM0YbpBwlDg4
	 +klZ0SWW564CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E0CC60607;
	Sat, 29 Aug 2026 19:00:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5051214F
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 19:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41FFE40730
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 19:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbbIkQihGBzp for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 19:00:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=VyqBxozA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A738405B7
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 19:00:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=VyqBxozAEGiJ6vRuo6Qw5JHMLySSTvJkoUT1O9Ih2DCZjJyqOzIwex/e5Q7z7DchhEv2AOCcjucZOQ1+eKDQFZ4TbUVCjIMnOGI2D18dc9IbF7eNb73ffdcOCrZx6fMsKPid6+KQk7gK5enPT+Ae063G7w3MhmmMtkBR85RNwmlbHAQMBcwPQz4vIzZUH2MEzlROiDb4U3qner6mh+YPlL6BpxB2xPbCI8jYPnYirNw2hKZ0fir7jTY+5qxhX+PZjsa+2YsHE9zsO3xQ6LkoQoPcVcZP8G5XSqp6Ejd982UQQPf+PpsKO3z2e+uatzBAhTT/iYhoDVnT9Jc1EGXQ+Q==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=OXpB/dX/xdz+J/Oll+b4FvQCvejMLZVPpmQHwpMU+JY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1155111931; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 29 Aug 2026 19:00:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x0OIM-0000000040p-2MGb;
 Sat, 29 Aug 2026 21:00:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20260827145001.1382288-1-neal.frager@amd.com> (Neal Frager's
 message of "Thu, 27 Aug 2026 15:50:01 +0100")
References: <20260827145001.1382288-1-neal.frager@amd.com>
Date: Sat, 29 Aug 2026 21:00:50 +0200
Message-ID: <875x0su4yl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal2_vek385_defconfig:
 remove useless atf console config
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 buildroot@buildroot.org, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > The VERSAL2_CONSOLE variable does not actually exist when building the atf
 > with plat=versal2. So the current VERSAL2_CONSOLE=cadence1 is not actually
 > doing anything. For this reason, the atf will print on its default console
 > which is UART0 or pl011_0.

 > The correct definition would be CONSOLE=pl011_1 in order to build the atf to
 > print on UART1 or pl011_1.

 > However, the git repo xparameters.h of the versal2_plm is not currently
 > enabling UART1 because the XPAR_XUARTPSV_NUM_INSTANCES is set to 1 including
 > the address defines only for UART0.
 > https://github.com/Xilinx/embeddedsw/blob/97f2baf7f69e9d5f447650110af0d8841e501277/lib/sw_apps/versal_plm/misc/versal_2ve_2vm/xparameters.h#L1519

 > The problem with this is that the plm is not configuring UART1, so the atf
 > will crash at boot time, if it is built with CONSOLE=pl011_1 and the plm has
 > not already enabled UART1.

 > For now, we will remove the unecessary config that is doing nothing.
 > The versal2_vek385_defconfig is working, but users need to currently open
 > two console windows to see the boot log because the current config is the
 > following.

 > plm - console uart0
 > asufw - console uart0
 > atf - console uart0

 > optee-os - console uart1
 > u-boot - console uart1
 > Linux - console uart1

 > A patch has been submitted to the embeddedsw repo to fix the xparameters.h
 > file such that the plm will correctly enable UART1. Once this is applied, we
 > will configure the plm and atf to use UART1 with the versal2_vek385_defconfig.

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
