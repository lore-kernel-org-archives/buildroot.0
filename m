Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397B7FCC068
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2759420AE;
	Fri,  6 Mar 2026 19:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqTwLzD2Qq4h; Fri,  6 Mar 2026 19:53:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9457F42118
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826807;
	bh=AlC2OsD4tB49jPxGjPGmN08gnSAqr9c6tDaLA/UO6HI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iNYnRh7RCbrl8tys4GIg4IPWldgsm2aqKSjGQnc8He/aY4sRBeCbdgTDu9jHbbGus
	 +SsvuD6raVrokstBesmOd4BivUU7c1LYS0i5lm5Tculc4OaB4uyMdXodzybIYsD4Uq
	 XcjqpXcbSB58wY/jcFUPII7OlCY1Y+7NQhcZYvd8Mc3m5EzoSm132ryBR5xAn5MeuH
	 ARW13NXgKcTYjSU4/1LoFq2GhcfOzclX1uyad+BMT0o/xNZynYM93bsi+cYVM4eTym
	 Kh651Yvmjn7R2lGG4vUNxoLl/65kDE5bWyOSTjIkN8oVusY448VuSfvo9rvnGlq8xN
	 Ou+QukBa7wHaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9457F42118;
	Fri,  6 Mar 2026 19:53:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03534169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F222641E5A
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAprc8wagvMW for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0487842085
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0487842085
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0487842085
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4852afd42ceso3873375e9.2
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826793; x=1773431593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qP5P4UGJz2atWYGE5r1vV5zbnuJXfxdwIxtwnP8YcJc=;
 b=D+IdQH7HUqAMj8PBSHtokOgPGakcPTALvbJ+x1UjMZD67u99ylSCNTZzqSZ/+6DTwi
 MbrgOvtLOVoIUMLc9sZE+1P7jismmArymwJuhe557iGKz/rmEC5Q8XQxUz8tiX74mPyL
 XFcbdWENgLBf1m/FNBY1P9bkb2qnenKH6iq98eFhC6F2Qm4HVX+a+6RHNmCMP4ItKxWT
 TTbg8/cUqNj3XEB1f56vDQsPna9pWINGgU2OHFOFw1Emmn+/BdseVtPnD7XIuVDeExd2
 PQSXcthoCEwBo1/hOSZPDljNz1RyqKvygd4lN2Iw72gsbFVKW8UflQbArQjz8sJz9phf
 Mgkw==
X-Gm-Message-State: AOJu0Yyiu3M6vRPn0sNGdAssmScYttkbSbdKeqTSCTamHexPGlcjzipi
 FClUijjONuf6c7aJTWvqym3doGrGWvCFcJDYZoEGYPI4GK10dEZX4my6AvFmfoCKMkP4e/T5HqR
 x55fO
X-Gm-Gg: ATEYQzz+7gmrFsFccKiSAYZIhJJmDswTvQ8B6xeO5wWxwsLXSKR69syI5OQgGrIRNCH
 eK9ESHLSyMddHEMeZu95s3Eeu5INF8G1uT+T/5/MI+UEVjVk361C3dsUzdJRDX9rowKdtCGnPaV
 b8gkwJRCc07eRKKq6IhGEGHCk452LJCU9KHtb9pLHWlk+GjUhfHLoYvo5CzzSLSF1S72SQ669oo
 03riyxrqYmprj2O2KqCt0YkHZATIDelfAEEpqwBXChV1CyfYhIhJcGYHH3gm56InoTBYKv0QgUa
 bKdAJdiJlLg6ugPFnp1apSiWjCE9sbZSaPNLjKCgSfSyn9S0gqbMmxaGeCzjs1hgApgEgfh3OQi
 EoaIjkogpaxkv0/H88pVKpopa/wXixBI/lFrPOld0/DQ+6YV1qLCN0sSZaa/i/nGatah6gxK+1d
 G/geSL9y4oKeHQF+s=
X-Received: by 2002:a05:600c:c10d:b0:485:2af3:3f8d with SMTP id
 5b1f17b1804b1-4852af34027mr18879565e9.14.1772826792914; 
 Fri, 06 Mar 2026 11:53:12 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852767d8e4sm53361435e9.2.2026.03.06.11.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:12 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:12 +0100
Message-ID: <20260306195312.7802-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228201547.84699-1-thomas.perale@mind.be>
References: <20260228201547.84699-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826793; x=1773431593; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qP5P4UGJz2atWYGE5r1vV5zbnuJXfxdwIxtwnP8YcJc=;
 b=S7g++joYYnBjVFykJYz5rQCt1AadiCysP7dJURx8ZwPnTTPwQiMEQeklZFFDvvCP6h
 9rvVGV0c19e0alChbLMaeZzuy1BPvR0T2n68ueZvXhXUFneCrTxDgH8L1I23JcGEFn5f
 KevY9g1K0bidjy7vKZ9sAbjeK1a4ZT8RAYH967YeZ8KlI/aKY0p5BTBIU7IaYigVOxU0
 x3PYv7EEqrFA7xcQyy/quYY8hEe8kpXYwXGY6dKJn8ok4rvoNZUZN/kYNsZsedmAY8pU
 Q9pnToAT98WfCPk21N4MGT/H6FAQ3mZjblcDfJG3EIVOVUkdzA2DNGLMj+vbEdWYCaDF
 Um6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S7g++joY
Subject: Re: [Buildroot] [PATCH] package/mupdf: add patch for CVE-2026-25556
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
> Fixes the following vulnerability:
> 
> - CVE-2026-25556:
>     MuPDF versions 1.23.0 through 1.27.0 contain a double-free
>     vulnerability in fz_fill_pixmap_from_display_list() when an exception
>     occurs during display list rendering. The function accepts a caller-
>     owned fz_pixmap pointer but incorrectly drops the pixmap in its error
>     handling path before rethrowing the exception. Callers (including the
>     barcode decoding path in fz_decode_barcode_from_display_list) also
>     drop the same pixmap in cleanup, resulting in a double-free that can
>     corrupt the heap and crash the process. This issue affects
>     applications that enable and use MuPDF barcode decoding and can be
>     triggered by processing crafted input that causes a rendering-time
>     error while decoding barcodes.
> 
> For more information, see
>   - https://www.cve.org/CVERecord?id=CVE-2026-25556
>   - https://cgit.ghostscript.com/cgi-bin/cgit.cgi/mupdf.git/commit/?id=d4743b6092d513321c23c6f7fe5cff87cde043c1
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...-incorrect-error-case-free-of-pixmap.patch | 53 +++++++++++++++++++
>  package/mupdf/mupdf.mk                        |  3 ++
>  2 files changed, 56 insertions(+)
>  create mode 100644 package/mupdf/0001-Fix-incorrect-error-case-free-of-pixmap.patch
> 
> diff --git a/package/mupdf/0001-Fix-incorrect-error-case-free-of-pixmap.patch b/package/mupdf/0001-Fix-incorrect-error-case-free-of-pixmap.patch
> new file mode 100644
> index 0000000000..f78c429cef
> --- /dev/null
> +++ b/package/mupdf/0001-Fix-incorrect-error-case-free-of-pixmap.patch
> @@ -0,0 +1,53 @@
> +From d4743b6092d513321c23c6f7fe5cff87cde043c1 Mon Sep 17 00:00:00 2001
> +From: Robin Watts <Robin.Watts@artifex.com>
> +Date: Mon, 12 Jan 2026 19:08:56 +0000
> +Subject: Bug 709029: Fix incorrect error-case free of pixmap.
> +
> +Don't free a pixmap we don't own!
> +
> +CVE: CVE-2026-25556
> +Upstream: https://cgit.ghostscript.com/cgi-bin/cgit.cgi/mupdf.git/commit/?id=d4743b6092d513321c23c6f7fe5cff87cde043c1
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + source/fitz/util.c | 15 +++++++++------
> + 1 file changed, 9 insertions(+), 6 deletions(-)
> +
> +diff --git a/source/fitz/util.c b/source/fitz/util.c
> +index 7710124cc..90226a5c1 100644
> +--- a/source/fitz/util.c
> ++++ b/source/fitz/util.c
> +@@ -119,7 +119,15 @@ fz_new_pixmap_from_display_list_with_separations(fz_context *ctx, fz_display_lis
> + 	else
> + 		fz_clear_pixmap_with_value(ctx, pix, 0xFF);
> +
> +-	return fz_fill_pixmap_from_display_list(ctx, list, ctm, pix);
> ++	fz_try(ctx)
> ++		fz_fill_pixmap_from_display_list(ctx, list, ctm, pix);
> ++	fz_catch(ctx)
> ++	{
> ++		fz_drop_pixmap(ctx, pix);
> ++		fz_rethrow(ctx);
> ++	}
> ++
> ++	return pix;
> + }
> +
> + fz_pixmap *
> +@@ -136,14 +144,9 @@ fz_fill_pixmap_from_display_list(fz_context *ctx, fz_display_list *list, fz_matr
> + 		fz_close_device(ctx, dev);
> + 	}
> + 	fz_always(ctx)
> +-	{
> + 		fz_drop_device(ctx, dev);
> +-	}
> + 	fz_catch(ctx)
> +-	{
> +-		fz_drop_pixmap(ctx, pix);
> + 		fz_rethrow(ctx);
> +-	}
> +
> + 	return pix;
> + }
> +--
> +cgit v1.2.3
> +
> diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
> index fe4f3e6756..c538b9bec8 100644
> --- a/package/mupdf/mupdf.mk
> +++ b/package/mupdf/mupdf.mk
> @@ -27,6 +27,9 @@ MUPDF_IGNORE_CVES = \
>  	CVE-2024-24258 \
>  	CVE-2024-24259
>  
> +# 0001-Fix-incorrect-error-case-free-of-pixmap.patch
> +MUPDF_IGNORE_CVES += CVE-2026-25556
> +
>  # mupdf doesn't use CFLAGS and LIBS but XCFLAGS and XLIBS instead.
>  # with USE_SYSTEM_LIBS it will try to use system libraries instead of the bundled ones.
>  MUPDF_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
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
