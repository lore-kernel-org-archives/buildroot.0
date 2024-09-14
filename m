Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8608C021A3
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 16:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2CDF80A51;
	Sat, 14 Sep 2024 16:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_kqMUl4YEoW; Sat, 14 Sep 2024 16:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9473281EAA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9473281EAA;
	Sat, 14 Sep 2024 16:16:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 354E11BF83A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 310C940436
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3erNRHAWjlT for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 16:16:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 61FBD40120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61FBD40120
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61FBD40120
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 16:16:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64BC0C0003;
 Sat, 14 Sep 2024 16:16:14 +0000 (UTC)
Date: Sat, 14 Sep 2024 18:16:13 +0200
To: Ben Hutchings via buildroot <buildroot@buildroot.org>
Message-ID: <20240914181613.4730aff3@windsurf>
In-Reply-To: <20240411145559.1183064-1-ben.hutchings@mind.be>
References: <20240411145559.1183064-1-ben.hutchings@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726330574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xh6daAP2Pk5Go2TxaCaa9LQQYR/KhVCJXZt/VGn4JAo=;
 b=c5MFkfh+AEneupZLwbjKRAlgd6MxBISDxWhzygz1uDzEM+nJNHOoLabMKpY+3PQpddIiQr
 MiXsJPI+FOe4Qygs5GC2gpNytPT/lITHaVNwBVf8tT8Fnu8ha1ENhnbMscIGv7UPMVaTCo
 x4bUb3WXzlB47cGvbdqZdR/w5ByT2kVL8hOsVr8RTqzxSQjX5RQMcmqmdb2PofThMLdpfL
 UmySgXRevsQxt7uYESvBDPlnKq2h32dPs2w47wzreczQb3Yyo1v94KLQo1+ewy0hMCEHkJ
 cNBp5H7OBEJ+SM9cfHSfd+qJJtKEmc2DtO/Ne9y9APcXsV/2QGbdbIdLPQXHnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c5MFkfh+
Subject: Re: [Buildroot] [PATCH] package/qt6/qt6base: Make qmake work
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Ben Hutchings <ben.hutchings@mind.be>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ben,

Adding in Cc: Angelo and Jesse who already tried to fix this in the
past, and also adding Roy who is looking after Qt6 packaging.

Some comments/questions below.

On Thu, 11 Apr 2024 16:55:58 +0200
Ben Hutchings via buildroot <buildroot@buildroot.org> wrote:

> Currently the qt6base package does not install a working qmake
> program, so applications can only be built with CMake.
> 
> To ease upgrades from Qt 5, make qmake work as well:
> 
> - Create a linux-buildroot-g++ device spec, like we do for Qt 5.
> 
> - Fix the generated target_qt.conf file.  The Qt build system
>   currently generates this with the sysroot directory wrongly added in
>   various places.
> 
> - Fix the qmake wrapper script in the sysroot to set the QMAKEPATH
>   environment variable.
> 
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>

This generally looks good, but I have two concerns.

The first one: there is nothing in Buildroot that exercises this. I
would like to have either a real package that uses this qmake support,
or a dummy package as a test case in support/testing/.

> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +define QT6BASE_MKSPEC_ARCH_CONFIG
> +# Qt 6 needs atomics, which on various architectures are in -latomic
> +	printf '!host_build { \n LIBS += -latomic\n }' > \
> +		$(STAGING_DIR)/usr/mkspecs/devices/linux-buildroot-g++/arch.conf
> +endef
> +endif
> +
> +define QT6BASE_INSTALL_MKSPEC
> +	mkdir -p $(STAGING_DIR)/usr/mkspecs/devices/linux-buildroot-g++
> +	$(INSTALL) -m 0644 $(QT6BASE_PKGDIR)/qplatformdefs.h \
> +		$(STAGING_DIR)/usr/mkspecs/devices/linux-buildroot-g++/
> +	sed 's%@CROSS_COMPILE@%$(TARGET_CROSS)%' \
> +		< $(QT6BASE_PKGDIR)/qmake.conf.in \
> +		> $(STAGING_DIR)/usr/mkspecs/devices/linux-buildroot-g++/qmake.conf
> +	touch $(STAGING_DIR)/usr/mkspecs/devices/linux-buildroot-g++/arch.conf
> +	$(QT6BASE_MKSPEC_ARCH_CONFIG)
> +endef
> +
> +# The generated broken target_qt.conf is broken, so replace it
> +define QT6BASE_INSTALL_TARGET_QT_CONF
> +	sed 's%@HOST_DIR@%$(HOST_DIR)%; s%@SYSROOT@%$(STAGING_DIR)%' \
> +		< $(QT6BASE_PKGDIR)/target_qt.conf.in \
> +		> $(STAGING_DIR)/usr/bin/target_qt.conf
> +endef

All these I'm reasonably happy with, it's very similar to what we have
for qt5. Quite puzzling that the config file is in
$(STAGING_DIR)/usr/bin/, but oh well.

> +# The qmake wrapper script doesn't set QMAKEPATH, so qmake doesn't
> +# find specs and modules installed for the target
> +define QT6BASE_FIX_QMAKE_SCRIPT
> +	sed -i '1a\
> +export QMAKEPATH=$(STAGING_DIR)/usr' \
> +		$(STAGING_DIR)/usr/bin/qmake
> +endef

This is what bothers me. Why do you fix $(STAGING_DIR)/usr/bin/qmake?
The one we care about and that will be used to build packages is
$(HOST_DIR)/usr/bin/qmake. And this one is not a script that can be
patched, but directly an ELF binary. So here we have something that
isn't good.

Do you think you could have a look into this, perhaps looping back with
Angelo, Jesse and Roy?

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
