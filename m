Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1A3FA3751
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6017281F1A;
	Fri,  2 Jan 2026 22:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OWKPyeqwqnvz; Fri,  2 Jan 2026 22:25:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EF5481F1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767392735;
	bh=KB75rc4tYNqSbk04nieOz6Pu8uMM7XLudLPj90Vtdzg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eGVqL1HuAUvVSBtAU0ZNRMrmxXQwFvl9XBMNQyQITgbaXeMv4YMfEpc5RvIDWadrX
	 Uq/Yw5daNG/n+e5nIVl8sqWjhJu0K3qrXGpHaumI+jJtNXie6GhtsMHwDOwOxTBkNr
	 pohlbad+HEoEZLjb5GEwst3X8wWsfTobFETYT01w/ySdR53mQARwskK8h8A6d+CRzJ
	 bftyB2BUVI9rkr2ruYB/1YSiq308R2lqt5UIw1VrcRAgsW2cD6Pa0tCi/TX8QhGZFC
	 GB9CYmoWLfeNHaFCcNT2ZW6wFEfKqhULP8XWPeEZYlzfHM7baD94IuZclkTJhNi7Yf
	 0o+7OY8IxmK5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EF5481F1F;
	Fri,  2 Jan 2026 22:25:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75041249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7055C608F2
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTQJ_E1HqzgW for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:25:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8467C608D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8467C608D4
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8467C608D4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:25:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 98224C1C3BE
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:25:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 37BEF606C7;
 Fri,  2 Jan 2026 22:25:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0D253113B023D; Fri,  2 Jan 2026 23:25:28 +0100 (CET)
Date: Fri, 2 Jan 2026 23:25:27 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20260102232527.0d0779b2@windsurf>
In-Reply-To: <20260102222022.3464952-1-bernd@kuhls.net>
References: <20260102222022.3464952-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767392729; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fr7/S96zqVYsEh/8OgcMFUnEedGSthdEkEGMnEOaYpg=;
 b=zNuqGenSyw4ppPG3SqWmpYc83r/XGdWtrn2TWLrL7Rd0auHEVmAK/TRlZySqUaEioY8Y5i
 8tTL7xjsMpQeaVvHGuwvfcUJGPk4EJ/natD82e+wJ+lXwaLvQLBp5vv0QTEBL7Fvt+9wbW
 ReaZjTzUUul8uzos/t/tDzm9zoR6MOZD0yVLFscFW5O9eCNPYfcWG1xdae1hvFsDSAaxSH
 xXa6ocuj8GrydHS8tS/PMUCRQSP7onGjGNzspnZLCp92KpG0RFGDNcEmOz59G1R69goeRq
 Ir6GFMpzho4EQaAuFPXm3fCzzYDmJW9+ROFhTensCVgdCJFng28G/agm39HDgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=zNuqGenS
Subject: Re: [Buildroot] [PATCH RFC 1/1] Config.in: remove experimental
 status of per-package SDK and target
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

Hello Bernd,

On Fri,  2 Jan 2026 23:20:22 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> The last buildroot commit mentioning "per-pack" dates back to 2024:
> 
> $ LC_ALL=C git log --graph --pretty=format:'%h - %d %s (%cr) <%an>' --abbrev-commit -- | grep per-pack | head -n 1
> * aa3ba97554 -  package/mender-grubenv: Fix per-package building (1 year, 3 months ago) <Adam Duskett>
> 
> so it should be safe to say that enabling BR2_PER_PACKAGE_DIRECTORIES
> is not considered experimental anymore.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

There are actually a few things that are still broken. For example
"make <foo>-reconfigure", "make <foo>-rebuild" and "make
<foo>-reinstall" are broken with per-package directories.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
