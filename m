Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C71C3DA7E
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 16:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AC4E401C2;
	Wed, 24 Jul 2024 16:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nIN7YJZS0RWS; Wed, 24 Jul 2024 16:18:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1179640E54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1179640E54;
	Wed, 24 Jul 2024 16:18:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB3F1BF29C
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 983A6401C2
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BAlLfEZKGre8 for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 16:18:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22A1F40E24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22A1F40E24
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22A1F40E24
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 16:18:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D10E1BF203;
 Wed, 24 Jul 2024 16:18:15 +0000 (UTC)
Date: Wed, 24 Jul 2024 18:18:14 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240724181814.7309ca72@windsurf>
In-Reply-To: <20240723211300.702319-1-fontaine.fabrice@gmail.com>
References: <20240723211300.702319-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721837895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nV8RanqkiHmXUumQrdk7FYrBzZ/eoN43ATUMZpj1ua8=;
 b=hQamZoGPND5nUvM6thjOw5pEj+sOJtw9Gq5dIBaGyc1looV8LWNrv5Zy52PW/WcvX88A6Q
 VyuBoL5QfsZnOvbOVCyGFq9cC5YyP/1zS+xc33fQA8gGMwb3ZO0IQ1183hNHqDwLr9jQiP
 ToRyBZCopiwnNib7RrrxuNp0AAva7p0X57Er1SjHAWFMaWdHme7X8ECFLI1GMAYn2Q5l4H
 sohcIp+xNLGiGIUw4bjyOt/po4740wUC9y7idqbh7MIN5mu62aW3lPddvr1ZBHNFaueZ+t
 xSK8QHGEPqNQi/yryJqlYP2SjnRmKcT3kd1BWmnFgjBu7AadeBdGn8QFDNE9dQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hQamZoGP
Subject: Re: [Buildroot] [PATCH 1/1] package/dvb-apps: drop package
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

On Tue, 23 Jul 2024 23:13:00 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> As advocated by Thomas Petazzoni [1], drop dvb-apps as package is not
> maintained anymore.
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20240723162533.549929-1-fontaine.fabrice@gmail.com
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  6 ---
>  Config.in.legacy                              |  7 +++
>  DEVELOPERS                                    |  1 -
>  package/Config.in                             |  1 -
>  .../dvb-apps/0001-Fix-generate-keynames.patch | 30 -----------
>  .../0002-Fix-compiler-warning-flags.patch     | 44 ----------------
>  ...0003-handle-static-shared-only-build.patch | 44 ----------------
>  .../dvb-apps/0004-Makefile-remove-test.patch  | 27 ----------
>  ...s-fix-build-with-kernel-headers-4.14.patch | 52 -------------------
>  package/dvb-apps/0006-fix-glibc-2.31.patch    | 23 --------
>  package/dvb-apps/Config.in                    | 14 -----
>  package/dvb-apps/dvb-apps.hash                |  6 ---
>  package/dvb-apps/dvb-apps.mk                  | 44 ----------------
>  13 files changed, 7 insertions(+), 292 deletions(-)
>  delete mode 100644 package/dvb-apps/0001-Fix-generate-keynames.patch
>  delete mode 100644 package/dvb-apps/0002-Fix-compiler-warning-flags.patch
>  delete mode 100644 package/dvb-apps/0003-handle-static-shared-only-build.patch
>  delete mode 100644 package/dvb-apps/0004-Makefile-remove-test.patch
>  delete mode 100644 package/dvb-apps/0005-utils-fix-build-with-kernel-headers-4.14.patch
>  delete mode 100644 package/dvb-apps/0006-fix-glibc-2.31.patch
>  delete mode 100644 package/dvb-apps/Config.in
>  delete mode 100644 package/dvb-apps/dvb-apps.hash
>  delete mode 100644 package/dvb-apps/dvb-apps.mk

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
