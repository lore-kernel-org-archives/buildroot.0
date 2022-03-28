Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23000C433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 19:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 624FA40ABB;
	Mon, 28 Mar 2022 19:53:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u2f_KvqevIR1; Mon, 28 Mar 2022 19:53:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96B4740AA2;
	Mon, 28 Mar 2022 19:53:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A37F51BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 875E660FBF
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vdf0gTcOjfEl for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:52:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98593607F7
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:52:55 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id bg10so30882073ejb.4
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 12:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=x9Hvu5xmturhJwFcjWq7eML3qTuduyqnmoY0eHNvjRU=;
 b=hh7Q1S2YSoHhk4FxmWlGVvxW1bidOG4+kNa3nhgPoRnNgCR61+gpuz5mjmME6pJeDd
 K7WXkjHlvuEvtMfRW25qQWIowPZ6AKbh8BBVErhlgVB+PEBmmfJTbbeJ6s8EpiXcxRRz
 2z8MuTe5zR63HcC8dljSA1/QkRC7oBcU36h4rRIf7Q1JNEJg1ckum59GFe7d/53p4Anc
 9fxE+oMLhhAe0z50vGKAB/BXeZpK5gzc1i9wn80KZu/Bpt09KYq11ly/L+/2ggiC2O9G
 au5UuClad62F7TevjYTM75aBWu/ABOCKwbej0glV6yzGw/cVmonkwi/9Wx+5fKYtBoT0
 U5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=x9Hvu5xmturhJwFcjWq7eML3qTuduyqnmoY0eHNvjRU=;
 b=vPw01xGq+HuS3+nBXZdFURKbZ5Sf3iAFG6PNeHNw0s5x0x1e3QUsRVhVMH6qCqLCdu
 siVJQWy5qau/ZFqI6ERFAPkJSEQ+clOki8nwgSYwXdznzgRzEPwYxLG3MIEE7RzZ8oeO
 lFiRieiWF4CY24klfhGUagpgegvbLEREvsLvbz0WYduT87WOwK66uW5bWMRNOQrp+oOs
 SoEviMqWAcakApT67pi8dRgKSTRovc42o9/VjsF/+Ufftz5McL23G3O9DGe3OGlt1Lj9
 lLRJn6JALUmdltiLQXfhndnToWy3tilngBjHlTY6lv3vU0UxNProDvZoOeoIfxmwwikz
 sR6g==
X-Gm-Message-State: AOAM533TeXjvGR/CIT7khoGUooT9Q3HI3QaavrcDgchOF+LHRNqz01VP
 sWR53TS4PkeNdlEujfJvzwFCS+RpkBAITg==
X-Google-Smtp-Source: ABdhPJzqdZmTHgZBASMifTZ5is4AGcSFujavwddDEc0jz8fAMC/EOmNOZBQtjZBzsSHsK3lZrvt/Wg==
X-Received: by 2002:a17:906:4fc3:b0:6e0:66a5:d59c with SMTP id
 i3-20020a1709064fc300b006e066a5d59cmr29099148ejw.131.1648497173476; 
 Mon, 28 Mar 2022 12:52:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a1709067ac800b006e0d47d3a63sm3422446ejo.84.2022.03.28.12.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 12:52:52 -0700 (PDT)
Message-ID: <88e09ed0-f4d9-bc00-e596-540111c707ce@mind.be>
Date: Mon, 28 Mar 2022 21:52:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB0493DD283963AD9660AF6CCE9F1D9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <VI1P190MB0493DD283963AD9660AF6CCE9F1D9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Subject: Re: [Buildroot] [PATCH 1/1] package/dbus-cxx: bump to version 2.2.0
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



On 28/03/2022 14:29, Lang Daniel via buildroot wrote:
> - License has been changed from GPL to LGPL or BSD-3-Clause
> - Drop upstream patches
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
[snip]
> diff --git a/package/dbus-cxx/dbus-cxx.mk b/package/dbus-cxx/dbus-cxx.mk
> index 3e89fc9db7..b850d45003 100644
> --- a/package/dbus-cxx/dbus-cxx.mk
> +++ b/package/dbus-cxx/dbus-cxx.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -DBUS_CXX_VERSION = 2.1.0
> +DBUS_CXX_VERSION = 2.2.0
>   DBUS_CXX_SITE = $(call github,dbus-cxx,dbus-cxx,$(DBUS_CXX_VERSION))
> -DBUS_CXX_LICENSE = GPL-3.0, Boost license (cmake-modules), Apache 2.0 (libcppgenerate)
> +DBUS_CXX_LICENSE = LGPL-3.0 or BSD-3-Clause, Boost license (cmake-modules), Apache 2.0 (libcppgenerate)

  It's LGPL-3.0+ actually.
  Applied to master with that fixed, thanks.

  Regards,
  Arnout

>   DBUS_CXX_LICENSE_FILES = COPYING cmake-modules/LICENSE_1_0.txt tools/libcppgenerate/LICENSE
>   DBUS_CXX_INSTALL_STAGING = YES
>   DBUS_CXX_DEPENDENCIES = libsigc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
