Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EB1C52D7D
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 13:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2DAD40B47;
	Thu, 15 Aug 2024 13:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BINyRmOrQVma; Thu, 15 Aug 2024 13:34:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7A4640B5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7A4640B5F;
	Thu, 15 Aug 2024 13:34:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE74D1BF2A2
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 13:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC21540247
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 13:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WVmOKMZ68ay for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 13:34:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7CD5540190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CD5540190
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CD5540190
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 13:34:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDBE620004;
 Thu, 15 Aug 2024 13:34:20 +0000 (UTC)
Date: Thu, 15 Aug 2024 15:34:20 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240815153420.3b099053@windsurf>
In-Reply-To: <20240815130718.1550384-1-aperez@igalia.com>
References: <20240815130718.1550384-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723728861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gU2tfZX9VM4Aqblmfvbab51E1iGxAA5A20pCBynXxHU=;
 b=fb9SzmdBR9C99E8JMVsJFqOI6zqoRmaaJmKoqfZuaXqHD/bbK0/KeB4jGJqMIqzk4jw7yw
 ncJ9ff1aEXtELmhBtgC6M0BjkgST/aBuIWbb6xpYK8MYzUp9iMLSf0GJ9GE53X7TVUGB2X
 hM6SuYjXtx63rEgW+5oWiwu58m1sjcvvqbHfS61A1Uq7JUtkSoBGknjCBXwVnz2URTLuvy
 v0BE2te1uGwVG6LDw6MYiMrYpHACrDSLzbH84RzCeU6/EK4PrDOUKIN9hnGAQPRMYoHuuG
 XKV1GPt37TR7VJTB/J459z6IF2lNdNiwoFUzg88WJbABA7O6+ZjE/Ur2IndmTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fb9SzmdB
Subject: Re: [Buildroot] [PATCH 1/1] package/wpebackend-fdo: add patch with
 missing EGL cast
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 15 Aug 2024 16:07:16 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Import a patch that has been accepted upstream and fixes build failures
> caused by a missing explicit cast to EGLNativeWindowType.
> 
> Fixes: http://autobuild.buildroot.net/results/92c5cc3134e92c263a0cbb4c05ef8956569e434b/
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...st-to-EGLNativeWindowType-explicitly.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/wpebackend-fdo/0001-Cast-to-EGLNativeWindowType-explicitly.patch

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
