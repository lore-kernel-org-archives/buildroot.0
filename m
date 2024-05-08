Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98151C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AAA660D54;
	Wed,  8 May 2024 16:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Myn0__86BvJd; Wed,  8 May 2024 16:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 761D860D9D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 761D860D9D;
	Wed,  8 May 2024 16:38:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94AC81BF97E
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E883401BB
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dil2seuaskTw for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:38:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1CFC9401AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CFC9401AF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CFC9401AF
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:38:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1AA9C0004;
 Wed,  8 May 2024 16:38:06 +0000 (UTC)
Date: Wed, 8 May 2024 18:38:05 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240508183805.5bcc0877@windsurf>
In-Reply-To: <20240508100506.18756-1-fontaine.fabrice@gmail.com>
References: <20240508100506.18756-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715186287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+soGe90J5xRg2TiQXiWdJvhcQUs5DpKlWxA042hIMk=;
 b=K1P5xhorwiz4m7t7e+ql/xNogNhMork8kPX7DfF8hXJQuW1Z/SOQg4p6dWPaNPQci6Ixmo
 TYhRPXhPTB6e/m4DvrEUaOQbZ0vx70rGjBd4hyCd1mBtB/N67o6eGi0IY04qVFXYLb2qou
 D26Rl74d8XSiuq5NlOiohuHYo199F2mK/GqHjIXdZMEOekDSaTVPhrAF1izY0NxoQOfO/X
 0vsAxb18wln0PWAIbQWxU2W54J4GWZUleAxfg3D0lS7gfiQd/8C6gPEQ62aCxuWS23qU5g
 Kap3lyiThQblQiXypKJHHb+bxMZWVByaIAsziJ2dPoJIvCgc4QlOSOgdfhAZWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K1P5xhor
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: fix legal info
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  8 May 2024 12:05:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 9b25246e9b731f167454ba4f8182eed1926f50a6 made a typo in license
> filename and forgot to add its hash:
> 
> ERROR: No hash found for LICENCE.ivsc
> 
> Fixes: 9b25246e9b731f167454ba4f8182eed1926f50a6
>  - http://autobuild.buildroot.org/results/144ce581645d78a2d27a59a63130977d0f549db8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/linux-firmware/linux-firmware.hash | 1 +
>  package/linux-firmware/linux-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks. Sorry for my bad review on this one :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
