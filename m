Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453B2C6FD19
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 20:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D91E8402CE;
	Fri, 10 Mar 2023 20:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D91E8402CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q_79O3Lr-Il1; Fri, 10 Mar 2023 20:23:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 073FB4031B;
	Fri, 10 Mar 2023 20:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 073FB4031B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 909801BF390
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 20:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 771704098E
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 20:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 771704098E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BaAxdyPVui2B for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 20:23:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 661F640592
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 661F640592
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 20:23:11 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id i34so25326908eda.7
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 12:23:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678479789;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IDePchpKr1QAYjyo3BTCTqRQVyE+GU2Shxa0Hv2DD94=;
 b=4UOcFzCuVUyZUHYF3rTyodvtGurIH56cm0nOvPcdwGPDK9Ub4zQoHbH9pCf8T6QFsf
 OKdh2hPe/4TGoxamf9Srx6f/DbCYn+DfixI2Up7tg4rdcuIwy/uNfz1OtbiXBy7Fl2zY
 ugS1URcm9KYu1sBTNkEwqlsKlQFkge8ffDP88WROpQLj5cAf3J9HuSiI7e/BH4IVwFGp
 6aoeEG5aLcQmP6pa9x5uEf6DUhFyTwAMa39vsb+k/B0C0JMnl2YSMYEGDDIxWnMQxheK
 c01NkyARvebbo53l0JTvr5PE+zT2Y1/Uhqq4dRdCG0KMw1CL/jdCPokRePI+pZgsbYzA
 0YyQ==
X-Gm-Message-State: AO0yUKVIOcVy+8nOyjCIqg6fgTBLbMk+Kpl3rNUCmpZkUpB2awM8qlFr
 bXe4VAeRlsSjUCouomu7wDFqlQ==
X-Google-Smtp-Source: AK7set//lHSV1r6Up14f3sdVkSK/HJQqh/5h2O2NBbyaPlu46R9qMIwz6Mr0Vgu2XqbWhWLzI7K8sw==
X-Received: by 2002:aa7:c392:0:b0:4ac:d2b4:5e37 with SMTP id
 k18-20020aa7c392000000b004acd2b45e37mr21883269edq.39.1678479789350; 
 Fri, 10 Mar 2023 12:23:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170906b18500b0090953b9da51sm243565ejy.194.2023.03.10.12.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 12:23:08 -0800 (PST)
Message-ID: <0d558369-1ec0-b06b-2e0d-5bd051d915b2@mind.be>
Date: Fri, 10 Mar 2023 21:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230223153236.914358-1-fontaine.fabrice@gmail.com>
 <20230224000059.367730f1@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230224000059.367730f1@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678479789;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IDePchpKr1QAYjyo3BTCTqRQVyE+GU2Shxa0Hv2DD94=;
 b=Gz0o6R8/lHpvGGzssmavsUK+OtBjklHaTZcU7zZpwgqcLOZYNNeuLeD0ualNq1MlKv
 IjF9aXjrmQTvL3d4OdEUPx9iNMT9TJq/qUQvq5I3uLkSWIrvG2IZH2bXdgJ7rpqN6oJh
 0D9h44OwrOcoGHgcNZ5npIp42PaK4j0EomyKxYBTjSremBkMOPbLl6aFpI0F5AT4SHpK
 X2y1TDFtjsZ4muj635Z0LS5uUcQ8OjfTTn9yIbk2/7xE8xKOxKLu88QX2MhKg9f9J2Th
 Yc96PaiBS6TmRYcZxtN5eiLlxh8+StW2rhZr/yDv/K06jHx/As/mQxHjDYun+mkJ7tIq
 NW8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Gz0o6R8/
Subject: Re: [Buildroot] [PATCH 1/1] package/cairo: fix pthread detection
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



On 24/02/2023 00:00, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> On Thu, 23 Feb 2023 16:32:36 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> pthreads detection fails if a warning is emitted resulting in the
>> following build failure with some toolchains:
>>
>> onfigure:34189: checking for cairo's pthread feature
>> configure:34300: /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O0 -g2  -D_REENTRANT -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lrt -latomic -lexecinfo -lm -lpthread >&5
>> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies executable stack
>> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
>> configure:34300: $? = 0
> 
> So this returns success.
> 
>> configure:34419: /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O0 -g2  -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lrt -latomic -lexecinfo -lm  >&5
>> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies executable stack
>> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
>> configure:34419: $? = 0
> 
> This as well.
> 
>> configure:34500: /home/buildroot/autobuild/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O0 -g2  -D_REENTRANT -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lrt -latomic -lexecinfo -lm  >&5
>> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: warning: /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/crtend.o: missing .note.GNU-stack section implies executable stack
>> /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/11.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
>> configure:34500: $? = 0
> 
> This as well.
> 
>> configure:34555: checking whether cairo's pthread feature could be enabled
>> configure:34557: result: no (can't link with -lpthread or -pthread)
> 
> So why does it conclude that thread support is not available?

  Because the configure script is stupid. Extract from the script:

> ac_fn_c_try_compile ()
> {
> [...]
>   (eval "$ac_compile") 2>conftest.err
>   ac_status=$?
>   if test -s conftest.err; then
>     grep -v '^ *+' conftest.err >conftest.er1
>     cat conftest.er1 >&5
>     mv -f conftest.er1 conftest.err
>   fi
>   $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
>   test $ac_status = 0; } && {
>          test -z "$ac_c_werror_flag" ||
>          test ! -s conftest.err
            ^^^^^^^^^^^^^^^^^^^^^^
  This test will fail (conftest.err is not empty).

>        } && test -s conftest.$ac_objext; then :
>   ac_retval=0
> else
>   $as_echo "$as_me: failed program was:" >&5
> [...]
> } # ac_fn_c_try_compile


> 
> 
>> + 	dnl Make sure we scored some pthreads.
>> + 	if test "x$enable_pthread" = "xyes" -a "x$have_pthread" != "xyes"; then
>> +-		AC_MSG_ERROR([pthread requested but not found])
>> ++		AC_MSG_WARN([pthread requested but not found])
>> ++		have_pthread=yes
> 
> This looks odd because you're basically "ignoring" the
> detection/validation of thread support.

  Yeah, the alternative is to patch host-autoconf to not do that stupid check of 
conftest.err. Which is perhaps a better idea, because it solves things globally. 
But who knows, maybe some checks actually rely on this?

  Or alternative, do something with binutils 2.39 (which is the one that 
introduced the warning) to suppress the warning. It probably won't fix external 
toolchains then though.

  Note that cairo upstream has moved to meson four years ago, we just haven't 
updated cairo in a long time.

  Regards,
  Arnout

> 
> Best regards,
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
