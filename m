Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A37CA1013
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 22:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 522C66059E;
	Thu, 18 Sep 2025 22:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GDvo5_1z0IwI; Thu, 18 Sep 2025 22:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 655F4605A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 655F4605A3;
	Thu, 18 Sep 2025 22:18:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CAE2E7
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 22:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 527B38291D
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 22:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9siquurmjCHx for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 22:18:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 86F08828F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86F08828F2
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86F08828F2
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 22:18:17 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2445826fd9dso17766775ad.3
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 15:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758233897; x=1758838697;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g4WBvDrkS+0bRvJFHRfrDlZ7EBnPwSmVRK+92XFFE2c=;
 b=K7WvlL00Cz1BS8809ZnICEaScfHbrVqHDMTw8z5xfs3073hHbLhEXZ+MabPbYJeY0+
 cx9rx+A2UVnKs165hv2W8OGF4ZnCOTxZ4I/9Hg7gnrJ4ETAa5vRr15OLUJKvrArQvQJk
 Qeb73Ba2QwCP6f+tkSHPq4ct/F9wHYKwErR2UcpLICcTU1Zaogaya+7/XfaNS8fabDhz
 9LFCLOXfy/FoHwhURF8noGeWKd5MyNlrGOn/02v2r6K9/UjH+wLkVVHhyqpjQn6czoXe
 SLf/jNiEulsfTu/FSk3UtdX6oBMPRFRh9zMxq1uEA3zcwP5WFS7waI45f5mcy0xvuBd7
 diMg==
X-Gm-Message-State: AOJu0Ywg3plLupSu9n+QhiStywlDpEB9Lop9lpv4pecgTOjipUCme7uQ
 /GmmC5Se0VR+9+FL1xjh3UDkgqLGhDFNu7n3xilqkg0w1OW+LmJnVr2A
X-Gm-Gg: ASbGnctf9y8rLjRG4nWcm3nLzK6MoOXKmMqVuaeRJp5MLfXlwH12Vikhe8IIbzfMyFx
 RPzLa8SoPRV23NySQJtUwOP18deJD4rd1525KmKa5KIdl/Nng/tn0xof4EHp81NlNfwLSMLcLiF
 LtPtcQgi5Gjj5lOQsAUWSqaFwa0heoTEmUaYL1oZPYr/+wpjLOWX2hNo0hDqU/Xpco3RLmMoQ8r
 jH/DjxjZCSO7OKkNwBQDbnrcYbtfFO7CQeWw/VzRtAWmjVBWz+Gvm8+RL+JJNTlW0N+W45dclHs
 D4vI9joXXvgW25Z/ySK1VnsXRFXaf0GzLughnqXqYfYzdxzwUz2Se5OuLrHejR/IDSoeHZkYZhQ
 gC3nxzJnE7zyRuhxKUdtKaPIbWp+KUu6KJ0qFYsVDJm9i+7Qr
X-Google-Smtp-Source: AGHT+IFegL/a0Q2qaMdEFtdB8Z9WJPmk0iRI1+V3GZe4UZmw5717/AZ/mdyS+ErCdSCdBS6N0K/Ljg==
X-Received: by 2002:a17:903:3884:b0:24c:82ad:a503 with SMTP id
 d9443c01a7336-269ba53a976mr12997235ad.41.1758233896504; 
 Thu, 18 Sep 2025 15:18:16 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698005309bsm36031195ad.27.2025.09.18.15.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Sep 2025 15:18:15 -0700 (PDT)
Message-ID: <0dd0aaf4-2777-4c3f-8e7e-83143c8e8836@gmail.com>
Date: Fri, 19 Sep 2025 05:18:13 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>
Cc: Buildroot Development <buildroot@buildroot.org>
References: <aMjHPLJ5qHp_TTju@archie.me> <20250916084217.4db9aa85@pc-1>
 <aMpFFo96JmNi24Zq@archie.me> <20250917172021.36e9bc72@pc-1>
 <9e835e4d-95bc-4b08-b5c5-65b4876a59bf@gmail.com>
 <20250918085231.0a1a6c88@pc-1>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20250918085231.0a1a6c88@pc-1>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758233897; x=1758838697; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g4WBvDrkS+0bRvJFHRfrDlZ7EBnPwSmVRK+92XFFE2c=;
 b=FwGNpqBecXckeOZlN2SjYPnHHstJIiOjAZqv185ctfguoPg4HO4F4jcPRx0VU5thdv
 HsgDJzNxmEPWvdnkuGXHvQa9i6y9Qbm/WHha6xvzwFPygC5++fhWu5UvMVR+8Idq2NCr
 dg7G4G9YTNgbhhbJoL1GK6h+kD33XSehRbjz4N2SN7sgOlrHR94mj/Da+RL9iCFqWebH
 1t930mYMcV8UHGHaz7e6i2GdOoGCoKqFkmB3tZ+szT226kZnxDx1dZKPuXlli6A3mQhV
 V1wRpNI3J4C0JGDo7DX5sKsY91NncO/mH89bUi2xJB/kRJ6PUO1T7AJHi2pCTD5FXKov
 x5Vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FwGNpqBe
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

On 9/18/25 13:52, Peter Seiderer wrote:
> On Thu, 18 Sep 2025 07:28:05 +0700, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> 
>> On 9/17/25 22:20, Peter Seiderer wrote:
>>> On Wed, 17 Sep 2025 12:20:22 +0700, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>>    
>>>> On Tue, Sep 16, 2025 at 08:42:17AM +0200, Peter Seiderer wrote:
>>>>> The following patch fixed the problem for me:
>>>>>
>>>>> diff --git a/package/readline/readline.mk b/package/readline/readline.mk
>>>>> index f69cbe45e2..078607a0c5 100644
>>>>> --- a/package/readline/readline.mk
>>>>> +++ b/package/readline/readline.mk
>>>>> @@ -15,6 +15,10 @@ READLINE_CONF_OPTS = \
>>>>>    	--disable-install-examples \
>>>>>    	--with-curses \
>>>>>    	--with-shared-termcap-library
>>>>> +HOST_READLINE_CONF_OPTS = \
>>>>> +	--disable-install-examples \
>>>>> +	--with-curses \
>>>>> +	--with-shared-termcap-library
>>>>>    READLINE_LICENSE = GPL-3.0+
>>>>>    READLINE_LICENSE_FILES = COPYING
>>>>>    READLINE_CPE_ID_VENDOR = gnu
>>>>
>>>> Applying your patch, I get another build error (this time on gdb):
>>>>
>>>> ```
>>>>     CXX    init.o
>>>>     CXXLD  gdb
>>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgoto@NCURSES6_TINFO_5.0.19991023'
>>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `UP@NCURSES6_TINFO_5.0.19991023'
>>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetent@NCURSES6_TINFO_5.0.19991023'
>>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetnum@NCURSES6_TINFO_5.0.19991023'
>>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `PC@NCURSES6_TINFO_5.0.19991023'
>>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetstr@NCURSES6_TINFO_5.0.19991023'
>>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetflag@NCURSES6_TINFO_5.0.19991023'
>>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `BC@NCURSES6_TINFO_5.0.19991023'
>>>> /usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tputs@NCURSES6_TINFO_5.0.19991023'
>>>> collect2: error: ld returned 1 exit status
>>>> make[3]: *** [Makefile:2232: gdb] Error 1
>>>> ```
>>>>
>>>> Thanks.
>>>>      
>>>
>>> Sorry, could not reproduce your failure...., did you make a complete
>>>
>>> 	$ make clean
>>> 	$ make
>>>
>>> re-build after applying the patch/change?
>>>    
>>
>> I can still reproduce the issue, unfortunately.
>>
>> (FYI: I encountered this on host-gdb.)
> 
> One last try, does your buildroot git souce tree already contain this (recent) commmit?
> 
> 	From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 	Date: Fri, 29 Aug 2025 17:24:39 +0200
> 	Subject: [PATCH] package/gdb: really fix build with GCC 15.x by using externalreadline
> 
> 	https://gitlab.com/buildroot.org/buildroot/-/commit/d98e15a3639d9758ab3223f0a6de3a94d506e6fa.patch
> 

It's already in my tree.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
