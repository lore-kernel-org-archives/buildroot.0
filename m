Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5F2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:27:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D70E861074
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D70E861074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9254060706;
	Sun, 19 Sep 2021 12:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wd-kA1xYutZg; Sun, 19 Sep 2021 12:27:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDBD0606F6;
	Sun, 19 Sep 2021 12:27:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E95FA1BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4CC4606F6
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLD2sJmj3SdO for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:27:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A53CC606EE
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:27:40 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id eg28so26513863edb.1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 05:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xKY5LJGkP4TbvonWDuaDcm0nDLko1Amx07ZjSNTfwzw=;
 b=TwYURQc50n9s33xXBqvsb+GBUarD9kXLKaqO8Muy8Fh3RDHx4j2rsX2Yy7z7JKs5fx
 UXD1HFGu7UxjASeBUYFEguYC5PbQSduZmnoDJhaSN0xc8+2AWPWFXx+7ytTu0eC0Vn8B
 bb2qqE1oG23hBh0BirDH0g19VqKdqzheW8CIahb/OGj8QheYx1xpKSfAK7ltwfcVw3oT
 N9NAe/w5lyI85YgzLklIqjLWZSA8S65qwTarCYQH0p0XbYbIKtAyc+y/xYGSJ2kAG5zv
 hDfXiN4DOQEaQqmVPch1CzTxMWvX9We9sei5P/OyFV4R5QkaW4fW8mmzjOS4kvQxtOm5
 aqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xKY5LJGkP4TbvonWDuaDcm0nDLko1Amx07ZjSNTfwzw=;
 b=MvOp19sXeAxevbWNfRftBou7mdQatvzNZJI+TAtzLsASVVzvbcUPNNB3JZj1znaPjl
 7GOtbPEZuFmYBAkWb1ZujV7EeDxYwGX7yuF2DLd7r02IWttpMlJqJT7p/iXLVNlrmJf/
 hbQfwRiOlTr2PLRwWBZ/M52JOp7b2zTNLmyrh41cKjOiWLSBIHw8vbNSSfGbOswRUzeM
 x9J3lDq1jrlLDV4LVKH8wMFgS2KuzHGhpyfRyaI//yx9M74z3P/Li5BW/36f9KZbFLE+
 uOqh1iHVo5qQ5AVHnISPqPKcw7cdWvxoWj4zC/vzFA9ys/kHA30NEqGQ7KIFUhMyP7Jo
 au9A==
X-Gm-Message-State: AOAM531BHGjn+DFrmcmsBDZm/J+TCPE+WyHSuNAAa9ggHkCM/O+vcNB/
 9MqZHVFzTzwHY7zgzelWxF5NdBwEXY2dcw==
X-Google-Smtp-Source: ABdhPJyYcvi/0pU8eCPxv6o8naqb77Ft20olxpICtX0YAZY3hoTnpgqp1Yv1A6hLNYMGPyG809icgw==
X-Received: by 2002:a17:906:1c07:: with SMTP id
 k7mr16402510ejg.145.1632054458826; 
 Sun, 19 Sep 2021 05:27:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k15sm4780108ejb.92.2021.09.19.05.27.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 05:27:38 -0700 (PDT)
Message-ID: <145608bf-0236-3052-a668-6225c27070a8@mind.be>
Date: Sun, 19 Sep 2021 14:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20210907114556.3977493-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210907114556.3977493-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: bump to version 2.69.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

  Hi James,

On 07/09/2021 13:45, James Hilliard wrote:
> Rebase remove cpp requirement patch.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  AFAIK, glib2's odd releases, like 2.69, are experimental, and the even 
releases, i.e. 2.68, are the stable ones. Normally we'd track only the stable 
releases. Any reason to switch to the experimental one now?

  Regards,
  Arnout

> ---
>   .../libglib2/0002-remove-cpp-requirement.patch   | 16 ++++++++--------
>   package/libglib2/libglib2.hash                   |  4 ++--
>   package/libglib2/libglib2.mk                     |  4 ++--
>   3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/package/libglib2/0002-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
> index 9393bd258a..691f3147ef 100644
> --- a/package/libglib2/0002-remove-cpp-requirement.patch
> +++ b/package/libglib2/0002-remove-cpp-requirement.patch
> @@ -1,4 +1,4 @@
> -From 2f168951df1feebeac549ada1ea44ea092484c54 Mon Sep 17 00:00:00 2001
> +From 36f4c37fb2a27d93cd58460fa9cc54a0c1cd957e Mon Sep 17 00:00:00 2001
>   From: Adam Duskett <Aduskett@gmail.com>
>   Date: Mon, 16 Sep 2019 10:12:38 -0700
>   Subject: [PATCH] remove cpp requirement
> @@ -17,7 +17,7 @@ https://gitlab.gnome.org/GNOME/glib/issues/1748
>    3 files changed, 1 insertion(+), 23 deletions(-)
>   
>   diff --git a/glib/glibconfig.h.in b/glib/glibconfig.h.in
> -index 7ef8c48..128e65d 100644
> +index 873cb0314..5ada525f7 100644
>   --- a/glib/glibconfig.h.in
>   +++ b/glib/glibconfig.h.in
>   @@ -117,7 +117,6 @@ typedef unsigned @glib_intptr_type_define@ guintptr;
> @@ -29,13 +29,13 @@ index 7ef8c48..128e65d 100644
>    /* gcc-2.95.x supports both gnu style and ISO varargs, but if -ansi
>     * is passed ISO vararg support is turned off, and there is no work
>   diff --git a/meson.build b/meson.build
> -index 4bbf4c2..ac59f4e 100644
> +index 4f1178aa4..a087d6e27 100644
>   --- a/meson.build
>   +++ b/meson.build
>   @@ -1,4 +1,4 @@
>   -project('glib', 'c', 'cpp',
>   +project('glib', 'c',
> -   version : '2.68.2',
> +   version : '2.69.3',
>      # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
>      meson_version : '>= 0.49.2',
>   @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
> @@ -46,7 +46,7 @@ index 4bbf4c2..ac59f4e 100644
>    
>    cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
>    
> -@@ -1679,20 +1678,6 @@ if g_have_iso_c_varargs
> +@@ -1697,20 +1696,6 @@ if g_have_iso_c_varargs
>    #endif''')
>    endif
>    
> @@ -67,7 +67,7 @@ index 4bbf4c2..ac59f4e 100644
>    g_have_gnuc_varargs = cc.compiles('''
>      void some_func (void) {
>        int a(int p1, int p2, int p3);
> -@@ -2330,7 +2315,6 @@ subdir('gobject')
> +@@ -2340,7 +2325,6 @@ subdir('gobject')
>    subdir('gthread')
>    subdir('gmodule')
>    subdir('gio')
> @@ -76,7 +76,7 @@ index 4bbf4c2..ac59f4e 100644
>      subdir('tests')
>    endif
>   diff --git a/tests/meson.build b/tests/meson.build
> -index e4ea226..7fd974c 100644
> +index 6741f8f52..316cf2527 100644
>   --- a/tests/meson.build
>   +++ b/tests/meson.build
>   @@ -55,11 +55,6 @@ tests = {
> @@ -92,5 +92,5 @@ index e4ea226..7fd974c 100644
>    
>    test_extra_programs = {
>   --
> -2.23.0
> +2.25.1
>   
> diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
> index 15e0085f78..b045a74a46 100644
> --- a/package/libglib2/libglib2.hash
> +++ b/package/libglib2/libglib2.hash
> @@ -1,4 +1,4 @@
> -# https://download.gnome.org/sources/glib/2.68/glib-2.68.2.sha256sum
> -sha256  ecc7798a9cc034eabdfd7f246e6dd461cdbf1175fcc2e9867cc7da7b7309e0fb  glib-2.68.2.tar.xz
> +# https://download.gnome.org/sources/glib/2.69/glib-2.69.3.sha256sum
> +sha256  47af2c6e06becee44d447ae7d1212dbab255b002b5141d9b62a4357c0ecc058f  glib-2.69.3.tar.xz
>   # License files, locally calculated
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index 4f13622e36..4315ceca52 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -LIBGLIB2_VERSION_MAJOR = 2.68
> -LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
> +LIBGLIB2_VERSION_MAJOR = 2.69
> +LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
>   LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
>   LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
>   LIBGLIB2_LICENSE = LGPL-2.1+
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
