Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BA0C41513
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 08:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6726E606CA;
	Wed, 10 Jul 2024 08:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCHOsmQPNOJm; Wed, 10 Jul 2024 08:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D89160880
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D89160880;
	Wed, 10 Jul 2024 08:48:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BE201BF5AD
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54AAE81F7E
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 08:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVoI00h4njIm for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 08:48:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1242881139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1242881139
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1242881139
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 08:48:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08B7D1C0003;
 Wed, 10 Jul 2024 08:48:42 +0000 (UTC)
Date: Wed, 10 Jul 2024 10:48:42 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20240710104842.16dbf85c@windsurf>
In-Reply-To: <20240710081348.60978-1-buildroot@heine.tech>
References: <20240710081348.60978-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720601323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1urvAu9fUJaB86v5z69SY/hoMlXTZ8Gh3eBjMgVCu04=;
 b=VljVXVRydGMfQean0shAG8v3v0HTWAg46cXcpIccWtP23mcZd7V7MXAwgaYPOQjAveQV3i
 xMcwQSq58kMfqEzhAlTFLnfnD3Do/YzMPvTZtN7nWxzta1gzJAM7PbN9vPe26v02lnSD7m
 ZJaotmC8FG2K5uHRqM5ptfq4hOF09wK/en+6wNsZcIK/EMLgdMh7iBZawokXxbQRgC3q04
 UUcsMntOFSlQs5DhJtbpfhE3m+IuqTUtItVFVEKNp2brWgZlLuFUSIFtgnWQ4ZiGaWP2pQ
 wI6U1EwRFuywtpFjfz5uUsAJbQS+n+HjjB4c5znKyEIB0PPWHH3FsowFv87Gdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VljVXVRy
Subject: Re: [Buildroot] [PATCH] package/sqlitecpp: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Wed, 10 Jul 2024 10:13:47 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> SQLiteC++ (SQLiteCpp) is a lean and easy to use C++ SQLite3 wrapper.
> 
> http://srombauts.github.io/SQLiteCpp/
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Thanks, I have applied after doing some changes, see below.


> diff --git a/package/sqlitecpp/Config.in b/package/sqlitecpp/Config.in
> new file mode 100644
> index 0000000000..02b2d8989c
> --- /dev/null
> +++ b/package/sqlitecpp/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_SQLITECPP
> +	bool "SQLiteC++"

Changed to:

	bool "sqlitecpp"

Indeed, we really want the prompt to be the same as the package name.

> +	select BR2_PACKAGE_SQLITE
> +	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA

Since it's written in C++, you forgot:

	depends on BR2_INSTALL_LIBSDCPP

and the corresponding Config.in comment saying that the toolchain needs
to have C++ support.


> diff --git a/package/sqlitecpp/sqlitecpp.mk b/package/sqlitecpp/sqlitecpp.mk
> new file mode 100644
> index 0000000000..bb1caa0f39
> --- /dev/null
> +++ b/package/sqlitecpp/sqlitecpp.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# SQLiteC++
> +#
> +################################################################################
> +
> +SQLITECPP_VERSION = 3.3.1
> +SQLITECPP_SOURCE = $(SQLITECPP_VERSION).tar.gz

This _SOURCE variable was not needed, the default is good enough.

> +SQLITECPP_SITE = $(call github,SRombauts,SQLiteCpp,$(SQLITECPP_VERSION))
> +SQLITECPP_LICENSE = MIT
> +SQLITECPP_LICENSE_FILES = LICENSE.txt
> +SQLITECPP_DEPENDENCIES = sqlite
> +SQLITECPP_INSTALL_STAGING = YES
> +
> +SQLITECPP_CONF_OPTS = \
> +	-DSQLITECPP_INTERNAL_SQLITE=OFF \
> +	-DSQLITECPP_RUN_CPPLINT=OFF \
> +	-DSQLITECPP_RUN_CPPCHECK=OFF
> +
> +$(eval $(cmake-package))

Again: applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
