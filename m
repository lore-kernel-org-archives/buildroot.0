Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DF0FED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52A8284E2B;
	Fri, 24 Apr 2026 16:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9Md7ISUhzdn; Fri, 24 Apr 2026 16:26:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 612CB84DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048002;
	bh=zxiJgOIS4gFq8VimHj9dS4wAPDttOAtgxaLMV2+r5DY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=To4hxu6xYwTyi/W+aAADpklFefQXyOAn63/NpYVv066jZJTjykhtwTPYwK4ahX7o+
	 OcIenpNx59EbfE6Ln2s3db8NF6+j0DbEg4Oei9WG8iyqHAQNwYX51IWJ5QgotpKXTT
	 aHm+zFvoaHVl/Ty4tY23vKk8CeA2Qm21wK6Ayck/ZEBd6i9/sHYNYxADc+KUUEf4I6
	 Q1BbvfFsw/H9CGlhUYNL5oyYoT89oxYtcZfY/6oygLDWtCJKJhVUteRwbvO5PzoiEw
	 VukUiNwHQ9HU65RQopNyaYnu9GaBh9xvNktGn0OQk6OKJ6XNo3o+G0c7AnYxmPudyl
	 uL+jTf8g5nLXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 612CB84DF2;
	Fri, 24 Apr 2026 16:26:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB62A206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF2B861C30
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTKMsa0URSqE for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:26:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8769261C31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8769261C31
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8769261C31
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:38 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so131933555e9.2
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777047996; x=1777652796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=utseyyrjyY/FDc8ogDl+1dC0UiCqnl8SdsKBYIVo6pM=;
 b=oFnYA7+zVHV0YhRCordyP7Ef6uxOm0KrwB3MHKB5EIjJvN2IJHpHfejEVKlCouakC/
 CJyMjMGJlk9/sdBJ6foq8ahSt2KToU4PL4gSn53tXkaoQDAAXCMK+y3iBfAawWa468+k
 +IDwIrSuz/kmTOKDsmLBwK0dzHpn8gmux+fQ9EW/Nr4EsWGzxiaTbzamCj8YP5EjxKT+
 56YjjAZEdOrivQNOdtxDj5wQPUFQIAyIaFMQ7VsGbHD1NcxAYJQ1BD0Y0BAbWLIgLZFy
 mozQnpnIRxSfWCZNAAdVqDc9ndyA9aNks9lUUB+DjeU87QXZMyND9jEfMlri2wpNRS8x
 GB+A==
X-Gm-Message-State: AOJu0Yz31rXDtlzcKiFXQ2diolkf2RCRfFY4rOvoGsgIW+5PeV2A2wTy
 UDQnH6zBvDB1myf518fEiIDvE3vukYEJqSTeKWjzBb1S3LykEVkkT0HZYthHYoRO/JU=
X-Gm-Gg: AeBDiesIyFlPQBrP6HGp0nZ7DreS06tImj3OlH3qUVG4JJSngj8RQNuh3iOGjNdmvDe
 JglCQtWaRCtZDaTqbNwdNOitXFZZlqBWbippgIURDgj6Z9gY9Btj8tlZN3LU1gC4b/Rp7n6NWbd
 17/xED1XtIYhtEdzS/RpU2DH/1QqytFdjkc8FxVqZYKEW8r6F1QbPn3SCqFbfXoWf4ozVjuo59U
 bmQmJUw/gN3K0OOmunNXxB1lsQZ66uNuuj6ts1t2q9Z1yqI4KbqU1cPEu46XWRKHS7o3jE+7fA5
 C4FmKgaQ1kWApMb+WeYZmgWawC3bb36P12tOUNmqXZCFWqdXSEgji/9st5cOzOmLHE6Ml34Vx25
 PRsBzucU0awOioIjMVy9O7+ZGMLdIIiuLXuxYKoOMxrI7Sl0zrNn7gffwM7scmO1GQjrot0zHsb
 2ksztMVGAYQaV1fNVimCV5PPG8SQ==
X-Received: by 2002:a05:600c:4e4f:b0:488:a2ac:a34c with SMTP id
 5b1f17b1804b1-488fb7433ddmr454471375e9.12.1777047996274; 
 Fri, 24 Apr 2026 09:26:36 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb74c68asm188887995e9.3.2026.04.24.09.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:26:35 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:26:35 +0200
Message-ID: <20260424162635.160815-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260417131129.220250-1-thomas.perale@mind.be>
References: <20260417131129.220250-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777047996; x=1777652796; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=utseyyrjyY/FDc8ogDl+1dC0UiCqnl8SdsKBYIVo6pM=;
 b=hBxUG/vGK/ww0CaY79knMKoTqwtTBZsCTjB/E/5q17YZ3OQZRFqlXZzO69TtjYzAiM
 SGcWNCz85khJTjupuRi2aHv2LtMIcEVPxk9aZ6T226Tb9DHunfCLvM3Tsrdxk7yomtkX
 bSJ7sV805lF2bnaR5WE9vnYYCCP0p8VgKP7IvNATBacDnM0UCc2KQhVjtzrYSFyc7S6+
 acTOAq5t37neSxJsOoGqlPD+O10DfR1S82xWplm3/QhleS8NMx9gmrpq2LEXixCwQjLf
 Zn0sHk2LuIkMgq0pKQFC8Pw9HsqBvv/GuhbpZtpvsDTBhZtJFiDnLLYTqb1eiN8jCzN8
 OkAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hBxUG/vG
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/freetype: patch
 CVE-2026-23865
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
> Fixes the following security vulnerability:
> 
> - CVE-2026-23865:
>     An integer overflow in the tt_var_load_item_variation_store function
>     of the Freetype library in versions 2.13.2 and 2.13.3 may allow for an
>     out of bounds read operation when parsing HVAR/VVAR/MVAR tables in
>     OpenType variable fonts. This issue is fixed in version 2.14.2.
> 
> For more information, see
>   - https://www.cve.org/CVERecord?id=CVE-2026-23865
>   - https://gitlab.freedesktop.org/freetype/freetype/-/commit/fc85a255849229c024c8e65f536fe1875d84841c.patch
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...r-overflow-in-array-size-computation.patch | 54 +++++++++++++++++++
>  package/freetype/freetype.mk                  |  3 ++
>  2 files changed, 57 insertions(+)
>  create mode 100644 package/freetype/0001-Check-for-overflow-in-array-size-computation.patch
> 
> diff --git a/package/freetype/0001-Check-for-overflow-in-array-size-computation.patch b/package/freetype/0001-Check-for-overflow-in-array-size-computation.patch
> new file mode 100644
> index 0000000000..6951880854
> --- /dev/null
> +++ b/package/freetype/0001-Check-for-overflow-in-array-size-computation.patch
> @@ -0,0 +1,54 @@
> +From fc85a255849229c024c8e65f536fe1875d84841c Mon Sep 17 00:00:00 2001
> +From: Werner Lemberg <wl@gnu.org>
> +Date: Sat, 3 Jan 2026 08:07:57 +0100
> +Subject: [PATCH] [ttgxvar] Check for overflow in array size computation.
> +
> +Problem reported and analyzed by povcfe <povcfe2sec@gmail.com>.
> +
> +Fixes issue #1382.
> +
> +* src/truetype/ttgxvar.c (tt_var_load_item_variation_store): Do it.
> +
> +CVE: CVE-2026-23865
> +Upstream: https://gitlab.freedesktop.org/freetype/freetype/-/commit/fc85a255849229c024c8e65f536fe1875d84841c.patch
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/truetype/ttgxvar.c | 15 ++++++++++++++-
> + 1 file changed, 14 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/truetype/ttgxvar.c b/src/truetype/ttgxvar.c
> +index 2ff40c9e8..96ddc04c8 100644
> +--- a/src/truetype/ttgxvar.c
> ++++ b/src/truetype/ttgxvar.c
> +@@ -609,6 +609,7 @@
> +       FT_UShort  word_delta_count;
> +       FT_UInt    region_idx_count;
> +       FT_UInt    per_region_size;
> ++      FT_UInt    delta_set_size;
> + 
> + 
> +       if ( FT_STREAM_SEEK( offset + dataOffsetArray[i] ) )
> +@@ -666,7 +667,19 @@
> +       if ( long_words )
> +         per_region_size *= 2;
> + 
> +-      if ( FT_NEW_ARRAY( varData->deltaSet, per_region_size * item_count ) )
> ++      /* Check for overflow (we actually test whether the     */
> ++      /* multiplication of two unsigned values wraps around). */
> ++      delta_set_size = per_region_size * item_count;
> ++      if ( per_region_size                                &&
> ++           delta_set_size / per_region_size != item_count )
> ++      {
> ++        FT_TRACE2(( "tt_var_load_item_variation_store:"
> ++                    " bad delta set array size\n" ));
> ++        error = FT_THROW( Array_Too_Large );
> ++        goto Exit;
> ++      }
> ++
> ++      if ( FT_NEW_ARRAY( varData->deltaSet, delta_set_size ) )
> +         goto Exit;
> +       if ( FT_Stream_Read( stream,
> +                            varData->deltaSet,
> +-- 
> +GitLab
> +
> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
> index ad8cd00ec8..51b0471d4f 100644
> --- a/package/freetype/freetype.mk
> +++ b/package/freetype/freetype.mk
> @@ -15,6 +15,9 @@ FREETYPE_CPE_ID_VENDOR = freetype
>  FREETYPE_DEPENDENCIES = host-pkgconf
>  FREETYPE_CONFIG_SCRIPTS = freetype-config
>  
> +# 0001-Check-for-overflow-in-array-size-computation.patch
> +FREETYPE_IGNORE_CVES += CVE-2026-23865
> +
>  # harfbuzz already depends on freetype so disable harfbuzz in freetype to avoid
>  # a circular dependency
>  FREETYPE_CONF_OPTS = --without-harfbuzz
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
