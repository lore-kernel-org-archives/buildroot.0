Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C579C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:43:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DF2261168
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DF2261168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21018406CC;
	Tue, 21 Sep 2021 20:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jh1BqhOOLvPL; Tue, 21 Sep 2021 20:43:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FFAA401FE;
	Tue, 21 Sep 2021 20:43:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB6DD1BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAA90401C3
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xm465uEmYhHG for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:43:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2AE9401BF
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:43:54 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id ee50so1066730edb.13
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=86FXttZVGXkZ09M7+GAD6P1vNMje7YKBmje5TQ51R74=;
 b=a0zgUrpaoW1PggreoxQ5L4KtwHTSZiIj+mxwzxnzuJad4wA77WPZYk0XYaOZp1nrSC
 bdNtFZxETlRtieQmr9oaICDsHhxLB3lq+9HgT1iBP1X6HMd86YO5HH3T/FheL+iscy9o
 XPv2LX4BCAvLTdU7YAQu+sv5sQeuPmHSAo2Cz8hsFvuZRBgCk/awi4N+3BACsogyg6Wi
 QFqlWnTC+Xnl/xrL0jpQoXWZg2mK0j6sOpUXumJeDLwWtN81Nu7dfQ0Jbzx7DPywlejR
 LSKt/NPEVsoKJ1fioDv7BDsW2hFvGs/fmhs7AAfRwOXHzsoOEoyt9IChCQ+iqP7wVoMD
 N3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=86FXttZVGXkZ09M7+GAD6P1vNMje7YKBmje5TQ51R74=;
 b=OMW6Mk5aRyBrdKQ+gkIJ//WF5vUVgfHKrrQzL6XuUPeYpKxugecdRofi+hTz1PhWYH
 q8nfI/UL4qdvrQrVaLoqvP2LB2fRGGusqUSAI0nTeb5Vfl0cla/5VIefS8jxH4oguinn
 8ZHy9C1Gy5s3yqScKkUzkCuVttF2cNc7L+2yXmO+BY1ekCmpGEzyODTEyyqdKbk6VQ5f
 J4eHuhCKTp2gwXcX1eANQYPBRl6+Ud9NCzg9sDZP2yScqFgJiG7Fd4/w/maOBE4Xy0+k
 14o92UOKf3aBq1t2EReL8AkRByoBBbV4K3LoUb5sBeDLGVtR9RRmtW0wlUVqc70c7cRF
 QyKA==
X-Gm-Message-State: AOAM5337O6hX3xyWXhyxE3bGFUOVqVyuMtmgEb7fpEYiwjjA+7woNcPE
 sX9yjXNiSmOkOTf2aKnKyUE+Xw==
X-Google-Smtp-Source: ABdhPJwQs83xq/wLK0ISlUUJq6+QrKWxfbmfGtQKgcYhl12wuA+tqzDS6yiF1QktcT8//fOSvZMkIw==
X-Received: by 2002:aa7:cd79:: with SMTP id
 ca25mr38601001edb.389.1632257032771; 
 Tue, 21 Sep 2021 13:43:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m13sm14446ejn.3.2021.09.21.13.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 13:43:52 -0700 (PDT)
Message-ID: <98dad0aa-a729-5385-180c-0d29c4067b9e@mind.be>
Date: Tue, 21 Sep 2021 22:43:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 buildroot@buildroot.org
References: <20210913072942.30109-1-patrickdepinguin@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210913072942.30109-1-patrickdepinguin@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] docs/manual/using-buildroot-debugger:
 suggest '-ix' iso '-x' when loading gdbinit
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 13/09/2021 09:29, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> A gdbinit file passed via '-x' will be read _after_ parsing any
> object/core file passed on the command-line. In cross-compilation context,
> this is particularly a problem when loading a core file, because without the
> 'sysroot' specified in the gdbinit file, it will give a lot of warnings,
> like:
> 
>      warning: .dynamic section for "/lib/libstdc++.so.6" is not at the expected address (wrong library or version mismatch?)
>      warning: .dynamic section for "/lib/librt.so.1" is not at the expected address (wrong library or version mismatch?)
>      warning: .dynamic section for "/lib/libm.so.6" is not at the expected address (wrong library or version mismatch?)
>      warning: .dynamic section for "/lib/libgcc_s.so.1" is not at the expected address (wrong library or version mismatch?)
>      warning: .dynamic section for "/lib/libc.so.6" is not at the expected address (wrong library or version mismatch?)
>      warning: .dynamic section for "/lib/ld-linux.so.2" is not at the expected address (wrong library or version mismatch?)
>      warning: .dynamic section for "/lib/libanl.so.1" is not at the expected address (wrong library or version mismatch?)
>      warning: .dynamic section for "/lib/libdl.so.2" is not at the expected address (wrong library or version mismatch?)
>      warning: .dynamic section for "/lib/libpthread.so.0" is not at the expected address (wrong library or version mismatch?)
>      warning: .dynamic section for "/usr/lib/libz.so.1" is not at the expected address (wrong library or version mismatch?)
>      warning: .dynamic section for "/lib/libnss_files.so.2" is not at the expected address (wrong library or version mismatch?)
> 
>      warning: Could not load shared library symbols for 17 libraries, e.g. [...]
>      Use the "info sharedlibrary" command to see the complete listing.
>      Do you need "set solib-search-path" or "set sysroot"?
> 
> In contrast, the '-ix' option will load the specified gdbinit file _before_
> parsing object/core files. This will remove said warnings.

  I didn't know this!

  Applied to master, thanks.

  Regards,
  Arnout

> 
> See also: https://sourceware.org/bugzilla/show_bug.cgi?id=28330
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>   docs/manual/using-buildroot-debugger.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/using-buildroot-debugger.txt b/docs/manual/using-buildroot-debugger.txt
> index d5293beb53..9a8a7dfbaf 100644
> --- a/docs/manual/using-buildroot-debugger.txt
> +++ b/docs/manual/using-buildroot-debugger.txt
> @@ -35,7 +35,7 @@ Then, on the host, you should start the cross gdb using the following
>   command line:
>   
>   ----------------------------
> -<buildroot>/output/host/bin/<tuple>-gdb -x <buildroot>/output/staging/usr/share/buildroot/gdbinit foo
> +<buildroot>/output/host/bin/<tuple>-gdb -ix <buildroot>/output/staging/usr/share/buildroot/gdbinit foo
>   ----------------------------
>   
>   Of course, +foo+ must be available in the current directory, built
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
