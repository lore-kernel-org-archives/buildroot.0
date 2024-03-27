Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C05CC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 22:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B02B819D1;
	Wed, 27 Mar 2024 22:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9Hg7qS4UipZ; Wed, 27 Mar 2024 22:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26AA781F2B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26AA781F2B;
	Wed, 27 Mar 2024 22:06:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7222B1BF33B
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C36660BD2
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 22:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHEMPWcHj0mh for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 22:06:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5CBFA6065F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CBFA6065F
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CBFA6065F
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 22:06:24 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41488e17e1cso2188025e9.0
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 15:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711577182; x=1712181982;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uqLHz81uFAUvm7whSdHjtCfUSySboCNybsER6Cv1K6I=;
 b=tknQwqUiJ1Fo5Z6cUypAayBzC2D6HiokLd4PGTT+fgCVq0d1T0ILNpsE6pC9jttNU7
 jZfkeK9aJW/RpHegH2C48+YO8MudDz5Z/trp2oHNtnOGsx+VAhSOkYs9IQZLKsUD0Xc7
 VFFd781Q65Ewf2gStKjN7mlgnJW6zVBtfUxcmB1JXibbVW+z7sZZUi2lyM9+z2Hg4f7O
 lRFBf7B7EXnuKB/vT3zTiSo1iHrOMsZ+fFgL0eGCwNBtOnug32SIGzHdz+kbvpXMXE0+
 JJ8a/fNf4QEegdfT5aFbfYIkHNwMMkT3jywtiCSPFIIiMqOKN/vwOnW/GD6/OqUob1Qp
 ZBPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfsN2jytf/01K70U7zi3E1VwG8t2+4caZ41jj9isVvwSNfks7mY9mS1T8f8rrOhtSoZXCWJUplhyF/M5R3wVdA8Y409nKdMw==
X-Gm-Message-State: AOJu0Yw7S8WiRoCe4cC+ZZm8KG46C5RpsjDAedZ1oiAiUxXSsk3SdhQq
 ibFKCyq3KTX46ePA2DK1hX4FWd3UAMUK8JlJnrFMCiqHn9nBURd4SPAzw7AQq3ywAvq3CQOT3AN
 n
X-Google-Smtp-Source: AGHT+IHq4o74oBrpCr5JdJf/wLpM7YK03B0GO5RweCuG1gs30nfeTIWsbW66eTWr4SgerGJGFD4W/Q==
X-Received: by 2002:a1c:7903:0:b0:414:86a3:8e8d with SMTP id
 l3-20020a1c7903000000b0041486a38e8dmr415159wme.22.1711577182246; 
 Wed, 27 Mar 2024 15:06:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b004146bcdde06sm214888wmq.6.2024.03.27.15.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 15:06:21 -0700 (PDT)
Message-ID: <7bf81dac-f8ff-4d0d-9f78-9a2b0ea2a134@mind.be>
Date: Wed, 27 Mar 2024 23:06:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240324211700.729359-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240324211700.729359-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711577182; x=1712181982; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uqLHz81uFAUvm7whSdHjtCfUSySboCNybsER6Cv1K6I=;
 b=VXSIf3LrsziUvAdnTAcPiCEDePffimlkAOzyiIvANVv0BekdTDkQ1tiL9Db4H6hROq
 zdwbAOKNaQwQu1g3ID5hblXT02/iGEYVM8yRJQsJPr0YB9JbFhpeeVJ8cYUHG7Riceny
 jYXjkJm7ItXPSp7QP6+8RfLPKUfgi/sIqY5ts7pJAwE9nOcaKbLMtu6sGK5zZGrxoc53
 dlQBC2ZbiQYKdWQwpE+VpDP5YRlAiFMW/OUSoL5O0RKKD69iDPnTMEu6dMgyeOtyie8E
 b2WbJMhagQ2O4bdLUWG2Wq/JH2X4/vxUwQ52LV6U7AkFSlZ8bnnqOhQhwmsVaJAvTNtX
 UevQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VXSIf3Lr
Subject: Re: [Buildroot] [PATCH 1/1] package/domoticz: bump to version 2024.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/03/2024 22:17, Fabrice Fontaine wrote:
> openzwave dependency is back since
> https://github.com/domoticz/domoticz/commit/b0eadaa2ec6d6340df7eeba0e6e373b71ba393fc
> 
> https://github.com/domoticz/domoticz/blob/2024.4/History.txt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/domoticz/domoticz.hash |  2 +-
>   package/domoticz/domoticz.mk   | 12 +++++++++++-
>   2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
> index 546177332e..ae86a67b79 100644
> --- a/package/domoticz/domoticz.hash
> +++ b/package/domoticz/domoticz.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  9effa792f856d8d9036c53b9ae500ee3bffa1488addf9d6f1fe4bf960f73f740  domoticz-2024.1.tar.gz
> +sha256  d87113d7cacd0b52b9126fcc1ef24e140a4f7042d5bc6262e86e4b4752f5cf38  domoticz-2024.4.tar.gz
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
> diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
> index 88bad15427..95d3335adb 100644
> --- a/package/domoticz/domoticz.mk
> +++ b/package/domoticz/domoticz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DOMOTICZ_VERSION = 2024.1
> +DOMOTICZ_VERSION = 2024.4
>   DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
>   DOMOTICZ_LICENSE = GPL-3.0
>   DOMOTICZ_LICENSE_FILES = License.txt
> @@ -51,6 +51,16 @@ else
>   DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=OFF
>   endif
>   
> +ifeq ($(BR2_PACKAGE_OPENZWAVE),y)
> +DOMOTICZ_DEPENDENCIES += openzwave
> +
> +# Due to the dependency on mosquitto, domoticz depends on
> +# !BR2_STATIC_LIBS so set USE_STATIC_OPENZWAVE to OFF otherwise
> +# domoticz will not find the openzwave library as it searches by
> +# default a static library.
> +DOMOTICZ_CONF_OPTS += -DUSE_STATIC_OPENZWAVE=OFF
> +endif
> +
>   ifeq ($(BR2_PACKAGE_PYTHON3),y)
>   DOMOTICZ_DEPENDENCIES += python3
>   DOMOTICZ_CONF_OPTS += -DUSE_PYTHON=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
