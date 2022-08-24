Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8ECC04AA5
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 20:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21920416B5;
	Wed, 24 Aug 2022 20:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21920416B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 83g_a2oJ759X; Wed, 24 Aug 2022 20:50:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B47E7416C0;
	Wed, 24 Aug 2022 20:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B47E7416C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 556351BF831
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 20:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CFC0416C0
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 20:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CFC0416C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v_P7WkWtgFHu for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 20:49:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC681416B5
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC681416B5
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 20:49:58 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b16so23608090edd.4
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 13:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=7IfEfSrOZE2ILKFWFI3FYPZyeBmGbp78sQWpwQ5YyZw=;
 b=WBD4I7xsSjCWg8m6LjHlQ9kbWh9KyrCUh1lY2woox9wz0hUzxZ9BvmZBt+9mBpeoiZ
 0Cvpe9b+VJ59fUy4fLQanNqMMj6//aPpm5p2+ZM0zItxlQF/gLR6XM4kdHijd2dhz+43
 2uSMS2PNF0UbKfhhzVwXMgSvD0Fc/njs2fhBZkuLUXF4IwGgSMCOqJyLdnQRWZu/r9pw
 kXS/U1GMHEF06D1fwTPHZ8uQMGcNlQd8TTaH6ZRPf/uF/VHsw5J+iUrph+3rCqdulQrw
 IEFy0FArXlqLbWm2tCmVzUCbIg+Wj3Ek8LFB/nvS4i/BzAukyrEaIBk5ZVNcsN++zzhH
 Bvvg==
X-Gm-Message-State: ACgBeo2s6BJFeqHn4AYWVhMmb0cj7G+c4TseziDBNIBJIX+eBtedkWRq
 cswyLp17zkEu4veMWKy0nukWlw==
X-Google-Smtp-Source: AA6agR6VPNuRyeXh2ItRyxFsmV8kKiaIMaqW/1U4TJ+4QB+NgoLhUOp1U4krNDfrKTyyu+fmeM+dwA==
X-Received: by 2002:a05:6402:353:b0:446:2d2c:3854 with SMTP id
 r19-20020a056402035300b004462d2c3854mr605383edw.193.1661374196997; 
 Wed, 24 Aug 2022 13:49:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a17090622c700b0073da32b7db0sm1495980eja.199.2022.08.24.13.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 13:49:56 -0700 (PDT)
Message-ID: <705af3ef-1388-85bf-6ac9-f24bca8d8a1c@mind.be>
Date: Wed, 24 Aug 2022 22:48:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>, buildroot@buildroot.org
References: <20220823194732.701895-1-marcus.hoffmann@othermo.de>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220823194732.701895-1-marcus.hoffmann@othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=7IfEfSrOZE2ILKFWFI3FYPZyeBmGbp78sQWpwQ5YyZw=;
 b=deoLTHVM7SKYp7JmvVRtATxp9CWSyDqBzGTIi6uYISnXJCVMuqf5mOhqaK77/QI6Vt
 7yEXtev94/QUC/US4O+KP78C7JT12yyk2ix/+74+KAoZpfufLvS5TXnx7YmgsqCrdUdg
 Ysuj8R8w8OGIzedqOROIpukXxDGQSS/INMvlT+wcMYiUBSPZEaJxKlJEJBnHjRmQr9xn
 Y/TKk0/2vcN5riUqvwH+dUMu/zSsOXsRkGwoGmCqpXdH42ik4tqkHcaZhbavg0Wd3Sr4
 N+V1fRlV3H2ohQLE5WVmSILx6+DhrGiRHqip43ojlycox2xFjkikIZl4A11spIf7kNDf
 2E0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=deoLTHVM
Subject: Re: [Buildroot] [PATCH 1/2] package/python-paho-mqtt: bump to 1.6.1
 to fix running on python 3.10
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
Cc: Davide Viti <zinosat@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/08/2022 21:47, Marcus Hoffmann wrote:
> Fixes the following error on calling mqtt.publish():
> 
>    File "/usr/lib/python3.10/site-packages/paho/mqtt/publish.py", line 222, in single
>      multiple([msg], hostname, port, client_id, keepalive, will, auth, tls,
>    File "/usr/lib/python3.10/site-packages/paho/mqtt/publish.py", line 126, in multiple
>      if not isinstance(msgs, collections.Iterable):
> AttributeError: module 'collections' has no attribute 'Iterable'
> 
> This was actually changed in release 1.5.0 but 1.6.1 is alaready out for
> almost a year, so we just update to that version.
> 
> Changelog:
> https://github.com/eclipse/paho.mqtt.python/blob/master/ChangeLog.txt

  Jumping from 1.4.0 to 1.6.1 at this point in the stabilisation month is not 
ideal...

> Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
> ---
>   package/python-paho-mqtt/python-paho-mqtt.hash | 6 +++---
>   package/python-paho-mqtt/python-paho-mqtt.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-paho-mqtt/python-paho-mqtt.hash b/package/python-paho-mqtt/python-paho-mqtt.hash
> index bf3993e9195..56783e3fc08 100644
> --- a/package/python-paho-mqtt/python-paho-mqtt.hash
> +++ b/package/python-paho-mqtt/python-paho-mqtt.hash
> @@ -1,6 +1,6 @@
> -# md5 from https://pypi.python.org/pypi/paho-mqtt/json, sha256 locally computed
> -md5  e3ac29cd5dc247a01083a2a8f3fddd08  paho-mqtt-1.4.0.tar.gz
> -sha256  e440a052b46d222e184be3be38676378722072fcd4dfd2c8f509fb861a7b0b79  paho-mqtt-1.4.0.tar.gz
> +# package hashes from from https://pypi.org/project/paho-mqtt/#copy-hash-modal-e8e8e0de-1aec-462d-8ae0-d858d4f5a0d7
> +md5  bdb20f88db291fdb4a0fe804c0f29316  paho-mqtt-1.6.1.tar.gz
> +sha256  2a8291c81623aec00372b5a85558a372c747cbca8e9934dfe218638b8eefc26f  paho-mqtt-1.6.1.tar.gz
>   sha256  76f13729e84e9222e543303df00f87d1b2c0995b6a505cd859a285667e44babb  LICENSE.txt

  Unfortunately, the LICENSE hash changed, because in fact the license changed:
@@ -1,3 +1,3 @@
-This project is dual licensed under the Eclipse Public License 1.0 and the
-Eclipse Distribution License 1.0 as described in the epl-v10 and edl-v10 files.
+This project is dual licensed under the Eclipse Public License 2.0 and the
+Eclipse Distribution License 1.0 as described in the epl-v20 and edl-v10 files.

  And to top things up, epl-v20 is missing in the tarball...

  Could you check if there is a version that does have the epl-v20 file? Perhaps 
even from an upstream git repo?

  Regards,
  Arnout

>   sha256  e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
>   sha256  3b9be6b894d0769de796e653571ff6cef494913c0ce78c35a97db939e7d9087c  epl-v10
> diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
> index d192749e1e1..892f5f33c74 100644
> --- a/package/python-paho-mqtt/python-paho-mqtt.mk
> +++ b/package/python-paho-mqtt/python-paho-mqtt.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PAHO_MQTT_VERSION = 1.4.0
> +PYTHON_PAHO_MQTT_VERSION = 1.6.1
>   PYTHON_PAHO_MQTT_SOURCE = paho-mqtt-$(PYTHON_PAHO_MQTT_VERSION).tar.gz
> -PYTHON_PAHO_MQTT_SITE = https://files.pythonhosted.org/packages/25/63/db25e62979c2a716a74950c9ed658dce431b5cb01fde29eb6cba9489a904
> +PYTHON_PAHO_MQTT_SITE = https://files.pythonhosted.org/packages/f8/dd/4b75dcba025f8647bc9862ac17299e0d7d12d3beadbf026d8c8d74215c12
>   PYTHON_PAHO_MQTT_LICENSE = EPL-1.0 or EDLv1.0
>   PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt edl-v10 epl-v10
>   PYTHON_PAHO_MQTT_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
