Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E603C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:42:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3031B60725
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3031B60725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09115606CA;
	Sat, 24 Jul 2021 20:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7WTy8e6OnUnA; Sat, 24 Jul 2021 20:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E181606A7;
	Sat, 24 Jul 2021 20:42:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66AAF1BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55E7083490
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u1zmbXA8zl5G for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:42:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F81782EF1
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:42:31 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id h8so6249575ede.4
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 13:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iIIsa2DxzzBFb+b2Kl0DUP38UF8x6gQm/S3Y5V/FOWE=;
 b=bAU098W85dUIjc98ynl889XGG/jfUvwshfs3E5/Qr7+oUTdbmWr6Wv4IkJzRZqSIuU
 WxS1vpeOVtEudrC1h2vCNvlv5P8/aumz0Dm6ghwjYi2aim7vl5cSxnZs2spBjoUwBzxf
 mpkYQ68CHa5FgUnOETUUj3rGB9Gk+0cGa7FLzJm33XVXo2/JjLeXnq04w7gHZlt8XgAj
 VuN1ljkXXsdZYu51VzWHHMZihZswP5xs6CFmnjyFxaeTRcZMc4e19Q2rUtQNc+CVCpqN
 F2qQ1+bqQOz7TCQvSABhPOW5wlxjh+EiMUNgGQkGTpZ3aHakH6UscEFvuGQ/ME3KJhY2
 n3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iIIsa2DxzzBFb+b2Kl0DUP38UF8x6gQm/S3Y5V/FOWE=;
 b=SBoGzmOGYTReGYQs4yPTNOo+5+BG+ECA6Jx/yREQoPGGhc9UPMldxG/11/crKoqGSP
 Uobp3n41+gKfZXHh661wmPSMr5v1w0g9Et9ShkZ4zn7y6j0ISAzHxIr3g6GYT5H93bex
 wCHd9P4upOKbmgTaVhd+mYZTtJY9AGuxekBXrrZD0amO9Jw5dwrewWNSJn/jpvu90Y6N
 QpLyZExAJyQkZn9s67o2mQNuYu2OiDOpjCJRnT5KVDKRZ84t6y06BrtD1ZFMv0Xb3F7y
 19fBx2u9cliu4aTv5IVUkg+nolx0y6xpzlOnVwFZ2/xPZXHOnMNH7oRtwaWT8yXPaGuC
 LUEw==
X-Gm-Message-State: AOAM531bmUVAQuWxA8ZLbhZaY3IG2H1L9yM6tHDl0BvM3nK5C0M6AeJU
 bs+asPxfol5c+lT7TowJUZt3+w==
X-Google-Smtp-Source: ABdhPJxV9dlpZS+UyZ3nmpia7mCJl5nb6xxUWYC+6vg2F4qQD2ddrCpvn6GznE84QwNsXYVeXa11xw==
X-Received: by 2002:aa7:db93:: with SMTP id u19mr12744835edt.227.1627159349570; 
 Sat, 24 Jul 2021 13:42:29 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y17sm12745001ejd.16.2021.07.24.13.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jul 2021 13:42:29 -0700 (PDT)
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20210708145946.854654-1-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <c995a5ea-e83c-47f6-6e4d-08f1b358474d@mind.be>
Date: Sat, 24 Jul 2021 22:42:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708145946.854654-1-nolange79@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] package/gtest: bump to version 1.11.0
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
Cc: Michael Nosthoff <buildroot@heine.tech>, Stephan Hoffmann <sho@relinux.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 08/07/2021 16:59, Norbert Lange wrote:
> Python is removed as dependency.
> gtest uses python for self-tests which are not run by buildroot,
> and the remaining scripts are not used by the build, and aren't
> maintained or supported.
> 
> Special handling for gtest-config and gmock-config is removed aswell,
> the CMake Buildsystem now does take care of those.
> 
> Installation of the python gmock generator scripts is conditional upon
> host-python[3].

 No it's not. The location is conditional, but it's always installed. So I kept
that part.

> Since this is one of the unsupported + unmaintained
> scripts, installation probably should be gutted completely.

 This may be true though.


 Applied to master with the above change.

 Regards,
 Arnout

> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/gtest/gtest.hash |  4 +--
>  package/gtest/gtest.mk   | 53 ++++++----------------------------------
>  2 files changed, 10 insertions(+), 47 deletions(-)
> 
> diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
> index 082c597780..d21fea7142 100644
> --- a/package/gtest/gtest.hash
> +++ b/package/gtest/gtest.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256	9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb	gtest-1.10.0.tar.gz
> -sha256	9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138	googletest/LICENSE
> +sha256  b4870bf121ff7795ba20d20bcdd8627b8e088f2d1dab299a031c1034eddc93d5  gtest-1.11.0.tar.gz
> +sha256  9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  LICENSE
> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
> index f8b2339d7e..994f63ec2d 100644
> --- a/package/gtest/gtest.mk
> +++ b/package/gtest/gtest.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GTEST_VERSION = 1.10.0
> +GTEST_VERSION = 1.11.0
>  GTEST_SITE = $(call github,google,googletest,release-$(GTEST_VERSION))
>  GTEST_INSTALL_STAGING = YES
>  GTEST_INSTALL_TARGET = NO
> @@ -20,15 +20,12 @@ endif
>  HOST_GTEST_LICENSE = Apache-2.0
>  HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
>  ifeq ($(BR2_PACKAGE_PYTHON3),y)
> -HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
> -HOST_GTEST_DEPENDENCIES += host-python3
> -else
> -HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
> -HOST_GTEST_DEPENDENCIES += host-python
> -endif
> -
>  HOST_GTEST_GMOCK_PYTHONPATH = \
> -	$(HOST_DIR)/lib/python$(HOST_GTEST_PYTHON_VERSION)/site-packages
> +	$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
> +else ifeq ($(BR2_PACKAGE_PYTHON),y)
> +HOST_GTEST_GMOCK_PYTHONPATH = \
> +	$(HOST_DIR)/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
> +endif
>  
>  # While it is possible to build gtest as shared library, using this gtest shared
>  # library requires to set some special configure option in the project using
> @@ -48,54 +45,20 @@ endif
>  
>  GTEST_CONF_OPTS += -DBUILD_GTEST=ON
>  
> -# Generate the gtest-config script manually, since the CMake build system is
> -# not doing it.
> -define GTEST_INSTALL_GTEST_CONFIG
> -	sed 's%@PACKAGE_TARNAME@%gtest%;\
> -		s%@PACKAGE_VERSION@%$(GTEST_VERSION)%;\
> -		s%@prefix@%$(STAGING_DIR)/usr%;\
> -		s%@exec_prefix@%$(STAGING_DIR)/usr%;\
> -		s%@libdir@%$(STAGING_DIR)/usr/lib%;\
> -		s%@includedir@%$(STAGING_DIR)/usr/include%;\
> -		s%@bindir@%$(STAGING_DIR)/usr/bin%;\
> -		s%@PTHREAD_CFLAGS@%%;\
> -		s%@PTHREAD_LIBS@%-lpthread%;' \
> -		$(@D)/googletest/scripts/gtest-config.in \
> -		> $(STAGING_DIR)/usr/bin/gtest-config
> -	chmod +x $(STAGING_DIR)/usr/bin/gtest-config
> -endef
> -GTEST_POST_INSTALL_STAGING_HOOKS = GTEST_INSTALL_GTEST_CONFIG
> -
>  ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
>  GTEST_CONF_OPTS += -DBUILD_GMOCK=ON
> -
> -# Generate the gmock-config script manually, since the CMake build system is
> -# not doing it.
> -define GTEST_INSTALL_GMOCK_CONFIG
> -	sed 's%@PACKAGE_TARNAME@%gmock%;\
> -		s%@PACKAGE_VERSION@%$(GTEST_VERSION)%;\
> -		s%@prefix@%$(STAGING_DIR)/usr%;\
> -		s%@exec_prefix@%$(STAGING_DIR)/usr%;\
> -		s%@libdir@%$(STAGING_DIR)/usr/lib%;\
> -		s%@includedir@%$(STAGING_DIR)/usr/include%;\
> -		s%@bindir@%$(STAGING_DIR)/usr/bin%;\
> -		s%@PTHREAD_CFLAGS@%%;\
> -		s%@PTHREAD_LIBS@%-lpthread%;' \
> -		$(@D)/googlemock/scripts/gmock-config.in \
> -		> $(STAGING_DIR)/usr/bin/gmock-config
> -	chmod +x $(STAGING_DIR)/usr/bin/gmock-config
> -endef
> -GTEST_POST_INSTALL_STAGING_HOOKS += GTEST_INSTALL_GMOCK_CONFIG
>  else
>  GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
>  endif
>  
> +ifneq ($(HOST_GTEST_GMOCK_PYTHONPATH),)
>  define HOST_GTEST_INSTALL_CMDS
>  	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
>  		$(HOST_DIR)/bin/gmock_gen
>  	cp -rp $(@D)/googlemock/scripts/generator/cpp \
>  		$(HOST_GTEST_GMOCK_PYTHONPATH)
>  endef
> +endif
>  
>  $(eval $(cmake-package))
>  # The host package does not build anything, just installs gmock_gen stuff, so
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
