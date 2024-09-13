Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1019FA3737
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 09:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73CD480AED;
	Fri, 13 Sep 2024 09:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0d7m5iuT_dCu; Fri, 13 Sep 2024 09:31:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 796E280B1E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 796E280B1E;
	Fri, 13 Sep 2024 09:31:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 956211BF2BD
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 09:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83AA66074F
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 09:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrATLy5PduvV for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 09:31:43 +0000 (UTC)
X-Greylist: delayed 319 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 13 Sep 2024 09:31:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 75DE76002E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75DE76002E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:0:465::201; helo=mout-p-201.mailbox.org;
 envelope-from=ruepp.simon@mailbox.org; receiver=<UNKNOWN> 
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75DE76002E
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 09:31:42 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4X4ppJ1PkSz9sy0;
 Fri, 13 Sep 2024 11:26:16 +0200 (CEST)
Date: Fri, 13 Sep 2024 11:26:15 +0200 (CEST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <1674539724.897321.1726219575160@office.mailbox.org>
In-Reply-To: <1925308551.70117.1722762773712@office.mailbox.org>
References: <20240723103238.704924-1-ruepp.simon@mailbox.org>
 <20240724085442.134872-1-ruepp.simon@mailbox.org>
 <20240724222144.00bffdf2@windsurf> <20240802191807.1b4edf36@windsurf>
 <1925308551.70117.1722762773712@office.mailbox.org>
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-MBO-RS-ID: 2a708fcedd5a73c1e2f
X-MBO-RS-META: fy4bzeotsnhthf4ga3hnqpszbaemsay5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbox.org; s=mail20150812; 
 t=1726219576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cOrPCAXsxjlaxzJNmdgeY3CC99JvcQ7She6WKyEQ+OM=;
 b=BxpWO22/CNrvRX9D6SnDYPK1WLXb4QG4aLnDDfbXDtMWcuPMgyDrUuOAQZwVUaQIlBBxTt
 y+PY8OQjDqMFm25t4G7qLUiikk7Mv+KkqYDEmZqYsoYmiZRm4kdGrjmCOyNuEpzu7j+69H
 PX8tG1Bvm+CRcwLx1K4psdgGUjVv+ji03HBfbA+OdHVkTfEdfHB0hI5sxMHvqff2zqhVe0
 p3Y9MeB+SCb6y6qIaryUrOKLSd5zHaGvKWSJaNvIPbrIxKC20h4j7QJUlQTs74meWV3P23
 X5TAJVaS/3wSKKZ8m6vwJTrvz3eDnsEXY1uGrIl383DfFm+Ab7qkp8AOMWrGwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=mailbox.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256
 header.s=mail20150812 header.b=BxpWO22/
Subject: Re: [Buildroot] [PATCH v2] package/qt5/qt53d: fix compilation error
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
From: Simon Ruepp via buildroot <buildroot@buildroot.org>
Reply-To: Simon Ruepp <ruepp.simon@mailbox.org>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas, 

I did some further research and can now answer your remaining questions:

> It seems like qt53d can use a system-provided
> assimp instead of a bundled copy of assimp:
> 
> !ios:!tvos:!qcc:qtConfig(assimp):if(qtConfig(system-assimp)|android-clang|clang|win32-msvc|gcc) {
>     SUBDIRS += assimp
> }
> 
> (from src/plugins/sceneparsers/sceneparsers.pro). There is apparently a
> -assimp config option that allows to chose between "system", "qt" and
> "no".

I found the options you mentioned in the "config_help.txt" file located in the qt53d build directory and integrated them in the qt53d.mk with: 

ifeq ($(BR2_PACKAGE_ASSIMP),y)
QT53D_DEPENDENCIES += assimp
QT53D_CONF_OPTS += -system-assimp
else
QT53D_POST_EXTRACT_HOOKS += QT53D_ASSIMP_EXTRACT
QT53D_CONF_OPTS += -qt-assimp
endif

But the build still fails when trying to use the system-provided version:

make[4]: *** No rule to make target '/home/sr20608/src/buildroot/output/build/qt53d-9bf4d03e2515f7c454647d54542330b6e90f8191/src/3rdparty/assimp/src/code/Common/Assimp.cpp', needed by '.obj/Assimp.o'.  Stop.

> Also, I see that src/3rdparty/patches/ has a bunch of patches for
> assimp. Should these patches be applied? Are they important?

These patches don't seem to be important anymore since they already have been applied.

Best regards
Simon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
