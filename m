Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDDDC624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A34EC60681;
	Fri,  4 Sep 2026 12:17:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bRJ1DIoPFJeh; Fri,  4 Sep 2026 12:17:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 868AE6083C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524252;
	b=WrwVJSEv70wQELtN+ihCqZIfD8MEppjUkNf85kTw4Gx19xRFFlsW+rS28mxJsj98tVuI
	 MgFoH2o5cUdlBjnykek4KdOaTNW3SLKaTSABGyt+Jv7fv4FE6OIlLg85aWEIThUvfGdiH
	 pYlEycarIefBpCe6tTOJveY9Mrge+Er3ipX9n3Tvl2eSITmAFXwIAJjIEYhPxOdQEOio7
	 ja5bGpT4OyrtlMPmDqKrCQwUZZcYKr2dW5XosFQM0MsAS+9mCV+m88cAjOZ1UCVvqXz4+
	 s1gEwiWfu7w12UBY2Nu74cbbNOsFvnkoKiV3GfztBB9PHfCCBmfu3WQ3bq3ckyPTOZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524252;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vTCsXLRAteTWfXhKwr2qNAQPwMmK5hGQLD1cm7BfjMc=;
	b=d+ibNnDs1AtZ8lY+cSWGdPlaSuLxI14T25q0acfjtFTzKqCP+4Nd5Oel4TI3ucFT+Ze9
	 F5MI+bQCgWEuuwZ2LJ4bubeuqNllZrl7wLJTioy4ao6udQAugKUfYcUDk68uYQU3xej8q
	 A+tPEHwBucZH8/+nGE+p3bB4ttl63MGbOOXa/jbNx3H3YV+j7rOXqEc9TjWQTloAJv+NS
	 C3cacMbF4jW9lUkZUmRt4g4KTyPdA64tDS1tJ2h27/g3ltt3MmjodhW7cX9fyX67exKvL
	 rdqoinqct29Q3/YeNMwe0uHDBycJbR3VRsWyXEPx3RfFWN2AFa7M9rWzHm9sKHPpX1w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524252;
	bh=vTCsXLRAteTWfXhKwr2qNAQPwMmK5hGQLD1cm7BfjMc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Iw9OiPKWnx8Bjfn/WkaehhBdE5Yvs2IGQJxHx/ivoBPsJHamyNxyfF6wM7dabnCa1
	 dYdngoL1N9GQnAXKVeZsESGt4jf2IjTxN1xvnRDmxhn9muxf2QCmxGHeRsdwMMZr/X
	 lu0LKYHgQGfGwm6cYVLVTNAOitPEloTmvZANCVqWFHY3yVYy120UhzCZh9MtbpFs3j
	 XjeRZEmx8HLh0X/Zp4qy0xbqSHPsHoyPMsQKCnUaKJcVApr+mK4B2JTl2if8LlF3b6
	 Ag317Pj7MrWjkj/TTmQwgf37tgE1PxDO8fcBGvWIGIP9FqCYKWXyH0EI3qSt6E2n5q
	 d/i+vcpSiq4vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 868AE6083C;
	Fri,  4 Sep 2026 12:17:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 08B1D10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2F7981174
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39aVCJFf7D33 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A119981172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524250;
 b=loVi6t7m+j5Ub2XhDG1zRUjL5IhN30y3ocGGc46a819Ak8/rqjI8w2h+lAjU3cu4OMRb
 VzkDFMwUjp6V6DlEG3Yc1hoMXNIMKK2aVE8NjsAUkC/ow3qBWzN2FCx3ndvRquZQuaQ8v
 VNbw77lo7o1Zb3K2FZyHB2wI9d4VWAJgY4c9x7JCnihW78OoiWgjk1v73LmugOtXmIvnd
 cNE8hUXdzFL8Nu9GGdv1RBj8z6b0Z2i3mB11ehRyDenotQLRJe/vPwKoOOpPx0ahOYY+G
 syqCzRuRswRe1AV3lYwg/4K33YhyiUrSaQRurgA5d3PcfNlnk1rQ0rR6RsVmlWWISRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524250;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=0CyroHhhEbzy4W5SjV+KcttJVRjRffUGa65auN4LezM=;
 b=fwcf1efvUewxWaAczzOXoKoIBEKEzcYaGaFhAiPeudlYUzTiYQYCCGMVo9AmZ0VpFc7N
 v+WOCnG6WzEwkuZN1tUIPP6+3+78JqxWH/jyLN/gzMfl0p+htkBNTakHS1IiFQgKueeO7
 9DgurIADgTbZH5iMfJZy2lDkCamKcUs4bgl2NKNj0Q8T5mz/3Zfssh6cx9Gt8gw+EYZpt
 E7RO9J9gi1KIaqRh3ib9AfhJ1acKCro5bvFAjq+wLvtV/Pb89lmNpmqAAN7XARryhjRst
 4EmPr1ZLTeo9bpqTRATK2PRU4ObSmpSduD1YvX3TOcjBPlsFn7BDcOoddVRp0xdIefQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Mb1wADGm; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A119981172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:28 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4843f205a5bso621501f8f.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524247; x=1789129047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0CyroHhhEbzy4W5SjV+KcttJVRjRffUGa65auN4LezM=;
 b=F8y3GgJl7h5gB7M+S7dJ1ZbwIhwK9ax/byAERPpsKXAyErsNkjevco6f8zZoI3GB62
 emDVIhs1pu85NVu/TbJD+dW3V13fhXx3bEePocOYjVRe2OL4eF7f0cgzSVOCfBx9IJK8
 kyJzWKuY1pBoMS5LQLn0J7DS6nWJdRWs2kYVswzIAos6NfZ5QDi3oo7lZj6mZCZTPlOG
 j/GJT5zumkcJYuIiDCi9PypZe2fcjbIj1gZkUJ2IoFUo6JBkN5GtrkpKVscLuIt9YpO4
 k/fT+Pa5V9EOOB2YVcIDz9+3pf23g+pridEHFbO1sPct7mvjh/9ufwElvLmPlzUUdNi0
 26gg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzi9xAvcyd10HRbueZWR8mN2h/PdM84hAM4b7kNnK63AFUjM6IpVjvhID4E7p50vzi8yNf/3YoLZEk=@buildroot.org
X-Gm-Message-State: AFuF++kRNBdigwRnRS62N/ImZadwTNZ6dEIMqlSyo6HabsvPKAv+vfuj
 Hu8EiD3uhI9cP5lcT42cFuF2c7/qnCM3GMnsCqk/9RuklEnjf9ODBiaPnJZHCE6nxH/sqJba06t
 PFMNC
X-Gm-Gg: AYBFou2ZhSlkK5wFua4N1iZjZO6VosUsDgEcGgwpNjol/LIU2HKvU05I5HCInIv25BA
 tW+b3MmmZm9+EmUw1fhBNatdEPG0DCpVMRfeswdgwlX4bdkGffONsPoscLQib/nS0ryUr1OX4bL
 M0Ua32bpWHGXxZVTtDEivkNG1WewEBd6jolwktiqTbywKisocbXO9og8UiocUjUD0QxvkY92piE
 4YlsQgX+T2wlKaik0fEee24yVDgLS+ItqslHkfAwzmwfCtZ3mCLgHOKdrSfA8+zMOcbHdqgyAaU
 +MQH4G//AKNDvBcaeVW0KqIHyXsGisKIl4c/KKSc/AmosY/2jYrgMnes6jKJVDddX93pmi4kRpJ
 mPBHbRyEpft9m+0zug+G3gUJOszwhSzM97c0N1iWf7AJ6/RwznXjOQedb/5i6hcfbfrOO0NHafd
 ujaL9YW5bRqHBq0I/oUQL+KIgZBS8SDcZTKrmjxk6F12oCQfL1Ga6I+w==
X-Received: by 2002:a05:6000:26d3:b0:482:fe64:1717 with SMTP id
 ffacd0b85a97d-48587097606mr6931374f8f.7.1788524246690; 
 Fri, 04 Sep 2026 05:17:26 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883acd33sm5915161f8f.18.2026.09.04.05.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:26 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:25 +0200
Message-ID: <20260904121726.403636-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726212249.155140-2-bernd@kuhls.net>
References: <20260726212249.155140-2-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] package/jpeg-turbo: fix libm linking
 issue
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
> Buildroot commit bb38f6f7208497cf5a4df922e833492001170111 bumped the
> package to 3.2.0. This version first included upstream commit
> https://github.com/libjpeg-turbo/libjpeg-turbo/commit/ed00e0f4b39291e954958b96a8d941ca4a9e03a2
> which removed the dependency to libm causing build errors detected by
> the autobuilders.
> 
> Disabling the build of tests by the previous patch of this series is not
> enough because the build will fail on other tools like
> 
> [ 98%] Linking C executable djpeg-static
> /home/bernd/buildroot/output/per-package/jpeg-turbo/host/bin/../lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
>  src/spng/CMakeFiles/spng-static.dir/spng.c.o: in function
>  `spng_decode_image':
> spng.c:(.text+0x4c62): undefined reference to `__fpclassifyf'
> 
> Add upstream commit to fix the problem.
> 
> Fixes:
> https://autobuild.buildroot.net/results/981/98114d4ea7afe62bb4cef934a06bf289d863ad3f/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> v2: add upstream commit instead of -lm
> 
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/42f55ce3d2bd3c15b6e8f865676bc17899cbe79c
> 
>  ...-Really-remove-gamma-correction-code.patch | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch
> 
> diff --git a/package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch b/package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch
> new file mode 100644
> index 0000000000..594e28f65c
> --- /dev/null
> +++ b/package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch
> @@ -0,0 +1,113 @@
> +From 0da22762971551462cfad8f0b11cfb037472a4e8 Mon Sep 17 00:00:00 2001
> +From: DRC <information@libjpeg-turbo.org>
> +Date: Thu, 16 Jul 2026 12:09:54 -0400
> +Subject: [PATCH] libspng: Really remove gamma correction code
> +
> +We really don't use it, and fpclassify() apparently introduces yet
> +another libm dependency in some cases (although I can't reproduce that.)
> +
> +Fixes #904
> +
> +Upstream: https://github.com/libjpeg-turbo/libjpeg-turbo/commit/0da22762971551462cfad8f0b11cfb037472a4e8
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/spng/spng.c | 20 ++++++++++++++++++--
> + 1 file changed, 18 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/spng/spng.c b/src/spng/spng.c
> +index 06249d68..aeadb67e 100644
> +--- a/src/spng/spng.c
> ++++ b/src/spng/spng.c
> +@@ -353,9 +353,12 @@ struct spng_ctx
> +     int widest_pass;
> +     int last_pass; /* last non-empty pass */
> + 
> ++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
> ++         introduces an unwanted libm dependency */
> +     uint16_t *gamma_lut; /* points to either _lut8 or _lut16 */
> +     uint16_t *gamma_lut16;
> +     uint16_t gamma_lut8[256];
> ++#endif
> +     unsigned char trns_px[8];
> +     union spng__decode_plte decode_plte;
> +     struct spng_sbit decode_sb;
> +@@ -1742,6 +1745,8 @@ static uint16_t sample_to_target(uint16_t sample, unsigned bit_depth, unsigned s
> +     return sample;
> + }
> + 
> ++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
> ++         introduces an unwanted libm dependency */
> + static inline void gamma_correct_row(unsigned char *row, uint32_t pixels, int fmt, const uint16_t *gamma_lut)
> + {
> +     uint32_t i;
> +@@ -1785,6 +1790,7 @@ static inline void gamma_correct_row(unsigned char *row, uint32_t pixels, int fm
> +         }
> +     }
> + }
> ++#endif
> + 
> + /* Apply transparency to output row */
> + static inline void trns_row(unsigned char *row,
> +@@ -3302,7 +3308,10 @@ int spng_decode_scanline(spng_ctx *ctx, void *out, size_t len)
> +     const struct spng_subimage *sub = ctx->subimage;
> + 
> +     const struct spng_ihdr *ihdr = &ctx->ihdr;
> ++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
> ++         introduces an unwanted libm dependency */
> +     const uint16_t *gamma_lut = ctx->gamma_lut;
> ++#endif
> +     unsigned char *trns_px = ctx->trns_px;
> +     const struct spng_sbit *sb = &ctx->decode_sb;
> +     const struct spng_plte_entry *plte = ctx->decode_plte.rgba;
> +@@ -3529,7 +3538,10 @@ int spng_decode_scanline(spng_ctx *ctx, void *out, size_t len)
> + 
> +     if(f.do_scaling) scale_row(out, width, fmt, processing_depth, sb);
> + 
> ++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
> ++         introduces an unwanted libm dependency */
> +     if(f.apply_gamma) gamma_correct_row(out, width, fmt, gamma_lut);
> ++#endif
> + 
> +     /* The previous scanline is always defiltered */
> +     void *t = ctx->prev_scanline;
> +@@ -3768,6 +3780,8 @@ int spng_decode_image(spng_ctx *ctx, void *out, size_t len, int fmt, int flags)
> + 
> +     /*if(f.same_layout && !flags && !f.interlaced) f.zerocopy = 1;*/
> + 
> ++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
> ++         introduces an unwanted libm dependency */
> +     uint16_t *gamma_lut = NULL;
> + 
> +     if(f.apply_gamma)
> +@@ -3807,15 +3821,14 @@ int spng_decode_image(spng_ctx *ctx, void *out, size_t len, int fmt, int flags)
> +         unsigned i;
> +         for(i=0; i < lut_entries; i++)
> +         {
> +-#if 0 /* libjpeg-turbo: Eliminate libm dependency */
> +             float c = pow((float)i / max, exponent) * max;
> +-#endif
> +             float c = 0.0f;
> +             if(c > max) c = max;
> + 
> +             gamma_lut[i] = (uint16_t)c;
> +         }
> +     }
> ++#endif
> + 
> +     struct spng_sbit *sb = &ctx->decode_sb;
> + 
> +@@ -5000,7 +5013,10 @@ void spng_ctx_free(spng_ctx *ctx)
> + 
> +     if(!ctx->user_owns_out_png) spng__free(ctx, ctx->out_png);
> + 
> ++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
> ++         introduces an unwanted libm dependency */
> +     spng__free(ctx, ctx->gamma_lut16);
> ++#endif
> + 
> +     spng__free(ctx, ctx->row_buf);
> +     spng__free(ctx, ctx->scanline_buf);
> +-- 
> +2.47.3
> +
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
