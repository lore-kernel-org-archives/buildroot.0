Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C39CAC59A
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 00:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2BC5613E4;
	Thu, 18 Sep 2025 00:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQCPdFZcit6F; Thu, 18 Sep 2025 00:28:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5526A61ABD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5526A61ABD;
	Thu, 18 Sep 2025 00:28:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27BDD199
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 00:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D6D184916
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 00:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8xTECNnr9sL for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 00:28:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4A4284915
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4A4284915
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4A4284915
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 00:28:10 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b54c86f3fdfso1082977a12.1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758155290; x=1758760090;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ehis6H1gYJ1b4XuJFifGhENn45yjTT5jnS76oQlT7+o=;
 b=gQrKTAWkE9kt5gd7Kx35522yma4bgzBVJLwMej1BBqK9zHYBbq52Aw0v0o5NCyddIY
 WB2KtFviUUYpa8iqVVPpnJP4COu6BhN6I6zeAHTmOlHnbRPU/5KSh1whV3CKhdJnV9oF
 zfBbVCbJ9yrPKAxVfzBlEknqUw7UrdW+yXm2+h7FagEeYeWxivFgRyGP4lgrAdexgm0M
 8zkpnkMYQRmJXeMCP5AIWO/WDIZ5sF8hxdkXqVDC6CWo59zI12tO+TzzmBiT+HT30RGw
 8fCsxtDmVBCCB6lizwKf/1/uJXqfvN42cCU+2e/oRgdyfd44jsDXbnzLOTZiC5MN5IA5
 qNZQ==
X-Gm-Message-State: AOJu0YxC0a5NdGNsMKJSBbZEmu8T0XiugoRsaMuEc6Imxa1V5pzMoZcn
 Z3GHn9EUoJ7LTxuyRBKTEJgyaVcRKbgDcE76E+bk4pIpkHriLDKSHz8d
X-Gm-Gg: ASbGncsHx1wJe+5qWP8lFrVALUjTTXKSJXzv/VtxhuJqO0EVUZMFUYO+DxMBU3Ud2ni
 PJ4/c2WIO6hgq1ayY7gKxrUea4y45P2axB8sd0qn0bxioV2sJ0szEyyzLpz9pW2MQFDYPJP58Zj
 ON0sHSIi90YuDhIzlByYue1/zKOw1TED6sAWNvqLeun9X7vBI5u8fpnXC892Pxtsr+V6Lk3vopu
 ltuXQ4V6rSgJQPpw5wig69nJ/mWLqMgXv1v3cO7OXHuakbkGwGshYXKu4fF38mubM7wsaHDQVny
 Vu0jUhWyq+AKq/EFf0pt1dXeaDqqpQfCxvUrQ8P6daGYUEgolIo6Wg1cz7PLBfAz9QyIdpDHocZ
 ngxz/ZcwcfqGWOgQKW3kh3mQS5rbs4FXOvx5KOm4UrDR6GTCz
X-Google-Smtp-Source: AGHT+IHAJeQrCeGddeeLxzex+KGJ/2ApaY30TyaZOmxGo9w/yPrdklsi0etfY3mIBW7P35MK4kOjLg==
X-Received: by 2002:a17:90b:278a:b0:32e:716d:4d2b with SMTP id
 98e67ed59e1d1-3305c5d432dmr1662420a91.3.1758155289695; 
 Wed, 17 Sep 2025 17:28:09 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-330607eac4esm638754a91.21.2025.09.17.17.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 17:28:09 -0700 (PDT)
Message-ID: <9e835e4d-95bc-4b08-b5c5-65b4876a59bf@gmail.com>
Date: Thu, 18 Sep 2025 07:28:05 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>
Cc: Buildroot Development <buildroot@buildroot.org>
References: <aMjHPLJ5qHp_TTju@archie.me> <20250916084217.4db9aa85@pc-1>
 <aMpFFo96JmNi24Zq@archie.me> <20250917172021.36e9bc72@pc-1>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20250917172021.36e9bc72@pc-1>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758155290; x=1758760090; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ehis6H1gYJ1b4XuJFifGhENn45yjTT5jnS76oQlT7+o=;
 b=lzn00B6VRBRIBCTGuk2D8sNZh34oCn7LbXsEF09H9PnJxlTmcqGxUo+Cv3eP5xnjSm
 kjdedysQsSXkEWjuy1ssYSlAXJTUX242PHFXurAlfZU/YoNupmumD/STZA3x8UBOk3xw
 SHqjxeptIKafM2C0okwGIMdgBXjXPHRyWnuDU6OLNS5o3/6r99cL05vSV/fI57tGDQvy
 dlWZMU5tmv4BFJNUwW2Dx0hEINzGWH69i63IVoCf7jDKxl7i3TFKXJn9rWTHbaHKLGvS
 J/+H9biKBx8Xy2auWAHFBFSFzXhFiahOfQU/CgWG6iR03cKD1gNaLdOQi5JafrlBXImt
 Liog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lzn00B6V
Subject: Re: [Buildroot] libreadline undefined symbol error when generating
 rootfs tarball
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

On 9/17/25 22:20, Peter Seiderer wrote:
> On Wed, 17 Sep 2025 12:20:22 +0700, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> 
>> On Tue, Sep 16, 2025 at 08:42:17AM +0200, Peter Seiderer wrote:
>>> The following patch fixed the problem for me:
>>>
>>> diff --git a/package/readline/readline.mk b/package/readline/readline.mk
>>> index f69cbe45e2..078607a0c5 100644
>>> --- a/package/readline/readline.mk
>>> +++ b/package/readline/readline.mk
>>> @@ -15,6 +15,10 @@ READLINE_CONF_OPTS = \
>>>   	--disable-install-examples \
>>>   	--with-curses \
>>>   	--with-shared-termcap-library
>>> +HOST_READLINE_CONF_OPTS = \
>>> +	--disable-install-examples \
>>> +	--with-curses \
>>> +	--with-shared-termcap-library
>>>   READLINE_LICENSE = GPL-3.0+
>>>   READLINE_LICENSE_FILES = COPYING
>>>   READLINE_CPE_ID_VENDOR = gnu
>>
>> Applying your patch, I get another build error (this time on gdb):
>>
>> ```
>>    CXX    init.o
>>    CXXLD  gdb
>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgoto@NCURSES6_TINFO_5.0.19991023'
>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `UP@NCURSES6_TINFO_5.0.19991023'
>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetent@NCURSES6_TINFO_5.0.19991023'
>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetnum@NCURSES6_TINFO_5.0.19991023'
>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `PC@NCURSES6_TINFO_5.0.19991023'
>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetstr@NCURSES6_TINFO_5.0.19991023'
>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetflag@NCURSES6_TINFO_5.0.19991023'
>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `BC@NCURSES6_TINFO_5.0.19991023'
>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tputs@NCURSES6_TINFO_5.0.19991023'
>> collect2: error: ld returned 1 exit status
>> make[3]: *** [Makefile:2232: gdb] Error 1
>> ```
>>
>> Thanks.
>>   
> 
> Sorry, could not reproduce your failure...., did you make a complete
> 
> 	$ make clean
> 	$ make
> 
> re-build after applying the patch/change?
> 

I can still reproduce the issue, unfortunately.

(FYI: I encountered this on host-gdb.)

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
