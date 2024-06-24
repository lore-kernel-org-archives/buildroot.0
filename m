Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD5FC3064D
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 13:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC9C881026;
	Mon, 24 Jun 2024 13:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDsh7pZl2XOn; Mon, 24 Jun 2024 13:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2E74814BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2E74814BB;
	Mon, 24 Jun 2024 13:46:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1FE01BF479
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEB3D81026
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GsaJJiRQcj1E for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 13:46:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB7BC81819
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB7BC81819
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB7BC81819
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 13:46:24 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4217136a74dso35461075e9.2
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 06:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719236782; x=1719841582;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uuc36bW95spYzxgP7kVdlKcByZVKPJi4AYgNtTUSgp8=;
 b=lgYvTTNXVvHJTqAnjA4pb1OB0Vh+znOXZ9ZTO35GeNPgVyiE8iAlxAS7z8nIlF0U8h
 +ULdle+Vhsnft679WOitcMwoFBOHUAFndLSlw4JzKcH1Iu4Jlq9cBa/xtuup8/mEwEgT
 cCGEGV9euOk/CWsdXPlYAY06NfK/jFYCDP0WwNbbAw18iBjnjhMnkanoP847ALK9CBIP
 EFhRm+hMEFRUYyaYMgU8UmTO4s4Wff4JuBIHWJIhLWLJJJOCb7hlVna3A/+ztO3iU29g
 Sty8iLJpEy0zeANF35TxRkwlnz94+mDHvdX63RNl7TXmSdxFDfU/zP5OPiCT+L6e7HH8
 CGzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYAr3C6qLEEIEmhz4MbWmQdvD/An5QOQE0FOWzKaA7qg+OBnigw5BLetRt3em6KXvcrBmC0wqMMFA1Uj4yDREtQjDk3nQ=
X-Gm-Message-State: AOJu0Yz5P1wvQXO+hL77qzMy+8lxmp+E6XKaLQd2cp8D7ld0iJjrPN6I
 w+FkbCCglJg6qKmPY+qoNVn0erbWhqMgDmJOtWZLnQGWnwqF33OuVBB4qvJiQIc=
X-Google-Smtp-Source: AGHT+IFiqaRzlykQ0Aq9mWMp/0IuAeC2IycutYKk8shrh3C069+Sfmla2PzYOBBwVYIRs3NzW8xG5Q==
X-Received: by 2002:a05:600c:6dd4:b0:423:b740:fa1 with SMTP id
 5b1f17b1804b1-4248cc271aemr29459705e9.15.1719236782344; 
 Mon, 24 Jun 2024 06:46:22 -0700 (PDT)
Received: from [10.1.0.155] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a2f6bd2sm10059099f8f.66.2024.06.24.06.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 06:46:21 -0700 (PDT)
Message-ID: <2c9f6eae-1b01-473d-8190-cdbc1587331f@mind.be>
Date: Mon, 24 Jun 2024 15:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20240612135727.11811-1-ps.report@gmx.net>
 <20240612135727.11811-4-ps.report@gmx.net>
Content-Language: en-GB
In-Reply-To: <20240612135727.11811-4-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719236782; x=1719841582; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Uuc36bW95spYzxgP7kVdlKcByZVKPJi4AYgNtTUSgp8=;
 b=TTONdBIx7sPmZnAU4F7m7MzdR89uO/WL8D40I2yOet2PdLtBuzaT0l5CGdt2EIiF+a
 U4YOsIfo/7sAwY+VPeGbiQddVyfc+MCrwQseWKRa31WAPChfIkf9qabUDPFBNI/5xTFZ
 EyauPjrA/Elyfz5cfbj44JkewS1BXPyL12u+OXyh6Vo7ck032bPZZydUwGdqHyW1VKii
 3OmpOwdetuiT7OFqqQl7+MBktgWHlrS4wLIp+LR/kvcCdSVT8TwqOKbmS1jtbURMxBIY
 31yyyx0KxuS/AFSnLT87meTLAGG2G/39GwEO8IqtwbojIKz0PV3MQmE92F6m8og6GhHb
 onrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TTONdBIx
Subject: Re: [Buildroot] [PATCH v2 4/5] package/xz: enable year2038 option
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/06/2024 15:57, Peter Seiderer via buildroot wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
> 
> - From autoconf-2.72 release notes ([1]):
>    *** Support for ensuring time_t is Y2038-safe
>    configure can now ensure that time_t can represent moments in time
>    after 18 January 2038, i.e. 2**31 - 1 seconds after the Unix epoch.
>    On most 64-bit systems this is true by default; the new feature
>    is detection of systems where time_t is a 32-bit signed integer by
>    default, *and* there is an alternative mode in which it is larger,
>    in which case that mode will be enabled.
> 
>    In this release, all configure scripts that use AC_SYS_LARGEFILE
>    gain a new command line option --enable-year2038.  When this option
>    is used, the configure script will check for and enable support for
>    a large time_t.
> 
>    This release also adds two new macros, AC_SYS_YEAR2038 and
>    AC_SYS_YEAR2038_RECOMMENDED.  Both have all the effects of
>    AC_SYS_LARGEFILE.  (This is because it is not possible to enlarge
>    time_t without also enlarging off_t, on any system we are aware of.)
> 
>    AC_SYS_YEAR2038 additionally flips the default for --enable-year2038;
>    a configure script that uses this macro will check for and enable
>    support for a large time_t by default, but this can be turned off by
>    using --disable-year2038.  AC_SYS_YEAR2038_RECOMMENDED goes even
>    further, and makes the configure script fail on systems that do not
>    seem to support timestamps after 18 January 2038 at all.  This
>    failure can be suppressed by using --disable-year2038.
> 
>    Changing the size of time_t can change a library`s ABI.  Therefore,
>    application and library builders should take care that all packages
>    are configured with consistent use of --enable-year2038 or
>    --disable-year2038, to ensure binary compatibility.  This is similar
>    to longstanding consistency requirements with --enable-largefile and
>    --disable-largefile.
> 
>    In this release, these macros only know how to enlarge time_t on two
>    classes of systems: 32-bit MinGW, and any system where time_t can be
>    enlarged by defining the preprocessor macro _TIME_BITS with the
>    value 64.  At the time this NEWS entry was written, only GNU libc
>    (version 2.34 and later) supported the latter macro.  Authors of
>    other C libraries with a 32-bit time_t are encouraged to adopt
>    _TIME_BITS, rather than inventing a different way to enlarge time_t.
> 
> - In buildroot there is already the BR2_TIME_BITS_64 config option
>    ('Build Y2038-ready code'), which enables a system wide
>    '-D_TIME_BITS=64' compile flag (and maybe should additional set
>    '--enable-year2039' configure option for the autotools-packages?).
> ---
>   package/xz/xz.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index e051ad0047..d81d0cf4ce 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -39,7 +39,7 @@ XZ_CONF_OPTS = \
>   	--enable-unaligned-access=auto \
>   	--disable-unsafe-type-punning \
>   	--disable-werror \
> -	--disable-year2038
> +	--enable-year2038

  Given that the next commit removes this option again, it's a bit useless to 
add it here. Perhaps it's still useful if the next commit gets reverted.


  Applied to master anyway, thanks.

  Regards,
  Arnout


>   
>   HOST_XZ_CONF_OPTS = \
>   	$(XZ_CONF_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
