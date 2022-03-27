Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1164EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAD5A40189;
	Sun, 27 Mar 2022 16:30:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ohVAlY3ClJ3; Sun, 27 Mar 2022 16:30:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AFE140423;
	Sun, 27 Mar 2022 16:30:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDBEB1BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC85540E47
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:29:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bNKY6L5PZAD1 for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:29:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D79E040904
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:29:56 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id lr4so15715669ejb.11
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=EKF58H6wnShWefEixzlWDW5byWN+aQ6icJqhrbkiHA8=;
 b=iYVNgpm3uqMBAITrs+IF9NCxgUrZZF1HOZHakZIyLNwQ9E5srJ8hTB4pR+Au4XXSSu
 XWFcANsETd5G4rfdfCoyqmEAq2TyjVceMx4W14ku2VZER9yWxiGoWIBNsxOWRXQmUtcf
 7ihAtmAtqk4P4Amoj+rguY0xjy7vv/cLi5rHX3TDrm6+97+rTozfpKIkGfqflhxAjH8r
 DGplsHR/+1Yb5kiYKjLBlPjqonxcYtGO+K34B/ihw7YZE/wou/90R6jJv/XxK7/mwBaY
 jPrUelqUZGitINAOdy+x33J+XzNJzCKRB6cjoRRDw3q/NMqZDdKuzg1HkUojnqddVuvx
 b5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=EKF58H6wnShWefEixzlWDW5byWN+aQ6icJqhrbkiHA8=;
 b=ATIi4FGLMNQeh5sK5tgECAB92gtbfpVfkChK9MFhqJfbKtxgAE3GEp21fIEYcwmjLm
 NM84BXzcLMJaNJTTH6g721/3MvoHJCP4xTTWu/v+OSIT8ErpJ3jRQCOYICLr7QKtq51b
 4UCk3ydUJxxWsShQzMbE3G2Sa42kUUHyqfMQti2ijEBhfCmAI3yERxWc9pdwnM1kQeiM
 G/U4m9jEzETrXAEARCC8rcJPSkvRO4kjVnvkmbNKDzH+9p6aDao3mGGN1lUUoOr9NdQl
 eibgqP3jLTqpZB4VgdNRMmXYvsl5H9xDf+Y9VEaRlATjQVmgSdqb4IBUDGTiTu73hAW4
 wjRQ==
X-Gm-Message-State: AOAM532NhDv1BBoxgZ/i84jAV4QefSn1o6PTJNg9rVo8702jhJzJAj2m
 6Q5zXdOPYuiOFZRp9sTOoxsbRQ==
X-Google-Smtp-Source: ABdhPJw7KxvKh/w3DU2Fkd+2F3FRLaLatTUZXIKpUpMJVIns+jEDl0+8SuOy2nQTa8NrF6GuibDucQ==
X-Received: by 2002:a17:907:dab:b0:6df:e51a:b990 with SMTP id
 go43-20020a1709070dab00b006dfe51ab990mr22376945ejc.573.1648398594975; 
 Sun, 27 Mar 2022 09:29:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r22-20020a17090638d600b006d584aaa9c9sm4758602ejd.133.2022.03.27.09.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:29:54 -0700 (PDT)
Message-ID: <ff548328-7433-34d2-6a12-8af05e087c49@mind.be>
Date: Sun, 27 Mar 2022 18:29:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220325213557.757894-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220325213557.757894-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/btrfs-progs: bump to version
 5.16.2
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



On 25/03/2022 22:35, Fabrice Fontaine wrote:
> Drop patches (already in version)
> 
> https://github.com/kdave/btrfs-progs/blob/v5.16.2/CHANGES
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...nst-h-to-fix-build-with-5-12-headers.patch | 43 ----------------
>   ...-sys-sysinfo-h-conditionally-on-musl.patch | 49 -------------------
>   ...ocal-definition-for-alignment-macros.patch | 46 -----------------
>   package/btrfs-progs/btrfs-progs.hash          |  2 +-
>   package/btrfs-progs/btrfs-progs.mk            |  2 +-
>   5 files changed, 2 insertions(+), 140 deletions(-)
>   delete mode 100644 package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch
>   delete mode 100644 package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch
>   delete mode 100644 package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch
> 
> diff --git a/package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch b/package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch
> deleted file mode 100644
> index b6c1a42456..0000000000
> --- a/package/btrfs-progs/0001-btrfs-progs-include-linux-const-h-to-fix-build-with-5-12-headers.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From b28f7bd9bba6f65258da48955154794f466b4104 Mon Sep 17 00:00:00 2001
> -From: Bruce Ashfield <bruce.ashfield@gmail.com>
> -Date: Thu, 30 Dec 2021 15:23:59 +0200
> -Subject: [PATCH] btrfs-progs: include linux/const.h to fix build with 5.12+
> - headers
> -
> -btrfs-tools compile fails with mips, musl and 5.12+ headers.
> -
> -The definition of __ALIGN_KERNEL has moved in 5.12+ kernels, so we
> -add an explicit include of const.h to pickup the macro:
> -
> -  | make: *** [Makefile:595: mkfs.btrfs] Error 1
> -  | make: *** Waiting for unfinished jobs....
> -  | libbtrfs.a(volumes.o): in function `dev_extent_search_start':
> -  | /usr/src/debug/btrfs-tools/5.12.1-r0/git/kernel-shared/volumes.c:464: undefined reference to `__ALIGN_KERNEL'
> -  | collect2: error: ld returned 1 exit status
> -
> -This is safe for older kernel's as well, since the header still
> -exists, and is valid to include.
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> -[remove invalid OE Upstream-status]
> -Signed-off-by: Stijn Tintel <stijn@linux-ipv6.be>
> -Signed-off-by: David Sterba <dsterba@suse.com>
> -[Retrieved from:
> -https://github.com/kdave/btrfs-progs/commit/b28f7bd9bba6f65258da48955154794f466b4104]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - kerncompat.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/kerncompat.h b/kerncompat.h
> -index df167fe6c..2503d1afa 100644
> ---- a/kerncompat.h
> -+++ b/kerncompat.h
> -@@ -29,6 +29,7 @@
> - #include <stddef.h>
> - #include <linux/types.h>
> - #include <linux/kernel.h>
> -+#include <linux/const.h>
> - #include <stdint.h>
> -
> - #include <features.h>
> diff --git a/package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch b/package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch
> deleted file mode 100644
> index 7473fe67cb..0000000000
> --- a/package/btrfs-progs/0002-btrfs-progs-include-sys-sysinfo-h-conditionally-on-musl.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From a2511aaa85c8d95d12805dfdcbb5667fa3e30ba5 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 8 Jan 2022 22:44:44 +0100
> -Subject: [PATCH] btrfs-progs: include sys/sysinfo.h conditionally on musl
> -
> -Make inclusion of sys/sysinfo.h conditional to avoid the following build
> -failure on musl:
> -
> -In file included from .../i586-buildroot-linux-musl/sysroot/usr/include/linux/kernel.h:4,
> -                 from ./kerncompat.h:31,
> -                 from common/utils.c:42:
> -.../i586-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:7:8: error: redefinition of 'struct sysinfo'
> -    7 | struct sysinfo {
> -      |        ^~~~~~~
> -In file included from common/utils.c:27:
> -.../i586-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
> -   10 | struct sysinfo {
> -      |        ^~~~~~~
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/16f44fb9dea72a7079e8e5517e760dd79d2724cc
> -
> -The 'struct sysinfo' is defined in linux/sysinfo.h and sys/sysinfo.h,
> -while both must not be included at the same time. Stop including
> -linux/kernel.h that sometimes unconditionally includes sys/sysinfo.h and
> -causes the double definition for some reason. As we now include
> -linux/const.h directly, there's no other effective change.
> -
> -Pull-request: #433
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Signed-off-by: David Sterba <dsterba@suse.com>
> -[Retrieved from:
> -https://github.com/kdave/btrfs-progs/commit/a2511aaa85c8d95d12805dfdcbb5667fa3e30ba5]
> ----
> - kerncompat.h | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/kerncompat.h b/kerncompat.h
> -index 2503d1afa..6ca1526e2 100644
> ---- a/kerncompat.h
> -+++ b/kerncompat.h
> -@@ -28,7 +28,6 @@
> - #include <assert.h>
> - #include <stddef.h>
> - #include <linux/types.h>
> --#include <linux/kernel.h>
> - #include <linux/const.h>
> - #include <stdint.h>
> -
> diff --git a/package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch b/package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch
> deleted file mode 100644
> index 86c63edc30..0000000000
> --- a/package/btrfs-progs/0003-btrfs-progs-kerncompat-add-local-definition-for-alignment-macros.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58 Mon Sep 17 00:00:00 2001
> -From: David Sterba <dsterba@suse.com>
> -Date: Thu, 13 Jan 2022 14:47:08 +0100
> -Subject: [PATCH] btrfs-progs: kerncompat: add local definition for alignment
> - macros
> -
> -There's still problem left with compilation on musl and kernel < 5.11,
> -because __ALIGN_KERNEL is not defined anymore:
> -
> -../bin/ld: kernel-shared/volumes.o: in function `create_chunk':
> -volumes.c:(.text+0x17f8): undefined reference to `__ALIGN_KERNEL'
> -
> -Due to the entangled includes and unconditional definition of
> -__ALIGN_KERNEL, we can't use #ifdef in kerncompat.h to define it
> -eventually (as kerncompat.h is the first include). Instead add local
> -definitions of the macros and rename them to avoid name clashes.
> -
> -Pull-request: #433
> -Signed-off-by: David Sterba <dsterba@suse.com>
> -[Retrieved from:
> -https://github.com/kdave/btrfs-progs/commit/b0cfe12c4d4b8b4ef335cdf4ddefcbdcd1b70d58]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - kerncompat.h | 9 ++++++++-
> - 1 file changed, 8 insertions(+), 1 deletion(-)
> -
> -diff --git a/kerncompat.h b/kerncompat.h
> -index 6ca1526e2..f0a6e196e 100644
> ---- a/kerncompat.h
> -+++ b/kerncompat.h
> -@@ -359,7 +359,14 @@ do {					\
> -
> - /* Alignment check */
> - #define IS_ALIGNED(x, a)                (((x) & ((typeof(x))(a) - 1)) == 0)
> --#define ALIGN(x, a)		__ALIGN_KERNEL((x), (a))
> -+
> -+/*
> -+ * Alignment, copied and renamed from /usr/include/linux/const.h to work around
> -+ * issues caused by moving the definition in 5.12
> -+ */
> -+#define __ALIGN_KERNEL__(x, a)		__ALIGN_KERNEL_MASK__(x, (typeof(x))(a) - 1)
> -+#define __ALIGN_KERNEL_MASK__(x, mask)	(((x) + (mask)) & ~(mask))
> -+#define ALIGN(x, a)		__ALIGN_KERNEL__((x), (a))
> -
> - static inline int is_power_of_2(unsigned long n)
> - {
> diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
> index 339eab02aa..14eeb1ca07 100644
> --- a/package/btrfs-progs/btrfs-progs.hash
> +++ b/package/btrfs-progs/btrfs-progs.hash
> @@ -1,5 +1,5 @@
>   # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
> -sha256  6230f8f33961bd62633d601b0d049a3c6b833c1a1a7a2f2782d0c5796e7ab920  btrfs-progs-v5.15.1.tar.xz
> +sha256  9e9b303a1d0fd9ceaaf204ee74c1c8fa1fd55794e223d9fe2bc62875ecbd53d2  btrfs-progs-v5.16.2.tar.xz
>   # Locally computed
>   sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libbtrfsutil/COPYING
> diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
> index 54922df839..9bf50ccfda 100644
> --- a/package/btrfs-progs/btrfs-progs.mk
> +++ b/package/btrfs-progs/btrfs-progs.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BTRFS_PROGS_VERSION = 5.15.1
> +BTRFS_PROGS_VERSION = 5.16.2
>   BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
>   BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
>   BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
