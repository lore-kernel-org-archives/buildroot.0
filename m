Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E68AEEEC1C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 22:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25D2F605FE;
	Thu,  1 Jan 2026 22:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8nRx-DsYNye; Thu,  1 Jan 2026 22:02:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45A4B60749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304940;
	bh=DGlrY1eDQ0J6p1kBHrhLwUBYNxzx8F5fBJ9si+gKJXk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=st55S0sj4YI7n2h8/G10qtXHVW9REY9A9cH7bxzyBSWkTobCNV2+JG0BLtE05c+Da
	 HI+n6dHxK0h5vdTFQIJnbc36wqhuhvXCdXeyg6NoKHw/HDgLHADmOd918/b4HAmEyA
	 tPKYduGBw0ocY217JjvguA7N5GVN4TqAql4C+gAdBKljrVStq1DgmH+9IFt+yBqv2i
	 a+qinD6rCBXNQYb++qFTo8FnwUv/oOBsMVuhuYj+wP2RXqMIyDVzKsrHnnukmIv8UI
	 tFUeXB4aRu8RXdfJjS/aZuQOuffwil9gUCWBn0l35wMPgGhklRAcwA0i/aT2fro2HV
	 OiQjia7NJStTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45A4B60749;
	Thu,  1 Jan 2026 22:02:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8D6F19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB0EE40613
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icEDX2RQv3ye for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 22:02:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B98BD405A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B98BD405A9
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B98BD405A9
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:02:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3616B4E41EE5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:02:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E9B4060749;
 Thu,  1 Jan 2026 22:02:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E1AE9113B0713; Thu,  1 Jan 2026 23:02:13 +0100 (CET)
Date: Thu, 1 Jan 2026 23:02:12 +0100
To: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101230212.0f482a7b@windsurf>
In-Reply-To: <20251120220801.1877397-2-mr.zoltan.gyarmati@gmail.com>
References: <20251120220801.1877397-1-mr.zoltan.gyarmati@gmail.com>
 <20251120220801.1877397-2-mr.zoltan.gyarmati@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767304934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1Wb/dacBr/4x4rd0eoh6Pz4N9AhCwKRqkSNBUduJFq0=;
 b=1mVi9K+BER2+Ye9vk2PMrjp75iDka2OC69cQ6INpP0oSmk1oOGRH/NKkNLX4Cooo4opWfB
 YHqXgdxMI8bcSlfyUFxBUkw+u6dUY7APTOa7CdpWt6vyI/PJw629SAuZFL/KKTBbK3G1li
 fYOymgWZxXFb5GQRsrCTbYSD8x10utE5PTe7KHLoK95Hlo/KRbRXrX7wqBswgOAlvdFwR0
 nJ+E9aBl7uYEkIOX64QaKjq92OS7/dVPsSuWWCLmwVcAi4NNqVWhjpZU3pk4xObmnT2crw
 65xU6NMU5mo0P3oxxIupaunx98hw6Xd+x9+xwB3vzhnLDbaqQpBxZzXyqlv+eA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1mVi9K+B
Subject: Re: [Buildroot] [PATCH 2/2] package/quazip: add runtime tests
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

Hello Zoltan,

On Thu, 20 Nov 2025 23:08:01 +0100
Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com> wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 0272b4ba33..86a91332d5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3541,3 +3541,4 @@ F:	package/quazip/
>  F:	package/shapelib/
>  F:	package/simple-mail/
>  F:	package/tinc/
> +F:      support/testing/tests/package/test_quazip.py

Indentation here should have been with one tab.

> diff --git a/support/testing/tests/package/test_quazip.py b/support/testing/tests/package/test_quazip.py
> new file mode 100644
> index 0000000000..ae17546898
> --- /dev/null
> +++ b/support/testing/tests/package/test_quazip.py
> @@ -0,0 +1,43 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestQuazipQt6(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +          BR2_PACKAGE_QT6=y
> +          BR2_PACKAGE_QUAZIP=y
> +          BR2_PACKAGE_QUAZIP_INSTALL_TESTS=y
> +          BR2_TARGET_ROOTFS_CPIO=y

Other tests have those lines aligned with the """

> +class TestQuazipQt5(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +          BR2_PACKAGE_QT5=y
> +          BR2_PACKAGE_QUAZIP=y
> +          BR2_PACKAGE_QUAZIP_INSTALL_TESTS=y
> +          BR2_TARGET_ROOTFS_CPIO=y

Here as well.

I fixed those and applied to master, thanks!

One thing that could have been improved is factorize both tests with a
common class, since they are 99% identical, and two child classes, one
for Qt5, one for Qt6, just adding the one line difference in the config
file between each test. If you're looking for something quick to do for
Buildroot, that's one idea :-)

Best regards,

Thomas

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
