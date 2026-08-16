Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9D8C5DF6D
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 15:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAEE380DB8;
	Sun, 16 Aug 2026 15:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4RUEXjX8E9m; Sun, 16 Aug 2026 15:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23ACD80D1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786892701;
	bh=rirAmtbRmb+eVjZ8gPCpqNJeoNBBfm6ICN+hz2jUFHY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TqTyTTgVsvMkNnxEtUYWc1QoGwrLMptp5BQ8yxvTKbgCZOMO2TIPkx5xtXZTkVfEI
	 c/9XGAKgsAooq0MezlSvvbDzvrq3/sBPvGafwlz/dn845BboVkwzbGXoSWNVuf4/9y
	 dceG9FiTmnjdwjcQ6/qVJueXlUApEwPGrVRDKH06QhaSt0rCVNsQO5JHTa8jlCaFaY
	 Ka0e1PXScXiLmON9xIiC9VeWaxA3t4ogatIZqiokNAEcekyCNuQ2vP6jgZo0jNnJ9f
	 tF/MQ2iSlOPDuSLBQmkxdukoQIzws30qF0T4MNVSpz7YIeyYz4WVodJY+LlNTOPuZz
	 i8gDAvnPHaztw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23ACD80D1D;
	Sun, 16 Aug 2026 15:05:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4BC4337
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA62F60604
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jlyf7AB6Qx2e for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 15:04:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4760605D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4760605D8
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4760605D8
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:04:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1251A4E41219;
 Sun, 16 Aug 2026 15:04:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D570460352;
 Sun, 16 Aug 2026 15:04:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9F49211C4F994; 
 Sun, 16 Aug 2026 17:04:50 +0200 (CEST)
Date: Sun, 16 Aug 2026 17:04:49 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>, 
 Bernd Kuhls <bernd@kuhls.net>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>
Message-ID: <aoHRf8QWmhNWsjZC@windsurf>
References: <20260701230410.2522114-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701230410.2522114-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/apache: use "Debian" filesystem
 layout to fix read-only rootfs
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

On Thu, Jul 02, 2026 at 01:04:08AM +0200, Fiona Klute via buildroot wrote:
> The previous configuration placed both logs and PID file in /var/logs,
> which is not writable with a read-only rootfs (e.g. squashfs), as well
> as non-standard. Starting HTTPD during boot failed with:
> 
> (30)Read-only file system: AH00091: httpd: could not open error log file /var/logs/error_log.
> AH00015: Unable to open logs
> 
> An additional issue was that the Buildroot-default --prefix=/usr
> override meant various Apache-internal directories (e.g. htdocs) were
> placed directly in /usr. Note that the upstream default prefix is
> /usr/local/apache2, not /usr/local.
> 
> Using the "Debian" layout provides a standard-compatible layout with
> logs in /var/log/apache2 and PID file in /var/run/apache2 (both in
> tmpfs with the default Buildroot fstab). Both directories need to
> exist when the server starts, so handle that in the init script.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
