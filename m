Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A094C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 14:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0882C83E74;
	Sat, 12 Feb 2022 14:32:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vkg9QLfaDdL0; Sat, 12 Feb 2022 14:32:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EA4E83E6D;
	Sat, 12 Feb 2022 14:32:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5CEE1BF5A1
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A138F60E8A
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZhGDjOD8hpB for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 14:32:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71ADE60B8F
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 14:32:23 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g7so4500849edb.5
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 06:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qWQYQdTH9EbNw0ROPNQgtjXtYJltxw/NbXVZsJUDXd0=;
 b=Mm3BLf+9LRCM2vUrLX4Z5kcycT4/TUiVLQxU1/8XCfdBbD9+xVQve673a+0Gp4RW6i
 9RcVEMoectQ2evzvjYMXkedBr9AtX+ts8NujB7Q7SHnFgkW47zt+lQSlF7hDJrCH06Mz
 uTTCKvU1xP9kyoKAhyt4/vIxl9BEEA8io/vuYLljhV81Zvnkt9zlZUuyKUCRubl6zxIp
 MKXDNyBgTu8qc9KOpFrlQ7LEBFt8X1m2+aPVmQT/OHp15eA6rs1GklOcFT7dCL7japoN
 /1h9QiPxUivJGkfcsTMkuJv74Hli15CPjS6hgtMb8xxtdFTlzaN57j3Zal2adj49oBWG
 a9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qWQYQdTH9EbNw0ROPNQgtjXtYJltxw/NbXVZsJUDXd0=;
 b=z0Q4dSn2H5xKRJcpZGptymi5341lL++ktf1tb8nS1v7vBfeJj+HDUH12qKe/eSuU/f
 rGTvkpLISLSRl6ylVxNWT2SabAzbzuehJQazgnH3qvhRxANQqBYVlZ/kZi4PUdeyc/ES
 bzqxAJ8V1B4CHVrtGOG8kaGt8dwpOYCGKAwPwnYc0RkQr9fqi6BUCVbDy17DWDGEXtWs
 M93VIsQoILjsGgjSXeP4DqDYFy9kJl2qesqovh0s65M2gdKX0qczlO/y4sJQEQ9KvTVt
 6+ByVmb5lRfXq12hIiysvX/5OXHxRabMBptTjhnlPx0rChw71F9Yg9v6E/l2Am4s29X0
 QU3g==
X-Gm-Message-State: AOAM531htDrliIVL85/6ip+tB2dw43xB19GDJNkrnEWJlhDfj5MlNR8Y
 rk3XpzwBnw4L/XamRBb33rBd2QzEr/msbw==
X-Google-Smtp-Source: ABdhPJxpWzM65GV73YdmsBZTgnnxLnJL2yVTpIV58vDtZu7jfA9+UdALjnL4VF3smuVbFTWGSeKesw==
X-Received: by 2002:a05:6402:43ce:: with SMTP id
 p14mr6945318edc.300.1644676341188; 
 Sat, 12 Feb 2022 06:32:21 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ce2sm6992924ejb.9.2022.02.12.06.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 06:32:20 -0800 (PST)
Message-ID: <bf571af4-eabb-0db3-7683-562216f71704@mind.be>
Date: Sat, 12 Feb 2022 15:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220127192311.1954197-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220127192311.1954197-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/5] package/serd: new package
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/01/2022 20:23, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  You didn't carry Gilles' Tested-by tags from v1, so I added those.

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS             |  1 +
>   package/Config.in      |  1 +
>   package/serd/Config.in |  8 ++++++++
>   package/serd/serd.hash |  4 ++++
>   package/serd/serd.mk   | 20 ++++++++++++++++++++
>   5 files changed, 34 insertions(+)
>   create mode 100644 package/serd/Config.in
>   create mode 100644 package/serd/serd.hash
>   create mode 100644 package/serd/serd.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index fe8de1916e..6e40b0e9ae 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1335,6 +1335,7 @@ F:	package/python-tomli/
>   F:	package/python-weasyprint/
>   F:	package/python-yarl/
>   F:	package/python-zopfli/
> +F:	package/serd/
>   F:	package/zchunk/
>   
>   N:	James Knight <james.knight@collins.com>
> diff --git a/package/Config.in b/package/Config.in
> index e4ca195beb..decf523821 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1720,6 +1720,7 @@ menu "JSON/XML"
>   	source "package/rapidjson/Config.in"
>   	source "package/rapidxml/Config.in"
>   	source "package/raptor/Config.in"
> +	source "package/serd/Config.in"
>   	source "package/tinyxml/Config.in"
>   	source "package/tinyxml2/Config.in"
>   	source "package/valijson/Config.in"
> diff --git a/package/serd/Config.in b/package/serd/Config.in
> new file mode 100644
> index 0000000000..7633a979e2
> --- /dev/null
> +++ b/package/serd/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_SERD
> +	bool "serd"
> +	help
> +	  Serd is a lightweight C library for RDF syntax which
> +	  supports reading and writing Turtle, TriG, NTriples, and
> +	  NQuads.
> +
> +	  https://drobilla.net/software/serd.html
> diff --git a/package/serd/serd.hash b/package/serd/serd.hash
> new file mode 100644
> index 0000000000..d64a2aa271
> --- /dev/null
> +++ b/package/serd/serd.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated after checking signature
> +# http://download.drobilla.net/serd-0.30.10.tar.bz2.sig
> +sha256  affa80deec78921f86335e6fc3f18b80aefecf424f6a5755e9f2fa0eb0710edf  serd-0.30.10.tar.bz2
> +sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
> diff --git a/package/serd/serd.mk b/package/serd/serd.mk
> new file mode 100644
> index 0000000000..85b16f6866
> --- /dev/null
> +++ b/package/serd/serd.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# serd
> +#
> +################################################################################
> +
> +SERD_VERSION = 0.30.10
> +SERD_SITE = https://download.drobilla.net
> +SERD_SOURCE = serd-$(SERD_VERSION).tar.bz2
> +SERD_LICENSE = ISC
> +SERD_LICENSE_FILES = COPYING
> +SERD_INSTALL_STAGING = YES
> +
> +SERD_CONF_OPTS += --largefile --no-coverage
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +SERD_CONF_OPTS += --static --no-shared --static-progs
> +endif
> +
> +$(eval $(waf-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
