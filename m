Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DFDC67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 20:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00BDE408C5;
	Mon,  8 Apr 2024 20:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmuUZAXI8C10; Mon,  8 Apr 2024 20:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1478440C1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1478440C1C;
	Mon,  8 Apr 2024 20:59:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BAB571BF292
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A80C640C1C
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5TEttVTFFQO for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 20:59:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 640C5408C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 640C5408C5
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 640C5408C5
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 20:59:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E062140002;
 Mon,  8 Apr 2024 20:59:13 +0000 (UTC)
Date: Mon, 8 Apr 2024 22:59:12 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240408225912.2603c2cf@windsurf>
In-Reply-To: <20240407092105.276261-1-fontaine.fabrice@gmail.com>
References: <20240407092105.276261-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712609954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3LlO2xrfvEh4y3/I+AkZgmFsyjyHxKfEEAEPGcwpjoQ=;
 b=Q3ZD9BMURRnZ4lcwV2iSh2ZOZ6KuQkebOlxt04pBL/3rJ9w17KV8VdApMZxrkFVG4EuLZZ
 dlu8Vk9rBKKcwC8DOg3qoOIznb85kg+v3zz/F3a2RKbHq8Y1R2IQTrZ8dnGAZQQYkI2mCT
 FT6jM7+pQro/ks+d1kNmEiCfSUcQq7Z/m7gw4TEYRX0SmD8Z52InuJTV2hDcwS80EH6P0m
 Jq5fFwKmULz8l+jzhHY1sKbHfb23csnDAfomJDSVbu0Qej6D/Evn5lOq/jaC6Xa3bGf8mn
 oJJnU0+hy8JBGtN62aG4OxJitmddbZtgQ1suMFH+tBHHp56TpREc9ASfBV2gfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q3ZD9BMU
Subject: Re: [Buildroot] [PATCH 1/2] package/libnpth: fix musl build
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Apr 2024 11:21:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following musl build failure raised since bump to version 1.7 in
> commit 3ef4d24192b20bd1eb5e34c9fa2a6aa5bde91f91 and
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=575573b5b63e147b1906240f192dbe37a26ca4b9:
> 
> npth.c:392:21: error: unknown type name 'npth_rwlock_t'; did you mean 'npth_cond_t'?
>   392 | npth_rwlock_rdlock (npth_rwlock_t *rwlock)
>       |                     ^~~~~~~~~~~~~
>       |                     npth_cond_t
> 
> Fixes: 3ef4d24192b20bd1eb5e34c9fa2a6aa5bde91f91
>  - http://autobuild.buildroot.org/results/d986ba27b734679fd70b4e0f23278ebd38e13c5d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...EXPOSE_RWLOCK_API-for-musl-C-library.patch | 37 +++++++++++++++++++
>  package/libnpth/libnpth.mk                    |  2 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 package/libnpth/0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
