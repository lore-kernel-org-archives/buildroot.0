Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A067C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 21:40:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD38A61168
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 21:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD38A61168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E2B14035B;
	Tue,  9 Nov 2021 21:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jOlrUEXa3ycl; Tue,  9 Nov 2021 21:40:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B1E640448;
	Tue,  9 Nov 2021 21:40:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BED961BF5DF
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 21:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC63240166
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 21:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQM80x5pN6IE for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 21:40:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45D5A40015
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 21:40:29 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id j21so1971425edt.11
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 13:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1zLAlQ4NwGNb6qJLACeKXUk4gHoiLJrELwYwjMPmP2c=;
 b=RrhbdFJDlzDdtj0tk6bca5WO+1l70lfTzAWgMUwbhUzWH6a4fcLMPzWivwXIBzH/te
 h1MBd6Ev/R92rqe8VZSGtwCtcooDSzj6OyKvxB0nDLF9KhFMvt/Z2VPxVCxwcexAK7ny
 3AIZY8O+ED7GRL/RVKIxj3Z6gjpiY6dLMDZWDLEREaVU3YMf7fZhWvmqKogNvym15He8
 v7KcVBZzGVREADslmTKooYO6pWqwj1xbEBuBsOmshki8Mtb4Rz3Jlx6Us+znhcM9P/pY
 wYe6TONLO7MnO1uK2qnvFJ9FVxUHxRQ0aSYS/iqeH5p49aBO12aTuT8qKxvrm7Ias70T
 tLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1zLAlQ4NwGNb6qJLACeKXUk4gHoiLJrELwYwjMPmP2c=;
 b=2Ctc2dxCe1mYH9eiVC7gnvvuqZbgleffyOIKp2Cj6QMAt8yFK9sCh+hseqmoEw5v8s
 NCWwTn5Q5hiEXqLlGdDFstVZhnJXAIpAK3I7Gr0MGODD9cR1CKuT0CbH3jMPi5AWqfaJ
 HxX2hCUWUeqM2fpFrvMZbU2Fk3PbmOSLa/Qc8agtxdohVWm+Mk/GQh+vg7PKDVc49rjZ
 kAOs/l9mYkA1vbNW1B2mIBq9Gu0B4/AsVUkDfbZCLor0+9FZh/gKwOg9DrxEDic90MpU
 WVJl1s61VV6eSUHWX2zFE2SKmf/ElGNGLuBraZijjpOT9ldKpEe/ig2tdDM29o/XRBft
 2ydg==
X-Gm-Message-State: AOAM531tmEVcPhjwjBplDqmlqnfs9zbHMr8kUr1sUiCc1/unyLYJA8f0
 wJsmatdC6EXIcJsAS0tNxu89/g==
X-Google-Smtp-Source: ABdhPJxKGdc6Xddps0Ycdz2VOXXohnCDRpEDn65CMTqVEHXz5jZXJmcn+/yrj391zeKAp+wJWnhksw==
X-Received: by 2002:aa7:cada:: with SMTP id l26mr14895727edt.376.1636494027381; 
 Tue, 09 Nov 2021 13:40:27 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s16sm11609192edy.11.2021.11.09.13.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 13:40:26 -0800 (PST)
Message-ID: <8aa1132c-43c5-93bc-718b-5199c9936c0d@mind.be>
Date: Tue, 9 Nov 2021 22:40:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211030214734.2154583-1-fontaine.fabrice@gmail.com>
 <20211101094752.4f0e6943@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211101094752.4f0e6943@windsurf>
Subject: Re: [Buildroot] [PATCH 1/1] package/oprofile: needs zlib
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/11/2021 09:47, Thomas Petazzoni wrote:
> On Sat, 30 Oct 2021 23:47:34 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> oprofile needs zlib to avoid the following build failure which is, for
>> an unknown reason, only raised since August 2021:
> 
> I don't really like changes that are made "for an unknown reason".
> Indeed, if you look at
> http://autobuild.buildroot.net/?reason=oprofile-1.4.0, this issue only
> appeared 3 times, and only on static-linking configurations.
> 
> So, I would really like to see a better investigation than just "adding
> this fixes the problem". We are clearly building OProfile many many
> times in the autobuilder, and it doesn't need zlib, except in this
> particular statically linked configuration.
> 
> So I'm afraid we need a more in-depth exploration of this issue.

  I did a slightly more in-depth exploration.

  In config.log, we see this:

configure:13535: checking for bfd_openr in -lbfd
configure:13560: 
/tmp/instance-0/output-1/per-package/oprofile/host/bin/arm-linux-gcc -o conftest 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 
-static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-static conftest.c -lbfd  -liberty -lpopt  -lintl >&5
/tmp/instance-0/output-1/per-package/oprofile/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: 
/tmp/instance-0/output-1/per-package/oprofile/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libbfd.a(compress.o): 
in function `decompress_contents':
compress.c:(.text+0x3c): undefined reference to `inflateInit_'
/tmp/instance-0/output-1/per-package/oprofile/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: 
compress.c:(.text+0x70): undefined reference to `inflateEnd'
/tmp/instance-0/output-1/per-package/oprofile/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: 
compress.c:(.text+0xa4): undefined reference to `inflate'
/tmp/instance-0/output-1/per-package/oprofile/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: 
compress.c:(.text+0xb8): undefined reference to `inflateReset'
/tmp/instance-0/output-1/per-package/oprofile/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: 
/tmp/instance-0/output-1/per-package/oprofile/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libbfd.a(compress.o): 
in function `bfd_compress_section_contents':
compress.c:(.text+0x640): undefined reference to `compressBound'
/tmp/instance-0/output-1/per-package/oprofile/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: 
compress.c:(.text+0x6d8): undefined reference to `compress'
collect2: error: ld returned 1 exit status


  Note that in this configuration, zlib is not selected (*), but apparently 
libbfd is still built with zlib support...

  It's pretty weird that the autobuild failure only started happening in August, 
on the 2021.02.x branch... But since it also happened on master only once, I 
guess it's just very very rare.


  Regards,
  Arnout

(*) which explains why this fails so infrequently. Static is already pretty 
rare, but in addition zlib is almost always selected by some other package. I 
checked in the autobuilder advanced search [1] but unfortunately I don't think 
there's a way to specify negative symbols, so I just checked about 20 of them 
manually and only the failing one doesn't have zlib selected.

[1] 
http://autobuild.buildroot.net/index.php?date[from]=2020-11-01&static=1&symbols[BR2_PACKAGE_OPROFILE]=y

(note: takes a very very long time to load).
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
