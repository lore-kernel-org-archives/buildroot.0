Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F0FD5C0F2
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 08:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A6E181A24;
	Tue, 16 Dec 2025 08:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59G1mtnzlEj4; Tue, 16 Dec 2025 08:39:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CAAB822CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765874350;
	bh=4nnCJdAwPJqktjRL44zoR0pr2ASwkF7kHJS3gz+zdLU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pzdOt56xpRc4H9g7xdWNP4XwmUGtWXUIk2z1VMZLYfWTrTDK6eSArKzGoKHi/7m4P
	 Lr17QkVnP33S91tpfoccoGaoYIOA1mrW0sJ2uxny9KeFKNEllmHLD2Mtpcf6/KVdZh
	 3M8Zf+lN3KnZ6sUl20AOkbMnQYBzlwqMpyF5/1MF+7bQYtuhKgnSp2JeuOGzaRihns
	 345CKbBGB+O+TieTpjc/XZ8DaUD6+Sl1gZumdLD5V+pNv1vWcYU8n3tp3vOEKYyuyO
	 hiosXDItRUKhJG3ZL2YrUkrc/DcxHmWa2jcHOWLkS1rsK3a/7SNkHETmNJN80gzW4W
	 qJGzEWYCgvw/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CAAB822CE;
	Tue, 16 Dec 2025 08:39:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EED79370
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 08:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3694822CE
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 08:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_FwZjSmCLAr for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 08:39:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33EA281A24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33EA281A24
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33EA281A24
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 08:39:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8CDA24E41C1D
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 08:39:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4C5046071C;
 Tue, 16 Dec 2025 08:39:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3ABBA11943190; Tue, 16 Dec 2025 09:39:02 +0100 (CET)
Date: Tue, 16 Dec 2025 09:39:01 +0100
To: Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: buildroot <buildroot@buildroot.org>, Samuel Martin
 <s.martin49@gmail.com>, Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20251216093901.3a425563@windsurf>
In-Reply-To: <20211212130745.2240973-1-horatiu.vultur@microchip.com>
References: <20211212130745.2240973-1-horatiu.vultur@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765874343; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=TC449KEaqoGOjxePnziTuETxSB0garkL4f6ySMwSLpw=;
 b=Io1ic7dlZ3/X9HrZhMI6ZrM1Zb3vFBVc31RsLkGcAohasAPTq6UQF9BjRBXgHC6X9TAFBP
 QKCMvIUv509fsdcdCgZdQ2bZ1CahOoBwHzuPJ7Eq7+xk6I0tk9XM3XRIXSpMHMK0WCVI11
 YFR66J41nQM837fSmJfclI54PkR/v1G6sI2b88zDaOS+dFoBV84KEe5ZU5p3HLHvj4kuEZ
 E7qjeJuxIKdu2rgTPbVwgCDtoHDtNzteNFNoP0TVf3HMOV27FnaIvZQhxG1GbpAkR88p4f
 2JsEadG8bJsUiM2ubpIrgx8HIcF4nDZLwIx5JP7KXFvMNnaomJ7qlKu12ltVPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Io1ic7dl
Subject: Re: [Buildroot] [PATCH] package/cfm: new package
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

Hello Horatiu,

On Sun, 12 Dec 2021 14:07:45 +0100
Horatiu Vultur via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>

I am getting back to after several years, as this package is no longer
building after the update to CMake 4:

CMake Error at CMakeLists.txt:6 (cmake_minimum_required):
  Compatibility with CMake < 3.5 has been removed from CMake.

  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
  to tell CMake that the project requires at least <min> but has been updated
  to work with policies introduced by <max> or earlier.

  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.

See also:

  https://autobuild.buildroot.net/results/dff/dff5fd392a4d35ee54ac8f1e7d44a04a1f1323b6/build-end.log

Most likely it is just a matter of updating:

  cmake_minimum_required(VERSION 2.6)

to:

  cmake_minimum_required(VERSION 3.5)

Could you have a look and provide a fix?

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
