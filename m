Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4246C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 17:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24BA0402FB;
	Sun, 19 Jun 2022 17:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24BA0402FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4EzSb-kmSbkq; Sun, 19 Jun 2022 17:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA17241514;
	Sun, 19 Jun 2022 17:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA17241514
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C95E1BF401
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 17:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66346408F2
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 17:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66346408F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nI9FNPJTue62 for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 17:24:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38F13408EF
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38F13408EF
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 17:24:05 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id o7so17102052eja.1
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 10:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=59UUs431+tyEGZAmnsqcBJ1ldoIEYk0GoKJk8bVq/YA=;
 b=OS766yTPM04hh3hsMLCz5TCaRhX38SxEq1DkgZdzQFvGES+6toKZsI9L2fYeQiqgOz
 gzS3rBmUlGN9dDiXrFT5aFmugNFEIbomozPjtDwlylu2U+O9GK6aZO4pTCEfBhNrrPvV
 rRsjiYjzLHsjgXCkU5u8F/WsvoKIhCQExwyqA9/40kXIKr1avja1BYw7awgzDwdi2gaF
 2vuoIvTaJ5UfHkLKLFrh89oRDEgFKTKVupybu47Zlu56EJHvXrjajZGFeGs+tCR2CVS9
 YlKBUxSn1YHiRjjS9HMwPsmoAlA2ZnV719wZYgktEt4aK/W0hr9N4+Za3JgH7Ecqio/x
 C5eg==
X-Gm-Message-State: AJIora+uULYyqe/2dvpAZc8OKLlnayU9pKaEmb9oc2f+ceG14CrqP4vF
 acNllw0CK+4OxEkmoXNeAE6ZaQ==
X-Google-Smtp-Source: AGRyM1v4c2yc+PnG9lQlZz6yZrfL9R74mjEuHrwJ0cb5+IhFi8CZ/0CFgO9mOZw6qC0LfphWrTi5yg==
X-Received: by 2002:a17:907:3f11:b0:711:d56d:ab57 with SMTP id
 hq17-20020a1709073f1100b00711d56dab57mr17782233ejc.160.1655659444223; 
 Sun, 19 Jun 2022 10:24:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 cy2-20020a0564021c8200b0042ab2127051sm8204672edb.64.2022.06.19.10.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 10:24:03 -0700 (PDT)
Message-ID: <7a326fb6-1079-ce5a-ab75-02dbe1fb06d6@mind.be>
Date: Sun, 19 Jun 2022 19:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20220607072852.1007185-1-dario.binacchi@amarulasolutions.com>
 <20220607072852.1007185-2-dario.binacchi@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220607072852.1007185-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=59UUs431+tyEGZAmnsqcBJ1ldoIEYk0GoKJk8bVq/YA=;
 b=XBRAWB+sHSUUu3W6p/G1xldQ85y9Q9YpZVUdNb7s6X7jH9/iDWp6QMNgVz8niTe2ig
 JeyLBHTxFAEKSHkeExBK3kUmkNLN6/IfdL/sfgsG8NQSD6wL/Toxy8c1DJmbe25eUa0k
 KG4rok2hiCVN1phLVKmtR57pm9AxCwM8GsKF8s9R7Z8czcecC8ymLbNREMyKis12JByn
 tNn1x3NckIshbrEW1B2j5Ga7tImxPJd60IEt6bIlUDw0Vcjk5weP9+sYjPGsfAoOJYK5
 YpSVAoeUXCQu2ozwTF1RY4TLDI6XwSw0mgp7NXl1Z9/TEmo8sNEJddXBMPt77Cj8P+Lx
 XtIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XBRAWB+s
Subject: Re: [Buildroot] [PATCH 1/3] package/uuu: new package
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
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Samuel Martin <s.martin49@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/06/2022 09:28, Dario Binacchi wrote:
> UUU (Universal Update Utility) is a Freescale/NXP I.MX Chip image deploy
> tools. It is an evolution of MFGTools (aka MFGTools v3). For this and
> for backward compatibility we have created a new package instead of
> updating the mfgtools package.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to master, after fixing the check-package warnings, thanks.

package/uuu/Config.in.host:12: help text: <tab><2 spaces><62 chars> 
(http://nightly.buildroot.org/#writing-rules-config-in)
package/uuu/Config.in.host:13: help text: <tab><2 spaces><62 chars> 
(http://nightly.buildroot.org/#writing-rules-config-in)
package/uuu/uuu.mk:13: possible typo: SET_VERSION -> *UUU*

  Regards,
  Arnout

> ---
>   DEVELOPERS                 |  3 +++
>   package/Config.in.host     |  1 +
>   package/uuu/Config.in.host | 18 ++++++++++++++++++
>   package/uuu/readme.txt     | 13 +++++++++++++
>   package/uuu/uuu.hash       |  4 ++++
>   package/uuu/uuu.mk         | 19 +++++++++++++++++++
>   6 files changed, 58 insertions(+)
>   create mode 100644 package/uuu/Config.in.host
>   create mode 100644 package/uuu/readme.txt
>   create mode 100644 package/uuu/uuu.hash
>   create mode 100644 package/uuu/uuu.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index aa18de83bcb6..60fa58ab35d6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -650,6 +650,9 @@ F:	package/lua-cjson/
>   F:	package/luaexpat/
>   F:	package/xinetd/
>   
> +N:	Dario Binacchi <dario.binacchi@amarula.solutions.com>
> +F:	package/uuu/
> +
>   N:	Dario Binacchi <dariobin@libero.it>
>   F:	package/davinci-bootcount/
>   F:	package/libmnl/
> diff --git a/package/Config.in.host b/package/Config.in.host
> index cd1c34b5a3d9..d00547d324a5 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -96,6 +96,7 @@ menu "Host utilities"
>   	source "package/uboot-tools/Config.in.host"
>   	source "package/util-linux/Config.in.host"
>   	source "package/utp_com/Config.in.host"
> +	source "package/uuu/Config.in.host"
>   	source "package/vboot-utils/Config.in.host"
>   	source "package/xorriso/Config.in.host"
>   	source "package/zip/Config.in.host"
> diff --git a/package/uuu/Config.in.host b/package/uuu/Config.in.host
> new file mode 100644
> index 000000000000..017e37517d0e
> --- /dev/null
> +++ b/package/uuu/Config.in.host
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_HOST_UUU
> +	bool "host uuu"
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
> +	help
> +	  UUU (Universal Update Utility) is Freescale/NXP I.MX Chip
> +	  image deploy tool. UUU is an evolution of MFGTools
> +	  (aka MFGTools v3).
> +
> +	  To be able to run uuu without root privileges, execute the
> +	  following steps:
> +
> +            sudo sh -c "uuu -udev >> /etc/udev/rules.d/70-uuu.rules"
> +            sudo udevadm control --reload
> +
> +	  https://github.com/NXPmicro/mfgtools
> +
> +comment "host uuu needs a toolchain w/ host gcc >= 4.9"
> +	depends on !BR2_HOST_GCC_AT_LEAST_4_9
> diff --git a/package/uuu/readme.txt b/package/uuu/readme.txt
> new file mode 100644
> index 000000000000..80dd90b93384
> --- /dev/null
> +++ b/package/uuu/readme.txt
> @@ -0,0 +1,13 @@
> +uuu Howto
> +=========
> +
> +Running uuu without root privileges
> +-----------------------------------
> +
> +Accessing USB devices on Linux requires root privileges by default.
> +To be able to run uuu without root priviles, execute the following
> +steps:
> +
> +  sudo sh -c "uuu -udev >> /etc/udev/rules.d/70-uuu.rules"
> +  sudo udevadm control --reload
> +
> diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
> new file mode 100644
> index 000000000000..10efff0337a1
> --- /dev/null
> +++ b/package/uuu/uuu.hash
> @@ -0,0 +1,4 @@
> +# locally computed
> +sha256  4fda8db488c4d3a98c2480c47b41907ad26b714c6400dd0a202baab4c17b0a9b  uuu-1.4.193.tar.gz
> +sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
> +sha256  77b90738ae98b7958d34d9f96caf2671210a133427f8f6b784914b54f406c29b  README.md
> diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
> new file mode 100644
> index 000000000000..550c42af8d86
> --- /dev/null
> +++ b/package/uuu/uuu.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# uuu
> +#
> +################################################################################
> +
> +UUU_VERSION = 1.4.193
> +UUU_SITE = $(call github,NXPmicro,mfgtools,uuu_$(UUU_VERSION))
> +UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
> +UUU_LICENSE_FILES = LICENSE README.md
> +HOST_UUU_DEPENDENCIES = host-bzip2 host-zlib host-libusb
> +
> +define SET_VERSION
> +	echo $(UUU_VERSION) > $(@D)/.tarball-version
> +endef
> +
> +HOST_UUU_POST_EXTRACT_HOOKS += SET_VERSION
> +
> +$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
