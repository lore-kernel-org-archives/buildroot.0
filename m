Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC11AC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:59:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B6E7610A6
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B6E7610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1588440496;
	Sat,  7 Aug 2021 08:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_tu9MsH9TkB; Sat,  7 Aug 2021 08:58:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B95A404E9;
	Sat,  7 Aug 2021 08:58:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 540951BF2FA
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 429D340018
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id chvgbSl3YuAP for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 08:58:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F35340017
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 08:58:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f16c:16be:6f47:5c9a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D8C3213F86A;
 Sat,  7 Aug 2021 10:58:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628326733;
 bh=rEuYdYjbHVSammS3ufxszj8B2j1MqGmJnL7HdPWtqRY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VgyBc+2THobthBK8/aWYyP0OO3Sn3SXDLzCUoGYwsg04gCiXbgPO8urpRxExsTDRk
 G/z2Ohxfjz63aUKj7RZv6qwPo3z/aZ+Ol1zsPQ7Q8wZk4jwWo+i6BpcZknjybWwK7Y
 JRYWu3C2MxyM+hDDzJcpfob7HaagfHC0MRxBx21rRvumYrLZhVvzYtPqc3YgXKgDgi
 Hukl1ligqYDBoP0RKhjg+2N5+tkdfRvs+3svemWpPNl/a4NAegVAJnsvR1za3ozxa/
 Je9c4qEXLMwKEJOofEeN/NNOr0LcZ1hnnvXIhC5/FY8OAJAMqJdeGvFQZ6RJRJ5NU4
 YWcdPzwpfIdVw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Aug 2021 10:58:46 +0200
Date: Sat, 7 Aug 2021 10:58:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210807085846.GW27036@scaer>
References: <20210806144418.3450660-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806144418.3450660-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/s390-tools: update third patch
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
Cc: Alexander Egorenkov <egorenar@linux.ibm.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-06 16:44 +0200, Fabrice Fontaine spake thusly:
> Update third patch to fix the following build failure:
> 
> /bin/sh: 1: curl-config: not found
> make[2]: Leaving directory '/tmp/instance-2/output-1/build/s390-tools-2.17.0/libvmdump'
> Error: libcurl is not built with the OpenSSL backend
> make[2]: *** [Makefile:54: check-dep-libekmfweb] Error 1
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b4ebe39e54f80b26bc81b249bfa643140c41d0bd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I've changed the title to be more informative:

    package/s390-tools: properly fix build with libcurl

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...0003-Makefile-add-CURL-XML2-_CONFIG.patch} | 47 ++++++++++++++++---
>  1 file changed, 40 insertions(+), 7 deletions(-)
>  rename package/s390-tools/{0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch => 0003-Makefile-add-CURL-XML2-_CONFIG.patch} (59%)
> 
> diff --git a/package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch b/package/s390-tools/0003-Makefile-add-CURL-XML2-_CONFIG.patch
> similarity index 59%
> rename from package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch
> rename to package/s390-tools/0003-Makefile-add-CURL-XML2-_CONFIG.patch
> index 2f6ea5a11c..4ac0b8b029 100644
> --- a/package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch
> +++ b/package/s390-tools/0003-Makefile-add-CURL-XML2-_CONFIG.patch
> @@ -1,7 +1,7 @@
> -From 49cd01dc97740b299119f32c822ccfd989ea7ec9 Mon Sep 17 00:00:00 2001
> +From c2c310e93a5af148d37323f8d873e5656dea8b64 Mon Sep 17 00:00:00 2001
>  From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  Date: Sun, 1 Aug 2021 21:50:21 +0200
> -Subject: [PATCH] libkmipclient/Makefile: add {CURL,XML2}_CONFIG
> +Subject: [PATCH] Makefile: add {CURL,XML2}_CONFIG
>  
>  Add CURL_CONFIG and XML2_CONFIG to allow the user to configure the
>  binaries used in check-dep-libkmipclient
> @@ -20,11 +20,47 @@ Fixes:
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  [Upstream status: https://github.com/ibm-s390-linux/s390-tools/pull/121]
>  ---
> + libekmfweb/Makefile    | 10 ++++++----
>   libkmipclient/Makefile | 13 ++++++++-----
> - 1 file changed, 8 insertions(+), 5 deletions(-)
> + 2 files changed, 14 insertions(+), 9 deletions(-)
>  
> +diff --git a/libekmfweb/Makefile b/libekmfweb/Makefile
> +index 8e12fb56..1c776996 100644
> +--- a/libekmfweb/Makefile
> ++++ b/libekmfweb/Makefile
> +@@ -47,6 +47,8 @@ detect-openssl-version.dep:
> + 	echo "}" >> $(TMPFILE)
> + 	mv $(TMPFILE) $@
> + 
> ++CURL_CONFIG ?= curl-config
> ++
> + check-dep-libekmfweb: detect-openssl-version.dep
> + 	$(call check_dep, \
> + 		"libekmfweb", \
> +@@ -64,8 +66,8 @@ check-dep-libekmfweb: detect-openssl-version.dep
> + 		"curl/curl.h", \
> + 		"libcurl-devel", \
> + 		"HAVE_LIBCURL=0" \
> +-		`curl-config --cflags` `curl-config --libs`)
> +-	curl-config --ssl-backends | grep OpenSSL >/dev/null 2>&1 || { echo "Error: libcurl is not built with the OpenSSL backend"; exit 1; }
> ++		`$(CURL_CONFIG) --cflags` `$(CURL_CONFIG) --libs`)
> ++	$(CURL_CONFIG) --ssl-backends | grep OpenSSL >/dev/null 2>&1 || { echo "Error: libcurl is not built with the OpenSSL backend"; exit 1; }
> + 	touch check-dep-libekmfweb
> + 
> + skip-libekmfweb-openssl:
> +@@ -83,8 +85,8 @@ ekmfweb.o: check-dep-libekmfweb ekmfweb.c utilities.h cca.h $(rootdir)include/ek
> + utilities.o: check-dep-libekmfweb utilities.c utilities.h $(rootdir)include/ekmfweb/ekmfweb.h
> + cca.o: check-dep-libekmfweb cca.c cca.h utilities.h $(rootdir)include/ekmfweb/ekmfweb.h
> + 
> +-libekmfweb.so.$(VERSION): ALL_CFLAGS += -fPIC `curl-config --cflags`
> +-libekmfweb.so.$(VERSION): LDLIBS = -ljson-c -lcrypto -lssl `curl-config --libs` -ldl
> ++libekmfweb.so.$(VERSION): ALL_CFLAGS += -fPIC `$(CURL_CONFIG) --cflags`
> ++libekmfweb.so.$(VERSION): LDLIBS = -ljson-c -lcrypto -lssl `$(CURL_CONFIG) --libs` -ldl
> + libekmfweb.so.$(VERSION): ALL_LDFLAGS += -shared -Wl,--version-script=libekmfweb.map \
> + 	-Wl,-z,defs,-Bsymbolic -Wl,-soname,libekmfweb.so.$(VERM)
> + libekmfweb.so.$(VERSION): ekmfweb.o utilities.o cca.o $(libs)
>  diff --git a/libkmipclient/Makefile b/libkmipclient/Makefile
> -index 36efecb..addd096 100644
> +index 36efecb4..addd0965 100644
>  --- a/libkmipclient/Makefile
>  +++ b/libkmipclient/Makefile
>  @@ -50,6 +50,9 @@ detect-openssl-version.dep:
> @@ -66,6 +102,3 @@ index 36efecb..addd096 100644
>   libkmipclient.so.$(VERSION): ALL_LDFLAGS += -shared -Wl,--version-script=libkmipclient.map \
>   	-Wl,-z,defs,-Bsymbolic -Wl,-soname,libkmipclient.so.$(VERM)
>   libkmipclient.so.$(VERSION): kmip.o request.o response.o attribute.o key.o ttlv.o json.o \
> --- 
> -2.30.2
> -
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
