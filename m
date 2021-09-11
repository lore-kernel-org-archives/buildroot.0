Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5F2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:22:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 109B6611BF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 109B6611BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E13BC607F0;
	Sat, 11 Sep 2021 14:22:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 58Or-lq4sUY1; Sat, 11 Sep 2021 14:22:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A024607D7;
	Sat, 11 Sep 2021 14:22:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E0C41BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 494A0837A4
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:22:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54sNW2m5erVB for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:21:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BD0583684
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:21:59 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id x11so10500107ejv.0
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OijL3KIE/+SNmm7tyOxnlK0NElOyWkVLKUOrcPX3tR4=;
 b=KCwunKcP1lzuIWFqfN/bZ8msCCo9xzk38Sy9wEt7PFFBI0F4/pDsrkNRWNcFVWVvOF
 RkL/yFbfWFWz7BFf7E4YgsxHqNhV7c4A8H9KTfiXRydHhW1eTBGA255iebTSKzYeV/0j
 4A8AvNtPLiPx7a1+GmWjv2nuWMPk/f8ld4CuhnMJx+J2Sxy6LIPG4F+A9oNs3Ay2IYFW
 ochj64VBgautkTTG5uzPQKfjUhXPqW8Jw9ZfFVLfsEPovmsLcKpG3Gsb7LsldXKxDh4o
 SiVKmP+SkdcgmPleCBNCvUbBq+hngzfOkom51/Tf8tUIiD9UZ4FTWrkehHcU6XaF9ca9
 dbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OijL3KIE/+SNmm7tyOxnlK0NElOyWkVLKUOrcPX3tR4=;
 b=PtAy5s5NsOmp+Ui9B9YZJcHcrMX4Zt8AxkA0LUTqYXTMFtM0oRMsXhXreFx/4ZDSW4
 URj7pIbPIQo+71nif6NkV5pYQGlO2lGjXOymriLepGYHM3Jh6sNwi1PWqlLlOFrXS5hP
 c6ErBM8noAHtBDH2fg59s+k2EIAthOa1vDlm0rWRcXRQv/YgVo1hCV97L7gfjvS8QVeb
 tKzu4epBesEaOaydpDSzZ/4ng9/eCuhcScNqjmPIYyZXC6yDu+IrSqX24s7FYnAcleJl
 e3AQ2+C40tDowYFoHw4YTbO4TxV/wGPQX5CGV06QgtwJpx2gxdQxe/VT/CXlrAzugYdY
 p8Cw==
X-Gm-Message-State: AOAM533R/IYYWz7n3jinYXnNduLpNRRittvtIM1gKalo0XlnzXBTZftn
 s9dgqonhg/RAwTXkzuI0tsfOQw==
X-Google-Smtp-Source: ABdhPJxhmTkVbZrERZcRUGzY0vjirT6qMl57wayX9+Yq8IQWpheJPIHl78VScI9qhb6Y30OCNnvNqw==
X-Received: by 2002:a17:907:1c01:: with SMTP id
 nc1mr3146331ejc.504.1631370117497; 
 Sat, 11 Sep 2021 07:21:57 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id eg14sm1015367edb.64.2021.09.11.07.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 07:21:56 -0700 (PDT)
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 buildroot@buildroot.org
References: <20210830112431.144659-1-thomas.claveirole@green-communications.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <8b458e9f-5a63-cfe4-c534-31b8d90e75f4@mind.be>
Date: Sat, 11 Sep 2021 16:21:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830112431.144659-1-thomas.claveirole@green-communications.fr>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/vuejs: bump version to 3.2.6
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 30/08/2021 13:24, Thomas Claveirole wrote:
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

 Both applied to master, thanks.

> ---
>  package/vuejs/vuejs.hash | 2 +-
>  package/vuejs/vuejs.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
> index c2804961d2..1801a0c6e9 100644
> --- a/package/vuejs/vuejs.hash
> +++ b/package/vuejs/vuejs.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  ddd5e07483d18d2abd645c01200f57d5ffd1c3bf262cdb9f9e1a66a7b855d84a  vue-3.1.5.tgz
> +sha256  464ea5fdbcb51eee0b5f4762f169024b36a3bcd2c039ea8608b17fdd8a8595e9  vue-3.2.6.tgz
>  sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
> diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
> index 18e12f69d4..e2fc2c2dfb 100644
> --- a/package/vuejs/vuejs.mk
> +++ b/package/vuejs/vuejs.mk
> @@ -4,13 +4,13 @@
>  #
>  ################################################################################
>  
> -VUEJS_VERSION = 3.1.5
> +VUEJS_VERSION = 3.2.6
>  VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
>  VUEJS_SITE = https://registry.npmjs.org/vue/-
>  VUEJS_LICENSE = MIT
>  VUEJS_LICENSE_FILES = LICENSE
>  
> -# Install .min.js as .js
> +# Install .prod.js as .js

 I've added some text in the commit message to explain this change.

 Regards,
 Arnout

>  define VUEJS_INSTALL_TARGET_CMDS
>  	$(INSTALL) -m 644 -D $(@D)/dist/vue.global.prod.js \
>  		$(TARGET_DIR)/var/www/vue.js
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
