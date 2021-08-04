Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC95EC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:18:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5110B60F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5110B60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BB4A401CE;
	Wed,  4 Aug 2021 21:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ST2ML7T8Q1q5; Wed,  4 Aug 2021 21:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ABD540224;
	Wed,  4 Aug 2021 21:18:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BCD21BF5DB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 292D740147
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Y8xnU7vDdnO for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:18:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE797400F8
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:18:50 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id f13so5263298edq.13
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 14:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VTOUUrK947qD+MoaYj8T6yB+41eLPzRgGILt7VQmgXE=;
 b=giaQw1sbYdgS3h2XCyzmqDTplP4mdbNj9WUBPxzVJNur4CsB6WdmDdUtcg50bPTHSF
 Y+on0xreOrmnpk6L+XOOxOezSmZD+YcvdQpuW3qFvb/YglcJ/I8lZSplefwx5Bk1Be8o
 rD71LA8Q+Ai/trRT9dICdejhlsau+LNutwHhEsWhllAT0ROmito6RPNUfu5vkeRxSKO4
 1UWIMv3G87dsjUlgTPFE8Q3X+FoIopNMMj8bKxUmIeNXbJr1COAd5Xhcv7wpK4Mfuxdk
 4F8Q00CeevNIew5n9rgPOU1RwmbY6RONzpsnVeX3oBtg95cH0PWPFScAVXo/TKsOFFTJ
 0Htw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VTOUUrK947qD+MoaYj8T6yB+41eLPzRgGILt7VQmgXE=;
 b=MT7UAbOV6LRiL7O/7gvB+O0Pw08DaB89wneEXWTgxcsvd5c9uFonBxdZrv4ozBruJK
 Kt8vEhZ6UkfcbgUR2syM6/EbmOnXV4Le3clAfkRF5ySupgg6PiodJ5n4y1RO6/ltwBUV
 wMcfGThJSE5EW12vbZuu9vA6TQGNVFGxWRTfuHNQCR1OtpXQbhudSMEUQFcTvIXtmM8g
 dI86FoV/fZQ8+dOTQMcCo1oJ5MP1RYMcfDU2L5CcxB+ybmPstHp8sxU5OrXI4jIVyVT7
 S0v58pS6bxtixtzDSV1N614H40B1dto+ua8/CaJtY/GSL86lEL4Ky0Et6frZTeBcUSYi
 Wvyw==
X-Gm-Message-State: AOAM533OumqbnBDITSkCqeSKYzDtw4EQyv6ALyR9IyZeBIvpNzZgjQhm
 dlVcyFXGOoMyUJeSfMKlc32dwa8dyZ9pO6LykTg=
X-Google-Smtp-Source: ABdhPJz1Te4sQawRGrCeLfuZOUYxMr+3c7UjV5qBnzHgvo9g4uMD3B82OsRJMBQidcmp5P+OsrCPmw==
X-Received: by 2002:a05:6402:1a3a:: with SMTP id
 be26mr2054476edb.232.1628111929146; 
 Wed, 04 Aug 2021 14:18:49 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id fr4sm1009634ejc.42.2021.08.04.14.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 14:18:48 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210804090813.789131-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <0d88d680-5bdb-2aec-daad-0425d5259c65@mind.be>
Date: Wed, 4 Aug 2021 23:18:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804090813.789131-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/sox: fix static build with
 libsndfile
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



On 04/08/2021 11:08, Fabrice Fontaine wrote:
> Fix the following static build failure with libsndfile raised since
> commit dbc6e9e9f385995eb10bbfb0bb08e7674100ce66:
> 
> configure:14720: checking for sf_open_virtual in -lsndfile
> configure:14745: /tmp/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g0  -static -Wall -Wmissing-prototypes -Wstrict-prototypes  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -Wl,--as-needed conftest.c -lsndfile    >&5
> conftest.c:73:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
>    73 | char sf_open_virtual ();
>       | ^~~~
> conftest.c:75:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
>    75 | main ()
>       | ^~~~
> /tmp/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /tmp/instance-1/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libsndfile.a(libsndfile_la-flac.o): in function `flac_byterate':
> flac.c:(.text+0xfc): undefined reference to `FLAC__StreamDecoderErrorStatusString'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4bc58ed68b29642876bb02710d0cd4f31540de86
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  ...e.ac-fix-static-linking-with-sndfile.patch | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/sox/0005-configure.ac-fix-static-linking-with-sndfile.patch
> 
> diff --git a/package/sox/0005-configure.ac-fix-static-linking-with-sndfile.patch b/package/sox/0005-configure.ac-fix-static-linking-with-sndfile.patch
> new file mode 100644
> index 0000000000..2233459331
> --- /dev/null
> +++ b/package/sox/0005-configure.ac-fix-static-linking-with-sndfile.patch
> @@ -0,0 +1,44 @@
> +From 06109c84ab6930265287049c4bf9405e7ebc4986 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 4 Aug 2021 10:27:16 +0200
> +Subject: [PATCH] configure.ac: fix static linking with sndfile
> +
> +Use SOX_FMT_PKG to retrieve sndfile dependencies (e.g. flac, opus or
> +vorbis). This will fix the following static build failure:
> +
> +configure:14720: checking for sf_open_virtual in -lsndfile
> +configure:14745: /tmp/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g0  -static -Wall -Wmissing-prototypes -Wstrict-prototypes  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -Wl,--as-needed conftest.c -lsndfile    >&5
> +conftest.c:73:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
> +   73 | char sf_open_virtual ();
> +      | ^~~~
> +conftest.c:75:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
> +   75 | main ()
> +      | ^~~~
> +/tmp/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /tmp/instance-1/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libsndfile.a(libsndfile_la-flac.o): in function `flac_byterate':
> +flac.c:(.text+0xfc): undefined reference to `FLAC__StreamDecoderErrorStatusString'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/4bc58ed68b29642876bb02710d0cd4f31540de86
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: not sent yet (waiting for feedback on third patch)]
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 8ae3202c..26510769 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -117,7 +117,7 @@ SOX_FMT_REQ([mp3], [MAD LAME TWOLAME])
> + SOX_FMT_PKG([oggvorbis], [ogg vorbis vorbisenc vorbisfile])
> + SOX_FMT_PKG([opus], [opusfile])
> + 
> +-SOX_DL_LIB([libsndfile], [sndfile.h], [sndfile], [sf_open_virtual])
> ++SOX_FMT_PKG([libsndfile], [sndfile])
> + SOX_FMT_REQ([sndfile], [LIBSNDFILE])
> + 
> + SOX_FMT_LIB([wavpack], [wavpack/wavpack.h], [wavpack], [WavpackGetSampleRate])
> +-- 
> +2.30.2
> +
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
