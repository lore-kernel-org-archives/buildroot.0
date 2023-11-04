Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2A6C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50ACF400BD;
	Sat,  4 Nov 2023 17:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50ACF400BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eW1JEZGW9oiQ; Sat,  4 Nov 2023 17:47:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10A4E40116;
	Sat,  4 Nov 2023 17:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10A4E40116
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4ADC01BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3129682277
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3129682277
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DtTR0I3-wGfu for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:47:20 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE3F582275
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE3F582275
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5437269a661so8252099a12.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 10:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699120038; x=1699724838;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B80gpRgETnFDusUbTJJmm4kF90OwDB4dU65kHrFHYbg=;
 b=CGRHT1pS8WVqBryuqcdS+rWWWF34zFBPiowf901faY8g8GbFgAVTn7KlirI/B8Lj2S
 lWWbl2niKgpmrErT1vB1N/yL+JHeOB9WrZlN3oEwobv+6kUfqB6eFQaNxFtC4g/dENkG
 kHiAJigNCIqHxngjhoSPHCzqkw2FUiQE3H1BtZEXbCMUj4FW9edAutpYMk0VYVe7UaF1
 joyZfQL5+yOeuL0vryN9PbbpJYzKP/F4CKa0KqkLyZgS46pmYdguDSbhRBooGXSKOmh1
 hpLhsGSHArq48+I+M5oELZKjtwsVi3KyQuIzcVIOWMczjKKscGsw+ihjsCH1o7PpWqd2
 hejg==
X-Gm-Message-State: AOJu0YwpQluk+L8dH3dQdruk980QKQAKbnE5iaZnNu1hsf/sYMpMo2Ux
 B2ZjOUXK9yeCD3ozDai5fcxpV2Ucu1xPl8NEEJk=
X-Google-Smtp-Source: AGHT+IHTVql5ppsAn+mRGutra5wES0eaN/K7Gi0WxvNkibn1EJSv0+HUSpw+ZXZq82FI0CiMzS0rAw==
X-Received: by 2002:a17:906:749a:b0:9dd:ce68:a28c with SMTP id
 e26-20020a170906749a00b009ddce68a28cmr2548005ejl.24.1699120037816; 
 Sat, 04 Nov 2023 10:47:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 gl9-20020a170906e0c900b009b2b47cd757sm2152053ejb.9.2023.11.04.10.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 10:47:17 -0700 (PDT)
Message-ID: <311be0da-367e-4adf-8092-893ec3a9cff4@mind.be>
Date: Sat, 4 Nov 2023 18:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
 <20231026092701.12345-14-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231026092701.12345-14-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699120038; x=1699724838; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B80gpRgETnFDusUbTJJmm4kF90OwDB4dU65kHrFHYbg=;
 b=T22yxXCPwQBVf+ZWVA2FTDI1UohrgqC3jBVG3ceeKAtAmyd/3bSSqCxAjoLFj7edbJ
 7Z7odymY4h6/K03M/QtuwtIiMziHHHAnWE4gUNx7x5lFRWtNHxxXtscSW/aZlR0L3EgL
 jp6Yah/SVZkEZw3yupT8D+bnu5OcS3TPdF3BIsaiTCLUjzDb74S8ohbLCFZHLh2iJEfm
 TMc+XBSZeG6k7fuAfPYOfcW9EC74JITu9tT8Ic6Lhe4PIeEP+ZMGw5tUG1D/HnbKe9TR
 EeMl4vaIlyzw+OVc6O9YE8ON9BckcDQzgYi8DZupEAqYPiphNUIIQ+BJCY37SE5F2YVk
 p9fQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=T22yxXCP
Subject: Re: [Buildroot] [PATCH 13/30] package/python3: update patch and
 partly use upstream build system to disable tk module
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Bernd, Adam,

On 26/10/2023 11:26, Adam Duskett wrote:
> From: Bernd Kuhls <bernd@kuhls.net>
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>   ...d-an-option-to-disable-the-tk-module.patch | 33 +++++++------------
>   package/python3/python3.mk                    |  2 ++
>   2 files changed, 14 insertions(+), 21 deletions(-)
> 
> diff --git a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
> index b89e1d27bc..1ed8959dba 100644
> --- a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
> +++ b/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
> @@ -20,15 +20,15 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
>   index 9f4cdf14cf..4f83911200 100644
>   --- a/Makefile.pre.in
>   +++ b/Makefile.pre.in
> -@@ -1920,7 +1920,6 @@ LIBSUBDIRS=	asyncio \
> - 		multiprocessing multiprocessing/dummy \
> +@@ -1921,7 +1921,6 @@
>    		re \
>    		site-packages \
> + 		sqlite3 \
>   -		tkinter \
>    		tomllib \
>    		turtledemo \
>    		unittest \
> -@@ -2038,9 +2038,6 @@
> +@@ -2039,12 +2038,15 @@
>    		test/xmltestdata \
>    		test/xmltestdata/c14n-20 \
>    		test/ziptestdata \
> @@ -37,10 +37,6 @@ index 9f4cdf14cf..4f83911200 100644
>   -		tkinter/test/test_ttk \
>    		unittest/test \
>    		unittest/test/testmock
> - ifeq (@PYDOC@,yes)
> -@@ -2021,6 +2018,13 @@ ifeq (@SQLITE3@,yes)
> - LIBSUBDIRS += sqlite3
> - endif
>    
>   +ifeq (@TK@,yes)
>   +LIBSUBDIRS += tkinter
> @@ -48,30 +44,25 @@ index 9f4cdf14cf..4f83911200 100644
>   +	tkinter/test/test_ttk
>   +endif
>   +
> -+
> - TEST_MODULES=@TEST_MODULES@
> - libinstall:	all $(srcdir)/Modules/xxmodule.c
> - 	@for i in $(SCRIPTDIR) $(LIBDEST); \
> + ifeq (@PYDOC@,yes)
> + LIBSUBDIRS += pydoc_data
> + endif
>   diff --git a/configure.ac b/configure.ac
>   index 4cc0951ab9..f4ce506801 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -4180,6 +4180,15 @@ if test "$SQLITE3" = "no" ; then
> -    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
> - fi
> +@@ -4202,6 +4202,11 @@
> + 	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
> + 	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
>    
>   +AC_SUBST(TK)
>   +AC_ARG_ENABLE(tk,
>   +	AS_HELP_STRING([--disable-tk], [disable tk]),
>   +	[ TK="${enableval}" ], [ TK=yes ])
>   +
> -+if test "$TK" = "no"; then
> -+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
> -+fi
> -+

  By doing the refresh in the same commit as the actual change to the patch, 
it's hard to see what really changed.

  After this change, it makes me wonder if the --disable-tk option is even 
relevant any more? AFAICS all it does is to avoid doing a test for tk, the 
result of which is anyway not going to be used.

  In that case, of course, the --disable-tk options also need to be removed from 
.mk.

> - AC_SUBST(PYDOC)
> -
> - AC_ARG_ENABLE(pydoc,
> + # Check for enable-ipv6
> + AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
> + AC_MSG_CHECKING([if --enable-ipv6 is specified])
>   --
>   2.34.1
>   
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 8b06c28fde..04105289d6 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -43,6 +43,7 @@ HOST_PYTHON3_CONF_ENV += \
>   	py_cv_module__codecs_kr=n/a \
>   	py_cv_module__codecs_tw=n/a \
>   	py_cv_module__sqlite3=n/a \
> +	py_cv_module__tkinter=n/a \

  IIUC this applies to 3.11 already, so we could use this part of the patch 
without any other change?

  Regards,
  Arnout

>   	py_cv_module__uuid=n/a \
>   	ac_cv_prog_HAS_HG=/bin/false
>   
> @@ -176,6 +177,7 @@ PYTHON3_CONF_ENV += \
>   	ac_cv_file__dev_ptc=yes \
>   	ac_cv_working_tzset=yes \
>   	py_cv_module_nis=n/a \
> +	py_cv_module__tkinter=n/a \
>   	ac_cv_prog_HAS_HG=/bin/false
>   
>   # GCC is always compliant with IEEE754
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
