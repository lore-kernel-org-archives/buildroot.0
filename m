Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB4BEE57FA
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 09:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4146C40362;
	Wed, 31 Dec 2025 09:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJDtxx_HjJzQ; Wed, 31 Dec 2025 09:46:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67C5B40397
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767174408;
	bh=tKp4XZebPgoF5FnWq/ZxFp83gR1QvVcTE0Ef4N3y+YM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cG5MvbhiZ1PQH/D0dC7cYn3s4rr8QeMYZ/N4MtOwyEB0sD3+7CfDLHJJ31BHwh0SZ
	 is6TqiFsZEG+Us8v8PE1ht5le0+gzJNTUt86mcyzeIi78udPVsnKzQtSmBzgJp1qDN
	 pfIXSDvAMQxyQhbFMm4mFqu9qaFC9Ku0o6jJsrllp/b5nstHzwSwTW6bVWeyDqD3a4
	 uw+Y0ZuMe3lHdb8TObtGCZiC/E9y/KN/ksguSRv3WkRMa/DWEkFtzu9NjDi5om633V
	 YbphGFRrYiZQ0/EFUzCp/Hq2kwAUuKKAadnFpwipzVez+lyQfiYbcPnljf9/y/JpF8
	 HuuCDskrcZKZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67C5B40397;
	Wed, 31 Dec 2025 09:46:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A7D1177
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 09:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5077B40397
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 09:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4K5E_YUQQSV4 for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 09:46:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 75A0740362
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75A0740362
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75A0740362
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 09:46:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5095A4E41EAC
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 09:46:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0DAE060744;
 Wed, 31 Dec 2025 09:46:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 549A5113B0757; Wed, 31 Dec 2025 10:46:36 +0100 (CET)
Date: Wed, 31 Dec 2025 10:46:31 +0100
To: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>, Fiona Klute
 <fiona.klute@gmx.de>
Message-ID: <20251231104631.602fe43c@windsurf>
In-Reply-To: <20251219-rasdaemon-v4-1-2cdc992de787@bootlin.com>
References: <20251219-rasdaemon-v4-0-2cdc992de787@bootlin.com>
 <20251219-rasdaemon-v4-1-2cdc992de787@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767174402; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=cyptWO/jabrg7hKWJ/n6k2gSxdnbBwLLlUNDubJCYVc=;
 b=NsDDbM/GoaFTAHJTlR3Js+RxNJbiAt7ZmbIpveY2eNsciT41mb2dB4kRhSPoIpjKqH7yD6
 vN+Wo6BxjtATu/Kzmbt7kI2y3nt0jt4qAaIX5V7um/d8SvAgTgj1sjnxqWiOCl5C1h+viR
 wt23X25mRibGli/JECvoxvKtpczcqd6PBA/QisFvtkD6L0yJdYHPrN7plN7xd3AMfIfKY8
 ZE/6XHI+wQUlsxz4xqOaOgKmGpLI1eBOAfKGkzfwEkqZX9X8+DUiZ5SpBhTpEm/Q6FBz2J
 XNb8AN6eUVm44rRHTL1QVqUARIhIiAww3VyFo+5F5uO7F12PH7eMTsV2yk4j5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=NsDDbM/G
Subject: Re: [Buildroot] [PATCH v4 1/2] package/rasdaemon: Add rasdaemon
 package
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

Hello Bastien,

On Fri, 19 Dec 2025 17:30:15 +0100
Bastien Curutchet via buildroot <buildroot@buildroot.org> wrote:

> Rasdaemon is a tool that aims to replace the edac-tool and provide a way
> to collect all hardware error events reported by the Linux kernel in a
> common framework.
> 
> Add a new package to support rasdaemon in the 'Hardware handling'
> section. It depends on libtraceevents to detect the ftrace events
> generated by the kernel. There is currently a build issue when sqlite
> isn't availaible while it's supposed to be an optional dependency. This
> build issue is fixed by patch 0001 (which has been also submitted to the
> rasdaemon project itself).
> 
> Support for the PCIe AER events is optionnal and implies a dependency on
> pciutils so also add a dedicated 'sub-option' to enable it.
> 
> Add a SYSV init script to start / stop the daemon
> 
> Add myself to the DEVELOPERS file.
> 
> Reviewed-by: Fiona Klute <fiona.klute@gmx.de>
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>

Thanks, applied after adjusting the commit title to:

	package/rasdaemon: new package

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
