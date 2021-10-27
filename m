Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AA9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:15:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CFFF610A0
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CFFF610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3412B80EDD;
	Wed, 27 Oct 2021 20:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6kxvHJPzTzTL; Wed, 27 Oct 2021 20:15:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D59880D13;
	Wed, 27 Oct 2021 20:15:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2236B1BF3D4
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F6BB80D13
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-mqLopj0A-o for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:15:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3226480CF2
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:15:15 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id w15so15321887edc.9
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 13:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=h1sIpvuQV+VrL6PBlU/RQto/si6+2Axhbh6Xoi95X+s=;
 b=Pr1pP14SC5qhFs4dszCMQjv3wYinq1N9d/spZEB4Pc8m5Hjf8azR/Ti8sdn/W17yEq
 mzCedUfMPBzlJr2UDJAlQecZh8yerhys1vWV6s2oHa7z9ndoruiUtB6rI1HLpozRV/GS
 tXzjLNF82IeddTTMO2/uvmd2yrZGhGYXZsUWFQdXCixdnGlrrkHgqNw81eacElZKfDbV
 SBh0FyFkFHf0aTsKKNl4LSSpO1/K/MWwKQkrEgyl8Y5cGBmPolp8tOX43gj+mATRiD29
 Io4UGYLnhmHEm5hsBSNGH+KZbToSpvKe0sdiZt1lRjLFkZa2q5/TH2e4DfdV7n8oXJGG
 ax+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=h1sIpvuQV+VrL6PBlU/RQto/si6+2Axhbh6Xoi95X+s=;
 b=XUpBI+ZeEjQ30azXQv93JIgEMmYZYz+WZLgeJq1sWD7v9byFG5tpbMADV4BvuzhCNk
 fi0tuTau+J+VCiGsB3HMwhOK6iunyoSzBm2b2PWswCh9NjssmfHNXfY+v4oNziHxWX/E
 EN7EQb5FoI9ekr31pPTEsohVQurnQf39Zoz5aPTB5YdHxuxYP/FDC/c2YSf2pG4bc9KM
 TAz7Fm53WJEzgxewfrs1EYuW4yfisA59FRbdN5tUPyqiJ0lbv1WdPndwQMQkNnjuMKfU
 GGPSDnvFFyfFjLae4q/bikeULMze0CDEhXQ2LvWIBwkz3X+t6kU8lP636tCKcU4k9Hdq
 M2kQ==
X-Gm-Message-State: AOAM531CPwE7gj+ZngeVvu5k64/7PmK6R+/CGn59sDL8TzJP5lAjlG7N
 wl1qORhtq6WdCyzDPds8/SYwtg==
X-Google-Smtp-Source: ABdhPJwpq8GDOioTo3iAgMfFePlFGD6Cq3XLpTdrDk6YNjUYEqmUOLJ0RZLEMiYFgmiA4E+WiLVTUQ==
X-Received: by 2002:a05:6402:5255:: with SMTP id
 t21mr46228649edd.103.1635365713424; 
 Wed, 27 Oct 2021 13:15:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p3sm426676ejy.94.2021.10.27.13.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 13:15:12 -0700 (PDT)
Message-ID: <2cd7c47c-a4f5-686d-4936-f6f1bdf1fd71@mind.be>
Date: Wed, 27 Oct 2021 22:15:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Herve Codina <herve.codina@bootlin.com>, buildroot@buildroot.org
References: <20211011085449.285731-1-herve.codina@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211011085449.285731-1-herve.codina@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/php-pecl-dbus: new package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/10/2021 10:54, Herve Codina wrote:
> The php-pecl-dbus package provides a PHP extension for interaction
> with D-Bus busses.
> 
> https://github.com/derickr/pecl-dbus
> 
> Based on initial work from Nicolas Carrier <nicolas.carrier@orolia.com>
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

  Applied to master, thanks.

[snip]
> diff --git a/package/php-pecl-dbus/0001-php8-compat.patch b/package/php-pecl-dbus/0001-php8-compat.patch
> new file mode 100644
> index 0000000000..bef9a1fa05
> --- /dev/null
> +++ b/package/php-pecl-dbus/0001-php8-compat.patch
> @@ -0,0 +1,161 @@
> +From 7fde4dd4d26d2a4b7957a1010c6ea9e4b940fc62 Mon Sep 17 00:00:00 2001
> +From: Stefan Saraev <stefan@saraev.ca>
> +Date: Mon, 18 Jan 2021 23:22:52 +0200
> +Subject: [PATCH] php8 compat
> +
> +This patch was retrieved from the pending upstream pull request
> +done by Stefan Saraev.
> +https://github.com/derickr/pecl-dbus/pull/8

  That's a bit verbose, I replaced it with a simple:

Upstream: https://github.com/derickr/pecl-dbus/pull/8

  I also added that upstream reference to the other patch.



  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
