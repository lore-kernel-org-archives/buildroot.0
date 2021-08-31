Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08DFC432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 13:45:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18B4860FED
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 13:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18B4860FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF63E4052A;
	Tue, 31 Aug 2021 13:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0OWB-_plOYb; Tue, 31 Aug 2021 13:45:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6857E40556;
	Tue, 31 Aug 2021 13:45:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA6971BF271
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 13:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8B8D4010B
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 13:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eh3oohhjkPUI for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 13:45:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C53D54026D
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 13:45:42 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id dm15so26889477edb.10
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 06:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3YdwMtyDFuXeMnqeuACxyIDvJCDqI+HH//+gWF+ocSE=;
 b=e5+wUrjTRXcChhU1MK3b13/sBf6kdY/5sSBv+9cJ3AuOlJ9sIXzU4InDA6agP15KrU
 /bn0dTpdvMVkUNs40L1NjjuCAN9HsQK8kvmgnJiz2lSpQkEtzsWtqvhMfn+r6NzD8SfN
 w+1ID73o070N9Sks73mw3UUR5t401KBpoRT3E3Bys88S95boQHpbqJuIB2S2562YiOvn
 LRkU3JfUnG0NaifnVOGGATNRW8ABn3/oO0E/qDmc0VUSNVDm8YwDHhQIYsdDkuqoh+TG
 AJSf/oZ61NZXc1csaL27A1xLBt3qpIgVjn56Y9PoDn1imDrosJSC9JVBKLi/WDrRHMzn
 MQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3YdwMtyDFuXeMnqeuACxyIDvJCDqI+HH//+gWF+ocSE=;
 b=trrONZEBQYh8WDG8/eCHu3m48B5nk6Avgzn1Z8Afota8QGibQU7pjkn2d9Zg2AWIrj
 zDKkj+1V+s033nqa3E9p1WjunE2WeNWNfj8Xq7VqoFdTHV39KeHWK3pMIaKCr0Ea9t3j
 8nLOS6UrmJdJRi9rfJ7oPl/XLvqU8mM23O30o7tNyalGDbIwU8Ili80R1DSqwcuMZpdq
 EJpRbIui8+Mc8m0JTjgnPRGa9qBXIIigAh57RKJC+MD/kLe3On+HM9lRTnlf0RcVNZgA
 ezfvGU3x2p3OE4fAOQq+pCRLGasnJ0R/0fhDp4BIlpVF2rSp87yeptI/t0kaXqi+2ODB
 6D2A==
X-Gm-Message-State: AOAM533D4bBS4L4+Zj8UYMZqYn7Pp2d8zBfs60aFry/RqmwPBxvV5WMa
 ZpmOPOepMGCzDQr/0cV+TQ+XYA==
X-Google-Smtp-Source: ABdhPJwMlHC7O5HiSwf6710EGoEbZJUPmO1+pPOHfyXqHUovIGFeuuLUfNY1Z4gAMzR+CAuOo3d+8g==
X-Received: by 2002:a05:6402:6d1:: with SMTP id
 n17mr20389214edy.106.1630417540851; 
 Tue, 31 Aug 2021 06:45:40 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d16sm9442374edu.8.2021.08.31.06.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 06:45:40 -0700 (PDT)
To: Nevo Hed <nhed+buildroot@starry.com>, buildroot@buildroot.org
References: <20210830205357.4104461-1-nhed+buildroot@starry.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <1eda8eb9-90dd-ac8f-9aee-620079c9f17d@mind.be>
Date: Tue, 31 Aug 2021 15:45:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830205357.4104461-1-nhed+buildroot@starry.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/nginx: override endianness
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 30/08/2021 22:53, Nevo Hed wrote:
> Though several patches exist in buildroot's nginx package dir they do
> not seem to address endianness.
> 
> The test program generated my the script compiles but fails to run (as
> it is built for another architecture) but the script does not
> distinguish between the failure to run the program and an indication
> of certain endianness.  As such the fallback of big-endian is used.
> This setting then causes http2 headers (anything not in the satic
> dictionary) to come out as undecipherble trash.
> 
> This commit includes a patch to the configure script to allow a
> `--force-endianness=big|little` flag as as setting that flag in
> buildroot's package makefile.
> 
> Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>
> ---
>  ...-of-endianness-for-cross-compilation.patch | 115 ++++++++++++++++++
>  package/nginx/nginx.mk                        |   1 +
>  2 files changed, 116 insertions(+)
>  create mode 100644 package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch
> 
> diff --git a/package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch b/package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch
> new file mode 100644
> index 0000000000..137ff6ea5d
> --- /dev/null
> +++ b/package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch
> @@ -0,0 +1,115 @@
> +From b1a6b13d8ac2cade71bae508c7d20fbee6807e4e Mon Sep 17 00:00:00 2001
> +From: Nevo Hed <nhed+buildroot@starry.com>
> +Date: Mon, 30 Aug 2021 13:28:13 -0400
> +Subject: [PATCH] Allow forcing of endianness for cross-compilation
> +
> +Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>

 Ideally, you should have sent the patch upstream and you should add a reference
to the upstream contribution. In this case, it can be as simple as:

Upstream-status: Invalid (upstream doesn't support cross-compilation)
See https://trac.nginx.org/nginx/ticket/2240


 Regards,
 Arnout

> +---
> + auto/endianness | 61 ++++++++++++++++++++++++++++++++-----------------
> + auto/options    |  6 +++++
> + 2 files changed, 46 insertions(+), 21 deletions(-)
> +
> +diff --git a/auto/endianness b/auto/endianness
> +index 1b552b6b..4b2a3cd7 100644
> +--- a/auto/endianness
> ++++ b/auto/endianness
> +@@ -26,25 +26,44 @@ int main(void) {
> + 
> + END
> + 
> +-ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
> +-          -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
> +-
> +-eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
> +-
> +-if [ -x $NGX_AUTOTEST ]; then
> +-    if $NGX_AUTOTEST >/dev/null 2>&1; then
> +-        echo " little endian"
> ++case "${NGX_FORCE_ENDIANNESS}" in
> ++    little)
> ++        echo " little endian (forced)"
> +         have=NGX_HAVE_LITTLE_ENDIAN . auto/have
> +-    else
> +-        echo " big endian"
> +-    fi
> +-
> +-    rm -rf $NGX_AUTOTEST*
> +-
> +-else
> +-    rm -rf $NGX_AUTOTEST*
> +-
> +-    echo
> +-    echo "$0: error: cannot detect system byte ordering"
> +-    exit 1
> +-fi
> ++    ;;
> ++
> ++    big)
> ++        echo " big endian (forced)"
> ++    ;;
> ++
> ++    "")
> ++        ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
> ++                  -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
> ++
> ++        eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
> ++
> ++        if [ -x $NGX_AUTOTEST ]; then
> ++            if $NGX_AUTOTEST >/dev/null 2>&1; then
> ++                echo " little endian"
> ++                have=NGX_HAVE_LITTLE_ENDIAN . auto/have
> ++            else
> ++                echo " big endian"
> ++            fi
> ++
> ++            rm -rf $NGX_AUTOTEST*
> ++
> ++        else
> ++            rm -rf $NGX_AUTOTEST*
> ++
> ++            echo
> ++            echo "$0: error: cannot detect system byte ordering"
> ++            exit 1
> ++        fi
> ++    ;;
> ++
> ++    *)
> ++        echo
> ++        echo "$0: error: invalid \"--force-endianness=${NGX_FORCE_ENDIANNESS}\""
> ++        exit 1
> ++    ;;
> ++esac
> +diff --git a/auto/options b/auto/options
> +index 80be906e..85a06456 100644
> +--- a/auto/options
> ++++ b/auto/options
> +@@ -17,6 +17,8 @@ NGX_USER=
> + NGX_GROUP=
> + NGX_BUILD=
> + 
> ++NGX_FORCE_ENDIANNESS=
> ++
> + CC=${CC:-cc}
> + CPP=
> + NGX_OBJS=objs
> +@@ -196,6 +198,8 @@ do
> +         --user=*)                        NGX_USER="$value"          ;;
> +         --group=*)                       NGX_GROUP="$value"         ;;
> + 
> ++        --force-endianness=*)            NGX_FORCE_ENDIANNESS="$value" ;;
> ++
> +         --crossbuild=*)                  NGX_PLATFORM="$value"      ;;
> + 
> +         --build=*)                       NGX_BUILD="$value"         ;;
> +@@ -432,6 +436,8 @@ cat << END
> +   --build=NAME                       set build name
> +   --builddir=DIR                     set build directory
> + 
> ++  --force-endianness=<big>|<little>  force endianness
> ++
> +   --with-select_module               enable select module
> +   --without-select_module            disable select module
> +   --with-poll_module                 enable poll module
> +-- 
> +2.31.1
> +
> diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
> index 1f996cc613..31b6e276b7 100644
> --- a/package/nginx/nginx.mk
> +++ b/package/nginx/nginx.mk
> @@ -49,6 +49,7 @@ NGINX_CONF_ENV += \
>  
>  # prefix: nginx root configuration location
>  NGINX_CONF_OPTS += \
> +	--force-endianness=$(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN))) \
>  	--prefix=/usr \
>  	--conf-path=/etc/nginx/nginx.conf \
>  	--sbin-path=/usr/sbin/nginx \
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
