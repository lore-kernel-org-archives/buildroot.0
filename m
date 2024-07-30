Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCC1C3DA61
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 07:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55646812DD;
	Tue, 30 Jul 2024 07:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szZyDgJ_wKvU; Tue, 30 Jul 2024 07:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C6DC812ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C6DC812ED;
	Tue, 30 Jul 2024 07:35:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E42031BF360
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBFC2405FA
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c62X-f1_rZyj for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 07:35:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DADB405DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DADB405DE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DADB405DE
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:35:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFCE520005;
 Tue, 30 Jul 2024 07:35:35 +0000 (UTC)
Date: Tue, 30 Jul 2024 09:35:34 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20240730093534.64231e5a@windsurf>
In-Reply-To: <20240719203934.2090944-1-thomas.petazzoni@bootlin.com>
References: <20240719203934.2090944-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722324936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6uPUcBPE00pgckMgWB70CO7RfgTs2y1hQRgjCTayF1c=;
 b=PobmASqJQ8uKdvT32gDL5zzqyhe6ENxiyQWT16QwZgMK2QXHm/vk3ClD0507/r0y+P0j11
 oQzb2VWylJt8GawIO440GDeDgVdx+Y5hgYHtac6LB2FCIYkr4opaYIpvJhoiCnjv4z0k08
 R6qQSpiaZlN3NJJhQrPI2bqjJQw71MXut+CHU3jHyYbO2xH18YipWmCpUJqIl5oZQ5EbTV
 u19Y//S0+brkaVOhYn/ylQurIhHvvkddzP5Xh/awkHrcxjb2CeH0fqJUUghw8KCT93p5dB
 xzhyVbDwPCRXMKZUTujb33uiUv34R+xjhcKA8Sz/WuR1JMpaOD1lCmfcsJdlzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PobmASqJ
Subject: Re: [Buildroot] [PATCH] package/igh-ethercat: backport fix to build
 with Linux 6.9
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 19 Jul 2024 22:39:33 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> This commit backports a patch from upstream that fixes the build with
> Linux 6.9.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/db2462b1c5c6797a0edca66a513c121dbddd8888/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...Remove-dev_base_lock-for-linux-6.9.0.patch | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/igh-ethercat/0001-Remove-dev_base_lock-for-linux-6.9.0.patch

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
