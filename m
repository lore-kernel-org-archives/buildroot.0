Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710CBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2960840616;
	Sun, 27 Mar 2022 16:29:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DnS52LqhoF8a; Sun, 27 Mar 2022 16:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB741404D0;
	Sun, 27 Mar 2022 16:29:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 105D01BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F409E818EC
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gT7WqysGREtq for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:29:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0824C818CD
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:29:27 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id u26so14397257eda.12
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=lmEbV4nh5/o5l9Zx5moFfhRG2z40zFgwwWCSWB8FttQ=;
 b=HlfIixHhKuhi0lbGdw7LWsCJr9UC3cBA/UR5VCCK/M/uwuVEtDzASbZGw3XwOg4On6
 EldGVQ0XAuOwzeAoYUFm2LLbEq8V74arhfioKpUNe57+zZzqHqlZFezdRdbYI1QrWv+w
 KGHlO/A6Q0MMqVSWGuEK7OdFlQ68g6EkNII+Bl/q0Fz7GQz46CZQxTFCEphnPtLIR4qR
 HSRFelRUfqT1PPzbq8cLBcq+RZ96CRgLe0bgt8x+voQI69nQKZLwskgSZmS4ZHINcofo
 pQIUTlMIkFL+tehV/SrSy5uM/3HVC5Erc4Bla3ATDRqvfmfa8+h7OxOTs7QJBUt3xEAP
 0rtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lmEbV4nh5/o5l9Zx5moFfhRG2z40zFgwwWCSWB8FttQ=;
 b=SHPfKuvEAZ9ApPmYQ5EBJd03vHGAY4B3WCfk6k4sUdyB/VDseQw50HPpZP1oLiZERT
 OhnBKrxybuYFb4vrzrKj7XTynlN8TKNcH8aZtRbbwy2X1u5Sx6isGSI+xXsvEE5iHBtd
 11LfiouofPWYbZGc3Aa9FMgZV1+CBsdfKOJRNcPyftOhgK5Y1MdtIzHzcxAyeDapk3l2
 cDmE2IYutJEQ/kwpj4xN+aWKx8Y2HYkwrYSGf2/aTlMVICPT9y5wy7nmX5YaSfVguDtn
 0i4uqn0Bd2uhrhnutK03ye0oLn2iGruquY25d9n7xeQBhYY+KyrozbOko8g+d70/IBaO
 3pMA==
X-Gm-Message-State: AOAM531TI/lwLPkbMQkvj+g5+tDvNtC/IRsIetz92nZUUit5kI30aNKe
 HzbD1zyfZ+mfl6ArKp21Y6KbHq0cQoNP+g==
X-Google-Smtp-Source: ABdhPJzpRGnlN+DEfagafxyl8vKaCIxtyFZV+hLEb9XDJLyUyp26g523Iuq0oTf5/Fd9Ihq8uI+xcQ==
X-Received: by 2002:a50:99cd:0:b0:418:d6c2:2405 with SMTP id
 n13-20020a5099cd000000b00418d6c22405mr11094064edb.342.1648398566070; 
 Sun, 27 Mar 2022 09:29:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a05640242cb00b0041922d3ce3bsm6067850edc.26.2022.03.27.09.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:29:25 -0700 (PDT)
Message-ID: <8c605bb1-5f14-d29b-43fb-6ce9b44ad7f5@mind.be>
Date: Sun, 27 Mar 2022 18:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220325211725.612796-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220325211725.612796-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/atk: bump to version 2.38.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/03/2022 22:17, Fabrice Fontaine wrote:
> https://gitlab.gnome.org/GNOME/atk/-/tags/2.38.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/atk/atk.hash | 4 ++--
>   package/atk/atk.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/atk/atk.hash b/package/atk/atk.hash
> index 2e7c3b5fec..d8cd69ff1f 100644
> --- a/package/atk/atk.hash
> +++ b/package/atk/atk.hash
> @@ -1,5 +1,5 @@
> -# From http://ftp.gnome.org/pub/gnome/sources/atk/2.36/atk-2.36.0.sha256sum
> -sha256  fb76247e369402be23f1f5c65d38a9639c1164d934e40f6a9cf3c9e96b652788  atk-2.36.0.tar.xz
> +# From http://ftp.gnome.org/pub/gnome/sources/atk/2.38/atk-2.38.0.sha256sum
> +sha256  ac4de2a4ef4bd5665052952fe169657e65e895c5057dffb3c2a810f6191a0c36  atk-2.38.0.tar.xz
>   
>   # Hash for license file
>   sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
> diff --git a/package/atk/atk.mk b/package/atk/atk.mk
> index dfeb4de8b2..2820fb486d 100644
> --- a/package/atk/atk.mk
> +++ b/package/atk/atk.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ATK_VERSION_MAJOR = 2.36
> +ATK_VERSION_MAJOR = 2.38
>   ATK_VERSION = $(ATK_VERSION_MAJOR).0
>   ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
>   ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
