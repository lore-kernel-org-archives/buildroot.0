Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB0CC52D7C
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 12:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4609940711;
	Thu, 15 Aug 2024 12:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amSjIRMANtPe; Thu, 15 Aug 2024 12:52:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32286406B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32286406B9;
	Thu, 15 Aug 2024 12:52:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9A421BF574
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96A774039D
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 12:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lg-9Hb0mRaSp for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 12:52:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B51E4026E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B51E4026E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B51E4026E
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 12:52:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5891020004;
 Thu, 15 Aug 2024 12:52:32 +0000 (UTC)
Date: Thu, 15 Aug 2024 14:52:31 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240815145231.500ab55e@windsurf>
In-Reply-To: <20240815092616.1201832-1-roykollensvendsen@gmail.com>
References: <20240815062841.1051418-1-roykollensvendsen@gmail.com>
 <20240815092616.1201832-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723726352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qTso8yzX0mT0oeerpptvLB9JjVKgSw58NhMo/AZUCuw=;
 b=gFkA1raW5gYq6EMrDoUKSuctBkpNkMc5jLQLwceJH/2fWZVrN0X7iGif5Y5EroDBJdaCPF
 MJ13UvUzQ6pwcf+O7p/gOTzwDHntidrIqlD7Em83vcWWYsnWG64PyoO3EUeu9fmy2toSUF
 8lHS6PA6h/ubD3gFLHihKx8TOC+39l9vJgQM5t4xZZhi90aVVdvcJYbzpzYWVraXbFbBfW
 c2cLwWEsy0xf0lOMK/4ioC6r1MprRmtLsv2r0CIoGknrMJ8mARxsPp1OKAPFtdNrFn1/6G
 as0G6uUS5dWzr1Wm3PQZQK/MCl4vcnCY8qvs0g1ByZAacUtVq93wvBvhBUnIhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gFkA1raW
Subject: Re: [Buildroot] [PATCH v2] package/qt6base: fix CVE-2024-39936
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy,

On Thu, 15 Aug 2024 11:26:14 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Fixes:
> https://security-tracker.debian.org/tracker/CVE-2024-39936
> 
> Got patch from:
> https://github.com/qt/qtbase/commit/2b1e36e183ce75c224305c7a94457b92f7a5cf58
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

Thanks, applied to master, after doing two tweaks. First,
package/qt6/qt6base: as the prefix in the commit title (to match the
real location of the package).

> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index 5ab61ba3e0..71dff3e672 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -10,6 +10,8 @@ QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
>  QT6BASE_CPE_ID_VENDOR = qt
>  QT6BASE_CPE_ID_PRODUCT = qt
>  
> +QT6BASE_IGNORE_CVES += CVE-2024-39936

And second, after adding a comment above this line that clarifies why
this CVE is ignored (just mentioning the patch file name is enough).

Indeed, not all CVEs are ignored because we have patches. Sometimes, we
ignore CVEs because they are irrelevant in the Buildroot context for
example, in which case we have a comment that explains why.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
