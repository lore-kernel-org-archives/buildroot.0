Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B99D1037B
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 11:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42A47613B9;
	Wed, 26 Nov 2025 11:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tSFrp702vkw; Wed, 26 Nov 2025 11:01:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FA5D60AC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FA5D60AC9;
	Wed, 26 Nov 2025 11:01:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C05A359
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 11:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E92940A88
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 11:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqBncNUIBK0N for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 11:00:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 34E1240A5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34E1240A5E
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34E1240A5E
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 11:00:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3C3BB1A1D6E
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 11:00:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 055F560721;
 Wed, 26 Nov 2025 11:00:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 28401102F0828; Wed, 26 Nov 2025 12:00:56 +0100 (CET)
Date: Wed, 26 Nov 2025 12:00:55 +0100
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20251126120055.6dd94e90@windsurf>
In-Reply-To: <20251126-rasdaemon-v1-2-38c590f3e591@bootlin.com>
References: <20251126-rasdaemon-v1-0-38c590f3e591@bootlin.com>
 <20251126-rasdaemon-v1-2-38c590f3e591@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764154856; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=TMnv0sxeKQALpqF3CNVaKTKmAQOBR/bwhJzVUz5cCFg=;
 b=KpFz+WXt9gvKp+reF9JUG1fTo87ZICDO/G/FuE4rtxx2JzOTyD5GNWql3J2ZTcFG9MF9SI
 WzOOunvHZPxKl0vLGDK+8Ncnr0W9mEwmUHiLHyhmOS0gvBITRgiB+HPUKqGuDc12dY/V5x
 3x0UW69Bvfl7BO7I2yKmzlj0O5EkV9g9s5QWRHHq7r20U0i0dBOYdtTD54yqDUWMT/kzNS
 qSYYXuPQhwYiFm9N0mRnyoR552ABW6qCF0r6S8P3eZUtJQxT5fqiIr8/AESm0E24mtjIrL
 qLN2oQDOtwpV/lpYH+F4lM5H4SicCLXw0Klk83jR/S7VEoc6uJqHkf6k+395nQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=KpFz+WXt
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: add rasdaemon tests
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

Hello,

On Wed, 26 Nov 2025 11:20:10 +0100
Bastien Curutchet <bastien.curutchet@bootlin.com> wrote:

> +class TestRasdaemon(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_RASDAEMON=y
> +        BR2_PACKAGE_RASDAEMON_AER=y
> +        BR2_PACKAGE_LIBTRACEEVENT=y
> +        BR2_PACKAGE_SQLITE=y
> +        BR2_PACKAGE_PCIUTILS=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        self.assertRunOk("/usr/sbin/rasdaemon --version")


Since it installs an init script, what about checking that the daemon
is actually running?

Bonus point if you're actually able to inject an error, and verify that
rasdaemon reacts to it by running some arbitrary action :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
