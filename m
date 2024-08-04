Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56790C3DA7F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 09:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97287811CD;
	Sun,  4 Aug 2024 09:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsgE2x3bh-8N; Sun,  4 Aug 2024 09:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69EE0811CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69EE0811CF;
	Sun,  4 Aug 2024 09:13:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B20781BF59E
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 09:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DFC94018A
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 09:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4gOHRtyXlKp for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 09:13:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.241.56.172;
 helo=mout-p-202.mailbox.org; envelope-from=ruepp.simon@mailbox.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1CF040163
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1CF040163
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1CF040163
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 09:13:00 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4WcDPP6DLXz9swD;
 Sun,  4 Aug 2024 11:12:57 +0200 (CEST)
Date: Sun, 4 Aug 2024 11:12:53 +0200 (CEST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <1925308551.70117.1722762773712@office.mailbox.org>
In-Reply-To: <20240802191807.1b4edf36@windsurf>
References: <20240723103238.704924-1-ruepp.simon@mailbox.org>
 <20240724085442.134872-1-ruepp.simon@mailbox.org>
 <20240724222144.00bffdf2@windsurf> <20240802191807.1b4edf36@windsurf>
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-MBO-RS-ID: 4d975279927ef20b54d
X-MBO-RS-META: tu1u9hdwtjts9zcp54umhnaqdct9ojhm
X-Rspamd-Queue-Id: 4WcDPP6DLXz9swD
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbox.org; s=mail20150812; 
 t=1722762777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OBQmMYhHn9WmqPlFG2gkM/L3KVstRyhYalGZ3kBraVk=;
 b=dfM8GUmxNew71AaED21ttwUSFdYPgQtC5qaB9AuTwk4udZyip15P4uFO1KaSMkGd+ZS0Ck
 gGFdsaRD9EZ7MxcXcxjAJcOCiUTVdoKkjO7AhI89MZhYW3GecI4VFEEMw+yNJdiumtDRCM
 dtgLnAz9lwIUipt28Yn0QXrWmLsK+KHO5reQjnOgKercKAqOkedUcz/iIaRqtP+NGSAjEh
 KbZmxXx7QW6qrGEnHNSkjOTFF/4kaWx93ZoxgUui3Yr6x2h4mc+eJ7Ju6Rvn0LJl5PUdxA
 MBrlWw65FK21C8qp7KRS0fEGbFv+qdB+CGC0zY0r2svkrRHRrPIAQ0YuHBA8OA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbox.org; s=mail20150812; 
 t=1722762775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OBQmMYhHn9WmqPlFG2gkM/L3KVstRyhYalGZ3kBraVk=;
 b=koNCWr7AhrxcsQDgJN+Gej2lRHn1IkNU+6Nhk6/NlscKEqUDpg0VfBBd+fap2GerrRkFGv
 qPhFBO1H1zjUuWqT1J3SbbWDoEwUn/YMXbvkwQf48e7/dU1PweD39AYZ6lBwAPZJJCPJKB
 NP3kJhbSyh+76RWRQDziYJKuO1UpOF0uu0s1rb7zW/tl4dRRgKvoiAns0i4rexnubfYplE
 Tkb8k1dIax2vZ/WFeCPXtC03Cv66v3d8P2GkXYNzCJZtShnkbtxkc6O7UZAzqILK3ZY+LR
 TzFkU6Gk3vILg7Oo+0t4Vd5iLNTQR2LOmcoafxgare5cXs0PVKofSk1SpClgTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=mailbox.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=mailbox.org
 header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812
 header.b=dfM8GUmx; 
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.a=rsa-sha256 header.s=mail20150812 header.b=koNCWr7A
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
 Julien Corjon <corjon.j@ecagroup.com>, Simon Ruepp <ruepp.simon@mailbox.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

this fails since commit ca9e08277c473de1d0119768661ce0ba96559a7a. 

I am currently on vacation and will be back in three weeks. During that period I unfortunately don't have the time to look into the problem any further. 

Maybe someone can help me out? 

Best regards
Simon

> Thomas Petazzoni <thomas.petazzoni@bootlin.com> hat am 02.08.2024 19:18 CEST geschrieben:
> 
>  
> Hello Simon,
> 
> Gentle ping on the below questions, in order to be able to move forward
> with resolving this qt53d build issue.
> 
> Thanks a lot for your contribution!
> 
> Thomas
> 
> On Wed, 24 Jul 2024 22:21:44 +0200
> Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
> 
> > Hello Simon,
> > 
> > On Wed, 24 Jul 2024 10:54:44 +0200
> > Simon Ruepp via buildroot <buildroot@buildroot.org> wrote:
> > 
> > > Compiling the qt53d package currently fails since the required
> > > source files of the assimp library are missing. Because of this,
> > > QT53D_EXTRA_DOWNLOADS along with a post extract hook is used
> > > to separately download and extract the missing files.
> > > 
> > > Signed-off-by: Simon Ruepp <ruepp.simon@mailbox.org>  
> > 
> > Thanks for the patch. Could you document since when this is failing,
> > i.e which Buildroot commit introduced this regression?
> > 
> > Also, could you comment on how this will interact with:
> > 
> > ifeq ($(BR2_PACKAGE_ASSIMP),y)
> > QT53D_DEPENDENCIES += assimp
> > endif
> > 
> > that we have in qt53.mk. It seems like qt53d can use a system-provided
> > assimp instead of a bundled copy of assimp:
> > 
> > !ios:!tvos:!qcc:qtConfig(assimp):if(qtConfig(system-assimp)|android-clang|clang|win32-msvc|gcc) {
> >     SUBDIRS += assimp
> > }
> > 
> > (from src/plugins/sceneparsers/sceneparsers.pro). There is apparently a
> > -assimp config option that allows to chose between "system", "qt" and
> > "no".
> > 
> > Also, I see that src/3rdparty/patches/ has a bunch of patches for
> > assimp. Should these patches be applied? Are they important?
> > 
> > Thanks a lot for your additional investigations :-)
> > 
> > Thomas
> 
> 
> 
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
