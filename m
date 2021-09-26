Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DE1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:42:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18E2A6103B
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18E2A6103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6053402E0;
	Sun, 26 Sep 2021 21:42:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id diD4eJPL--8S; Sun, 26 Sep 2021 21:42:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7DD4402D3;
	Sun, 26 Sep 2021 21:42:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A045E1BF370
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FF00818E8
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:42:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2HNfq3P1WblN for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:42:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9230818E6
 for <buildroot@busybox.net>; Sun, 26 Sep 2021 21:42:23 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id ee50so60781294edb.13
 for <buildroot@busybox.net>; Sun, 26 Sep 2021 14:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:cc:organization:in-reply-to
 :content-transfer-encoding;
 bh=vf5entVQ31MuQIT2Yd4FHB0RW6DbMiutUuAh0gG2PkU=;
 b=CwrNYgW0kWLuL65CgqLnD15pGUgYoMaoYDbZ8riJtt5wEoPsE+w9xk1Y1QtFXMa9N8
 h8wPMgzxfoDhljQ4p2gxFrCXFg58mUcETxNJEPRuExPo8uufHxtio37cuj5jfrYCCiS6
 pIukJRpSiPrCO8uEEj2h/dELlp5WOmVx61zaA5GIMadP7BE1iwkWJRPcglyvd/gqT33D
 sj58u3lVnlm8V42ZXtO0k4iSQSKWojmqhBiHpZmrLf75KXqmYOgk/ozVBJGdRHBiVWd9
 FXn9jOhllnB99mWmJuVOcvLmTMYR3BxcMftMD6aq7REiYicbT5QDlRkizAptFxa3n2jG
 le6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:cc:organization:in-reply-to
 :content-transfer-encoding;
 bh=vf5entVQ31MuQIT2Yd4FHB0RW6DbMiutUuAh0gG2PkU=;
 b=CvkY8KHe3LTAEJfRjbkkdn8HqHorNA/GFx2yXEykVNBGlt1/Kdj+2VXfmY6htcSjx9
 5JwpXg6ReqVWFBCde14qKR0STZiTIR2DvrgcBYu2EGsgyFgZD0zyBg4rCmzL+h0wi88T
 DpbuKsAJsDyLrVBA4lD7fABKjVntjB5gdZN4P1eF/irGKAN1nTOL7n+IyYYXehMaAAz6
 AUZUWONJXHMiJ+LJNuFe3rm6yLqTOmrHhX99Rn3F9w3JLchOplC8TJ3RKsr7OT25dGYd
 QIZluDnfych6WTSY2vWmZqOZTbz1UIN8vPntg/Bez5Aqm4K4qtjqzB4b5AiJj1uDUwSb
 sUgw==
X-Gm-Message-State: AOAM5318ZjH6bMTvapKP1jKLcW6y+i/QGyrF9ZcP2SSeZrHnQvh164zH
 xw+eA0CjduAkpASR2OxwR40Unw==
X-Google-Smtp-Source: ABdhPJywCfKywlAqMSkzLFMFcHCZwuNyt/s6zy/n9JJ+UEGojH/pOgL0OAVmqW5T3N1kGsWS3cfcDQ==
X-Received: by 2002:a17:907:7785:: with SMTP id
 ky5mr24187577ejc.247.1632692541598; 
 Sun, 26 Sep 2021 14:42:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b5sm1756910edu.13.2021.09.26.14.42.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 14:42:21 -0700 (PDT)
Message-ID: <fba75762-e27c-7530-b133-b11735c24c7b@mind.be>
Date: Sun, 26 Sep 2021 23:42:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20210920192442.2784967-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210920192442.2784967-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/mstpd: new package
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
Cc: Vadim Kochan <vadim4j@gmail.com>, Serhiy Boiko <serhiy.boiko@plvision.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Francois,

On 20/09/2021 21:24, Francois Perrad wrote:
[snip]
> diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
> new file mode 100644
> index 000000000..0e5c9714c
> --- /dev/null
> +++ b/package/mstpd/mstpd.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# mstpd
> +#
> +################################################################################
> +
> +MSTPD_VERSION = 0.0.9
> +MSTPD_SITE = $(call github,mstpd,mstpd,$(MSTPD_VERSION))
> +MSTPD_AUTORECONF = YES
> +MSTPD_LICENSE = GPL-2.0

  There is actually hmac_md5.c that has a different license. So I added that 
one, and I added it to LICENSE_FILES as well and to the hash file.

> +MSTPD_LICENSE_FILES = LICENSE
> +


  Vadim (in Cc) posted the same package a year ago. He had

+# mstpd requires that it is installed into /sbin, not /usr/sbin
+MSTPD_CONF_OPTS = \
+	--sbindir=/sbin

which he later explained with "it should point to /sbin because
Linux's bridge implementation calls /sbin/bridge-stp in case the STP
handling is delegated to user space." - which sounds pretty feasible to me...

  Did you test this with STP and with a non-unified /usr?

  I've anyway alreayd applied as-is to master (with the license fix), but please 
check if the --sbindir is needed.

  Regards,
  Arnout

> +$(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
