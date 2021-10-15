Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D4FC433FE
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:24:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE09661181
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 19:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE09661181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A02560726;
	Fri, 15 Oct 2021 19:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 58-bFuekDiHK; Fri, 15 Oct 2021 19:24:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2D7860BC3;
	Fri, 15 Oct 2021 19:24:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFD2A1BF41F
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB84983AF0
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 19:24:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QVpFm35J3KKs for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 19:24:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF10A83AE8
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 19:24:00 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id ec8so42129699edb.6
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 12:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=+I7xYfNetT2EQ/LbJWp30dmP6rjico4XV9DNVKpMrxI=;
 b=IuV/fg+UbxoTKch1VKKMxvZQzqqSyNq4Bs9tBpassWA7jZUQuh5HV/4FUUXguL/EqH
 JWxhLLjrwBrQnEnNzc0LTlhGHwdc24/qnxmGRvNLiyfKZ11f2tKvm4PWq/AoJBpmNXTU
 jWy3ht33UfecJeKhE0KCMyqzMM67EZ/XG72IuESU2F6WVnzfPZskwPQIfQUKNPJTFf1E
 Jsqz7MYg/BLEfK8341SxOLJ+8olrIOqq5gaWM1onNLVEczz0/nGFWgs4/FVLH7AjdhZ3
 CAKXvIhTA6WN+ablXzn/4X4fEw8Ckq2ZI5ot5A4gRC7YcE27p635VlbWDvsgJ4LPrxfu
 QBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+I7xYfNetT2EQ/LbJWp30dmP6rjico4XV9DNVKpMrxI=;
 b=hZFPv8aevMNN1Gr1Wi/0j8ZtBuBN1VjwDl7hAcFaBi4SFrvFU98hpHWmHlaM7AgTJk
 CFqC+65sKUn//s8AMelaPWmeGUVWEIAmnnaoY2VG50zVgXM/EcOE6Gr07YGLc0gYuBW9
 BJOeuVOuqOunb2C4HoriHhoAz03Ylpg3UmXk4vigylX2Y0Y/pIrfCjCQHUqGUv3q3eOy
 KRY7GxoWrbxnjDMtsDl4baOS3v8UWX00sXc5RC7lj5QAmHQ6vZqnKFKneg+ovfIQ0+df
 uiQQi6c8vVzJpFFbEpj9J27d6QoAvNri+n0r/HLMhGdnhQ1MuCnLCctmB5vzXWipfeCs
 Swaw==
X-Gm-Message-State: AOAM53160lcomHRhm6GrKn0sB+JZBQ8Z2v/9LnrcNvxNiZT/5lbWfHzj
 Ox6KBOFHNG6u+VaDLiFX+lxWlw==
X-Google-Smtp-Source: ABdhPJy1vR2Bi7c98O9NQB3lxHPCb2SOiFFXCyuNuZdQvt/nz0QvmSoF10fXl2DA/UOt73GS/ZMbAQ==
X-Received: by 2002:a05:6402:694:: with SMTP id
 f20mr20422323edy.100.1634325838781; 
 Fri, 15 Oct 2021 12:23:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v13sm5613019ede.79.2021.10.15.12.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 12:23:58 -0700 (PDT)
Message-ID: <df7940c6-50e3-319e-42d3-602426b5effa@mind.be>
Date: Fri, 15 Oct 2021 21:23:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: William Tambe <tambewilliam@gmail.com>, buildroot@buildroot.org
References: <CAF8i9mOWDB9MSrgipQWH8bHzQf4bc=m+t=dTwdGrSb7SASF2Ew@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAF8i9mOWDB9MSrgipQWH8bHzQf4bc=m+t=dTwdGrSb7SASF2Ew@mail.gmail.com>
Subject: Re: [Buildroot] git failing to build: zlib.h: No such file or
 directory
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



On 15/10/2021 18:28, William Tambe wrote:
> Hi,
> 
> I am not able to build git on BuildRoot 2021.08.1; it complains about
> not finding zlib.h despite the header existing at
> target/usr/include/zlib.h .

  Whether it's in target doesn't matter, it has to be in the staging directory, 
i.e. host/pu32-buildroot-linux-gnu/sysroot/usr/include/zlib.h

  If it's not there: can you reproduce this with a clean build?

  Also, we have no architecture called "pu32", so you must be using a fork of 
buildroot.

  To debug this further, run the failing command manually and add -v to the gcc 
command line:

cd /home/tambewilliam/Documents/buildroot-build/build/git-2.31.1/
/home/tambewilliam/Documents/buildroot-build/host/bin/pu32-elf-gcc -v -o 
fuzz-pack-idx.o -c -MF ./.depend/fuzz-pack-idx.o.d -MQ fuzz-pack-idx.o -MMD -MP 
  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 
-static -I. -DHAVE_SYSINFO -DGIT_HOST_CPU="\"x86_64\"" -DHAVE_ALLOCA_H -DNO_CURL 
-DNO_OPENSSL -DNO_GETTEXT -DNO_DEFLATE_BOUND -DSHA1_DC 
-DSHA1DC_NO_STANDARD_INCLUDES -DSHA1DC_INIT_SAFE_HASH_DEFAULT=0 
-DSHA1DC_CUSTOM_INCLUDE_SHA1_C="\"cache.h\"" 
-DSHA1DC_CUSTOM_INCLUDE_UBC_CHECK_C="\"git-compat-util.h\"" -DSHA256_BLK 
-lpthread -DHAVE_PATHS_H -DHAVE_STRINGS_H -DHAVE_DEV_TTY -DHAVE_CLOCK_GETTIME 
-DHAVE_CLOCK_MONOTONIC -DHAVE_GETDELIM 
'-DPROCFS_EXECUTABLE_PATH="/proc/self/exe"'  -DSNPRINTF_RETURNS_BOGUS 
-DFREAD_READS_DIRECTORIES -DNO_STRLCPY -DSHELL_PATH='"/bin/sh"' 
-DPAGER_ENV='"LESS=FRX LV=-c"'  fuzz-pack-idx.c

This will give you a list of all the include paths that are used, so you can 
check that the one containing zlib.h is there.


  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
