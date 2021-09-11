Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C39C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:00:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D65060E76
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 13:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D65060E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E1084044E;
	Sat, 11 Sep 2021 13:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v7dKAzniNTj9; Sat, 11 Sep 2021 13:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53CA1401BB;
	Sat, 11 Sep 2021 13:00:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0158D1BF31A
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E320840693
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 13:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40qy4l7hZIy6 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 13:00:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA62540690
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:00:16 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id q3so6683202edt.5
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 06:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ev5UxF4AY83KIURa5otJw8agVFWInSbeGPhzH13SlmE=;
 b=fIByMufRwCRgixvka5x3HCAaKazpgukKhfTNuX++1RecaolnVeuA4lfEndS+HB94rT
 0CJRL9TLiCIBh6E5rRzZlosr0aIVpGza9xFeK4M/UnWnTG9CL7zYOcbTzMYivelj4xEx
 FstRZlK0mW0WSv9ykqn7LYfXeFbfIoUrv9R2mCXHy2nyELTtzF/RST3OznVhOKeUTDQE
 8OfcLSVP+NAhl69zphQL9HaRuQWvIwpiPkvOMX5ImkhVsvaIiNX/aOR563ydNhdqMAV4
 X3GLnlcuJqMGs6bjiopi1W0JIvQb6FpCm1uYLyGGUVPjeRGU2p6F0EJhgB3FIM9SaJa/
 Z2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ev5UxF4AY83KIURa5otJw8agVFWInSbeGPhzH13SlmE=;
 b=Ukw/ce7g8tDKeKa2hCQwvCjllG2gyEqQu7/CtSibBd/SuTgoagtnf0aCa310N3y9Q5
 7YfRD2FQR8E1kfJNdGNSqXiTpuvJwu3qiKBOCMWws5y6SbDtqv8JARzu4WJDL3lfFG/s
 E75BzPpKr1ZZylfsIgvFBQBZM9JeJzZDsGAnm1V8CrovKxPly0Oy9XqbQbFKQkUXea3s
 y25M5c2NI4oLTCkiZkAVPNepTlF+ds3E2oBkr2krit03jB/OZVoi+7/ysser56qVQZjI
 4kB7bosAM9W+tjPHq6rCHHhH1N5kczZQXX8XL72pejxOfiHZhvsH+sfGGemukazWAHLT
 aQ8Q==
X-Gm-Message-State: AOAM533pDOIeYiY264PizU5OF9C3qpbAJRCCmCaLr5TpY1dXZgAwljYL
 IbhM0JLcEEdgsKCmZrgt0AVsYHa/usNZQA==
X-Google-Smtp-Source: ABdhPJze8RhYs6eYsnNsNnog0th/gtLmAvlm+2Qr8xkeP2xR2Wlvlvx/QgAh4w2rFARbAP/KCfa0FA==
X-Received: by 2002:aa7:c884:: with SMTP id p4mr3055843eds.203.1631365214837; 
 Sat, 11 Sep 2021 06:00:14 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k21sm755281ejj.55.2021.09.11.06.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 06:00:14 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210827220531.273104-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <606fb349-382e-4167-2958-4ec4cb2deb9d@mind.be>
Date: Sat, 11 Sep 2021 15:00:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827220531.273104-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/qemu: fix fuse-lseek on uclibc-ng and musl
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 28/08/2021 00:05, Fabrice Fontaine wrote:
> Fix the following build failure on uclibc-ng raised since bump to
> version 6.0.0 in commit 6b86c9335fc3ff381878156c6243454d4b688df9:
> 
> ../block/export/fuse.c: In function 'fuse_lseek':
> ../block/export/fuse.c:641:19: error: 'SEEK_HOLE' undeclared (first use in this function)
>   641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
>       |                   ^~~~~~~~~
> ../block/export/fuse.c:641:19: note: each undeclared identifier is reported only once for each function it appears in
> ../block/export/fuse.c:641:42: error: 'SEEK_DATA' undeclared (first use in this function); did you mean 'SEEK_SET'?
>   641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
>       |                                          ^~~~~~~~~
>       |                                          SEEK_SET
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/33c90ebf04997f4d3557cfa66abc9cf9a3076137
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Fix build instead of disabling fuse-lseek on uclibc-ng and musl
> 
>  ...e.c-fix-fuse-lseek-on-uclibc-or-musl.patch | 44 +++++++++++++++++++
>  package/qemu/qemu.mk                          |  8 +---
>  2 files changed, 45 insertions(+), 7 deletions(-)
>  create mode 100644 package/qemu/0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch
> 
> diff --git a/package/qemu/0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch b/package/qemu/0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch
> new file mode 100644
> index 0000000000..137371c51f
> --- /dev/null
> +++ b/package/qemu/0006-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch
> @@ -0,0 +1,44 @@
> +From 8c3fcbf23fe31cf56f21ce1737bf22fe65fc553b Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 27 Aug 2021 23:40:01 +0200
> +Subject: [PATCH] block/export/fuse.c: fix fuse-lseek on uclibc or musl
> +
> +Include linux/fs.h to avoid the following build failure on uclibc or
> +musl raised since version 6.0.0:
> +
> +../block/export/fuse.c: In function 'fuse_lseek':
> +../block/export/fuse.c:641:19: error: 'SEEK_HOLE' undeclared (first use in this function)
> +  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
> +      |                   ^~~~~~~~~
> +../block/export/fuse.c:641:19: note: each undeclared identifier is reported only once for each function it appears in
> +../block/export/fuse.c:641:42: error: 'SEEK_DATA' undeclared (first use in this function); did you mean 'SEEK_SET'?
> +  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
> +      |                                          ^~~~~~~~~
> +      |                                          SEEK_SET
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/33c90ebf04997f4d3557cfa66abc9cf9a3076137
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: sent to qemu-devel@nongnu.org]

 I've replaced this with the link to patchwork [1] and applied to master, thanks.

 Regards,
 Arnout

[0]
https://patchwork.ozlabs.org/project/qemu-devel/patch/20210827220301.272887-1-fontaine.fabrice@gmail.com/


> +---
> + block/export/fuse.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/block/export/fuse.c b/block/export/fuse.c
> +index fc7b07d2b5..2e3bf8270b 100644
> +--- a/block/export/fuse.c
> ++++ b/block/export/fuse.c
> +@@ -31,6 +31,9 @@
> + #include <fuse.h>
> + #include <fuse_lowlevel.h>
> + 
> ++#ifdef __linux__
> ++#include <linux/fs.h>
> ++#endif
> + 
> + /* Prevent overly long bounce buffer allocations */
> + #define FUSE_MAX_BOUNCE_BYTES (MIN(BDRV_REQUEST_MAX_BYTES, 64 * 1024 * 1024))
> +-- 
> +2.32.0
> +
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 0bd3eafadd..a58bc9024a 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -92,14 +92,8 @@ QEMU_OPTS += --disable-tools
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
> -QEMU_OPTS += --enable-fuse
> +QEMU_OPTS += --enable-fuse --enable-fuse-lseek
>  QEMU_DEPENDENCIES += libfuse3
> -# musl does not support SEEK_HOLE/SEEK_DATA
> -ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> -QEMU_OPTS += --disable-fuse-lseek
> -else
> -QEMU_OPTS += --enable-fuse-lseek
> -endif
>  else
>  QEMU_OPTS += --disable-fuse --disable-fuse-lseek
>  endif
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
