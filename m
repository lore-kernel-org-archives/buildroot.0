Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5ECCE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 632514142D;
	Mon, 17 Nov 2025 19:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFmZxBVfwqnF; Mon, 17 Nov 2025 19:52:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56C0741430
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56C0741430;
	Mon, 17 Nov 2025 19:52:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 181061BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF06441431
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gt7PgsqeRlTe for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:52:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ADEDC413F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADEDC413F6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADEDC413F6
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:52:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4B770B9798FE; Mon, 17 Nov 2025 20:52:15 +0100 (CET)
Message-ID: <02dfb9d9-dc7b-48b6-a7d6-e228e7990715@rnout.be>
Date: Mon, 17 Nov 2025 20:52:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20251013210940.511743-1-bernd@kuhls.net>
 <20251013210940.511743-3-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251013210940.511743-3-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409135; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=ZaK+UfWYwMCyJfhzwmixqeKGjrL1ZrgbmsGzvgNa/K0=;
 b=VMzcqayKMWQ+ylVXwC6tRtrNqnsPrrkv4UGKRzniGmkVZgj0KFtPZfLcsbf4WSAKiGYVdp
 tXIuCETw1hyrxGNJISpeU7LJcYx+KEppGmdt53CeK8agOJ2pt46by2LaVSQ8t1toZ7Nlwt
 7PVdGrQlNWYd6nmi3d31Vuq9wz0kg+ZXnpiisqHN2ftO1dByC4uAzpuP1x7cdXjUvcM6aW
 DQTdJfHidipA8nDdiGIv/gx7tNPR8MbnUkYUXTZamunvKISvTxS975Ru7w4kW0qvAuCRFf
 bu+XN8GFIBuWsfq6i7to3+JiF85oMj74Z+XD82EAuC2LueYA7gJAwbk8ebVCcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VMzcqayK
Subject: Re: [Buildroot] [PATCH 3/3] package/libxslt: security bump version
 to 1.1.43
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/10/2025 23:09, Bernd Kuhls wrote:
> Release notes:
> https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.43.news
> 
> Fixes CVE-2025-24855 & CVE-2024-55549.
> 
> Switched _LICENSE_FILES to Copyright due to upstream commit
> https://gitlab.gnome.org/GNOME/libxslt/-/commit/29938a64f6449aceb3e97a9e8da10abe2e27a314
> in version 1.1.36 and the removal of COPYING in the 1.1.43 tarball,
> although COPYING did still exist in the 1.1.42 tarball.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/libxslt/libxslt.hash | 6 +++---
>   package/libxslt/libxslt.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
> index dd67940c8a..98c68eded1 100644
> --- a/package/libxslt/libxslt.hash
> +++ b/package/libxslt/libxslt.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.42.sha256sum
> -sha256  85ca62cac0d41fc77d3f6033da9df6fd73d20ea2fc18b0a3609ffb4110e1baeb  libxslt-1.1.42.tar.xz
> +# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.43.sha256sum
> +sha256  5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403f0183a  libxslt-1.1.43.tar.xz
>   
>   # Hash for license file:
> -sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  COPYING
> +sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  Copyright
> diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
> index b5bb22f9ae..e92b383b89 100644
> --- a/package/libxslt/libxslt.mk
> +++ b/package/libxslt/libxslt.mk
> @@ -4,12 +4,12 @@
>   #
>   ################################################################################
>   
> -LIBXSLT_VERSION = 1.1.42
> +LIBXSLT_VERSION = 1.1.43
>   LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
>   LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
>   LIBXSLT_INSTALL_STAGING = YES
>   LIBXSLT_LICENSE = MIT
> -LIBXSLT_LICENSE_FILES = COPYING
> +LIBXSLT_LICENSE_FILES = Copyright
>   LIBXSLT_CPE_ID_VENDOR = xmlsoft
>   
>   LIBXSLT_CONF_OPTS = \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
