Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F27C5AD4E
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 20:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91A676063F;
	Sun,  9 Aug 2026 20:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKEPa5hERSfC; Sun,  9 Aug 2026 20:29:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 352826061C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786307356;
	bh=PzdYpooTR08A/Ykruvg0UIondzh/opwDH7jKeBcG9CM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lwEwtUgcxoBSZMaJRHbA6i/e/DJedRNDMSslb76Hg6fleI/tllaDmRNhXIujc7ZA2
	 QP/k/0t/O1Rf5Hx5hoXXA6zaylM9JlsvwcqYgR/xemgDdagWw1d2quljWfuc0Nz9Rk
	 X6O8DC1C9BmVdHkTIgM+/PiyXtAgV6HDLlSQVnndVLld9Upu4UmBE9d0cGESvvgpR4
	 gURpKJg+fPu3wvt+57cf7eSxuz5v2wlXH3Lilh/5kXkc1kZAYHLiF7na5vWDbyZvhF
	 Di2HWJ1FKNAOy9uWgRb1gEgVjBXEsvYOVZMhp0RvUx0+/W4mCg+SO85qxlVJXf1YEJ
	 pyDJ2hn/k3FtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 352826061C;
	Sun,  9 Aug 2026 20:29:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC23040A
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C22CF80C64
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6mJhovBlh2T for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 20:29:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACD9380C66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACD9380C66
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACD9380C66
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:29:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9857B1A1487
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:29:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6DB2C6033B;
 Sun,  9 Aug 2026 20:29:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4D30B11C494E9; 
 Sun,  9 Aug 2026 22:29:06 +0200 (CEST)
Date: Sun, 9 Aug 2026 22:29:05 +0200
To: Alsey Coleman Miller <alseycmiller@gmail.com>
Cc: buildroot@buildroot.org, =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>
Message-ID: <anji-UrwHCkDrzFm@windsurf>
References: <20260809201403.3855903-1-alseycmiller@gmail.com>
 <20260809201403.3855903-2-alseycmiller@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260809201403.3855903-2-alseycmiller@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786307347; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=Gb925liWjupoLNkRr9kg3tUT8qzyHdjfUe8codnIRIs=;
 b=a5dKeb1S8BezV1Bq+pc9tGwUuX8sn2JqXOwcE9GXVWimJn72KeKFM1VQZyjcktGEswVW4c
 RfwmH50BwcPSMraZRYj2GBmbqlPCYPhU5g06I1vVj2ZrIFv8vLVXzXgCQQ8sCeeuNaC7mi
 xAk4+2Ipg7nP1eZr2lXplWPV8lR5GnuSLe0SNRp/Z1uZe9slGHU4VSYk2lVdtQqOuovUnl
 5ns6feDhtAqyGwUFflzNum5Y/UI3kDahdO82FRJ344cYG7FGflymdm3XiLAH8DOxaZTF4a
 jWJXhPxR66fuYf0/0IjDlS99nDmiYrWzvqsYG3zBfjg5EC9v7SPcIL69WE/oVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=a5dKeb1S
Subject: Re: [Buildroot] [PATCH v2 2/2] package/wine: select libxkbcommon
 and libxml2 for the Wayland driver
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

Hello,

On Sun, Aug 09, 2026 at 04:14:03PM -0400, Alsey Coleman Miller wrote:
> wine.mk passes --with-wayland whenever BR2_PACKAGE_WAYLAND is enabled,
> but nothing guarantees the rest of what wine's Wayland test needs is in
> the configuration. That test is:
> 
>   WINE_NOTICE_WITH(wayland, [test -z "$WAYLAND_CLIENT_LIBS" \
>     -o -z "$WAYLAND_SCANNER" -o -z "$XKBCOMMON_LIBS" \
>     -o -z "$XKBREGISTRY_LIBS" -o "$ac_cv_header_linux_input_h" = "no"], ...)
> 
> and because --with-wayland is passed explicitly, WINE_NOTICE_WITH turns
> into AC_MSG_ERROR rather than a notice.
> 
> So wine needs libxkbcommon, and it needs the libxkbregistry part of it,
> which is only built when libxml2 is available. Select both when Wayland
> support is enabled, and add libxkbcommon to the build dependencies.
> 
> Note that libxml2 is not a direct dependency of wine, it only has to be
> in the configuration so that libxkbcommon builds libxkbregistry; the
> build ordering is handled by libxkbcommon's own dependency on libxml2.
> 
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>

Thanks for this new iteration!

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
