Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFC6C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 16:52:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FDE960F23
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 16:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FDE960F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D472280DF9;
	Sun, 29 Aug 2021 16:52:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 73htv-grrULH; Sun, 29 Aug 2021 16:52:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67CEA80E91;
	Sun, 29 Aug 2021 16:52:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 450C21BF962
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 16:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32C9A40104
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 16:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oyGgmMxwNwI1 for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 16:52:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE7E740108
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 16:52:37 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id j13so12581014edv.13
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 09:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AZ9A6ogdwt55j/M8mRAPYBLCmXgyRFPj5M3Tnh4Bv20=;
 b=f9dnKamMWqEWpIuDqyZ0w04DypAw5WBHuv6FO5MoNZGsCTXM++CcT7BwJZjwdGcvU+
 8y/g644hAP271uE3AxTLVtzZEBeC4lU5h7qfQp1r1UyV2CBaptex75JSJuFYArfZz0If
 OSvAH6fiqeN9RhHtVSh+jc6nIYZHETE0he1cSzFB34y8BozsfkfEvTtQpLjJ+B36NWYo
 syGVm7zr/madN0Fl0S1A6fKBGpMdhCwncskp1w1OBnI9a5UMP4VcJBsCLKtUGR/8oKhe
 ozTcwHy/jvTOiU8kmdiIEYH+cD5f6JQ3W2esQq6sGfRqjAb1c+1Q+O+SPzWYfFxMiZ1p
 JYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=AZ9A6ogdwt55j/M8mRAPYBLCmXgyRFPj5M3Tnh4Bv20=;
 b=pQcYKhLtydIg9WzKDQ2P76PmxoAHmj0Nc0aAp7B/UToIi90L4znqYZvAnrbZN2RYRk
 wXmWwpdwb5uvwGbG+RjdmXzQWhmoMpBFXlJIKoz0wblOjvFL2yerLsIT4D7zhGWA62/x
 WyMMjwxCQc7Mx1Wof3Q8jv68xZFQHts/nqb/C+7s8uRej9X/+luTD2KIz+xqRFuyrruG
 bdseIcgYqZIshcpuRuoZsRzNl2u++oVPX6HXDUykacLGjBY7Y1+ifAp29anT95JmAdi4
 qy9yO9vDm7Q6xSnSXuUC2qM3mWKNoIUeHO2JOjtLLxwy3Q7DeaaPUqSNrKypvo00vsHp
 5Rlg==
X-Gm-Message-State: AOAM532E2C+oakt2TuQZjXs7doeRJ5f5RVHKxUtbzXYkYKZMIm0Lu9VW
 hn1gPaOhJIXHdygUETHDRMX5XdzM5+pSnA==
X-Google-Smtp-Source: ABdhPJzUQubk92Nvnr2R7KVXzqU6HxzkxX8E6ldQMjhIv8qzhQuV0Sted6MmKcKYNa8XOh3bCKDTrQ==
X-Received: by 2002:aa7:da81:: with SMTP id q1mr19790140eds.29.1630255955739; 
 Sun, 29 Aug 2021 09:52:35 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id lu4sm5353156ejb.103.2021.08.29.09.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Aug 2021 09:52:35 -0700 (PDT)
To: Andreas Naumann <anaumann@ultratronik.de>, buildroot@buildroot.org
References: <20210804140211.12849-1-anaumann@ultratronik.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <461d6e65-dbea-d448-524d-1fbe9142fa99@mind.be>
Date: Sun, 29 Aug 2021 18:52:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804140211.12849-1-anaumann@ultratronik.de>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5opcua: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 04/08/2021 16:02, Andreas Naumann wrote:
> The Qt OPC UA module implements a Qt API to interact with OPC UA on
> top of a 3rd party OPC UA stack.
> The default is open62541, which is bundled by qt5opcua in version 1.0,
> so we dont need to provide/depend on br's own open62541 package.
> 
> Another dependency is mbedtls, but it's optional.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  DEVELOPERS                         |  1 +
>  package/qt5/Config.in              |  1 +
>  package/qt5/qt5opcua/Config.in     |  9 +++++++++
>  package/qt5/qt5opcua/qt5opcua.hash | 10 ++++++++++
>  package/qt5/qt5opcua/qt5opcua.mk   | 19 +++++++++++++++++++
>  5 files changed, 40 insertions(+)
>  create mode 100644 package/qt5/qt5opcua/Config.in
>  create mode 100644 package/qt5/qt5opcua/qt5opcua.hash
>  create mode 100644 package/qt5/qt5opcua/qt5opcua.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1547ff123b..7427f3cc82 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1985,6 +1985,7 @@ N:	Naumann Andreas <ANaumann@ultratronik.de>
>  F:	package/evemu/
>  F:	package/libevdev/
>  F:	package/pkg-qmake.mk
> +F:	package/qt5/qt5opcua/
>  
>  N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
>  F:	package/uacme/
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index 6714c6271d..6f2428d800 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -51,6 +51,7 @@ source "package/qt5/qt5location/Config.in"
>  source "package/qt5/qt5lottie/Config.in"
>  source "package/qt5/qt5mqtt/Config.in"
>  source "package/qt5/qt5multimedia/Config.in"
> +source "package/qt5/qt5opcua/Config.in"
>  source "package/qt5/qt5quickcontrols/Config.in"
>  source "package/qt5/qt5quickcontrols2/Config.in"
>  source "package/qt5/qt5quicktimeline/Config.in"
> diff --git a/package/qt5/qt5opcua/Config.in b/package/qt5/qt5opcua/Config.in
> new file mode 100644
> index 0000000000..2b0ba37af3
> --- /dev/null
> +++ b/package/qt5/qt5opcua/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_QT5OPCUA
> +	bool "qt5opcua"
> +	depends on BR2_PACKAGE_QT5
> +	help
> +	  Qt is a cross-platform application and UI framework for
> +	  developers using C++.
> +
> +	  The Qt OPC UA module implements a Qt API to interact with
> +	  OPC UA on top of a 3rd party OPC UA stack.
> diff --git a/package/qt5/qt5opcua/qt5opcua.hash b/package/qt5/qt5opcua/qt5opcua.hash
> new file mode 100644
> index 0000000000..e55fb17743
> --- /dev/null
> +++ b/package/qt5/qt5opcua/qt5opcua.hash
> @@ -0,0 +1,10 @@
> +# Hash locally calculated
> +sha256  562171c6dfd6f4f072316ddb6d7c5bcc8907a68ba31005cb8c20ed75beff34fb  qt5opcua-5.15.2-br1.tar.gz
> +
> +# Hashes for license files:
> +sha256  d93cc415382f0013088fa276d9cf82373badf244c78220a926f15ee46f0fe3c4  LICENSE-CC0
> +sha256  f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d  LICENSE.FDL
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
> +sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
> +sha256  6c3f3c31b93985f1b93bfbb35fb609d37281697d0efc220c9f91cf4b59eaabde  LICENSE.GPLv2
> +sha256  75d800e60c8d58c2e7f0338e8552ea6123a9ce7e5dd8e1cdf2095e013b737488  LICENSE.LGPLv3
> diff --git a/package/qt5/qt5opcua/qt5opcua.mk b/package/qt5/qt5opcua/qt5opcua.mk
> new file mode 100644
> index 0000000000..a58c4c5e14
> --- /dev/null
> +++ b/package/qt5/qt5opcua/qt5opcua.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# qt5opcua
> +#
> +################################################################################
> +
> +QT5OPCUA_VERSION = $(QT5_VERSION)
> +QT5OPCUA_SITE = https://code.qt.io/qt/qtopcua.git
> +QT5OPCUA_SITE_METHOD = git
> +QT5OPCUA_INSTALL_STAGING = YES
> +QT5OPCUA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs) CC0-1.0
> +QT5OPCUA_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL LICENSE-CC0
> +QT5OPCUA_SYNC_QT_HEADERS = YES
> +
> +ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> +QT5OPCUA_DEPENDENCIES += mbedtls
> +endif
> +
> +$(eval $(qmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
