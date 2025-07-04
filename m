Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE183C83F05
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80BDC83CC6;
	Fri,  4 Jul 2025 06:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpqWQRLBbtrl; Fri,  4 Jul 2025 06:46:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B93F83CC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B93F83CC7;
	Fri,  4 Jul 2025 06:46:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E579F7AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1EE483A08
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lpNiOuUJ0IbB for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:46:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C7F8B82A53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7F8B82A53
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7F8B82A53
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:33 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so221927f8f.2
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611592; x=1752216392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GDo1PxNwId/ztSjBvN9C0OGO/N5U8UdRzU76CbI8l2c=;
 b=KOLUzEw70jYtSaYWTlgZOJwEdGRuO0ca5DXRk5k1fpRkQYLP+iQjGiL+mCPgW10tJD
 zPK+YFbvOnn6x2cBMIV+iMbmLK+Z8sR8RGsQ+CfVYiPOACcP16EUrIx9GNWxiNmYY63f
 ecTx8aAF81IfntbPrsXsXqYc6ywR9cB2wK0sUZ6JBzsVKPrtC+dSXSNDEzOZyNgnbhQ3
 BhcpCmFGc2GkGjm5IXghywSKTdeL2bZ5gMJ5dH/k5jNGYLVfU58qrRMQHqOVZJr3Inlt
 AcuN0q19va4LBhlrgHVS/qSyhDPeHZfcIETl0QrfwhfiyQ0QztxA/A3SrAemPX1tkXgi
 gZDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8vcMXZpkeKCtrTKY5AEMjMymjsverdsPnN4awbl4f8Rir4d0k2VBJ959+mb5zPKO6aJuYUyJ4vxQ=@buildroot.org
X-Gm-Message-State: AOJu0Yy0StZjbIUPU2LF+Q4tl89TgMLwKgy8Mwv39Wp381ATgZLMpE+u
 /7tUYldZTOEQAIPFQZYDvwKbotokUTj53KRrIvSh8armMLHRY1xv2fRhYy+gMXvaWVc=
X-Gm-Gg: ASbGncsHptWT34OL89T/GEzzbWaG3rU8djpT1oGt0/wwkgQ5JlryHUCvdyE1p01jrOq
 HM/vft0UuykjzUpdAoa5y+z99LTDmT99QoOLGb81jSFP4bMwc77KGxhwyA0vTAiP7MVOC0DK6Ii
 hHwGs809ba8NPovqzjQPwjkNLFNWsClfSbUV0zji00o8nESn1jbXAetSEbsBtwTJHpg0GzIgxsv
 xAfIH4uvluhLV9rW3Xg39lh0FfGeWzySE6qbx1ud6RSxDGf3+j1dIr9NAWwKngBL/snRQajC14B
 qJbvyQKLcGm61JrjjRKboT/AqJmKXIh812ir83eti5nDRAv2zgUgWtV5SObf5FXjCqBtXVZCr1e
 5an6PiYS4KA==
X-Google-Smtp-Source: AGHT+IF0xvweDSPU7SjcrkugCMSdlNSR49y7luSZPWmzBKLEZwO0XgXV4hNdbK9vV4ekqCMQ/scqUQ==
X-Received: by 2002:a05:6000:40df:b0:3a3:7987:945f with SMTP id
 ffacd0b85a97d-3b4964ee23emr954387f8f.57.1751611591639; 
 Thu, 03 Jul 2025 23:46:31 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b470d9e470sm1628273f8f.41.2025.07.03.23.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:46:30 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:46:30 +0200
Message-ID: <20250704064630.4063646-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250621122724.957110-1-bernd@kuhls.net>
References: <20250621122724.957110-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611592; x=1752216392; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GDo1PxNwId/ztSjBvN9C0OGO/N5U8UdRzU76CbI8l2c=;
 b=W1Nre2F2326Chz4OI0noXxDtWwyrvI7lewgea9OKh3lyML3H7sIjMU9U2juQR4MBOh
 K1zuOxzHckP6ww0rxzQ9+pnPpvB/jmPJdsvKLgKQUCaYVleliytJjQpZzyAajMuXpMM3
 bT0IBAR/nVKfHh+AnXyGzxA07Qavw1Gf1B7p23mz1GZ04KRj7TIWy4vUvtXz4TXuiioW
 CJAwWkqmL4bBhZg2f1bOz0uiGJIh1Nj3ruM0ezYQFFAp1aLSnGIRYATSm0oTBD8VCfiZ
 EeUgU5uxwrfg3g5XIJ9G4AQwgGKitmlgWL5rfMPh9HVkjkdTRSLa4jfugJZipVWm7UmK
 +VVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=W1Nre2F2
Subject: Re: [Buildroot] [PATCH 1/1] package/mpv: remove stale patch
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
> Buildroot commit 8f69974c20fbc7dc642be62a0ef3fb2941f5bb35 switched the
> buildsystem of mpv from waf to meson but forgot to remove a patch which
> fixed a waf-related build error.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  .checkpackageignore                          |  1 -
>  package/mpv/0001-fix-powerpc64-altivec.patch | 32 --------------------
>  2 files changed, 33 deletions(-)
>  delete mode 100644 package/mpv/0001-fix-powerpc64-altivec.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 0534465eb3..cb3d3bc33b 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -814,7 +814,6 @@ package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch l
>  package/mono/0002-Ongoing-work-on-the-cmake-build.patch lib_patch.Upstream
>  package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
>  package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
> -package/mpv/0001-fix-powerpc64-altivec.patch lib_patch.Upstream
>  package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch lib_patch.Upstream
>  package/mrouted/S41mrouted NotExecutable
>  package/mrp/S65mrp lib_sysv.Indent lib_sysv.Variables
> diff --git a/package/mpv/0001-fix-powerpc64-altivec.patch b/package/mpv/0001-fix-powerpc64-altivec.patch
> deleted file mode 100644
> index 45983fec8f..0000000000
> --- a/package/mpv/0001-fix-powerpc64-altivec.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Subject: [PATCH] Work around bool type redefinition by altivec
> -
> -On powerpc64le, the SDL header may include altivec.h and this
> -(combined with -std=c99) will cause a compile failure due to bool
> -being redefined as a vector type.
> -
> -Adjust the compiler flags to add -std=gnu99 (which is compatible with
> -altivec) when using gcc. The generic flag '-std=c99' is left in place for other
> -compilers (in the gcc case it is overridden by the (later) gnu flag).
> -
> -Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ----
> - waftools/detections/compiler.py | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/waftools/detections/compiler.py b/waftools/detections/compiler.py
> -index 5bbba87..50836a2 100644
> ---- a/waftools/detections/compiler.py
> -+++ b/waftools/detections/compiler.py
> -@@ -43,7 +43,8 @@ def __add_gcc_flags__(ctx):
> -                        "-Wno-switch", "-Wparentheses", "-Wpointer-arith",
> -                        "-Wno-pointer-sign",
> -                        # GCC bug 66425
> --                       "-Wno-unused-result"]
> -+                       "-Wno-unused-result",
> -+                       "-std=gnu99"]
> - 
> - def __add_clang_flags__(ctx):
> -     ctx.env.CFLAGS += ["-Wno-logical-op-parentheses", "-fcolor-diagnostics",
> --- 
> -2.10.0.297.gf6727b0
> -
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
