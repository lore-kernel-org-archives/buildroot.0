Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00466C3DA45
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 11:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AFF94152D;
	Wed, 10 Jul 2024 11:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xPgUE-fXRSIC; Wed, 10 Jul 2024 11:47:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 556E041545
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 556E041545;
	Wed, 10 Jul 2024 11:47:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 932C81BF977
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 11:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 811A460885
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 11:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id toXi611NwK7i for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 11:47:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39C85606EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39C85606EA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39C85606EA
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 11:47:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F274540003;
 Wed, 10 Jul 2024 11:47:20 +0000 (UTC)
Date: Wed, 10 Jul 2024 13:47:19 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20240710134719.5b84b352@windsurf>
In-Reply-To: <e3604bce-6189-4cef-a0f2-19257f66ebf1@gmx.de>
References: <20240704121352.1915154-1-fiona.klute@gmx.de>
 <20240704121352.1915154-4-fiona.klute@gmx.de>
 <20240708235639.7a9cc07c@windsurf>
 <1e0c66a5-b6d3-4117-aafb-68b4d00a5565@gmx.de>
 <20240709135538.4594978e@windsurf>
 <f1ec17d8-b94a-4759-be4b-9eba46ae1b5a@gmx.de>
 <20240709203551.1e05568e@windsurf>
 <e3604bce-6189-4cef-a0f2-19257f66ebf1@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720612041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjJ6hobhYZXi7qs0A+c+EWGrHGtnSLjIahET5XJxPEA=;
 b=WP07PHcwy47xG7Uoq3XUj/aPA1rudVriLn8AIwCCvL9JZvciJ3yUwNe/QkzyYx8z/5Zzol
 EAe6ocg1nr2LNc2ttYO/n2vmPNujBaR5CzdA8zBxqZI2U3XuPuUTxWx/Ahc3mbLrAdxbZh
 sS8GHUVG/csnmYYtehq6nTYFH9TIcMTzUIlfYhIwWP925tyfCvHMsfD+m/oczRQWIDI2JR
 fqIP4NV93ubqvzL3Y2lmLZ6j7pNcHzpFREmXB7nRdACSEA6CL146cLY2RJtxSP/K9nlNdm
 AJcQwa/jb/KaV4Kq+HHomUD5MOG5zAxzfSJ+JcNq5lVQQ935dJ8BfIR649gZmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WP07PHcw
Subject: Re: [Buildroot] [PATCH v2 3/4] package/fail2ban: bump version to
 1.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Wed, 10 Jul 2024 13:17:58 +0200
Fiona Klute <fiona.klute@gmx.de> wrote:

> If you just use a fresh defconfig, yes, but that doesn't quite work for
> fail2ban (there isn't one that enables it, it needs Python, and I'd like
> to build with musl to match my target). I guess it'd be easy enough to
> create a snippet with the required config, append it after defconfig,
> and run "make oldconfig".
> 
> But then I still wouldn't get to reuse BR2_DL_DIR (though
> utils/docker-run can use that from environment) and the CCache setup.

Not sure what's the problem here. Here is another example, where I
start from a simple config for an ARMv7 toolchain:

$ mkdir /tmp/foo
$ cp ~/buildroot/support/config-fragments/autobuild/bootlin-armv7-glibc.config .config
$ ~/buildroot/utils/docker-run make -C ~/buildroot O=$(pwd) menuconfig

enable BR2_PACKAGE_PYTHON3=y and BR2_PACKAGE_FAIL2BAN=y in menuconfig, exit

$ ~/buildroot/utils/docker-run make

and that's it. No need to have an existing defconfig.

Regarding BR2_DL_DIR: it re-uses the one defined in your environment
outside the docker container, so it just works. Regarding BR2_CCACHE,
you can set the option in menuconfig, but indeed it wouldn't re-use the
cache that's available outside the container.

> I could use a defconfig from my external tree, but then I'd need to get
> utils/docker-run to mount it. That might actually be an option: Make
> utils/docker-run honor BR2_EXTERNAL the same way it does BR2_DL_DIR.
> Would such a patch be welcome? If yes I'm going to give it a try.

See above: you don't need an existing defconfig to test things.

However, it would indeed perhaps make sense for docker-run to mount
BR2_EXTERNAL trees inside the container.

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
