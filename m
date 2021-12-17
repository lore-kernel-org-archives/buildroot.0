Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8ADC433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 17:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B43884D29;
	Fri, 17 Dec 2021 17:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLydifwbExwL; Fri, 17 Dec 2021 17:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E20584D19;
	Fri, 17 Dec 2021 17:44:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C053E1BF2AF
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF71B42016
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G8-6x7uY96ui for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 17:44:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5D8042002
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 17:44:27 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id o20so10606628eds.10
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 09:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/VTc++Ihdip6f85SRrn9vp4cw7kXOmEMBT/tQBOp+IU=;
 b=RNMJQ4eOJ858qcruaNx7xldDGafF0bessfuzsA6FLykAOe+X5azdlVGAgBPtIzjaCD
 6n4NAxZTPBcY4Mkz2ToLTC/ZSHQICVZmj4Cs9nUkF7u+cm/N1hSstMGBeD7bWzKYTyK3
 PM4TapSnSa0Zu7f6EAezgWOiBhPS09TEaMPLMmenZD7U7YWPR6KEVzTHW/T7XylyiYAt
 MagAZa1ZZ/8CdsbI5sVYPtidD4vf+cTDqEEZ8nzxYoQBn2hksB42xitzwfb8y8MUiCCb
 8fPrlbIAU9HNkcqAvOAAZ4pypj4EUG5m520iwqKERUyLowOPsa6oew+hWUhT8+Q82f6v
 goYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/VTc++Ihdip6f85SRrn9vp4cw7kXOmEMBT/tQBOp+IU=;
 b=mYhc2EEHQOnKHJvuU6NrlCprxeTmeLCD+wYDUz8DBpZhkqcyYzkCYQE2bo6F2iVbc/
 E7V237jtvKm5DTYhIptSNITT1E20K7+OYzFKpkBddM9jbWIWpPhYwvEKv4ZlH2hGpTuV
 +ICmfeDJIUUiZ+/norI2dy9HEtJlbrhuB1nXb58c3fBslsciil052auZ8z7nQnqvhIhp
 57y59D3JXjVcMNpp3qpAvglEA6hjtAdiUJPx2KkHEZ+rGXjEf+H4cFkCBcy9SYWcTd5i
 KvNZi6e/FK/1C+hZYpriBKmjmeHsC5nbhlMQvxE5mBXxU/gUigL3FKQwXvFiqHii5Lqo
 bSwg==
X-Gm-Message-State: AOAM533QHgBK3pS+BT4Mr5qgX0tSnSdxsiAubv1lmd6GSH16K8hvjS9+
 BgZafrV++8gs7cEQp5KT9X4rBw==
X-Google-Smtp-Source: ABdhPJwvpoc5i+d288xMYlHuWO/R0N6a4i9mHsLV9jLsjPZ9JUkj+syiaZz6hLLfYtqDO31cWjazHg==
X-Received: by 2002:a17:907:3da3:: with SMTP id
 he35mr3575493ejc.464.1639763065882; 
 Fri, 17 Dec 2021 09:44:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qf14sm12383ejc.18.2021.12.17.09.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 09:44:25 -0800 (PST)
Message-ID: <eebcdba5-46b5-663d-df5b-088a26179047@mind.be>
Date: Fri, 17 Dec 2021 18:44:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211216223050.1028050-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211216223050.1028050-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/stella: bump to version 6.6
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/12/2021 23:30, Fabrice Fontaine wrote:
> - C++17 is mandatory since version 6.5 and
>    https://github.com/stella-emu/stella/commit/fe2b4d630e1aeae80d0e90d7fe5e79b396c796a6
> - Update hash of Copyright.txt, year updated:
>    https://github.com/stella-emu/stella/commit/21438a82cc5245ff7437c9e61425d9d4307f7273
> 
> https://github.com/stella-emu/stella/blob/6.6/Changes.txt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/stella/0001-configure-add-CC.patch | 30 ++++++++++++++++++++++
>   package/stella/Config.in                   |  6 ++---
>   package/stella/stella.hash                 |  4 +--
>   package/stella/stella.mk                   |  2 +-
>   4 files changed, 36 insertions(+), 6 deletions(-)
>   create mode 100644 package/stella/0001-configure-add-CC.patch
> 
> diff --git a/package/stella/0001-configure-add-CC.patch b/package/stella/0001-configure-add-CC.patch
> new file mode 100644
> index 0000000000..d4b29e39b5
> --- /dev/null
> +++ b/package/stella/0001-configure-add-CC.patch
> @@ -0,0 +1,30 @@
> +From 143cf9fa13a07b827de7065a5e919631406b0941 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 12 Dec 2021 22:46:52 +0100
> +Subject: [PATCH] configure: add CC (#854)
> +
> +Add CC to fix the following build failure when cross-compiling which is
> +raised since
> +https://github.com/stella-emu/stella/commit/771b5b44e31de1b81a552ee47b65014fbc338776:
> +
> +out/src/sqlite/sqlite3.o: file not recognized: file format not recognized
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/stella-emu/stella/commit/143cf9fa13a07b827de7065a5e919631406b0941]
> +---
> + configure | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/configure b/configure
> +index df666b377..0101d2567 100755
> +--- a/configure
> ++++ b/configure
> +@@ -899,6 +899,7 @@ echo "Creating config.mak"
> + cat > config.mak << EOF
> + # -------- Generated by configure -----------
> +
> ++CC := $CC
> + CXX := $CXX
> + CXXFLAGS := $CXXFLAGS
> + LD := $LD
> diff --git a/package/stella/Config.in b/package/stella/Config.in
> index 7722f8a540..b5d148489a 100644
> --- a/package/stella/Config.in
> +++ b/package/stella/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_STELLA
>   	depends on !BR2_STATIC_LIBS # sdl2
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
>   	select BR2_PACKAGE_SDL2
>   	help
> @@ -11,10 +11,10 @@ config BR2_PACKAGE_STELLA
>   
>   	  https://stella-emu.github.io/
>   
> -comment "stella needs a toolchain w/ dynamic library, C++, threads, gcc >= 6"
> +comment "stella needs a toolchain w/ dynamic library, C++, threads, gcc >= 7"
>   	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
>   		!BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_6
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
>   
>   comment "stella needs a toolchain not affected by GCC bug 64735"
>   	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> diff --git a/package/stella/stella.hash b/package/stella/stella.hash
> index c40d96616a..8aa5118165 100644
> --- a/package/stella/stella.hash
> +++ b/package/stella/stella.hash
> @@ -1,4 +1,4 @@
>   # Locally computed:
> -sha256  0346900e9ba4b6d532b72d956adc5078502a9bd6bbc1648bb3dd68f5ffd4859b  stella-6.4-src.tar.xz
> -sha256  d207ee9e563fdd062582df8cbb6c8303b9879bd107692c0db2a32477e47dfa35  Copyright.txt
> +sha256  d481efc6d27b5294565dfcc10983de2dbc4db8a59932a678ffdb4d2404b8c207  stella-6.6-src.tar.xz
> +sha256  d5e5897578c2590e48328986cebd950ff215653f7f506ef93accf981870366a6  Copyright.txt
>   sha256  58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
> diff --git a/package/stella/stella.mk b/package/stella/stella.mk
> index 9e21606155..198a1134dc 100644
> --- a/package/stella/stella.mk
> +++ b/package/stella/stella.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -STELLA_VERSION = 6.4
> +STELLA_VERSION = 6.6
>   STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
>   STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
>   STELLA_LICENSE = GPL-2.0+
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
