Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63FEEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4D7D40820;
	Fri, 13 Feb 2026 19:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iv5wtg31yQ9m; Fri, 13 Feb 2026 19:40:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A910F4229B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011619;
	bh=xXNRxCC4ean5lTGQ2WRJA2fdiFRXYnmb3O9WNxx+Aqk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Aooz4Te2YUt3wnzH5kqhXySx6v6qHuZlUuoC11q+uLXS5NVVnOMMOJL3aOAczmGBD
	 wkQgBgxYpzepJcdJ4oyXngSA9jWd3Rs3zX9uM81ihr6ntgkTEOeEBH6bDc45EEiIx0
	 DHVFUT5BWrwj6bgB3V9V/RY9Pciw7SuIxBeeRs+1R3azPuO4Z1PbAWNUZd1IDmD1z3
	 nACOsBpqHVsfwgo7kGl1WD9OurL3P28nCWI2cSoXVRTVR0kNxbYC1GPo/yerbHobj/
	 LsP2TbtcqOJk4plivfbdrgrEwru4P+I2kAsMlhOyoxHt/6orC30TmRNxLcgt3F7klN
	 u/987D8ThfDOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A910F4229B;
	Fri, 13 Feb 2026 19:40:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B80EEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 688ED41298
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJI7gLW_627S for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2E10B4129A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E10B4129A
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E10B4129A
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:44 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4375d4fb4d4so1022014f8f.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011462; x=1771616262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JblJOL5rxwWygdFVCP3K2kb5zTmFBc6XqPjMaGgABxo=;
 b=nrrwn3bN2ZnwU2MHXEDdSTXwXnWJzAUTlu76orl58uNKoBgIzL+AVPv/7T87X4klN7
 i6IVuNHfIu2ktDtf0Kh+yCayawJYSZdyHtyP8XaJ+M4ZU4p7blHZdHfuksp8ql5qdmJV
 YT+VlVL3TqSn025DH5vaJrnPf6iSnkNywq+j6k3zx37oJttkp3QnOhnlVN5KUXnXqYnY
 w5HN5/bPrHGiGdCoNr7/FoC/XcD8ftgjrlEHCbuddRngVp+wcFyLYEssqTS9t7shhwPd
 H3tY7yVXbtlZZ/fqS3Qx0FSRZAylhpjZPb07IXfMnbXac/MNIbgJ0ZmHVsqYH5udtHzE
 LfqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWUiaxmg20IkPUcQ74QfeAKqFRphCKRtg8hPEeCvcHVr59pB/Obq1QBQ7DH+cdLN15DXRTStOlRI0=@buildroot.org
X-Gm-Message-State: AOJu0Yx/xlXTXTfV9aVhLmBevNhX+68u7BUAVY9bq31UO2QlaQW+s7D1
 huW32IA/edOsuhytSxseNCTJnNTNW6cgWyLPKgNsp3ToPvPGFBPoUQHDfuyAgLviqOs=
X-Gm-Gg: AZuq6aJm6qCB9pXnuiAdQOjTj99MUuAImsTLvtnZJAKLemzBVkJfSP5w+XASvwWe1Mt
 lfc26RD+xazgrLemaqLC50cokHtS3614SE70l7y+F35am8fc25+So0YFuuZbY33dhH9JBKVbJNI
 Bvww6nTkluQB2tp1C/MmeL3eDHx7TqP4biJIsysOiHpvZtWbEJCbiWlL7T7eXN6gxuXpnq9/509
 a+isBsrxKFswih/TpdGKlZ1ceOP22YCVE7DdeFU9NQ8XV1jBsjumSxUW1j4DTb5/3yZjLy0Z06d
 WpDUAaQiTT8plczMHSpaQ8dTlzcRw2JM8sla/oB4oJUHJQiTT2OeRvSAMdx6WKBXsP3YarBCwBB
 FOsro7IZvLOEOPj3Y46nXL2qhWYhmaHKMFVkiOTFcWYjFiB+R7fKYpExLmhBo9FUVh5VmCMWbPA
 87o1M6O6cFoxELL6w=
X-Received: by 2002:a05:6000:1447:b0:437:7168:af37 with SMTP id
 ffacd0b85a97d-4379791855fmr6395709f8f.42.1771011462048; 
 Fri, 13 Feb 2026 11:37:42 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8209sm7988037f8f.30.2026.02.13.11.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:41 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:41 +0100
Message-ID: <20260213193741.40356-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260110133905.2518546-1-bernd@kuhls.net>
References: <20260110133905.2518546-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011462; x=1771616262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JblJOL5rxwWygdFVCP3K2kb5zTmFBc6XqPjMaGgABxo=;
 b=a4U9RgWAtKPHQc+CSP9Be4h4NjjiL0sYTusEOt1XYn2PFsT31M5QtZjoafcfms+PwV
 eHvT5vEsMLxxJOvFS2jjsYIHZ8a8jE4lc+JXQjz3AjK+yO4zeUn8cRIaW7LYnPPq4xzJ
 2viM3zsj0ys+EUChqqBmbWaeD0KusZqSc17KDyvPEothUQzfFMmFdl5ek4MQpReFVQ7q
 v92QDszWJxMiIf1ZDneuRZlOazZv7UOyQuhYWE8nDss01V26jO4zawAJVzD3TwgWW3X6
 WVXUGpECngdGQ0jsBJhPqxyyN12BX09HVOdWsbfkJoHyoMH+zxwb//JX/Fortdh7OI6U
 pDEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=a4U9RgWA
Subject: Re: [Buildroot] [PATCH 1/2] package/safeclib: fix build with
 gcc-14.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Backported two upstream patches to fix build errors introduced by the
> bump of gcc to 14.x.
> 
> Renamed patch 0001 to prepare its removal with the upcoming version bump
> of safelib, added Upstream: tag.
> 
> Fixes:
> https://autobuild.buildroot.net/results/af6/af65e6386439098ddf706ca43e99320cf5e9fd80/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  .checkpackageignore                           |  1 -
>  ...snprintf_s-Increase-Buffer-Size-by-1.patch | 51 +++++++++++++++++++
>  ...snprintf_s-Increase-Buffer-Size-by-1.patch | 49 ++++++++++++++++++
>  ...3-fix-armv7-asm-inline-error-GH-115.patch} |  4 +-
>  4 files changed, 102 insertions(+), 3 deletions(-)
>  create mode 100644 package/safeclib/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
>  create mode 100644 package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch
>  rename package/safeclib/{0001-fix-armv7-asm-inline-error-GH-115.patch => 0003-fix-armv7-asm-inline-error-GH-115.patch} (98%)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index ad02938884..2502803da3 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -873,7 +873,6 @@ package/rubix/0001-dont-use-legacy-functions.patch lib_patch.Upstream
>  package/rubix/0002-misc-fixes.patch lib_patch.Sob lib_patch.Upstream
>  package/rygel/S99rygel Shellcheck lib_sysv.Indent lib_sysv.Variables
>  package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch lib_patch.Upstream
> -package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch lib_patch.Upstream
>  package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch lib_patch.Upstream
>  package/samba4/0002-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch lib_patch.Upstream
>  package/samba4/S91smb Shellcheck lib_sysv.Indent lib_sysv.Variables
> diff --git a/package/safeclib/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch b/package/safeclib/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
> new file mode 100644
> index 0000000000..eae11dcc0d
> --- /dev/null
> +++ b/package/safeclib/0001-vsnprintf_s-Increase-Buffer-Size-by-1.patch
> @@ -0,0 +1,51 @@
> +From 62051f9761f92dc99c8ce0552239ad10e2062168 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sat, 10 Jan 2026 12:16:22 +0100
> +Subject: [PATCH] vsnprintf_s: Increase Buffer Size by 1
> +
> +Another fix similar to https://github.com/rurban/safeclib/commit/f59a0c8c1b5cf19cd0ed7f9bfb3a1e85f54113d0
> +
> +In function 'safec_ntoa_format',
> +    inlined from 'safec_ntoa_long' at str/vsnprintf_s.c:331:12:
> +str/vsnprintf_s.c:256:24: error: writing 32 bytes into a region of size 0 [-Werror=stringop-overflow=]
> +  256 |             buf[len++] = '0';
> +      |             ~~~~~~~~~~~^~~~~
> +str/vsnprintf_s.c: In function 'safec_ntoa_long':
> +str/vsnprintf_s.c:312:10: note: at offset 32 into destination object 'buf' of size 32
> +  312 |     char buf[PRINTF_NTOA_BUFFER_SIZE];
> +      |          ^~~
> +In function 'safec_ntoa_format',
> +    inlined from 'safec_ntoa_long' at str/vsnprintf_s.c:331:12:
> +str/vsnprintf_s.c:260:24: error: writing 32 bytes into a region of size 0 [-Werror=stringop-overflow=]
> +  260 |             buf[len++] = '0';
> +      |             ~~~~~~~~~~~^~~~~
> +str/vsnprintf_s.c: In function 'safec_ntoa_long':
> +str/vsnprintf_s.c:312:10: note: at offset 32 into destination object 'buf' of size 32
> +  312 |     char buf[PRINTF_NTOA_BUFFER_SIZE];
> +      |          ^~~
> +cc1: all warnings being treated as errors
> +
> +Upstream: https://github.com/rurban/safeclib/pull/150
> +
> +[backported to version 3.7.1]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/str/vsnprintf_s.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/str/vsnprintf_s.c b/src/str/vsnprintf_s.c
> +index 59dbda94..ca838df1 100644
> +--- a/src/str/vsnprintf_s.c
> ++++ b/src/str/vsnprintf_s.c
> +@@ -296,7 +296,7 @@ static size_t safec_ntoa_long(out_fct_type out,  const char *funcname,
> +                               unsigned long base, unsigned int prec,
> +                               unsigned int width, unsigned int flags)
> + {
> +-    char buf[PRINTF_NTOA_BUFFER_SIZE];
> ++    char buf[PRINTF_NTOA_BUFFER_SIZE + 1];
> +     size_t len = 0U;
> + 
> +     // no hash for 0 values
> +-- 
> +2.47.3
> +
> diff --git a/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch b/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch
> new file mode 100644
> index 0000000000..2dabebf3b2
> --- /dev/null
> +++ b/package/safeclib/0002-vsnprintf_s-Increase-Buffer-Size-by-1.patch
> @@ -0,0 +1,49 @@
> +From dea3c2e1aa1b775baa690b9ef40239f881c5f068 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 13 Aug 2025 20:23:48 -0700
> +Subject: [PATCH] vsnprintf_s: Increase Buffer Size by 1
> +
> +It is a buffer overflow warning that GCC 15.2 is catching.
> +The issue is that it's trying to write to `buf[len++]` when len could
> +potentially be 31, which would write to buf[31] in a buffer of size 32
> +(valid indices 0-31), but the len++ post-increment means it could
> +theoretically write beyond the buffer bounds.
> +
> +Fixes
> +
> +../../sources/safec-3.9.1/src/str/vsnprintf_s.c: In function 'safec_ftoa.isra':
> +../../sources/safec-3.9.1/src/str/vsnprintf_s.c:523:24: error: writing 32 bytes into a region of size 31 [-Werror=stringop-overflow=]
> +  523 |             buf[len++] = '0';
> +      |             ~~~~~~~~~~~^~~~~
> +../../sources/safec-3.9.1/src/str/vsnprintf_s.c:394:10: note: at offset [1, 32] into destination object 'buf' of size 32
> +  394 |     char buf[PRINTF_FTOA_BUFFER_SIZE];
> +      |          ^~~
> +cc1: all warnings being treated as errors
> +
> +Upstream-Status: Submitted [https://github.com/rurban/safeclib/pull/148]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream: https://github.com/rurban/safeclib/commit/f59a0c8c1b5cf19cd0ed7f9bfb3a1e85f54113d0
> +
> +[backported to version 3.7.1]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/str/vsnprintf_s.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/str/vsnprintf_s.c b/src/str/vsnprintf_s.c
> +index ca838df1..8ef6989a 100644
> +--- a/src/str/vsnprintf_s.c
> ++++ b/src/str/vsnprintf_s.c
> +@@ -369,7 +369,7 @@ static size_t safec_ftoa(out_fct_type out,  const char *funcname,
> +                          double value, unsigned int prec, unsigned int width,
> +                          unsigned int flags)
> + {
> +-    char buf[PRINTF_FTOA_BUFFER_SIZE];
> ++    char buf[PRINTF_FTOA_BUFFER_SIZE + 1];
> +     size_t len = 0U;
> +     double tmp;
> +     double diff = 0.0;
> +-- 
> +2.47.3
> +
> diff --git a/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch b/package/safeclib/0003-fix-armv7-asm-inline-error-GH-115.patch
> similarity index 98%
> rename from package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch
> rename to package/safeclib/0003-fix-armv7-asm-inline-error-GH-115.patch
> index 3cb37b96f5..bf14812318 100644
> --- a/package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch
> +++ b/package/safeclib/0003-fix-armv7-asm-inline-error-GH-115.patch
> @@ -7,8 +7,8 @@ some armv7 buildroot variants fail on asm.
>  we already probe for that, so use it.
>  Fixes GH #115
>  
> -[Retrieved from:
> -https://github.com/rurban/safeclib/commit/9c739800a8915d5f2a73c840190920e95ffa1c5c]
> +Upstream: https://github.com/rurban/safeclib/commit/9c739800a8915d5f2a73c840190920e95ffa1c5c
> +
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  ---
>   tests/perf_private.h | 49 +++++++++++++++++++++++++-------------------
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
