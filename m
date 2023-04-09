Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC5FC77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 13:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBDE34032A;
	Sun,  9 Apr 2023 13:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBDE34032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d4I7-WjZ31za; Sun,  9 Apr 2023 13:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E99984014E;
	Sun,  9 Apr 2023 13:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E99984014E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 403FA1BF82D
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26DA54014E
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26DA54014E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 539Ul5xlaDjH for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 13:31:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EC7D40022
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EC7D40022
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 13:31:46 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94a342f15e4so50432166b.0
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 06:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681047104;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B7+q310+LKMy6GqjSuCW4qOYthgX/MSHPTKMsGD1w4g=;
 b=rOm6/d0Vic2dLR2v8MPcnWQoDhYlrgFIian1U3wE7TsBFYPx5LXWVjwp+C/MePsSAs
 XuCDl8KU9e7XsdP1QY5f7p5efupzdVO8Mup6jXINhzA0e4Mw2S8xYJ57ozv9DuCdPlnu
 khgJZxBSuVqXIlP3LmNmeqjWnNXHlC9eesDfvEFPYJ8uKIRX77PL+iTMzt72N/x2t1CI
 ShmU7Uk6LI2O17iwXM+SBZMYX30kdDsiNSLHfQkdLC1lKMGNpwzFgi/1WPLqWE2NU00F
 t4BpflYqBSxXHJDJ8g7+lDLX3TDG8nJzWv2aYsTXdLAoco9vsGz9Gm3tNyt6fv5VKmEw
 /iRA==
X-Gm-Message-State: AAQBX9elflyduWRoV4jxXpS/F4yjDD86fTK/w+O2hJXkDtuFAxRkzmxI
 jUUv41ddHQswhDImAenlOOldJq+ubJ+4Qyx1LCI=
X-Google-Smtp-Source: AKy350ZucupWELMRaqoRz1cS0Dq0yac/hI4GhKrT3CZlL8aMO9tzUMF4byFqWFya02fr1i6g5TO+cA==
X-Received: by 2002:aa7:c393:0:b0:500:2cc6:36da with SMTP id
 k19-20020aa7c393000000b005002cc636damr7041816edq.19.1681047104102; 
 Sun, 09 Apr 2023 06:31:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05640235cb00b004fa380a14e7sm3819008edc.77.2023.04.09.06.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 06:31:43 -0700 (PDT)
Message-ID: <10144c7d-50db-b34b-edc3-5c6b32a794df@mind.be>
Date: Sun, 9 Apr 2023 15:31:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20230408135150.245980-1-dario.binacchi@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230408135150.245980-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681047104;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B7+q310+LKMy6GqjSuCW4qOYthgX/MSHPTKMsGD1w4g=;
 b=hP7Apq3REt1sJ/E6fYJJL5KBRbt6JzbWei0zw8rUk/EkjIAFDCR46DQDE9aC5tLDt3
 DeTFTu645A5a1blY/r88yOJVJw6uc/FAt8nYFrfaQ4bFaJJy+7UKIKPaXyaYV+zCFawo
 9stPZdzHUR0E2wf8x5RsrTv1PGpVs4NRk7RC8L2WD1eOPnXjT+geXRarzF63ylQ51MYJ
 1otabkW7ctO/RUijNLiOQbMuKqBitN98v4KP05FjGBbIgcdzhE+y5PfEHUhQAk+2PSIx
 +VVt3wHtyhYkGGw315QbtZXw0hynbtkcOdWfrwog3RSoB/U1TB1pt1/rJVHT2C9oPw8h
 MOZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hP7Apq3R
Subject: Re: [Buildroot] [PATCH 1/1] package/openocd: bump to 0.12.0
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



On 08/04/2023 15:51, Dario Binacchi wrote:
> As reported by [1], version 0.12.0 fixes these errors:
> 
> Error executing event examine-end on target stm32f7x.cpu:
> buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl:37: Error: wrong # args: should be "expr expression"
> in procedure 'mmw' called at file "buildroot/output/host/bin/../share/openocd/scripts/target/stm32f7x.cfg", line 103
> at file "buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl", line 37
> Info : starting gdb server for stm32f7x.cpu on 3333
> Info : Listening on port 3333 for gdb connections
> Info : Unable to match requested speed 2000 kHz, using 1800 kHz
> Info : Unable to match requested speed 2000 kHz, using 1800 kHz
> Error executing event examine-end on target stm32f7x.cpu:
> buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl:37: Error: wrong # args: should be "expr expression"
> in procedure 'ocd_process_reset'
> in procedure 'ocd_process_reset_inner' called at file "embedded:startup.tcl", line 288
> in procedure 'mmw' called at file "buildroot/output/host/bin/../share/openocd/scripts/target/stm32f7x.cfg", line 103
> at file "buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl", line 37
> target halted due to debug-request, current mode: Thread
> xPSR: 0x01000000 pc: 0x080003fc msp: 0x20050000
> Error executing event reset-init on target stm32f7x.cpu:
> buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl:37: Error: wrong # args: should be "expr expression"
> in procedure 'ocd_process_reset'
> in procedure 'ocd_process_reset_inner' called at file "embedded:startup.tcl", line 288
> in procedure 'mmw' called at file "buildroot/output/host/bin/../share/openocd/scripts/board/stm32f769i-disco.cfg", line 71
> at file "buildroot/output/host/bin/../share/openocd/scripts/mem_helper.tcl", line 37
> 
> Remove upstream patches.
> 
> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1014849
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

[snip]

> diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.hash
> index 91eb56d930ea..b605eb7aa463 100644
> --- a/package/openocd/openocd.hash
> +++ b/package/openocd/openocd.hash
> @@ -1,3 +1,3 @@
>   # From http://sourceforge.net/projects/openocd/files/openocd/0.11.0/
> -sha256  43a3ce734aff1d3706ad87793a9f3a5371cb0e357f0ffd0a151656b06b3d1e7d  openocd-0.11.0.tar.bz2
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> +sha256  af254788be98861f2bd9103fe6e60a774ec96a8c374744eef9197f6043075afa  openocd-0.12.0.tar.bz2
> +sha256  1b8f7e37ee5afbbf95c2a4d62b12b25232e29538692663b434318503a9a88419  COPYING

  If the license hash changes, you _have_ to explain why in the commit message. 
In this case, it's because the license file moved from COPYING to 
LICENSES/preferred/GPL-2.0, and another file was added to explain the licenses. 
So we now need 3 license files: COPYING, LICENSES/preferred/GPL-2.0 and 
LICENSES/license-rules.txt. While you're at it, check the latter file to verify 
if maybe our GPL-2.0+ tag was not entirely correct.

  Marked as Changes Requested.

  Regards,
  Arnout

> diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
> index 37a06ca848b7..95a7fd3c2a2c 100644
> --- a/package/openocd/openocd.mk
> +++ b/package/openocd/openocd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENOCD_VERSION = 0.11.0
> +OPENOCD_VERSION = 0.12.0
>   OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
>   OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
>   OPENOCD_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
