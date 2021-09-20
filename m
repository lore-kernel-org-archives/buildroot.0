Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA21C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:23:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B32F610A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B32F610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 161FF82A7F;
	Mon, 20 Sep 2021 19:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3upYwooO6Y9n; Mon, 20 Sep 2021 19:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 633AE829FD;
	Mon, 20 Sep 2021 19:22:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A21971BF955
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 901AF403A1
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6-2MZiC-mzTx for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 19:22:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0FA34045C
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 19:22:32 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id c22so65189885edn.12
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 12:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Rm8xirwWDNHFWlWgh9/uDd4rcstpfai2yPEVEMIzFf4=;
 b=S+ndE97+PfN/ezx1Q07Z5ru1YLW2XqqHRj7fFscOf2mhoyg36fCHMnY4crCbh+6H8V
 E4rbMA8xviBko3JJXGi6OwNEiZCODLN8eP5ZIN9m14Q+UfknZr153E6OYXKWOrbR8pJa
 /IVK1GHOpwvyIk4Rp9WBcVtVLxdKNxawOPEZWhP/ZLfIhKhfhXHMF7LQAxNW8OLpCzgD
 SHbKIxmyN+M8oYzBj+Jk6BnCXvwtZcUfd6SGwp/YPvnpRaUeYvSyOXsIllMGXRbDbeBP
 RkRHmggkXWFThkLZ1lEvSsdWIQu5sJWppDUF0nbqESfAE3xprkpCd7NzK6ve/6/TO7V4
 4f0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Rm8xirwWDNHFWlWgh9/uDd4rcstpfai2yPEVEMIzFf4=;
 b=gyKbY/CZOC3cc10b09JDoHOy1TgMtiLtUUvFJfIr71zbpMWgl1Ej9ckMvAng4ckxo7
 ibDE3t6UF6eBd3smaGyGtdErYSf5zWGOJ61bGT/oBP6Fs8IBBZWnUSu9Vwsgr45af1B/
 WxuRybY+wTbCIC/tZRnxCg0r79MxgKpzRTFz/5KL+PANUk7NRRgrxzKY1wEBC+qwazLL
 CNVedw9r3W1waTi208BhI7i4GM6q4MyqLp/gc6DmcpeIAn8Fz1dVKy0DMRykLizm0z/S
 r4tN0YaBvUF5NA6KGyb47dxPSN9fnTsKvzwqgA6xiSJ8J+GNd/IO5G92nGL/5/aIw9mk
 J03w==
X-Gm-Message-State: AOAM5317jrl2wCyCM9FH2D/2styr30bqDWtgUMqgJO6xzExhJQE+obpK
 IRQzXohKfkVrEc/zjZw7nkMInjlTyAEUPw==
X-Google-Smtp-Source: ABdhPJz5Tj9/gh+ZTNyFyZVCu2XKLm3BFRB6KuOgiCRta6q48B0LqIM43P2wdwVopTCiPx+f+6kjnA==
X-Received: by 2002:a17:906:d8a4:: with SMTP id
 qc4mr30853598ejb.323.1632165750887; 
 Mon, 20 Sep 2021 12:22:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e22sm7684599edu.35.2021.09.20.12.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 12:22:30 -0700 (PDT)
Message-ID: <78bc73e5-3ce9-4bb3-e7cc-b05c549e7a5a@mind.be>
Date: Mon, 20 Sep 2021 21:22:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210908202509.860895-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210908202509.860895-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gssdp: bump to version 1.3.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 08/09/2021 22:25, Fabrice Fontaine wrote:
> Disable gtk_doc (enabled by default since
> https://gitlab.gnome.org/GNOME/gssdp/-/commit/652edd5c0145c0a542017840e3f3bc22b9ade159)
> 
> https://gitlab.gnome.org/GNOME/gssdp/-/blob/gssdp-1.3.1/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gssdp/gssdp.hash | 4 ++--
>   package/gssdp/gssdp.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
> index 2f13c0a847..4954568420 100644
> --- a/package/gssdp/gssdp.hash
> +++ b/package/gssdp/gssdp.hash
> @@ -1,5 +1,5 @@
> -# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.3/gssdp-1.3.0.sha256sum:
> -sha256  e739cf33f813403a53973cd8f2882dcd7208bad9582269f7066fc9e8ea3a52cc  gssdp-1.3.0.tar.xz
> +# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.3/gssdp-1.3.1.sha256sum:
> +sha256  affbf145c26e02dda9d31f9da9fd5182bd2cc36565ab8ee2e877567b2fd206cd  gssdp-1.3.1.tar.xz
>   
>   # Hash for license file:
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
> index 9e67d35db1..c7982f16c5 100644
> --- a/package/gssdp/gssdp.mk
> +++ b/package/gssdp/gssdp.mk
> @@ -5,14 +5,14 @@
>   ################################################################################
>   
>   GSSDP_VERSION_MAJOR = 1.3
> -GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).0
> +GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).1
>   GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
>   GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
>   GSSDP_LICENSE = LGPL-2.1+
>   GSSDP_LICENSE_FILES = COPYING
>   GSSDP_INSTALL_STAGING = YES
>   GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
> -GSSDP_CONF_OPTS = -Dexamples=false -Dsniffer=false
> +GSSDP_CONF_OPTS = -Dexamples=false -Dgtk_doc=false -Dsniffer=false
>   
>   ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>   GSSDP_CONF_OPTS += -Dintrospection=true -Dvapi=true
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
