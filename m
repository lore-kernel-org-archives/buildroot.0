Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27878C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E650E40937;
	Thu,  9 May 2024 16:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-l8YlEDEXL2; Thu,  9 May 2024 16:19:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6256409A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6256409A3;
	Thu,  9 May 2024 16:19:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 724D71BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F4EB606A3
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqLHQkPtu-Xz for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:19:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BDF760073
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BDF760073
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BDF760073
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:19:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 123F3C0003;
 Thu,  9 May 2024 16:18:58 +0000 (UTC)
Date: Thu, 9 May 2024 18:18:58 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20240509181858.6db00f5e@windsurf>
In-Reply-To: <20240422175944.449122-1-thomas@devoogdt.com>
References: <20240422175944.449122-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715271539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o9TbJJOhb3FhcVkKkeQoX8pXMd94s00GSrX6PiyRa+8=;
 b=UWS7G32tylxJ8MtrtkwPkoF0assmKhyG/tbZIPCaLp0rhB56IWQEyFgrg841PXH94b+tzk
 Wuz3LCyPRrmTmlY7SrRWinXi24oqjwoud1j3HFi/TDEmIBE6W+ShlMGuqG3ohuV65SeEM3
 s7RZsWWGEmvSgFVsFPW+ErSaATvVVPp5G4h/VjzEEaWQwvfLH7zsuTRgvLPhtI8bSJTSDT
 dnssIKLSNL1JO9go5GH9T1dFNOrhvyGK9pPZbCMJgsrGjn8/TeTrICSswm1JMn8+TNOFXZ
 c6O1AQiWfqg7m4/OQRys54J9F6zJhgrWASeaESijTjVqPbSeNBamTvrCUEzpbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UWS7G32t
Subject: Re: [Buildroot] [PATCH v1] package/syslog-ng: bump to 4.7.1
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
Cc: Chris Packham <judge.packham@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Mon, 22 Apr 2024 19:59:44 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Thanks for the patch!


> diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
> index aa1e71d225..c06a7221bf 100644
> --- a/package/syslog-ng/Config.in
> +++ b/package/syslog-ng/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_SYSLOG_NG
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	select BR2_PACKAGE_JSON_C

When you add a new select like this, you need to be careful. Indeed, if
the option you're selecting has some "depends on", you need to
replicate them in your package. Here, JSON_C has a "depends on
BR2_TOOLCHAIN_HAS_SYNC_4", which needs to be replicated:

index aa1e71d225..1302e6ac46 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_SYSLOG_NG
        depends on BR2_TOOLCHAIN_HAS_THREADS
        depends on BR2_USE_MMU # fork()
        depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+       depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+       select BR2_PACKAGE_JSON_C
        select BR2_PACKAGE_LIBGLIB2
        select BR2_PACKAGE_PCRE2
        select BR2_PACKAGE_OPENSSL
@@ -16,5 +18,6 @@ config BR2_PACKAGE_SYSLOG_NG
 
 comment "syslog-ng needs a toolchain w/ wchar, threads"
        depends on BR2_USE_MMU
+       depends on BR2_TOOLCHAIN_HAS_SYNC_4
        depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
        depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

I fixed that up when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
