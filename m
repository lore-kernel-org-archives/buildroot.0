Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39574C5ACD3
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 17:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA8A083AB4;
	Fri, 20 Feb 2026 17:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CoPsn8hcVTD4; Fri, 20 Feb 2026 17:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8BD883A62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771607716;
	bh=vu3pPx/pBMpYljgry8FPlCs+sQfBsQmNoc1UmnQK1Bw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kL3VmgvmGzgUVswdQeMh+MIeVH2+SIJlaSR3XVFkydMM0F7qXyFbxOzCZRyxnjrZ6
	 q3e1sgdslMGwZlyG+z/7vV9H5+H4wTyGvEuHGINvNBb0usIQSq2JnWKobD9j0RL1TO
	 9BcPOt7LGCb/cIeAltGW03AKeBsFF9bILx0z2qZFBKv+TgKsI7Bs+F6ZbDLKWkaLNY
	 u78u/UcQkRGSPHSq0ad0UlUUdKYpE80eAtjn83fx3ITm0iX633daCuAG9DkqSrcf3O
	 60A61kD/iilZx+C7bCGIRTfXLZ6gi1FIOlKNf3+kA8FQf7R100gIsjwKi93HVS/n2Y
	 KQi5qY5qBk8pQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8BD883A62;
	Fri, 20 Feb 2026 17:15:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 119F9206
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 17:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 025FE61024
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 17:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hL8jZdbGQPJq for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 17:15:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 864D96101E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 864D96101E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 864D96101E
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 17:15:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.19.4]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHG8m-1vxtwG0b2W-00Ddxy; Fri, 20
 Feb 2026 18:15:12 +0100
Message-ID: <03570aeb-5b6d-4a89-8280-9767c7df1f60@gmx.de>
Date: Fri, 20 Feb 2026 18:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
Cc: Titouan Christophe <titouan.christophe@mind.be>
References: <cover.1771588390.git.yann.morin@orange.com>
 <ab05c9e4712a533a581a956f978c383aa18ef7ab.1771588390.git.yann.morin@orange.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <ab05c9e4712a533a581a956f978c383aa18ef7ab.1771588390.git.yann.morin@orange.com>
X-Provags-ID: V03:K1:ew2hzqLqJHGXrT/1RRRs2klJTlAt8jSJ07IETZeHzqD5/jjlvlU
 t7HAMNbB1yt/VuFzb9M783ot1qA1qT1nUuOpdz7EgnFyR0csXMPbFNojOVlt4eZy2JS9XWE
 0m77OtOr3Pf6d/AnPq9ZUOvHBsM4vxriyuk8AZIVX4DqQHQblpem1TVeeyDMpaLmL0jWNUk
 9lzfY2opTFU4RlGVHsVzw==
UI-OutboundReport: notjunk:1;M01:P0:3igKNeSqYOE=;AKDhqDEypxvQ9CZrR5q2sPeaS7L
 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
 rBsuSHQwtMKt3bX7IQ6Z
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1771607712; x=1772212512; i=fiona.klute@gmx.de;
 bh=SuKT0au6PlXTlHcaR57mE3NHlz4oIST+8kS74OOv0xs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=e++gNe0Pm393hR9Qr5lKMDImISHRzDRkawkVsPyNojwP3fFESU+Cicc/Rj/sDAEF
 w+l5lHxxhasheYZ/d4jOPMgWZUrNvDx4clXe3c+6jiOa2QNfjPNdfKhC2boxbY/GW
 ueRhx/7rsI23jO14l9sDvcDFgMyAz9CtjywbaVd+Ce2hUazhAIKzN969x3Ei0lz5N
 CwL0Rycp6LipqF+/xeUIaEM1ZJR6XbfHtYPHnTQLwh9ZEfQzUAVBS6FU4kxe5ZtXn
 WKOwoeQWr/KWLPyCBsWT2PZf4dDdZ41qmvPiWrG0iiRcuyRDk7iXBk3YvvtuNM5a/
 sw0qQOsjTvxg45TRfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=e++gNe0P
Subject: Re: [Buildroot] [PATCH 4/8] package/mosquitto: add option to build
 broker-related apps
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, all!

Am 20.02.26 um 12:53 schrieb yann.morin@orange.com:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> mosquitto_{ctrl,db_dump,passwd,signal} can be handy to interact with
> the mosquitto broker during development, but are usually unnecessary
> on the target.
> 
> Add an option to enable or disable them. Make that new option enabled
> by default when the broker is enabled, to keep backward compatibility
> with previous (def)config files.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Titouan Christophe <titouan.christophe@mind.be>
> ---
>   package/mosquitto/Config.in    | 16 ++++++++++++++++
>   package/mosquitto/mosquitto.mk | 12 ++++++++----
>   2 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
> index d0f096e5cf..954a4d3b75 100644
> --- a/package/mosquitto/Config.in
> +++ b/package/mosquitto/Config.in
> @@ -33,6 +33,22 @@ config BR2_PACKAGE_MOSQUITTO_CLIENTS
>   	    mosquitto_sub
>   	    mosquitto_rr
>   
> +config BR2_PACKAGE_MOSQUITTO_APPS
> +	bool "install apps"
> +	default y if BR2_PACKAGE_MOSQUITTO_BROKER  # Backward compatibility
> +	depends on BR2_USE_WCHAR  # libedit
> +	# For mosquitto_ctrl shell feature, mandatorily enabled:
> +	select BR2_PACKAGE_READLINE if !BR2_PACKAGE_LIBEDIT
> +	help
> +	  Those apps can be used to interact with the broker:
> +	    mosquitto_db_dump
> +	    mosquitto_signal
> +
> +	  Additionally, when TLS is enabled, the following apps are
> +	  also installed:
> +	    mosquitto_ctrl
> +	    mosquitto_passwd

The "when TLS is enabled" confused me at first: There is no "enable TLS" 
option for package/mosquitto, and passwords might just as well be used 
without TLS (of course better not over external network, but via Unix 
socket or localhost it should be fine). Looking at the the previous 
patches & upstream code it's clear that mosquitto_passwd is gated behind 
WITH_TLS because it requires OpenSSL.

Could you rephrase this to make it clear that BR2_PACKAGE_OPENSSL=y is 
what will enable building those tools? It might be helpful to include a 
note like "enable BR2_PACKAGE_OPENSSL to build TLS support" in the main 
BR2_PACKAGE_MOSQUITTO help, too.

Thanks for working on this update!

Best regards,
Fiona

> +
>   config BR2_PACKAGE_MOSQUITTO_BROKER
>   	bool "install the mosquitto broker"
>   	default y
> diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
> index de952e9d77..1cfc052003 100644
> --- a/package/mosquitto/mosquitto.mk
> +++ b/package/mosquitto/mosquitto.mk
> @@ -19,8 +19,7 @@ MOSQUITTO_CONF_OPTS = \
>   	-DWITH_TESTS=OFF \
>   	-DWITH_STATIC_LIBRARIES=OFF \
>   	-DWITH_BUNDLED_DEPS=ON \
> -	-DWITH_HTTP_API=OFF \
> -	-DWITH_CTRL_SHELL=OFF
> +	-DWITH_HTTP_API=OFF
>   
>   # adns uses getaddrinfo_a
>   ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
> @@ -75,12 +74,18 @@ else
>   MOSQUITTO_CONF_OPTS += -DWITH_CLIENTS=OFF
>   endif
>   
> +ifeq ($(BR2_PACKAGE_MOSQUITTO_APPS),y)
> +MOSQUITTO_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBEDIT),libedit,readline)
> +MOSQUITTO_CONF_OPTS += -DWITH_APPS=ON -DWITH_CTRL_SHELL=ON
> +else
> +MOSQUITTO_CONF_OPTS += -DWITH_APPS=OFF -DWITH_CTRL_SHELL=OFF
> +endif
> +
>   ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER),y)
>   
>   MOSQUITTO_CONF_OPTS += \
>   	-DCMAKE_INSTALL_SYSCONFDIR=/etc \
>   	-DWITH_BROKER=ON \
> -	-DWITH_APPS=ON \
>   	-DWITH_PLUGINS=ON \
>   	-DWITH_PLUGIN_ACL_FILE=ON \
>   	-DWITH_PLUGIN_PASSWORD_FILE=ON \
> @@ -123,7 +128,6 @@ MOSQUITTO_POST_INSTALL_TARGET_HOOKS += MOSQUITTO_INSTALL_TARGET_CONF
>   else # !BR2_PACKAGE_MOSQUITTO_BROKER
>   MOSQUITTO_CONF_OPTS += \
>   	-DWITH_BROKER=OFF \
> -	-DWITH_APPS=OFF \
>   	-DWITH_PLUGINS=OFF
>   endif
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
