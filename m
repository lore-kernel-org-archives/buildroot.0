Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DCAC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AEBF405DD;
	Wed, 27 Apr 2022 19:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sL75nSweDNlE; Wed, 27 Apr 2022 19:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5324F405B5;
	Wed, 27 Apr 2022 19:36:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 869511BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8338C82D14
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FqJi0fm02fFS for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:36:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76C4D82CDE
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:36:10 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id k27so3123226edk.4
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 12:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=1ZtoBNYsdlR3ggMG4rXEEYbFkGtZ9O3sViDCmO+fimA=;
 b=LNyaa8aPl8j8yxZX6o0udj0Msgw1EcGSZKiSavJNr8jkFHJrr0EDGaV3fdWlIP/YA2
 cTbt+TXI3UKW9Yoa3HZ1PTUOWhj+xhyomJQBZ4nWmKQYxw1AFestOgc3aQgY7XPIws+q
 XP26ZGDX9xeeQkXzfteTE8oRXJb3gXItVnDg4dt4Y9oDwqpXlvcHjeMmELKdalVkhUpa
 00uJ0bE4PFGPuMVCqa+M0Vmu9QzaxcKmopc7UKzCa5zDz0+ODU9K3NOFBrYtPj8wZyKM
 9X81CYHyR6oUUiTH6SEmVRES0XS3MbNweDXNjkcu0EWVw/X3aiu03kZMFIrSUuC1vqtT
 jyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1ZtoBNYsdlR3ggMG4rXEEYbFkGtZ9O3sViDCmO+fimA=;
 b=Ldar5naOINC6ja7d+3nrQtx9PA2HFfVRc5Gv9W2yAYAck6bnT3UwDbLzqAt+VJbYXu
 0Dw5xrhCwrWnCyWmw7sXxdXPsMI4IIy2qqjFQ95+gH8NaL/qqJFxi9eNdvm27FrLHu49
 TkXWUSEkHVvGCzZAvf8Z5XZQjHcsgZSOI08sKK4QZwj8r+2HSFKgTHlGLRnfvKjFU+ry
 V2G0ATBnXPbBQrQY9/pPCLS7dXA2CLolNeuDm+y1veWJ/DMaxzbCOF0TPjdf+m5hSAoY
 KIFqtR/akSvmJtgIB0B/h5OE1uajMCdqLWX0EcgHEUV022Xp+AkT96rkxhu9ko+UxcAH
 zaMQ==
X-Gm-Message-State: AOAM530Xdh7cjFbT/UW2jpzOntGgQ9IyROYKJ1fEstkjmBeT1rCN/J/8
 6tPnfueGHf6L5AXuCY4IGaN5UyLZqXSRgw==
X-Google-Smtp-Source: ABdhPJwPrxPnCKjjrJqLcpNyJL/A4rbDmtPl8VFIXIPCufQg4++uVkKGxYv4/i7wQFAYM+WN0TMK8w==
X-Received: by 2002:a05:6402:34c9:b0:423:deb7:f69e with SMTP id
 w9-20020a05640234c900b00423deb7f69emr32250023edc.335.1651088168701; 
 Wed, 27 Apr 2022 12:36:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a1709060b5100b006f38cf075cbsm5145494ejg.104.2022.04.27.12.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:36:08 -0700 (PDT)
Message-ID: <f3585d1a-552b-dd85-7d6f-8fe727c532ae@mind.be>
Date: Wed, 27 Apr 2022 21:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220426191934.2738310-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220426191934.2738310-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/linknx: fix build with
 argp-standalone and NLS
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/04/2022 21:19, Fabrice Fontaine wrote:
> Fix the following build failure with argp-standalone and NLS raised
> since commit 5430c8fedd0392e79e0c011825b056fea129980a:
> 
> configure:7799: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/xtensa-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -largp   >&5
> /home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libargp.a(argp-parse.o): in function `argp_version_parser':
> /home/giuliobenetti/autobuild/run/instance-2/output-1/build/argp-standalone-1.4.1/argp-parse.c:179: undefined reference to `libintl_dgettext'
> 
> [...]
> 
> checking for library containing argp_parse... no
> configure: error: argp_parse not found
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/ce5753193ec4518c75ee0ab9270b577397ca1c02
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/linknx/linknx.mk | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
> index dbee0742fe..dcfcd5e3f5 100644
> --- a/package/linknx/linknx.mk
> +++ b/package/linknx/linknx.mk
> @@ -23,7 +23,10 @@ LINKNX_DEPENDENCIES = \
>   	host-pkgconf \
>   	libpthsem \
>   	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone) \
> -	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
> +	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
> +	$(TARGET_NLS_DEPENDENCIES)

  This is only really needed in case argp-standalone is selected...

  But it doesn't really hurt, so applied to master, thanks.

  Regards,
  Arnout

> +
> +LINKNX_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
>   
>   ifeq ($(BR2_PACKAGE_LIBCURL),y)
>   LINKNX_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
