Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06E8C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57FE94025D;
	Sun, 11 Feb 2024 15:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ya9iHMFAQU_O; Sun, 11 Feb 2024 15:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F241403A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F241403A4;
	Sun, 11 Feb 2024 15:27:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E97A1BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E915960674
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:27:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VM-rbQDT6F2u for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:27:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA24F60655
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA24F60655
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA24F60655
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:27:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46155FF804;
 Sun, 11 Feb 2024 15:27:52 +0000 (UTC)
Date: Sun, 11 Feb 2024 16:27:51 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240211162751.38fdb544@windsurf>
In-Reply-To: <20240211093858.14022-1-fontaine.fabrice@gmail.com>
References: <20240211093858.14022-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707665272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9L2KVT0S4OSiMSVSByvXyhWMC+AcybVEGdvLS/fS9CI=;
 b=NHbMAi+bkgoEJAvavWVo6SjREutlddHb8Zl0PtcRx8vBx9oxCagmO01XP9+ejoo93X0AJb
 iWxuqkzmuVipED0YXlMquI3Swu0UAH/PSLfnAeS9gtKk/1/Ew+z0ekGGBKi3eHLU3yGNl6
 NJGEBFU/1LxB7aUocxYB5idYqtoYGl5YKMEb5igUpAZiN6HtnKGgmbUkKxgaOvNxQSNq1Y
 Bqyh//sAiVV6DBUcFSHss+W+s39ePeAEnf/iJcFEEDqMmnWGCtmLyd36Ruo58EzyPISc3Q
 6RCLTPdIj9BWZ3WSdnR3AkwArWqBG8rQIOZpS1iLcwGw1eo/JqddGxkWHsyqvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NHbMAi+b
Subject: Re: [Buildroot] [PATCH 1/1] package/minisign: needs threads
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
Cc: Patrick Oppenlander <patrick.oppenlander@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 11 Feb 2024 10:38:58 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since the addition of the package
> in commit d90ac63d9b3448a239bb9aa8030326699a3fdc3d:
>   Could NOT find Threads (missing: Threads_FOUND)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8d63a88291de945661a936d2437917a3428de276
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/minisign/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
