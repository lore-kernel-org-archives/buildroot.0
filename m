Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CA0C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:06:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92AE360F6F
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92AE360F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6978B84142;
	Thu, 23 Sep 2021 21:06:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nkli0Is43BQg; Thu, 23 Sep 2021 21:06:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84680840CE;
	Thu, 23 Sep 2021 21:06:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78F991BF317
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68E16840CE
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zJNz8tygmzID for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:06:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AB0B84078
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:06:40 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id x7so13386898edd.6
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 14:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g/7LS0cTsgI3ZFffxJXILSWaVbyTrJSDoHTDJJtalGA=;
 b=P5oqZviBVbfeL5q9EO5VQ1RfrISzN3H56qHdQeFKV8bkBNcAMv+gfMdoj9rrGh0qSj
 u9byf1X5Pase1xnpfFazu3cP3z6gm5vrqrFYiXZjS2NEyJ6mgt9d0VC5WaRyXUOrmNOK
 bVtNBHw1wnSp/6+ndDdObu6P0jZJHoMkD4/OFp+gpoviuQg8TtN6bwQAgsj6tH2rI/bs
 pi4vdEJk+7U/FD1RahviITS19+d5C7pTmps+XK+Y+n8kjYklcbL6KouUQFibRXCDpYMm
 D1hGe6eqr7J8u0VHxpqF4rHg3k3SBTQaTV78y4FPZqIqT4jLcLtaaOX/efSFD8CKSCSA
 JHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g/7LS0cTsgI3ZFffxJXILSWaVbyTrJSDoHTDJJtalGA=;
 b=zJUb1VSg1hUnxmTmVPq1BvOj60evhCoISu0UV12aCEfKCd6mg1Maprh/JvZLRq8CnD
 oFfh7m5a6hEQG4JmgAImrZ+k49A5dVXR3skOAXu8OD6QOpQ4wEnrvt0gc/dQH79EkVy1
 sN08sLwFannBWUxR8OmorCL0+/BDW+q9clTq1mv4eHh/k+R7b8QJVG/XVt+OFlzDNgvu
 kiqLkqqOFurJZYaT+GQBwcmA4eJpCk8jjPA2QNgBQQRXEmF4yDOluMqR3xBm8Wjq4m2m
 GFrookX3zyN00JntpjaUvP6E7buEVC6LoRLK2QD9LokUDVnp92YMTeNVFmjqGz9cv/bZ
 99vw==
X-Gm-Message-State: AOAM531bWeBmx/aSenOKGxvHdxFZtxcJa7YSjaYdYtqO0SPqZP2hxpDB
 9bFGLzkeFowT4BXpjDFERcdYiQ==
X-Google-Smtp-Source: ABdhPJxBQpD6RV2PiwxMxiWL930y6XnOAK9Ie1kyaZNZD+KT/qlt6zxDb4tZ8AfUfMZsXRDuXGD8fA==
X-Received: by 2002:a17:906:8a41:: with SMTP id
 gx1mr7757128ejc.507.1632431198348; 
 Thu, 23 Sep 2021 14:06:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bq4sm3817250ejb.43.2021.09.23.14.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 14:06:37 -0700 (PDT)
Message-ID: <1cfac7d1-8013-6aed-6651-8e55815ee499@mind.be>
Date: Thu, 23 Sep 2021 23:06:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210919143818.3448648-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210919143818.3448648-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/log4cxx: bump to version 0.12.0
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 19/09/2021 16:38, Fabrice Fontaine wrote:
> - Drop patch (already in version)
> - Switch to cmake-package
> 
> https://www.mail-archive.com/announce@apache.org/msg06525.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  I also applied all the other patches you posted on 19/9, but I'm too lazy to 
reply to all those mails :-)

  Regards,
  Arnout

> ---
>   .../0001-fix-build-without-wchar.patch        | 55 -------------------
>   package/log4cxx/log4cxx.hash                  |  4 +-
>   package/log4cxx/log4cxx.mk                    | 16 ++----
>   3 files changed, 6 insertions(+), 69 deletions(-)
>   delete mode 100644 package/log4cxx/0001-fix-build-without-wchar.patch
> 
> diff --git a/package/log4cxx/0001-fix-build-without-wchar.patch b/package/log4cxx/0001-fix-build-without-wchar.patch
> deleted file mode 100644
> index fc0e7be5c9..0000000000
> --- a/package/log4cxx/0001-fix-build-without-wchar.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 1fa70eaf24d75e84625f22779ec347fd29bf1ae6 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Thu, 24 Sep 2020 08:47:37 +0200
> -Subject: [PATCH] fix build without wchar
> -
> -Disable wencode without wchar or the build will fail on:
> -
> -odbcappender.cpp: In static member function 'static void log4cxx::db::ODBCAppender::encode(wchar_t**, const LogString&, log4cxx::helpers::Pool&)':
> -odbcappender.cpp:362:22: error: 'wencode' is not a member of 'log4cxx::helpers::Transcoder'
> -  *dest = Transcoder::wencode(src, p);
> -                      ^~~~~~~
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/bab5329fdeb894471bfd5192ce04d3fbd2f9be5c
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://github.com/apache/logging-log4cxx/commit/f171f818c798d48631d5b45851e4593953f31d9c]
> ----
> - src/main/cpp/odbcappender.cpp              | 2 ++
> - src/main/include/log4cxx/db/odbcappender.h | 2 ++
> - 2 files changed, 4 insertions(+)
> -
> -diff --git a/src/main/cpp/odbcappender.cpp b/src/main/cpp/odbcappender.cpp
> -index 6bfa519e..218df132 100644
> ---- a/src/main/cpp/odbcappender.cpp
> -+++ b/src/main/cpp/odbcappender.cpp
> -@@ -357,10 +357,12 @@ void ODBCAppender::setSql(const LogString& s)
> - 	}
> - }
> -
> -+#if LOG4CXX_WCHAR_T_API || LOG4CXX_LOGCHAR_IS_WCHAR_T || defined(WIN32) || defined(_WIN32)
> - void ODBCAppender::encode(wchar_t** dest, const LogString& src, Pool& p)
> - {
> - 	*dest = Transcoder::wencode(src, p);
> - }
> -+#endif
> -
> - void ODBCAppender::encode(unsigned short** dest,
> - 	const LogString& src, Pool& p)
> -diff --git a/src/main/include/log4cxx/db/odbcappender.h b/src/main/include/log4cxx/db/odbcappender.h
> -index a26bc35b..fdc144ff 100644
> ---- a/src/main/include/log4cxx/db/odbcappender.h
> -+++ b/src/main/include/log4cxx/db/odbcappender.h
> -@@ -300,8 +300,10 @@ class LOG4CXX_EXPORT ODBCAppender : public AppenderSkeleton
> - 	private:
> - 		ODBCAppender(const ODBCAppender&);
> - 		ODBCAppender& operator=(const ODBCAppender&);
> -+#if LOG4CXX_WCHAR_T_API || LOG4CXX_LOGCHAR_IS_WCHAR_T || defined(WIN32) || defined(_WIN32)
> - 		static void encode(wchar_t** dest, const LogString& src,
> - 			log4cxx::helpers::Pool& p);
> -+#endif
> - 		static void encode(unsigned short** dest, const LogString& src,
> - 			log4cxx::helpers::Pool& p);
> - }; // class ODBCAppender
> diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
> index 535a0c4aac..6fc0d8836e 100644
> --- a/package/log4cxx/log4cxx.hash
> +++ b/package/log4cxx/log4cxx.hash
> @@ -1,4 +1,4 @@
> -# From https://www.apache.org/dist/logging/log4cxx/0.11.0/apache-log4cxx-0.11.0.tar.gz.sha512
> -sha512  f8aa37c9c094e7a4d6ca92dff13c032f69f1e078c51ea55e284fcb931c13256b08950af3ea6eaf7a12282240f6073e9acab19bfe217f88dbd62a5d2360f3fbdd  apache-log4cxx-0.11.0.tar.gz
> +# From https://www.apache.org/dist/logging/log4cxx/0.12.0/apache-log4cxx-0.12.0.tar.gz.sha512
> +sha512  00fe571f9c511bf93b17cac8269ce00f7e817e8d723acf62bddff1bbe0e7facd0ab2fd75c01a93870f7e5c66718b2b73fc22c5f193bfd204e34d052b1123e60d  apache-log4cxx-0.12.0.tar.gz
>   # Locally computed
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
> index 075f8cb371..49f4667a9a 100644
> --- a/package/log4cxx/log4cxx.mk
> +++ b/package/log4cxx/log4cxx.mk
> @@ -4,29 +4,21 @@
>   #
>   ################################################################################
>   
> -LOG4CXX_VERSION = 0.11.0
> +LOG4CXX_VERSION = 0.12.0
>   LOG4CXX_SITE = http://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
>   LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
>   LOG4CXX_INSTALL_STAGING = YES
>   LOG4CXX_LICENSE = Apache-2.0
>   LOG4CXX_LICENSE_FILES = LICENSE
> -# error: required file './compile' not found
> -LOG4CXX_AUTORECONF = YES
>   
>   LOG4CXX_CONF_OPTS = \
> -	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config \
> -	--with-apr-util=$(STAGING_DIR)/usr/bin/apu-1-config \
> -	--disable-dot \
> -	--disable-doxygen \
> -	--disable-html-docs
> +	-DAPR_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apr-1-config \
> +	-DAPR_UTIL_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apu-1-config
>   
>   LOG4CXX_DEPENDENCIES = apr apr-util
>   
>   ifeq ($(BR2_PACKAGE_LIBESMTP),y)
>   LOG4CXX_DEPENDENCIES += libesmtp
> -LOG4CXX_CONF_OPTS += --with-SMTP=libesmtp
> -else
> -LOG4CXX_CONF_OPTS += --without-SMTP
>   endif
>   
> -$(eval $(autotools-package))
> +$(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
