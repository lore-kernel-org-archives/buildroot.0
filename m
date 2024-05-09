Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9D3C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 21:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C68D61331;
	Thu,  9 May 2024 21:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_Ckti6sNwd9; Thu,  9 May 2024 21:05:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70D926133B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70D926133B;
	Thu,  9 May 2024 21:05:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABB941BF427
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A49B741606
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cT46l6VuYOPF for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 21:05:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02D97415E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02D97415E7
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02D97415E7
 for <buildroot@buildroot.org>; Thu,  9 May 2024 21:05:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2688FC0003;
 Thu,  9 May 2024 21:05:19 +0000 (UTC)
Date: Thu, 9 May 2024 23:05:18 +0200
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20240509230518.67b8e9b0@windsurf>
In-Reply-To: <20240424122240.136386-1-yegorslists@googlemail.com>
References: <20240424122240.136386-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715288719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VReXlUq9XxouhwLlxSACVXOAtSNAdLDnvW64YhB99Kk=;
 b=B25j7MUc0beWLvv7S8MggyiQlmaGqPJoXOerQKpWHvvQXVkTomYoPNLMI1TMOer7cG0sli
 NQLVC/kFYwUwc+M0L4z/eGMYSUQBEaeinw+7ESV5InYYjN79T8THnyJxwuesS7QYY3Ab82
 agIDFeN7uiueWgZfFepYcHsBqDLHp1mCWvbrVkrB+oJd5TBieQCsB9qo8pwLXF6UgJTdD5
 Kn2rleC2ZE4xaPClWKqtDXl1EaAOQKYP7YLONPtkNzBUxsK0NUz19nCTs7+UU8zq+wBbK0
 lJuOA0JwjpcioLypWwzPe6Jo6UlJdxKoplpnT+/J95bhnhEUW8S3uWetmo/yig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B25j7MUc
Subject: Re: [Buildroot] [PATCH] package/libxmlb: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yegor,

On Wed, 24 Apr 2024 14:22:40 +0200
yegorslists--- via buildroot <buildroot@buildroot.org> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

I've applied, after fixing two things, one small, one more important.

> diff --git a/package/libxmlb/Config.in b/package/libxmlb/Config.in
> new file mode 100644
> index 0000000000..702cc3d6f2
> --- /dev/null
> +++ b/package/libxmlb/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_LIBXMLB
> +	bool "libxmlb"
> +	depends on !BR2_STATIC_LIBS # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_USE_MMU # glib2
> +	depends on BR2_USE_WCHAR # glib2
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBSOUP

You select BR2_PACKAGE_LIBSOUP here, but you have no dependency on
libsoup in the .mk file, I don't see any traces of libsoup being used
in the libxmlb code base, and it builds just fine with only libglib2 as
a dependency, so I dropped this (apparently bogus?) select of
BR2_PACKAGE_LIBSOUP.


> diff --git a/package/libxmlb/libxmlb.hash b/package/libxmlb/libxmlb.hash
> new file mode 100644
> index 0000000000..6f364d1e04
> --- /dev/null
> +++ b/package/libxmlb/libxmlb.hash
> @@ -0,0 +1,4 @@
> +# Locally computed:
> +sha256  7050a3e43c4e1f53020cfbdfcb6fd5dc664c6c240faceb5ae3c8830423918262  libxmlb-0.3.19.tar.gz
> +sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
> +

This extra line in the hash file caused a check-package warning, so I dropped it.

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
