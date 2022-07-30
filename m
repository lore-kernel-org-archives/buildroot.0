Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF92C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 16:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DFBD408DD;
	Sat, 30 Jul 2022 16:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DFBD408DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DHODvQ-d3pgL; Sat, 30 Jul 2022 16:28:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 487EF408FE;
	Sat, 30 Jul 2022 16:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 487EF408FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 174C01BF84C
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6870823C0
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6870823C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W2V8zzgh2jNw for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 16:28:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C01CA81DB2
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C01CA81DB2
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 16:28:47 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id p5so8978953edi.12
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 09:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WuYlFQIeAMnTrznT15PRg2mNClHRWbtkymK/cSPWRNU=;
 b=zKxDI6dVjGAMG1lqkrXl8wRVBxzAxkV6vnq4zk63f6Hpv9dRsFlUeq4vbdQZV07AWD
 sLyvPxlNrCsb2bkZeaC2YVNnflIpwTxSmuLgvANdjTcKdzz3/S000Im/cVKbpyUDGFTB
 msTn2ofAZxaZG4ym1ltJRq84/KPV7eLFOIx2D3FjN+6sTP6pzKJHLKN7vsdBWnD4oyk3
 vPD9PTa17i3M5Kzu9FEBfv0gC5L4mCSlNtNytRC0NU4iybs4eNLIzIkEphKA0k7d4JOv
 qzo0UxYWigEASE9qne7g2m1z52p7TbI3KLbtRtyY7i0LtUgoCpC7mUKl//O3uQc/DLj7
 3mPw==
X-Gm-Message-State: AJIora8keECSfu5EZqUO900ejezknsGm4WG8OUO0PkeEAXRzkLRiCUM1
 Twi/oK/MOh8/m/2q6CreclFq3A==
X-Google-Smtp-Source: AGRyM1tMoS8ec9zHAxV+Igce+AoFmdmV5oeF/Tzii5OX3kNAzLAETv91mgMVNScy249j/Kd1oY+Ghw==
X-Received: by 2002:a05:6402:611:b0:43c:cb2d:76c0 with SMTP id
 n17-20020a056402061100b0043ccb2d76c0mr8320231edv.425.1659198525990; 
 Sat, 30 Jul 2022 09:28:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 zo6-20020a170906ff4600b006feed200464sm3087263ejb.131.2022.07.30.09.28.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Jul 2022 09:28:45 -0700 (PDT)
Message-ID: <bf923353-f8b8-e93e-b911-f337f0f46da4@mind.be>
Date: Sat, 30 Jul 2022 18:28:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20220730105534.645046-1-bernd.kuhls@t-online.de>
 <20220730174036.48ca64aa@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220730174036.48ca64aa@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WuYlFQIeAMnTrznT15PRg2mNClHRWbtkymK/cSPWRNU=;
 b=bwRUmjSVX9vX/otH7cw9Wx38Vi2vS88e2W8FH0S689dNIbabTfLdoVz6Qjye8B/f2H
 24SWSKu+FyLoPzZwKWmhVTwJMJtwkFj8CcXQlD6/lRKotKoYoqT0vHTmAJZXf/6DlOzc
 57jdQId/kKsvDFBZgF1XGwCSkIvtZO0MHYUWZS6sWwFtBXH0hAllELaBpr1oNA/uy+Ru
 4YaQYr0QfaVnrN/ogxmOfaPilfkQE5TzrMjKJTsLTOol5t49sz/jWlbM9iF4IWdLGYHe
 /MtCNKIHIBO6gyj1o2pO9xuk7cvpdYL/D1nfdnScvtyVddv+hs1m1lFCuTcIZiHq0L/k
 JeZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bwRUmjSV
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: fix build error with
 c++ disabled
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/07/2022 17:40, Thomas Petazzoni via buildroot wrote:
> Hello Bernd,
> 
> On Sat, 30 Jul 2022 12:55:34 +0200
> Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> 
>> The vp8 encoder depends on c++ support since commit
>> 06a1a05b55aa64720d4ede9b07c385cc8f06625d
>>
>> src/transcoding/codec/codecs/libs/libvpx.c:23:10: fatal error: vpx/vp8cx.h: No such file or directory
>>     23 | #include <vpx/vp8cx.h>
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/152/152dec2f7148a23fa1a434d2c6ad31de6d1b2466/
>> http://autobuild.buildroot.net/results/009/0090b100eca4f94d2f0081ce0db7ff9b4ae0ca79/
>>
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>> ---
>>   package/tvheadend/Config.in    | 3 ++-
>>   package/tvheadend/tvheadend.mk | 7 +++++++
>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
>> index c033b29819..99a24ec011 100644
>> --- a/package/tvheadend/Config.in
>> +++ b/package/tvheadend/Config.in
>> @@ -66,7 +66,8 @@ config BR2_PACKAGE_TVHEADEND_TRANSCODING
>>   	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
>>   	select BR2_PACKAGE_FFMPEG_GPL # needed for x264 support
>>   	select BR2_PACKAGE_FFMPEG_SWSCALE
>> -	select BR2_PACKAGE_LIBVPX
>> +	# vp8 encoder needs c++
>> +	select BR2_PACKAGE_LIBVPX if BR2_INSTALL_LIBSTDCPP
>>   	select BR2_PACKAGE_X264
>>   	help
>>   	  Enable transcoding support.
>> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
>> index 1d1a714505..8ceb7493c8 100644
>> --- a/package/tvheadend/tvheadend.mk
>> +++ b/package/tvheadend/tvheadend.mk
>> @@ -47,6 +47,12 @@ TVHEADEND_DEPENDENCIES += rpi-userland
>>   else
>>   TVHEADEND_CONF_OPTS += --disable-omx
>>   endif
>> +ifeq ($(BR2_PACKAGE_LIBVPX)$(BR2_INSTALL_LIBSTDCPP),yy)
>> +TVHEADEND_CONF_OPTS += --enable-libvpx
>> +TVHEADEND_DEPENDENCIES += libvpx
>> +else
>> +TVHEADEND_CONF_OPTS += --disable-libvpx
>> +endif
> 
> It is apparently an optional dependency, so why do we select it in
> Config.in?

  It is select'ed by transcoding support, but in the .mk file the optional 
dependency is always added just in case there's something else in tvheadend that 
starts using it.

  Regards,
  Arnout

> 
> Thanks!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
