Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473AED5B146
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C76981776;
	Mon, 28 Oct 2024 20:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3rjPmNlcp7q; Mon, 28 Oct 2024 20:23:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A0368179C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A0368179C;
	Mon, 28 Oct 2024 20:23:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D6F24EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BD65608E2
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VeHgY41mAbF1 for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:23:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D846E608D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D846E608D1
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D846E608D1
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:23:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A77AC1C0002;
 Mon, 28 Oct 2024 20:23:30 +0000 (UTC)
Date: Mon, 28 Oct 2024 21:23:29 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241028212329.297e61dd@windsurf>
In-Reply-To: <20241028192609.459318-1-bernd@kuhls.net>
References: <20241028192609.459318-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730147011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u4hCXvzk36W82w3jzmzE3frFx4/3sKRNeUSHlG7ldMY=;
 b=Ci2cXJvlmDvn5rvCgzS4gt3f2Zyn9KurSlDGO4EH9B0jwsDRNO9SlUSRB1f1O0FdzV0D7Z
 HU73MXE1mEPIfQyat846TwLZPCijwbXOtyoZ4+9aPMKOTC5od6SbcCDcWF9eyC1avFxFuS
 DGnKYw3jHnDsODyGulVlfmrjv/Zh8p05gfA9tV+iKRt2LSWBXnifQAGsbltPWsE/z8M1vv
 ek4twHDimexEzX5rw9+dmwGRKPyO+JvzLuYgmw4Im20TVwMhaXBYDjnH40zVyvngIHf+rs
 G/PYpXghESRAEdmVLfVRueQ7/VM6ErufaXPN0rL9ndgAv5JnV2zEO57poJCy4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ci2cXJvl
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: fix build
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

On Mon, 28 Oct 2024 20:26:09 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 0a0a0b3de4..d081bbce89 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -21,6 +21,7 @@ APACHE_DEPENDENCIES = host-pkgconf apr apr-util pcre2
>  
>  APACHE_CONF_ENV= \
>  	ap_cv_void_ptr_lt_long=no \
> +	ac_cv_func_gettid=no \

I'm afraid this is not the proper fix. You're pointing to a build issue
on glibc, which does provide gettid(), which is why the test
successfully detects it. The issue comes from the fact that the apache
code forgets to include <unistd.h> with _GNU_SOURCE defined, which is
needed to access gettid().
See https://man7.org/linux/man-pages/man2/gettid.2.html.

Could you have a look into this, and submit a patch to upstream Apache?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
