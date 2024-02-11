Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30058C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 15:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDF224025D;
	Sun, 11 Feb 2024 15:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mXvC4gmmZiqK; Sun, 11 Feb 2024 15:33:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EDD1403A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EDD1403A4;
	Sun, 11 Feb 2024 15:33:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BD901BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 867E340694
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 15:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 46aNa9gqomSC for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 15:33:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 87CFA4068A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87CFA4068A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87CFA4068A
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 15:33:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A237EFF804;
 Sun, 11 Feb 2024 15:33:17 +0000 (UTC)
Date: Sun, 11 Feb 2024 16:33:17 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240211163317.68b199d6@windsurf>
In-Reply-To: <20240209203852.671387-1-fontaine.fabrice@gmail.com>
References: <20240209203852.671387-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707665597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TPZMEGK1IKM7qudNnpAb2SXOSiQuEa6n69WIglnwo8w=;
 b=Lh34waImEDvE+lXEGGg76ZQPIc2fdQQ7+u58B0V87F30BZXeerWSRLMa0SDiFyA3Vy7Zn8
 tQ4H9Jrwq7YofUP3H/GEJazSjouwFAPTMDmY5HOBQXy9EAyyuB60nIpiMC14Zft+pr80L/
 Vgwab4jUP0DwtOv4xns/mS63IQ/DQFFYkH0cX0YWDyyljjoGUE/Gn6NZ7d0OS0Sg1T+fol
 EHidkCu2rrSmGQKXDG8BbJo9agRw66HIIY0YYJF44vXLNg4h44AnL5jV0bYfCF37dyGc5c
 gHZu/iBVeecF+FfaF7qpLjP8VRNIJsuEeY7HO9NB04AWyEsBj0M1gZjytVVi/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Lh34waIm
Subject: Re: [Buildroot] [PATCH 1/1] package/libqrtr-glib: fix static build
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
Cc: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  9 Feb 2024 21:38:52 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following static build failure raised since bump to version
> 1.2.2 in commit b50bb982208011841fe0a9a7e4309808085cf493:
> 
> [5/5] Linking target src/libqrtr-glib/libqrtr-glib.so.0.0.0
> FAILED: src/libqrtr-glib/libqrtr-glib.so.0.0.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e0442e97279a07f33a14ec52840f98b7ec0fe32d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...rtr-lib-meson.build-fix-static-build.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/libqrtr-glib/0001-src-libqrtr-lib-meson.build-fix-static-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
