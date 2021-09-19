Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6ADC433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:15:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C24761074
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C24761074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F09B4016C;
	Sun, 19 Sep 2021 12:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HWHEcmVzceeh; Sun, 19 Sep 2021 12:15:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0F8B4023D;
	Sun, 19 Sep 2021 12:15:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C7D01BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8903C605A4
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5kVlq9zoOXJ6 for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:15:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4041860599
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:15:01 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id eg28so26432172edb.1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 05:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iPrfH3E7MlPQPQhoTA4fD5TDUKr6gV3NIdxqrQiANKg=;
 b=RLZMOJpJOgXagUPo+ubU8foE602jivj7BAC19QqrjTn4N/0ceLzv4TM9lkcvDQrDD9
 fc+RdL918uaY4YzGvAmsn1xRowyNObjjYR8WPl3z09xDc4ieYAIWllb1EtXy/gW+iCAo
 mSwLiKNE+Qr5k3hMQzhNyGG4VyZ06moPY4lRtiL5a2zXytzqDcDvy933Zlcc6xcBcGnO
 NV2oomc9wbPX6VYoEjYW8iMJgWUjU9uXWF7zYnLlH9gfKuSUNpVLdEj4tr62Nbtyw9yP
 i6vdczs+hLQiW+M6wrZlEJADNdCVqBBD63g+X/tA8L8QQ1os49/l30cookpfYcuXjhgC
 4IHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iPrfH3E7MlPQPQhoTA4fD5TDUKr6gV3NIdxqrQiANKg=;
 b=OdibfbklU4Y34kZB0VjbQBDCckXAeQ+L2qhLu+U46jA7ztFqJEL1Uy7tvfKSjcTFlj
 Cj4bPJ13pjaZwmzTSm6zdCWQ0wN7hpCabYNCEjmnoQgBjYS6dmk7j/4UMvUcUJ2QaAm7
 KUAD5ZiO2FOO0IhMctKy4tnotkzPvMVPAWjduyrIas2X3mpDHP/X7TGTXUuYegFvhdIS
 VEPcuq752FwYFCp91Cz3aX2rT1/Pxex2at7TA4r6kTVFG+ClXi37CQ1JZeXjnYH/limQ
 EPCzwnM+cNRNIHTH894/9aCKsTZ5b904wQaiYDT0vdWcoRW430vrfoRs9eMr7cEFF2gA
 cZ4Q==
X-Gm-Message-State: AOAM530iwI0cMNmATPA+WR+VnaIxU3eK0kTY5Hi3BM+wrqixu30K83ap
 NyBdKNQXp+/ZJP82pKk6istcXQ==
X-Google-Smtp-Source: ABdhPJxadia+sMtu7p5+kFiiVH1pGs+OVV+dSNz1F/BSPxK/p19VPMwgwd5cP6fGrjOqrWhz+RQq5A==
X-Received: by 2002:a17:906:1f09:: with SMTP id
 w9mr20077865ejj.472.1632053699334; 
 Sun, 19 Sep 2021 05:14:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k21sm4777803ejj.55.2021.09.19.05.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 05:14:58 -0700 (PDT)
Message-ID: <57e10f97-c769-2418-e465-a72346426d87@mind.be>
Date: Sun, 19 Sep 2021 14:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210906212745.120679-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210906212745.120679-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/libnss: bump to version 3.70
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 06/09/2021 23:27, Giulio Benetti wrote:
> Drop local patch that has been upstream(even if with another authorship).

  Applied to master, thanks.

> 
> Release Notes (not yet available, but should eventually land):
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.70_release_notes

  No release notes are available since 3.66, and neither is any of those 
releases mentioned on the release page [1]. The release page still says that 
3.66 is the latest stable release (which is what we'd normally use). But that's 
bollocks, clearly, because 3.68 is even used in a firefox ESR release so it 
should definitely be stable...

  Could you check about this with upstream?

  If they no longer create release notes or update their releases page, I guess 
that's OK with us - but we should stop mentioning those non-existent release 
notes in the commit messages then :-)

  Regards,
  Arnout

[1] https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases


> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   ...2.c-fix-SHA256-redefinition-on-ARM-b.patch | 47 -------------------
>   package/libnss/libnss.hash                    |  4 +-
>   package/libnss/libnss.mk                      |  2 +-
>   3 files changed, 3 insertions(+), 50 deletions(-)
>   delete mode 100644 package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch
> 
> diff --git a/package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch b/package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch
> deleted file mode 100644
> index f925f20051..0000000000
> --- a/package/libnss/0001-lib-freebl-sha512.c-fix-SHA256-redefinition-on-ARM-b.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 434d79c52db5b680accc531572319bd7094fa470 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 7 Aug 2021 23:19:01 +0200
> -Subject: [PATCH] lib/freebl/sha512.c: fix SHA256 redefinition on ARM big
> - endian
> -
> -For an unknown reason, SHA256_{Compress,Update}_Native are defined in
> -lib/freebl/sha512.c if IS_LITTLE_ENDIAN is undefined since version 3.68
> -and
> -https://github.com/nss-dev/nss/commit/e1e00f21f2d73e0d5d27651ad5606efa5714abe4
> -
> -This raises the following build failure on ARM big endian:
> -
> -Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha256-armv8.o: In function `SHA256_Compress_Native':
> -sha256-armv8.c:(.text.SHA256_Compress_Native+0x0): multiple definition of `SHA256_Compress_Native'
> -Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o:sha512.c:(.text.SHA256_Compress_Native+0x0): first defined here
> -Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha256-armv8.o: In function `SHA256_Update_Native':
> -sha256-armv8.c:(.text.SHA256_Update_Native+0x0): multiple definition of `SHA256_Update_Native'
> -Linux2.6_aarch64_aarch64_be-linux-gnu-gcc_glibc_PTH_64_DBG.OBJ/Linux_SINGLE_SHLIB/sha512.o:sha512.c:(.text.SHA256_Update_Native+0x0): first defined here
> -
> -Revert this change as it seems completely unrelated to the commit title
> -"Bug 1655493 - Support SHA2 HW acceleration using Intel SHA Extension"
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/237aba0c16a34fec1b0fe50fe08cace438eda1bf
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - nss/lib/freebl/sha512.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/nss/lib/freebl/sha512.c b/nss/lib/freebl/sha512.c
> -index 946ab9f7f..3ec414b52 100644
> ---- a/nss/lib/freebl/sha512.c
> -+++ b/nss/lib/freebl/sha512.c
> -@@ -164,7 +164,7 @@ static void SHA256_Compress_Generic(SHA256Context *ctx);
> - static void SHA256_Update_Generic(SHA256Context *ctx, const unsigned char *input,
> -                                   unsigned int inputLen);
> -
> --#if !defined(USE_HW_SHA2) || !defined(IS_LITTLE_ENDIAN)
> -+#if !defined(USE_HW_SHA2)
> - void
> - SHA256_Compress_Native(SHA256Context *ctx)
> - {
> ---
> -2.30.2
> -
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 8073913e7c..afb6d5602e 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_69_1_RTM/src/SHA256SUMS
> -sha256  bbdbd248c25e2faf498edbdd2ffd5896b54cfa35bd2e450813b491f805c754e0  nss-3.69.1.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_70_RTM/src/SHA256SUMS
> +sha256  2b89abb8601ee405be8ac5b5703d71f1fb38a51c3a64a3d834387f78b325511b  nss-3.70.tar.gz
>   # Locally calculated
>   sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 83954cc124..3f8f0e1789 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNSS_VERSION = 3.69.1
> +LIBNSS_VERSION = 3.70
>   LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>   LIBNSS_DISTDIR = dist
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
