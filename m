Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658A2D10374
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1023260C2A;
	Thu, 24 Oct 2024 20:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAX3Sy0-oxw8; Thu, 24 Oct 2024 20:42:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E975960C1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E975960C1E;
	Thu, 24 Oct 2024 20:42:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D1BF4960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE85D4055E
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0BGYvIE1sOc for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:42:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B219E4012A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B219E4012A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B219E4012A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:42:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE00D1C0004;
 Thu, 24 Oct 2024 20:42:29 +0000 (UTC)
Date: Thu, 24 Oct 2024 22:42:28 +0200
To: Erico Nunes <nunes.erico@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241024224228.55f1a784@windsurf>
In-Reply-To: <20241003152523.1131434-1-nunes.erico@gmail.com>
References: <20241003152523.1131434-1-nunes.erico@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729802550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v0dVwj/LXLUSwKPWfITI3lPQaIvogStHyvZXDnJgLE0=;
 b=JHtPXCRQ+Yud0db+ivcpimaJrwBy0kdYzmt+CrRLFPolWgzj6ci5PkjiBNE/VV0Ccr2BoS
 Harny6KyFbJT/ucTgr+hfzDaXBSoZdgXUzyO4AmAPsprYln4VnsyAhAlw64zFqlru1ndHB
 ROh7Ui+v2slkwmUfyAYZtWfWhUJQsPqUWG2AZL5muCESzPIJ0U1EEiaXwOeQnyeHnI6Omx
 TatmogbW2ze93XH/KUheFPpMRNfJjbORA/vhkUaCHCh3cWNXr2irh53BCJgvCzPlcKkbju
 HQJNAO1+V1jPFwhsAC0NDmgErhlKwXuYtjNgiiE2/TDzuj1Kz1LLDNbkvz5yOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JHtPXCRQ
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: drop my packages
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

On Thu,  3 Oct 2024 17:25:23 +0200
Erico Nunes <nunes.erico@gmail.com> wrote:

> I still follow Buildroot development and use it for some personal
> projects, but no longer have the time to be an active contributor.
> Some of these are important defconfigs and packages to have up-to-date
> in Buildroot, and mostly other developers have been doing that work, so
> I am dropping them so that someone from the active contributors can be
> the maintainer contact for them.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  DEVELOPERS | 12 ------------
>  1 file changed, 12 deletions(-)

Applied to master, thanks. That being said, as Arnout said: a given
package or defconfig can be associated to multiple in our DEVELOPERS
file. So if you're registered as a developer for a given package or
defconfig, it doesn't prevent anyone from being registered as a
developer for the same package or defconfig.

In any case: thanks a lot for all your contributions to Buildroot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
