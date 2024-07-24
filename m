Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADD5C3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 20:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1618A4023B;
	Wed, 24 Jul 2024 20:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ws5fIIQvXNL9; Wed, 24 Jul 2024 20:21:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C042340DFD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C042340DFD;
	Wed, 24 Jul 2024 20:21:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 480F51BF283
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 20:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3748240DFD
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 20:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18FvLfBFufjT for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 20:21:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB0644023B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB0644023B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB0644023B
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 20:21:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2428820003;
 Wed, 24 Jul 2024 20:21:45 +0000 (UTC)
Date: Wed, 24 Jul 2024 22:21:44 +0200
To: Simon Ruepp via buildroot <buildroot@buildroot.org>
Message-ID: <20240724222144.00bffdf2@windsurf>
In-Reply-To: <20240724085442.134872-1-ruepp.simon@mailbox.org>
References: <20240723103238.704924-1-ruepp.simon@mailbox.org>
 <20240724085442.134872-1-ruepp.simon@mailbox.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721852505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lRASeQNxeOQh13p/72nxgWLHVVF60yXGBamvg+9+6kA=;
 b=lCApGYr0f9vP2iFDflKLbK4U7tR7IYcRAq/WVtsQrbU2PAsqCz8ROwLzDv21uxP3CppnTJ
 VG/U7DhuzqBrTNKL7pB7o2x3AEAyxvOhkx0NYZ0SBh9sFVVbFniZL7aILCeWcdgLU45ala
 kU/DeLDAJfItEyJsppjuyrFs6u0jCO56u0+UMGx3TCsBiC/93YSQdCJ4DJO5esIt5reYyh
 CKdmall6eWs5995xcnBcL/ig/WOmOlJvAeSb8oE3sDTqutPUT87oW17dxCLwc+8ROaxdhe
 z4dvtmE1GsZS2Otn5GQSsko8kNQ2++TetCrIAr285Pty+mAoYwrBigfaWYET3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lCApGYr0
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
 Julien Corjon <corjon.j@ecagroup.com>, Simon Ruepp <ruepp.simon@mailbox.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Simon,

On Wed, 24 Jul 2024 10:54:44 +0200
Simon Ruepp via buildroot <buildroot@buildroot.org> wrote:

> Compiling the qt53d package currently fails since the required
> source files of the assimp library are missing. Because of this,
> QT53D_EXTRA_DOWNLOADS along with a post extract hook is used
> to separately download and extract the missing files.
> 
> Signed-off-by: Simon Ruepp <ruepp.simon@mailbox.org>

Thanks for the patch. Could you document since when this is failing,
i.e which Buildroot commit introduced this regression?

Also, could you comment on how this will interact with:

ifeq ($(BR2_PACKAGE_ASSIMP),y)
QT53D_DEPENDENCIES += assimp
endif

that we have in qt53.mk. It seems like qt53d can use a system-provided
assimp instead of a bundled copy of assimp:

!ios:!tvos:!qcc:qtConfig(assimp):if(qtConfig(system-assimp)|android-clang|clang|win32-msvc|gcc) {
    SUBDIRS += assimp
}

(from src/plugins/sceneparsers/sceneparsers.pro). There is apparently a
-assimp config option that allows to chose between "system", "qt" and
"no".

Also, I see that src/3rdparty/patches/ has a bunch of patches for
assimp. Should these patches be applied? Are they important?

Thanks a lot for your additional investigations :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
