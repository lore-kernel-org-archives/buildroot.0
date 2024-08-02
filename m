Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469BDC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 17:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFB3B820E2;
	Fri,  2 Aug 2024 17:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7M0yjxZ7g5HD; Fri,  2 Aug 2024 17:18:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E88EA84500
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E88EA84500;
	Fri,  2 Aug 2024 17:18:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D63271BF387
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFDC440112
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_wteKMMLl-H for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 17:18:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7FFF7400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FFF7400F5
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FFF7400F5
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 17:18:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F3B640003;
 Fri,  2 Aug 2024 17:18:08 +0000 (UTC)
Date: Fri, 2 Aug 2024 19:18:07 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>, Simon Ruepp
 <ruepp.simon@mailbox.org>
Message-ID: <20240802191807.1b4edf36@windsurf>
In-Reply-To: <20240724222144.00bffdf2@windsurf>
References: <20240723103238.704924-1-ruepp.simon@mailbox.org>
 <20240724085442.134872-1-ruepp.simon@mailbox.org>
 <20240724222144.00bffdf2@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722619088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZNuDRPg8s4BN5OI5rbUOK0TZnl5eMBSwbJ5NjAF6D0=;
 b=m0LnpeN+eXmqDKgLVtO8rxbe2B4ex+jMmXDh5hH1kDlLxqBI8AtFqDYelH+WNZJC6CQij4
 eLxxbl4Z+3vV1Tn3P0BlNZdSCDQDbRPM6n38Vt4p+e4zqWK0ATBJ4taDggyJPwTAdjuDg1
 Hofu9G3aG7vqYouEB69HOcHeswfu55p6RBLBA8PKcw1xN5twWuF/BDMRWAGWk5FcaljC7s
 PCljdQeNVNl2q+Z8bQkRl8iM9SyBPyIBYELxfrMKQslsu15aueTcY8TJpt65xvb0a4227w
 cIXBCpNPbnqYdxbOXKGg0J2qski8JCPEug4CpTdy4GYjLtYTNFnALrLl7YGaXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m0LnpeN+
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Simon,

Gentle ping on the below questions, in order to be able to move forward
with resolving this qt53d build issue.

Thanks a lot for your contribution!

Thomas

On Wed, 24 Jul 2024 22:21:44 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Hello Simon,
> 
> On Wed, 24 Jul 2024 10:54:44 +0200
> Simon Ruepp via buildroot <buildroot@buildroot.org> wrote:
> 
> > Compiling the qt53d package currently fails since the required
> > source files of the assimp library are missing. Because of this,
> > QT53D_EXTRA_DOWNLOADS along with a post extract hook is used
> > to separately download and extract the missing files.
> > 
> > Signed-off-by: Simon Ruepp <ruepp.simon@mailbox.org>  
> 
> Thanks for the patch. Could you document since when this is failing,
> i.e which Buildroot commit introduced this regression?
> 
> Also, could you comment on how this will interact with:
> 
> ifeq ($(BR2_PACKAGE_ASSIMP),y)
> QT53D_DEPENDENCIES += assimp
> endif
> 
> that we have in qt53.mk. It seems like qt53d can use a system-provided
> assimp instead of a bundled copy of assimp:
> 
> !ios:!tvos:!qcc:qtConfig(assimp):if(qtConfig(system-assimp)|android-clang|clang|win32-msvc|gcc) {
>     SUBDIRS += assimp
> }
> 
> (from src/plugins/sceneparsers/sceneparsers.pro). There is apparently a
> -assimp config option that allows to chose between "system", "qt" and
> "no".
> 
> Also, I see that src/3rdparty/patches/ has a bunch of patches for
> assimp. Should these patches be applied? Are they important?
> 
> Thanks a lot for your additional investigations :-)
> 
> Thomas



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
