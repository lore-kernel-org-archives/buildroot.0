Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A12FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF01540361;
	Sun, 12 Dec 2021 14:52:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4B2RBDxRLWp9; Sun, 12 Dec 2021 14:52:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6D444014E;
	Sun, 12 Dec 2021 14:52:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43CA31BF973
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 309F785A30
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FjR08Fx4aP7d for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:52:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25F2F85A25
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:52:00 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id l25so44831271eda.11
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=q02Ysd+MjvMcl7rFlte2JpqFRJ+q6HYM4OtEMs3PPL4=;
 b=Uzy2ZvYrpUxOPZX+FGgi6lUlx/a9vELDkKktJvR62Kype/vD2bML7mTwq+h202dKLJ
 NKer1uiLuanzL7lc/avLPacJrgvn4q4p9SW+PuDYfGItVjLGe1ICrRFaw2kFdpxmb0c0
 F63/tLKNhSsHkXc53msZPBULv6DA4RYX0Ywo/OwFMEv0eMpX3Ly5SXmUOU0xe4KsI2sh
 jW/Ny9HAowo6D+CcmzsT/nIYkUPCtYynwE1eXTy4yHmsJwXYlzt8TWtbuaYy4QUQku7d
 79m4vMmoAwsCirYqHMgyalUMWGrl7GOV4F9NzjqDyBrzLCdYqRyjGv3y5tprFHpuKYnv
 78kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=q02Ysd+MjvMcl7rFlte2JpqFRJ+q6HYM4OtEMs3PPL4=;
 b=rXh7pmJV4/r9yGu12Bpjy+yqRTAZAUUjSg78e9Jx7SuFhg5nsnNfp+VxwZQk/SCBmw
 pwKIe1ondNJ+plQZ5hMl22AR2kqyYPOFMPkdbmxRpdwtgsHkqKbfQNe08Ht7OqmXVp3a
 v6qtnZeQxZD4+pE2Sd7lbsLGLWoBCFx5cHivadttvfT35dkvpO/RUYl2+jd8j7Q5pjxX
 sL9IqZwb6VUBlwQpcTWkP7qu/c6sLcL8rFgte1GYTQrJBtvGnJJeqjKoQtWvhjTaxmer
 xo57E/xRL6pKGkdZXEgM9P5SbcmpTBHxafY5aCznPPPsLrL7IpvepDA25KKKveq0vqzl
 xEuQ==
X-Gm-Message-State: AOAM532ejR0mfaOS0N8f8L7gT4S80Azx/iomMNR15NN/tG8mRd/a0kIO
 bViIXZG7SiqJoJItNouGQ7TlL7vZeon2rg==
X-Google-Smtp-Source: ABdhPJyLoFhMO8uJRtzF8E+/LDAsk/ZAU2XDGOu4YT7bdPEkyBieSyWMetUc1MeSSVH6HX78k9IBcw==
X-Received: by 2002:a05:6402:518a:: with SMTP id
 q10mr25286877edd.86.1639320718439; 
 Sun, 12 Dec 2021 06:51:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b14sm4727128edw.6.2021.12.12.06.51.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:51:58 -0800 (PST)
Message-ID: <452434d2-f1f8-e1d1-4724-5fb0bfeb80e5@mind.be>
Date: Sun, 12 Dec 2021 15:51:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211211181645.58049-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211211181645.58049-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libexif: bump to version 0.6.24
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



On 11/12/2021 19:16, Fabrice Fontaine wrote:
> Drop patch (already in version)
> 
> https://github.com/libexif/libexif/releases/tag/v0.6.24
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...xif-gps-ifd.c-fix-build-with-gcc-4.8.patch | 40 -------------------
>   package/libexif/libexif.hash                  |  2 +-
>   package/libexif/libexif.mk                    |  4 +-
>   3 files changed, 3 insertions(+), 43 deletions(-)
>   delete mode 100644 package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch
> 
> diff --git a/package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch b/package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch
> deleted file mode 100644
> index 7bbf3b3e4d..0000000000
> --- a/package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 0c925491dea995ca96770159158bb8d57a48d84b Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Wed, 15 Sep 2021 07:56:32 +0200
> -Subject: [PATCH] libexif/exif-gps-ifd.c: fix build with gcc 4.8
> -
> -Fix the following build failure with gcc 4.8 raised since version 0.6.23 and
> -https://github.com/libexif/libexif/commit/e12c3529813cd16d50bf0a1c759093e1039dffec:
> -
> -exif-gps-ifd.c: In function 'exif_get_gps_tag_info':
> -exif-gps-ifd.c:62:3: error: 'for' loop initial declarations are only allowed in C99 mode
> -   for (int i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
> -   ^
> -exif-gps-ifd.c:62:3: note: use option -std=c99 or -std=gnu99 to compile your code
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/7dd222e06d1e6611449fb8fe7516817c9ad43d65
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/libexif/libexif/pull/72]
> ----
> - libexif/exif-gps-ifd.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/libexif/exif-gps-ifd.c b/libexif/exif-gps-ifd.c
> -index 9c9ba70..de5f950 100644
> ---- a/libexif/exif-gps-ifd.c
> -+++ b/libexif/exif-gps-ifd.c
> -@@ -59,7 +59,8 @@ const static struct ExifGPSIfdTagInfo exif_gps_ifd_tags[] = {
> - };
> -
> - const ExifGPSIfdTagInfo *exif_get_gps_tag_info(ExifTag tag) {
> --  for (int i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
> -+  int i;
> -+  for (i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
> -     if (tag==exif_gps_ifd_tags[i].tag)
> -       return &exif_gps_ifd_tags[i];
> -   }
> ---
> -2.33.0
> -
> diff --git a/package/libexif/libexif.hash b/package/libexif/libexif.hash
> index e087daf58a..0d082aedb0 100644
> --- a/package/libexif/libexif.hash
> +++ b/package/libexif/libexif.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  a740a99920eb81ae0aa802bb46e683ce6e0cde061c210f5d5bde5b8572380431  libexif-0.6.23.tar.xz
> +sha256  d47564c433b733d83b6704c70477e0a4067811d184ec565258ac563d8223f6ae  libexif-0.6.24.tar.bz2
>   sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
> diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
> index 49637f1519..921029b4ac 100644
> --- a/package/libexif/libexif.mk
> +++ b/package/libexif/libexif.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -LIBEXIF_VERSION = 0.6.23
> -LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.xz
> +LIBEXIF_VERSION = 0.6.24
> +LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
>   LIBEXIF_SITE = \
>   	https://github.com/libexif/libexif/releases/download/v$(LIBEXIF_VERSION)
>   LIBEXIF_INSTALL_STAGING = YES
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
