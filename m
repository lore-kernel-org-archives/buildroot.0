Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B2DCEFD15
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C69D940940;
	Tue,  6 Jan 2026 22:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yFRXyOvYS4XK; Tue,  6 Jan 2026 22:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D4A040560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767737192;
	bh=Uz737MPjFn/5Vi2LU16zM/Y1rHLpWAQXktUjiOb3j9E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M4rDq9tfvw1Ll8v9LWrDZClpcXqbtH0+Z8eo0MWzK7l+O1GU15XCZquwLftucIIQk
	 93UGe5KHPn+ZymquUDNYKZCsjnMp3DOkC/9XEXwIK1v1WFt0TVhK5/PJQIoVKxH1Sc
	 D5Y3gfU+uo5G046XoHBCMWDOlLC9c7M4JzXgMS3kCp5tHWqS4/RgumSrYNQrj6YUqB
	 HA2HUlDawutPmXUfq+ttEtd9+QHhu5f5R8fvyeOsjxCSpMoNtNdtnbmU+CCo7otCbO
	 UfEZcXXxVTtYsEjpzOcZen5na7s5IYydx90Hc2W9goQ+b0J6oFoPWIs8QAtiGEj6yk
	 /8lMH7tQvu+sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D4A040560;
	Tue,  6 Jan 2026 22:06:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49AF0249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B38060C19
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avQceEL3uuAz for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:06:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4938F60740
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4938F60740
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4938F60740
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:06:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 842674E41FB4
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:06:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5473A60739;
 Tue,  6 Jan 2026 22:06:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 52609103C807E; Tue,  6 Jan 2026 23:06:25 +0100 (CET)
Date: Tue, 6 Jan 2026 23:06:24 +0100
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20260106230624.0e6d878b@windsurf>
In-Reply-To: <20251217181631.724907-1-raphael.pavlidis@gmail.com>
References: <20251217181631.724907-1-raphael.pavlidis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767737186; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pwC6HXxWdv/xRpEsFKe3rBqrHqgYUAAKS9Zytgxh0RQ=;
 b=2COgQhLehdR09PsYC9uJ/dEfczOvT5ivZV0XRdy58PVxPvMNWIkbwrYTes+VWw3puOErMA
 rndPk+FJTMSUSVbpNZxFYS6OFD4b2iQumqu4tUTW41enX46AIjHoGtv3IZf0xR6S55+h8n
 U+WAlGX5NPIDTQhqqS/NGNmchNyHcydZDQn+GnV4CwbrWwIfedTsUypk6wNtq4WR2cz06k
 wzVKprF54xyoAHFMW9SFTvoPX39uTWXpdGq36xwhsRl1KqMN4NRzZFSR41VM4CFHo55axb
 83Lla2vApFeeiLF04HoFEC9ouPryykLlfChrj2eKCcDvqAl2O6+5KA/6czRgUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=2COgQhLe
Subject: Re: [Buildroot] [PATCH v1 1/2] package/linux-pam: security bump to
 version 1.7.1
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

Hello Raphael,

On Wed, 17 Dec 2025 18:16:29 +0000
Raphael Pavlidis <raphael.pavlidis@gmail.com> wrote:

> The build system was changed from autotools to meson.
> 
> Changelog:
> https://github.com/linux-pam/linux-pam/releases/tag/v1.7.0
> https://github.com/linux-pam/linux-pam/releases/tag/v1.7.1
> 
> This commit fixes the CVE-2024-10963 security vulnerability. See:
> https://github.com/advisories/GHSA-rw99-6hrh-fmjr

It is slightly annoying to do such a big "bump" with a change of build
system just to get a security fix.

Could you instead change this to:

- In PATCH 1, backport upstream commit
  940747f88c16e029b69a74e80a2e94f65cb3e628 which is the fix for
  CVE-2024-10963, according to
  https://github.com/linux-pam/linux-pam/issues/834. Add the
  LINUX_PAM_IGNORE_CVES += CVE-2024-10963 entry.

- In PATCH 2, do the version bump, drop the patch, drop the
  LINUX_PAM_IGNORE_CVES += CVE-2024-10963.

This way the maintainers of the 2025.02 will be able to backport PATCH
1, but keeping the "big bump" of PATCH 2 only for master.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
