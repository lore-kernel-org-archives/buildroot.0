Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3DBC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 19:17:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 065B660462
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 19:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 065B660462
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCE7C6072F;
	Fri,  3 Sep 2021 19:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6lH5zm1SePpb; Fri,  3 Sep 2021 19:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E44CB61542;
	Fri,  3 Sep 2021 19:17:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 608541BF2F7
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 19:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E61A407BA
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 19:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Tr5kVSDiGI6 for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 19:17:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2E4A4081E
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 19:17:08 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a25so112962ejv.6
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 12:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q/351pmwThacWmO7Znfem+5RbFYJB9TVVNQ6HyCQGUU=;
 b=S+Qa3aBjV0/I35jL19q7+meNjyWv9uhKz6fS8O+wvZcO58X2BuKCB8Uw8RTFlpeec7
 5sEikwL6gYjbqvi1RfCpbJ1PmV2EgbRIBPURRdt787dYCmmSdl3XVsFgNMK7QTb4GrO0
 r11uW4nb8mfKvPoeUeni4Q/zcqlMC03AhAG2ELPYpaezXY9KlLSfDuNAv+LAHr8U/3Ba
 PcCcvg53G7hR3cmuZdBjwfgR17CbBftb2kaVr1rcNzeXWnStqOQYHG8O2UKSM6iqeBQ9
 KksGASRatsDiiSHuRt+g0mwoYKmibQdfiubfYWh7G6tIt3LkZ6hF3VaQD/tyA853+PlJ
 iqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Q/351pmwThacWmO7Znfem+5RbFYJB9TVVNQ6HyCQGUU=;
 b=J0vAgpr1TyXneESDtwgWN2n1L+YQ9KXrJVeqNJAGQ1VZfp0/b7tXVni+Sj1HHnFfwu
 nNSZymqAcWeJO3OSx3OFpcbjet5qR7hRV5JbjHVABehFgYaxcQ+A4tBudZLvhsBMTKT2
 Dg3VEXOizEc830VP8CTGCIP2LxS6WZvIEPQHWEcTesL74A4SbqF7cHcOtNWAKQMAs15H
 VwZmOawoHw2diAbSg+lYOTckQJXKbqCSHqjtmtndds6N1aHzHi99qk1SDPWefbM0cMQj
 zPP5ylD+O6dz4Cf//EHhOFYD4C9XYQLaZ7cNJ4y1Drjm8nUzPYeQKGoJ3ZKBTeBHh6Ym
 HZ/A==
X-Gm-Message-State: AOAM533kBGKTJxrLGC1S20wkoOlG9kkn6mYwLbAMzPz5D3/jt9J/1pQa
 Isy0qkf4IAzDqnwj5szVcKbswg==
X-Google-Smtp-Source: ABdhPJxgnVFaBVbAnDIUyfsUhrF4ebekMi/dQyaqAKVE2fO8nl1WGeWMyl2q7XQQc3q8ZvYXGzvK4A==
X-Received: by 2002:a17:907:50a1:: with SMTP id
 fv33mr465153ejc.128.1630696626843; 
 Fri, 03 Sep 2021 12:17:06 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ca4sm36198ejb.1.2021.09.03.12.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:17:06 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210902164154.2273969-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <4260c748-92a3-5945-263e-9960deaebcfe@mind.be>
Date: Fri, 3 Sep 2021 21:17:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902164154.2273969-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/xvisor: fix build with gcc 11
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 02/09/2021 18:41, Fabrice Fontaine wrote:
> Fix the following build failures with gcc 11:
> 
> /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/build/drivers/drivers.o: in function `psmouse_extensions':
> /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `lifebook_detect'
> /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `alps_detect'
> /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `ps2pp_init'
> /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `trackpoint_detect'
> /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `fsp_detect'
> 

 It took me a bit of puzzling to find out why this was GCC 11 specific. I'm not
100% sure, but I think it's that GCC 11 changed the inline keyword behaviour
again. It's not the "extern inline" thing because that would possibly trigger
multiple defined symbols, not undefined symbols...

> Fixes:
>  - http://autobuild.buildroot.org/results/69062b9c80567d135edd48890165e69881cf7295
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...psmouse-back.c-fix-build-with-gcc-11.patch | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 package/xvisor/0002-psmouse-back.c-fix-build-with-gcc-11.patch
> 
> diff --git a/package/xvisor/0002-psmouse-back.c-fix-build-with-gcc-11.patch b/package/xvisor/0002-psmouse-back.c-fix-build-with-gcc-11.patch
> new file mode 100644
> index 0000000000..fdd75a6483
> --- /dev/null
> +++ b/package/xvisor/0002-psmouse-back.c-fix-build-with-gcc-11.patch
> @@ -0,0 +1,95 @@
> +From 9dc69a4ea899d2f982085ad727bcc92c4496c3ec Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 2 Sep 2021 18:13:03 +0200
> +Subject: [PATCH] psmouse-back.c: fix build with gcc 11
> +
> +Fix the following build failures with gcc 11:
> +
> +/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/build/drivers/drivers.o: in function `psmouse_extensions':
> +/home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `lifebook_detect'
> +/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `alps_detect'
> +/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `ps2pp_init'
> +/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `trackpoint_detect'
> +/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `fsp_detect'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/69062b9c80567d135edd48890165e69881cf7295
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: not sent (no answer on first patch)]

 Doesn't hurt to send it anyway, right?

> +---
> + drivers/input/mouse/psmouse-base.c | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
> +index 23956442..c6f740f7 100644
> +--- a/drivers/input/mouse/psmouse-base.c
> ++++ b/drivers/input/mouse/psmouse-base.c
> +@@ -719,6 +719,7 @@ static int psmouse_extensions(struct psmouse *psmouse,
> + {
> + 	bool synaptics_hardware = false;
> + 
> ++#ifdef CONFIG_MOUSE_PS2_LIFEBOOK
> + /*
> +  * We always check for lifebook because it does not disturb mouse
> +  * (it only checks DMI information).
> +@@ -729,6 +730,7 @@ static int psmouse_extensions(struct psmouse *psmouse,
> + 				return PSMOUSE_LIFEBOOK;
> + 		}
> + 	}
> ++#endif
> + 
> + /*
> +  * Try Kensington ThinkingMouse (we try first, because synaptics probe
> +@@ -772,6 +774,7 @@ static int psmouse_extensions(struct psmouse *psmouse,
> + 		synaptics_reset(psmouse);
> + 	}
> + 
> ++#ifdef CONFIG_MOUSE_PS2_ALPS
> + /*
> +  * Try ALPS TouchPad
> +  */
> +@@ -787,6 +790,7 @@ static int psmouse_extensions(struct psmouse *psmouse,
> + 			max_proto = PSMOUSE_IMEX;
> + 		}
> + 	}
> ++#endif
> + 
> + /*
> +  * Try OLPC HGPK touchpad.
> +@@ -819,19 +823,24 @@ static int psmouse_extensions(struct psmouse *psmouse,
> + 				      psmouse, set_properties) == 0)
> + 			return PSMOUSE_GENPS;
> + 
> ++#ifdef CONFIG_MOUSE_PS2_LOGIPS2PP
> + 		if (psmouse_do_detect(ps2pp_init,

 This is not actually the proper solution. Instead, the ps2pp_init (and all
other functions) should be declared static inline instead of plain inline in the
header file.


 Regards,
 Arnout

> + 				      psmouse, set_properties) == 0)
> + 			return PSMOUSE_PS2PP;
> ++#endif
> + 
> ++#ifdef CONFIG_MOUSE_PS2_TRACKPOINT
> + 		if (psmouse_do_detect(trackpoint_detect,
> + 				      psmouse, set_properties) == 0)
> + 			return PSMOUSE_TRACKPOINT;
> ++#endif
> + 
> + 		if (psmouse_do_detect(touchkit_ps2_detect,
> + 				      psmouse, set_properties) == 0)
> + 			return PSMOUSE_TOUCHKIT_PS2;
> + 	}
> + 
> ++#ifdef CONFIG_MOUSE_PS2_SENTELIC
> + /*
> +  * Try Finger Sensing Pad. We do it here because its probe upsets
> +  * Trackpoint devices (causing TP_READ_ID command to time out).
> +@@ -847,6 +856,7 @@ static int psmouse_extensions(struct psmouse *psmouse,
> + 			max_proto = PSMOUSE_IMEX;
> + 		}
> + 	}
> ++#endif
> + 
> + /*
> +  * Reset to defaults in case the device got confused by extended
> +-- 
> +2.32.0
> +
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
