Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F6BC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FC0260AF1;
	Sat,  4 Nov 2023 21:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FC0260AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DaIuslVqagSL; Sat,  4 Nov 2023 21:36:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57BD060D79;
	Sat,  4 Nov 2023 21:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57BD060D79
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BAEF1BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2331540273
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2331540273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NTJWymWT8tme for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:36:31 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E308540360
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E308540360
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50943ccbbaeso4611631e87.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 14:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699133789; x=1699738589;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YBkTqcPig4mWnrvzI6G2pNUUCaeg8ATEOSZ7OuvWnXY=;
 b=uqPS9DVrTAj+4BcHplU0ruYa+rdsu3tFBm/ws3exkmTEXjE618wzPUR9R/wB0GHfpm
 cuLncAeXrGJbeCk3qsaOEl9ybEPWG7TAeLCM2EhNYUwKvnZ6LPru2mp/iJYyJjRWHr6e
 6ximFZSsLenZvTuY2fpG9SWnFU3uo+8WVTWs/1KjWgSUNYorLm8whA1SZqA0pCGXHiTI
 pALscyGRIcfrU4xIcb5wbUTYZIcscfK/zU65Ln+EwALtXQU54bM9stMKs/KCwNQDR85N
 imfMT1TlBParpPtIuyyEsEmAKiRBIZiTEPlYHQ0Ppyj1O4jkLb6/Xde5QR2CEtgMXdme
 92fQ==
X-Gm-Message-State: AOJu0Yx/L0fWahLGixVElqFXRsei2SXMwh98FDGMmF3itjg7lqrHbynE
 xxUpQP84kqz+a0u/vR5OWE6Fqw==
X-Google-Smtp-Source: AGHT+IGbNYtsPFsZKieAEDQcOKm5tLH7Z1RzXp2Yd2gT5r8YigQRdJXf7MgwaL6urxnOqWKvSojkYw==
X-Received: by 2002:a05:6512:3d0b:b0:500:8f66:5941 with SMTP id
 d11-20020a0565123d0b00b005008f665941mr23940985lfv.50.1699133788752; 
 Sat, 04 Nov 2023 14:36:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 r11-20020aa7d14b000000b00534e791296bsm2465277edo.37.2023.11.04.14.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 14:36:28 -0700 (PDT)
Message-ID: <3c3aa47c-be16-433c-ae49-696b4dd01e39@mind.be>
Date: Sat, 4 Nov 2023 22:36:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
 <20231026092701.12345-26-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231026092701.12345-26-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699133789; x=1699738589; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YBkTqcPig4mWnrvzI6G2pNUUCaeg8ATEOSZ7OuvWnXY=;
 b=DPashD5gRsT2SHc1iCC8BK7HPIjgyA5jtJO+bLDh7wN70ZDsloQK4idiSyI6YDLXhO
 8YD9yi/VuFLo1Yo9Hg+M5py0B/9e+3Cr/uWZ73JxEppytQpTrtMisIsXqXvE8SlC++UA
 5lUWKqg1IFNYr2//bmjV4UPWuiHg3aZ+6RAhsnSKn5YpB6+nStHbNY5MkW4TRIKXliD7
 LxVIl2bzAiUnS7Pp3/J/ybLLzXyZ6UgwkqIfMoOe4ojIAA1yr5rAvhwAV8NjenqzA/7q
 e57cjVx7tD4sJxOmqrkiZ+APrM13mCNAJNAQgydFzUk9aES6H0uKl9c0Er/+31y8Bbtm
 o8eg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DPashD5g
Subject: Re: [Buildroot] [PATCH 25/30] package/python-iptables: use
 sysconfig.get_path instead of get_python_lib
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/10/2023 11:26, Adam Duskett wrote:
> distutils is removed in Python 3.12.0. Switch to using sysconfig.get_path to
> facilitate the migration.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...g-get_path-instead-of-get_python_lib.patch | 40 +++++++++++++++++++
>   1 file changed, 40 insertions(+)
>   create mode 100644 package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch
> 
> diff --git a/package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch b/package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch
> new file mode 100644
> index 0000000000..2a4de3daf2
> --- /dev/null
> +++ b/package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch
> @@ -0,0 +1,40 @@
> +From fd415a3613fad872062fb7cb4e271ac1476402ef Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <adam.duskett@amarulasolutions.com>
> +Date: Tue, 24 Oct 2023 08:47:12 +0200
> +Subject: [PATCH] use sysconfig.get_path instead of get_python_lib
> +
> +Distutils has been removed from python 3.12.0. Use sysconfig.get_path instead
> +of get_python_lib.
> +
> +Upstream: https://github.com/ldx/python-iptables/pull/340
> +
> +Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> +---
> + iptc/util.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/iptc/util.py b/iptc/util.py
> +index 04fe905..94befc5 100644
> +--- a/iptc/util.py
> ++++ b/iptc/util.py
> +@@ -3,7 +3,7 @@ import os
> + import sys
> + import ctypes
> + import ctypes.util
> +-from distutils.sysconfig import get_python_lib
> ++import sysconfig
> + from itertools import product
> + from subprocess import Popen, PIPE
> + from sys import version_info
> +@@ -64,7 +64,7 @@ def _do_find_library(name):
> +
> +     # probably we have been installed in a virtualenv
> +     try:
> +-        lib = ctypes.CDLL(os.path.join(get_python_lib(), name),
> ++        lib = ctypes.CDLL(os.path.join(sysconfig.get_path("purelib"), name),
> +                           mode=ctypes.RTLD_GLOBAL)
> +         return lib
> +     except:
> +--
> +2.41.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
