Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62EDC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 17:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3146B6115F;
	Mon, 25 Jul 2022 17:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3146B6115F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qvriK3BjrOoB; Mon, 25 Jul 2022 17:07:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A9C760E3D;
	Mon, 25 Jul 2022 17:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A9C760E3D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8A6B1BF396
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 17:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC17640491
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 17:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC17640491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KsaeWL8ke6vs for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 17:07:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DCCE402F5
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DCCE402F5
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 17:07:11 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h8so16885625wrw.1
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 10:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Za2NZ1AhIuCtnfFJWXuK63Z+7/hEAzv+KYIpoZpjJh0=;
 b=SER0ZP/gcXh5Ty0xlGZzTdKMKUU+cHiQNVVuuXr+itvwAEM2bSXvME6PmcGfwZE9/3
 qh5fO9MXxfWSQ+snDcHtz+zjfC2x8yqGLVd1+M32SxShCTmr5eTq1C/YI0svSnytBXF1
 w5S7mP1JEu4A/HFV4s9qTLfiXHQtIHF5YZGjcK3Vv5kc4SWneRhaNv8MQie8Ij5hxvf1
 HUh7naGUfwszoc4BcXYQndv7B6V28Ty3+LiW/N6x68iTxyWDv3bjKJs2aOghtQecjfbH
 8uo6RtiXwuTN1TOofHGucMoUw+BhE1URtzMkPoKna1IDzxp2FVAURN+2q9FvFnM3SSMD
 +vvg==
X-Gm-Message-State: AJIora/Uva2f+Z4cvNi0gNyPHdbeusVL429GQ8E+nVMoNbsqCXmDTrHK
 hRIcin2C8Iu5GYENTt+bAG2YdeeHc6F6xQ==
X-Google-Smtp-Source: AGRyM1tFhP/CCuPzNt3JLjmEKjYgE6ICN4DZveEXRmsbWzMIJPtu+aL6lJ455PpQz0sp6X+zz52MNA==
X-Received: by 2002:a5d:64ed:0:b0:21e:92e2:3e71 with SMTP id
 g13-20020a5d64ed000000b0021e92e23e71mr2117670wri.432.1658768829417; 
 Mon, 25 Jul 2022 10:07:09 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 s2-20020adff802000000b0021e4edba1e5sm12632422wrp.111.2022.07.25.10.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 10:07:08 -0700 (PDT)
Message-ID: <aa456e5e-38a8-ae80-9ee5-b3aa714291a9@mind.be>
Date: Mon, 25 Jul 2022 19:07:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Johan Oudinet <johan.oudinet@gmail.com>, buildroot@buildroot.org
References: <20211018121900.455863-1-johan.oudinet@gmail.com>
 <20211025091638.4769-1-johan.oudinet@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211025091638.4769-1-johan.oudinet@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Za2NZ1AhIuCtnfFJWXuK63Z+7/hEAzv+KYIpoZpjJh0=;
 b=hykoIUlk9RnR+d1OtyErRDBLe4mYE/gxrIxy2Y80a2AGqL+au4MqK+pXHBHDutFfex
 DgcwncEBte6z1Zv/W1BNOQMi6L2g7Ozz6Qn3Z2oOv144BYyhut0pPZkwo2sofdn9KB19
 4zE+mMux4GCOVcntPro7JCKgUnaQO9fZvH2ZZEnWJoNW6VaNVA9jv+35ctMMoTg0CcmV
 Ssk48bS2DnUf6Bpv40fYXnyfoiFTVQabjNgFs7mInFxv+rVnqoRyYunfP7ZC8noZOUDN
 X6x++34mXucDwbZS3RPZcQ23qGKwzytgDTQlLOk2boCfl3cjx1/HDkyhnyZxauSIWsad
 hxXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hykoIUlk
Subject: Re: [Buildroot] [PATCH v2] package/vis-network: new package
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



On 25/10/2021 11:16, Johan Oudinet wrote:
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

  Applied to master, thanks, with two changes:
      - alphabetically order DEVELOPERS;
      - license is OR, not AND

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - install CSS file
> ---
>   DEVELOPERS                           |  1 +
>   package/Config.in                    |  1 +
>   package/vis-network/Config.in        |  7 +++++++
>   package/vis-network/vis-network.hash |  4 ++++
>   package/vis-network/vis-network.mk   | 21 +++++++++++++++++++++
>   5 files changed, 34 insertions(+)
>   create mode 100644 package/vis-network/Config.in
>   create mode 100644 package/vis-network/vis-network.hash
>   create mode 100644 package/vis-network/vis-network.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f864f7ef47..1d1b6757e3 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1390,6 +1390,7 @@ F:	package/erlang-p1-yconf/
>   F:	package/erlang-p1-zlib/
>   F:	package/nginx-dav-ext/
>   F:	package/vuejs/
> +F:	package/vis-network/
>   
>   N:	John Stile <johns@msli.com>
>   F:	package/dhcpcd/
> diff --git a/package/Config.in b/package/Config.in
> index d40eb9dabc..6e4807aded 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1650,6 +1650,7 @@ endif
>   	source "package/jszip/Config.in"
>   	source "package/openlayers/Config.in"
>   	source "package/popperjs/Config.in"
> +	source "package/vis-network/Config.in"
>   	source "package/vuejs/Config.in"
>   if BR2_PACKAGE_VUEJS
>   comment "External Vue.js plugins"
> diff --git a/package/vis-network/Config.in b/package/vis-network/Config.in
> new file mode 100644
> index 0000000000..39e8ac54c5
> --- /dev/null
> +++ b/package/vis-network/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_VIS_NETWORK
> +	bool "vis-network"
> +	help
> +	  Display dynamic, automatically organised, customizable network
> +	  views. Network uses HTML canvas for rendering.
> +
> +	  http://visjs.github.io/vis-network/
> diff --git a/package/vis-network/vis-network.hash b/package/vis-network/vis-network.hash
> new file mode 100644
> index 0000000000..56f141f5f7
> --- /dev/null
> +++ b/package/vis-network/vis-network.hash
> @@ -0,0 +1,4 @@
> +# Locally computed
> +sha256  a9f7325cbe28147318476c63f09c1d5c894d2239bfa4b4dd2dfb3dbebb0705d3  vis-network-9.1.0.tgz
> +sha256  1509904280a272780fd69c04b858f512cf216f8e3464a0dd98d8f34416feced9  LICENSE-APACHE-2.0
> +sha256  1f65085e54c036645082257618db2c7b787e68c3b02485e214ecd09e0834ee8f  LICENSE-MIT
> diff --git a/package/vis-network/vis-network.mk b/package/vis-network/vis-network.mk
> new file mode 100644
> index 0000000000..349ba1bf26
> --- /dev/null
> +++ b/package/vis-network/vis-network.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# vis-network
> +#
> +################################################################################
> +
> +VIS_NETWORK_VERSION = 9.1.0
> +VIS_NETWORK_SOURCE = vis-network-$(VIS_NETWORK_VERSION).tgz
> +VIS_NETWORK_SITE = https://registry.npmjs.org/vis-network/-
> +VIS_NETWORK_LICENSE = Apache-2.0, MIT
> +VIS_NETWORK_LICENSE_FILES = LICENSE-APACHE-2.0 LICENSE-MIT
> +
> +# Install .min.js and .min.css as .js and .css, respectively.
> +define VIS_NETWORK_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 644 -D $(@D)/dist/vis-network.min.js \
> +		$(TARGET_DIR)/var/www/vis-network.js
> +	$(INSTALL) -m 644 -D $(@D)/dist/dist/vis-network.min.css \
> +		$(TARGET_DIR)/var/www/vis-network.css
> +endef
> +
> +$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
