Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F1DC3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 20:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7555280966;
	Sun,  4 Aug 2024 20:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tih965SM_Tea; Sun,  4 Aug 2024 20:46:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 713AD80E24
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 713AD80E24;
	Sun,  4 Aug 2024 20:46:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 646171BF4DD
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E412403B7
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D38DRoU0Tmdz for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 20:46:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A83140390
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A83140390
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A83140390
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 20:46:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39D681C0003;
 Sun,  4 Aug 2024 20:46:21 +0000 (UTC)
Date: Sun, 4 Aug 2024 22:46:20 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20240804224620.03d00f47@windsurf>
In-Reply-To: <20240804095012.878259-1-troglobit@gmail.com>
References: <20240804095012.878259-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722804381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tn8FjuR2kCA/mEVvWzRmae2P5/5IHglc/eUK0/ssEBU=;
 b=PZ8Pzj68ROhp3PO/H1Z21GE3hjPw1uQGI16HLwb72dzDnnoBTz2bnLQXZie5q20k/Xf8G1
 yrD9s0OaJtr3JBrhrXDqtx2yFaoJbLSBJY19Uic2r5bA3JTGUHif0ftLnETwEbwa+7nUlH
 XP8YmvBLp9rgklf355dh5XE5dU1MugXp2AWZNuTfjNzE9Ppw3aAY82DmPQR6mM46HYY/ho
 VC1Ylru7J1GqW0Eyi4Kb/aiHHHzuupnvdrivqJ2xOzpEJHyojFYsHZV8uc9lUaL97q2XlV
 RQfvZhbdKWag6hQwZuR4CehYKDnDpWaQrouH4yq5Y9eRcMti+sQXaC9xk/FA4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PZ8Pzj68
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-pam: add menuconfig
 option to build pam_lastlog.so
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  4 Aug 2024 11:50:12 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/linux-pam/Config.in    | 9 +++++++++
>  package/linux-pam/linux-pam.mk | 6 ++++++
>  2 files changed, 15 insertions(+)

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
