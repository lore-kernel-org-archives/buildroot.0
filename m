Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56CAFED3F0
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80942429C5;
	Fri, 24 Apr 2026 16:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9XazU9LM3GP; Fri, 24 Apr 2026 16:27:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A1D5429C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048059;
	bh=4ZfKeanCRW6O+ZNn/8OnSo/mMcSJU5LmdJ+qnO/0OEw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y/z2l78d3Ydgd678LSKnVUlf4dMVeSkM3lQ5vywQ6DP9S9I38iQK87TCrDs8ykw14
	 rZI44lZZMqdUKo3kXmBORdAWDdZjW++OB9VQmyuHvuwVimiyJ+4O/Gcqy+ZMTFP6pW
	 4c1618sU5yrr1C3Zc4CXh4v3zAfM3+/3d31ufEB/nyZQtZoRRVbfaRkTNc681YS0CK
	 TnOfVvnO1YITz4RzWXuUikd+Zk0a2UcEz+JV+5Z7tVJq32gJfYIAFUGauDwC5yesFJ
	 cGmeKz+MSYtGK12Y/Q/bEkxAXN6HOVKgtH8V0iiJTzROj72NwHhmeoB1li96hfYopu
	 eHE2MybCw1z0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A1D5429C7;
	Fri, 24 Apr 2026 16:27:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41094206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D5A761C32
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUXrZO2pspGf for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 122F961C30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 122F961C30
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 122F961C30
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:29 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso110117745e9.3
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048048; x=1777652848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Wr2O8bNHza3N+4vFnAjlw3GxF0kZEaMrLzNhtqvcTnw=;
 b=fWkh2qy7gch/jlI6N/d27JBDMORMSfAXh9ywx7jo1GhTfTBpyq28ZeqWwlgSMbqpQE
 5jqEseQawjnuNuRR2WZSwHRiKdn54f6LV69uzNcIN/VFrdaTxpB2btlhd4FN+QR5U49z
 NejB7BKwTB7jFXWLDLwYAEQlkM72FPlwYb99b5PiHRIFRY6SDQ+vLsJgM//q+k3SdLrj
 QXDCh6LS6urNg0wOXvDivnZRpMZpB1+bjJeuzhTCME2yj3yiffgRN9t+jihU7nlIHZvO
 zMRAqDT/7VQCL/TDBCU0cQcXdhaw7/W8UCqU+/VG8F2DQJJejcOpb7eqUbQ7km9mCL4p
 3uPQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/mmw2f+VAeiHHhy703NTL8zL4lXQUfPPPdZHOmR3E1SACfHHKMA/5Q1WzcrUNmWAuJegkCJeFaK4I=@buildroot.org
X-Gm-Message-State: AOJu0YyJ2THLqQPMYcvZWsuijEFqoeC6WqxQubCCzTKfp/mWzgPsLPZz
 Cotr+rPCCmN9JgOun7I/TZeqcktkjyVguibtq3aVRR6PW7MxJS3TOwGKJEXA+Bey0L6mzi4OY3o
 bReWl
X-Gm-Gg: AeBDiesUxJuGYd7657SGjm83lwcOYDdhkYyBDDOxdQAsSP05wP8l6UV/quH5rn7R72t
 TSmyOL10MhW2TPxmcp+JuDDxOfvZoHAy1GLPX9tecMwyVa/jN1Kx9+gh2lg1/J4WXnbhgI4Oi9+
 oX3w7TTonaowVJbaGEBpBduOdt1hBY+PzvvbivjTnqnyXPLZG35VPUU/lMY8pe58zyvcatesjVw
 Gv4qGLuy66GVYirjKMxQbmr1txDH/DuGgNt/0QCrU+LwaSB+PP6KkbVQXVwK1Tm7pv32KBP/xaz
 fuRmuKsuzSSpHNy3FD5KNQapZD8OXVlaUtf6xwEtlwE915aAjCGEPNmAvEpFMhysrSLlC3Xyhp6
 UbA4pfJxtQS9g0P5cOYoK4x2osjw0S40Qb7iOsLPc9OdlTvakB3C24gyt3s3DEE2vTcaRA1sfRt
 k5mCn9G9E196u+LF4XqVKGVG22Vg==
X-Received: by 2002:a05:600c:a105:b0:485:3a03:ceca with SMTP id
 5b1f17b1804b1-488fb7826femr328147985e9.23.1777048048083; 
 Fri, 24 Apr 2026 09:27:28 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f8188sm636040695e9.2.2026.04.24.09.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:27 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:26 +0200
Message-ID: <20260424162726.162284-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260417105529.4147375-2-bernd@kuhls.net>
References: <20260417105529.4147375-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048048; x=1777652848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wr2O8bNHza3N+4vFnAjlw3GxF0kZEaMrLzNhtqvcTnw=;
 b=QgLlHusRR97qGCJG3ARVcgCNo1jBurenII5TFjeapTII1szaZgE8LfDS3+TTCBP0CG
 zlAaUVEaX6LUVW6AAEr8xyXT/1LNbm/KDmPWC+Vx8j2KR7o2h/1R9qSmSQ3bF9DlDUEF
 H09oO2uTHKNP3W1nslTkuTzVfABmV5Iwj/m9YAVrRqN07XIuliCfif/XKRn2iEfRpJXH
 fLyBrdNqTVGlVgmNaveddWNTwlTXSS78wFDBNMFrfF0wlsxwYeny62ES6R26YB+NOVJO
 /1IsSLwEIjjSUDmkd3yvgnTQ7AB6AfQb+LDCg3woB4YoIeu+io3wGGLXsPEACpi6Da49
 haYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QgLlHusR
Subject: Re: [Buildroot] [PATCH 2/2] package/ghostscript: security bump to
 version 10.07.0
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
> https://ghostscript.readthedocs.io/en/gs10.07.0/News.html
> "This release addresses CVEs: TBC (Two applied for)"
> 
> Removed patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  .../ghostscript/0001-Fix-32-bit-build.patch   | 63 -------------------
>  package/ghostscript/ghostscript.hash          |  4 +-
>  package/ghostscript/ghostscript.mk            |  2 +-
>  3 files changed, 3 insertions(+), 66 deletions(-)
>  delete mode 100644 package/ghostscript/0001-Fix-32-bit-build.patch
> 
> diff --git a/package/ghostscript/0001-Fix-32-bit-build.patch b/package/ghostscript/0001-Fix-32-bit-build.patch
> deleted file mode 100644
> index 648e235d3b..0000000000
> --- a/package/ghostscript/0001-Fix-32-bit-build.patch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -From 3c0be6e4fcffa63e4a5a1b0aec057cebc4d2562f Mon Sep 17 00:00:00 2001
> -From: Ken Sharp <Ken.Sharp@artifex.com>
> -Date: Wed, 10 Sep 2025 08:55:30 +0100
> -Subject: [PATCH] Fix 32-bit build
> -
> -Bug #708824 "ghostscript 10.06.0 compilation failure on 32-bit archs"
> -
> -nbytes shiouldn't be an intptr_t, it doesn't get used for pointer
> -arithmetic. Previously it was a uint, should be a int64_t, to fit with
> -all the other devices.
> -
> -Checked other warnings, and found a (very minor) one in gdevdbit.c, fix
> -that while we're here (signed/unsigned mismatch, we don't really care).
> -
> -Upstream: https://github.com/ArtifexSoftware/ghostpdl/commit/3c0be6e4fcffa63e4a5a1b0aec057cebc4d2562f
> -
> -Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ----
> - base/gdevdbit.c | 2 +-
> - base/gdevmpla.c | 6 +++---
> - 2 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/base/gdevdbit.c b/base/gdevdbit.c
> -index e07cc3f3b8..1b5c69325b 100644
> ---- a/base/gdevdbit.c
> -+++ b/base/gdevdbit.c
> -@@ -191,7 +191,7 @@ gx_default_copy_alpha_hl_color(gx_device * dev, const byte * data, int data_x,
> -     fit_copy(dev, data, data_x, raster, id, x, y, width, height);
> -     row_alpha = data;
> -     out_raster = bitmap_raster(width * (size_t)byte_depth);
> --    if (check_64bit_multiply(out_raster, ncomps, &product) != 0)
> -+    if (check_64bit_multiply(out_raster, ncomps, (int64_t *) &product) != 0)
> -         return gs_note_error(gs_error_undefinedresult);
> -     gb_buff = gs_alloc_bytes(mem, product, "copy_alpha_hl_color(gb_buff)");
> -     if (gb_buff == 0) {
> -diff --git a/base/gdevmpla.c b/base/gdevmpla.c
> -index 2f0d522561..ffc5ff42e6 100644
> ---- a/base/gdevmpla.c
> -+++ b/base/gdevmpla.c
> -@@ -1954,12 +1954,12 @@ mem_planar_strip_copy_rop2(gx_device * dev,
> -         int i;
> -         int j;
> -         intptr_t chunky_sraster;
> --        intptr_t nbytes;
> -+        int64_t nbytes;
> -         byte **line_ptrs;
> -         byte *sbuf, *buf;
> - 
> -         chunky_sraster = sraster * (intptr_t)mdev->num_planar_planes;
> --        if (check_64bit_multiply(height, chunky_sraster, (size_t *)&nbytes) != 0)
> -+        if (check_64bit_multiply(height, chunky_sraster, &nbytes) != 0)
> -             return gs_note_error(gs_error_undefinedresult);
> -         buf = gs_alloc_bytes(mdev->memory, nbytes, "mem_planar_strip_copy_rop(buf)");
> -         if (buf == NULL) {
> -@@ -2003,7 +2003,7 @@ mem_planar_strip_copy_rop2(gx_device * dev,
> -         intptr_t i;
> -         intptr_t chunky_t_raster;
> -         int chunky_t_height;
> --        intptr_t nbytes;
> -+        int64_t nbytes;
> -         byte **line_ptrs;
> -         byte *tbuf, *buf;
> -         gx_strip_bitmap newtex;
> diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
> index e50113ecfe..c2e48b01e6 100644
> --- a/package/ghostscript/ghostscript.hash
> +++ b/package/ghostscript/ghostscript.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10060/SHA512SUMS
> -sha512  e9efa6a334cf34703f565f5043dd794452270415b34c2bea260e9dac6c72ebbcbedfa2e4cb9029841f8f582bbce91be8160e135a190081f3262bcf04417f80f1  ghostscript-10.06.0.tar.xz
> +# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10070/SHA512SUMS
> +sha512  1c2a14951223c975a53bd9767c28bd3a6e420c385a5e0d7a60a5ff5b091bc027929c815bf57cddf97611e8d265ece1c219321737f2cabb5646685c6e8cdb85c9  ghostscript-10.07.0.tar.xz
>  
>  # Hash for license file:
>  sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
> diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
> index 1fc850ad20..159e06db91 100644
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GHOSTSCRIPT_VERSION = 10.06.0
> +GHOSTSCRIPT_VERSION = 10.07.0
>  GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
>  GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
>  GHOSTSCRIPT_LICENSE = AGPL-3.0
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
