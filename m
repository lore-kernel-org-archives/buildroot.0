Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F7FD10C04
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 19:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D393A401DC;
	Sat, 26 Oct 2024 19:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rpI-Q9zqky9X; Sat, 26 Oct 2024 19:10:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA0A840230
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA0A840230;
	Sat, 26 Oct 2024 19:10:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3F6A5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82804401DC
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61RzRFJ1fr3V for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 19:10:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 34FF3401A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34FF3401A2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34FF3401A2
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:10:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8645B60002;
 Sat, 26 Oct 2024 19:10:42 +0000 (UTC)
Date: Sat, 26 Oct 2024 21:10:41 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
Message-ID: <20241026211041.5b772864@windsurf>
In-Reply-To: <20240916071447.801674-1-aperez@igalia.com>
References: <20240916071447.801674-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729969842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LDDmNegv7tk0/I2BO0uC3RMlSfJBFZiekD0c4vCda+w=;
 b=Zck29KoOk7qYRm3UZJkNNp8KrrhfWcqg9lTaFRbFLfKkALwor1RIQC0VpVgxyP0LW1fyKX
 ILNgFC7u0nUtrSJceZZo7plMVvcBszsll6qMheAlDWv+6Nyyx6LJe3F3G1aX46VP1+m2J1
 q3631IghjhAH3zjjgDUrwFhEcngbs/JUS6IJ+/GxsIZZQOKQs1Rcno7MFjdi/EHghb5wXC
 SjpcTUEeqw7HC15wz6xdoVGQgnZQ1y1DyjLJq8Tb1w0sPu1Pg0i5UagFfmJotS2r1REYMH
 SwqydDwpTSD0UoKc+OKnlQ1QMmnSJFH3qRMLsLr3O01lXKuFaO+p2hf4CwgrlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zck29KoO
Subject: Re: [Buildroot] [PATCH] package/wpebackend-fdo: bump version to
 1.14.3
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

On Mon, 16 Sep 2024 10:14:46 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This is a bugfix release which plugs a couple of small leaks, and
> includes patch "0001-Cast-to-EGLNativeWindowType-explicitly.patch",
> which can now be removed. Release notes:
> 
>   https://wpewebkit.org/release/wpebackend-fdo-1.14.3.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...st-to-EGLNativeWindowType-explicitly.patch | 36 -------------------
>  package/wpebackend-fdo/wpebackend-fdo.hash    |  7 ++--
>  package/wpebackend-fdo/wpebackend-fdo.mk      |  2 +-
>  3 files changed, 5 insertions(+), 40 deletions(-)
>  delete mode 100644 package/wpebackend-fdo/0001-Cast-to-EGLNativeWindowType-explicitly.patch

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
