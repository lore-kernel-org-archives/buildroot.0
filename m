Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7CDC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EE5080EF9;
	Thu,  7 Aug 2025 18:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWubJlJNMwUh; Thu,  7 Aug 2025 18:25:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFDC080ED6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFDC080ED6;
	Thu,  7 Aug 2025 18:25:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39E3C4C6
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 209AD605F0
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDc3SzhcB2Yp for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E41D0605F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E41D0605F1
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E41D0605F1
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b7862bd22bso1218198f8f.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591078; x=1755195878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l0ppaFGeK8x9KWf3I6o42ymltfEpZiA8XunVpqD1nUU=;
 b=bVBYBP4K2R0KusDdeJW1eJrQ9NZ/kvitWFy5+Eb869GYY+zlK+csJ3f5arPac69Ax0
 sEJCUnuRZbgyvsLDrzeoGkTiiWUPzOJlEM4pIXhpDGTnDbrkOoEoxTOH9vI1ZdxrJtpp
 SjJxeJiei2tuVvS6rkmmK4YzMkd5g+0bBxQMeXKTn46V3bIEbk/HHaC1ldwZoAGvbznk
 3kbOeKDxHG4FgFIfbOD3U6iJlyH/33Uc9dlf0kcGzOZSWfdXCgOslRMZL7ISACgsFKwP
 A5Vv0ln4c9KTGOuiRwv2R9TlLMD2EWtwp/D9YW+ockh2PMfnY2UkeoKn/lSYqaOXnB6x
 3Jhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUnLvfDlGRvm8zmCkJ++Mu9JJ58l+q19dWk/R9LLLe48I5wJXneqHN3Nqa9QetgrV8A2hHnIpn/e0=@buildroot.org
X-Gm-Message-State: AOJu0YzJ0j7Sn9zHH+CHqQQ5JFXAtIn6hVdZe2YArtHEmVJOy/QcTyD3
 CoUWnAzs/GoBBKW+oKquhoILxbb4BNZrppPSk7W7PGIzVz/W8naH1GH3qwvJt4UBQOL2u9vXObI
 BLlLd
X-Gm-Gg: ASbGncsb4wW8DG+tzy60f+yDCb7ygD+D4xzAhRI1+rHOcjbEaafxUUfaCZdVX2UyILp
 YKw0jJLQT8Y82Zh5JU+nnIhcda0ZEm5BM3TpbbKc+GM7YlBD7IpxGTP2WYLnbQhxwRdDsqTzpr4
 ibFYmuPTNDw1x7n9cnW2FPZKe31hQU0M4DV2TsqHUmZPkdBB4V5frpajpU+AHyrWUoLKwsQiJeX
 5tvOzR9sictQgJ5OyKUGL9JIDOpbf2KeRXKY5cOyVIan0pJ1NtKjph7l1s3DxJ2bfFNtRuBpTyl
 ZGZ8xxmDNqim4odbIz273e04o/qnMQGe18I1q4o6fdhrxb6y+Gzm+zimo40mzLfj4kTtvDCby1I
 096oV9naeKTh5aA==
X-Google-Smtp-Source: AGHT+IGTvXFtI7vWsCV3JVo1ITzMH+91WSdm4C1u5cKlHhdfeQ+eT19dEV6OEVnRvVwYFBV0SpFXkg==
X-Received: by 2002:a05:6000:2209:b0:3a4:cec5:b59c with SMTP id
 ffacd0b85a97d-3b8f97f4ba4mr4542444f8f.25.1754591077879; 
 Thu, 07 Aug 2025 11:24:37 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c46ee84sm26870915f8f.57.2025.08.07.11.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:37 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:37 +0200
Message-ID: <20250807182437.725899-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250726071450.3545797-1-bernd@kuhls.net>
References: <20250726071450.3545797-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591078; x=1755195878; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l0ppaFGeK8x9KWf3I6o42ymltfEpZiA8XunVpqD1nUU=;
 b=DIQ4o/DAOyUFeW4UVYKFQcdpX/oArTVTeJQHVtGBxmoEftehAf5BVuxDC1vnOmRff0
 WFjpSNrWvh41utODwQI3alOwg5AStc2O7SaNcWNNmXcu1hy2Cy0xFGPp9sTyufAZfEQR
 NpIGT/N6xKiMoFR+IZ60ptC08ZZTLq/k12PUrFjqZ9DccxUVXhUR6ifrY6+kDdlu7ADL
 D0fT9d5pCYfZrLPy/IBoXA/2dQZ/X9DLAOfOfkm58zC2NcSUFCt3wcUlCGXFMB3pei7g
 9yOKLU3bjeiTvCmGwaZ5DK5VyZel8nGdWrsEEEQe9Ma9rZ7wfVGe6iUuAdwRexEgASj4
 bvAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DIQ4o/DA
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/libva: fix build error"
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
> This reverts commit c41f953ab9ba262324484a2efe1151d8f543eebd.
> 
> This commit broke gst1-vaapi:
> https://lists.buildroot.org/pipermail/buildroot/2025-July/782786.html
> 
> Reported-by: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...a-remove-older-0.32-and-0.33-support.patch | 239 ------------------
>  1 file changed, 239 deletions(-)
>  delete mode 100644 package/libva/0001-va-remove-older-0.32-and-0.33-support.patch
> 
> diff --git a/package/libva/0001-va-remove-older-0.32-and-0.33-support.patch b/package/libva/0001-va-remove-older-0.32-and-0.33-support.patch
> deleted file mode 100644
> index 75fb8c9499..0000000000
> --- a/package/libva/0001-va-remove-older-0.32-and-0.33-support.patch
> +++ /dev/null
> @@ -1,239 +0,0 @@
> -From 0340bca0ee4f7d66fe029ce4c7fece01c896f00a Mon Sep 17 00:00:00 2001
> -From: Carl Zhang <carl.zhang@intel.com>
> -Date: Mon, 13 May 2024 16:19:13 +0800
> -Subject: [PATCH] va: remove older 0.32 and 0.33 support
> -
> -libva version 2.x should be compatible with 2.x series , not 1.x series
> -and 0.x series
> -reserve va_compat.h , because maybe some existing usage refer this file
> -
> -Upstream: https://github.com/intel/libva/pull/812
> -
> -Signed-off-by: Carl Zhang <carl.zhang@intel.com>
> -[Bernd: rebased after upstream commit
> - https://github.com/intel/libva/commit/a6192260e7cde16ceb9db80eec02b44192087590]
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - va/Makefile.am |  4 ---
> - va/libva.syms  |  9 -------
> - va/meson.build |  8 ------
> - va/va_compat.c | 45 -------------------------------
> - va/va_compat.h | 73 +-------------------------------------------------
> - 5 files changed, 1 insertion(+), 138 deletions(-)
> - delete mode 100644 va/libva.syms
> - delete mode 100644 va/va_compat.c
> -
> -diff --git a/va/Makefile.am b/va/Makefile.am
> -index 8d16d422c..4ebf8f09a 100644
> ---- a/va/Makefile.am
> -+++ b/va/Makefile.am
> -@@ -32,7 +32,6 @@ LDADD = \
> - 
> - libva_source_c = \
> - 	va.c			\
> --	va_compat.c		\
> - 	va_str.c		\
> - 	va_trace.c		\
> - 	$(NULL)
> -@@ -75,7 +74,6 @@ libva_source_h_priv = \
> - 
> - libva_ldflags = \
> - 	$(LDADD) -no-undefined	\
> --	-Wl,-version-script,${srcdir}/libva.syms \
> - 	$(NULL)
> - 
> - libva_cflags = \
> -@@ -91,7 +89,6 @@ noinst_HEADERS			= $(libva_source_h_priv)
> - libva_la_SOURCES		= $(libva_source_c)
> - libva_la_CFLAGS			= $(libva_cflags)
> - libva_la_LDFLAGS		= $(libva_ldflags)
> --libva_la_DEPENDENCIES		= libva.syms
> - libva_la_LIBADD			= $(LIBVA_LIBS)
> - 
> - if USE_DRM
> -@@ -146,7 +143,6 @@ DISTCLEANFILES = \
> - 	$(NULL)
> - 
> - EXTRA_DIST = \
> --	libva.syms		\
> - 	va_version.h.in		\
> - 	meson.build		\
> -         libva.def               \
> -diff --git a/va/libva.syms b/va/libva.syms
> -deleted file mode 100644
> -index b3f91f935..000000000
> ---- a/va/libva.syms
> -+++ /dev/null
> -@@ -1,9 +0,0 @@
> --VA_API_0.32.0 {
> --    local:
> --        vaCreateSurfaces_0_32_0;
> --};
> --
> --VA_API_0.33.0 {
> --    global:
> --        vaCreateSurfaces;
> --} VA_API_0.32.0;
> -diff --git a/va/meson.build b/va/meson.build
> -index e15f8fe3e..43db2a3ef 100644
> ---- a/va/meson.build
> -+++ b/va/meson.build
> -@@ -11,7 +11,6 @@ version_file = configure_file(
> - 
> - libva_sources = [
> -   'va.c',
> --  'va_compat.c',
> -   'va_str.c',
> -   'va_trace.c',
> - ]
> -@@ -55,15 +54,8 @@ libva_headers_priv = [
> -   'va_trace.h',
> - ]
> - 
> --libva_sym = 'libva.syms'
> --libva_sym_arg = '-Wl,-version-script,' + '@0@/@1@'.format(meson.current_source_dir(), libva_sym)
> --
> - libva_link_args = []
> - libva_link_depends = []
> --if cc.links('void vaCreateSurfaces_0_32_0(void) {} void vaCreateSurfaces() {}', name: '-Wl,--version-script', args: ['-shared', libva_sym_arg])
> --  libva_link_args = libva_sym_arg
> --  libva_link_depends = libva_sym
> --endif
> - 
> - install_headers(libva_headers, subdir : 'va')
> - 
> -diff --git a/va/va_compat.c b/va/va_compat.c
> -deleted file mode 100644
> -index 44d69562b..000000000
> ---- a/va/va_compat.c
> -+++ /dev/null
> -@@ -1,45 +0,0 @@
> --/*
> -- * Copyright (c) 2007-2011 Intel Corporation. All Rights Reserved.
> -- *
> -- * Permission is hereby granted, free of charge, to any person obtaining a
> -- * copy of this software and associated documentation files (the
> -- * "Software"), to deal in the Software without restriction, including
> -- * without limitation the rights to use, copy, modify, merge, publish,
> -- * distribute, sub license, and/or sell copies of the Software, and to
> -- * permit persons to whom the Software is furnished to do so, subject to
> -- * the following conditions:
> -- *
> -- * The above copyright notice and this permission notice (including the
> -- * next paragraph) shall be included in all copies or substantial portions
> -- * of the Software.
> -- *
> -- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
> -- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> -- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
> -- * IN NO EVENT SHALL INTEL AND/OR ITS SUPPLIERS BE LIABLE FOR
> -- * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> -- * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> -- * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> -- */
> --
> --#define VA_COMPAT_DISABLED 1
> --#include "sysdeps.h"
> --#include "va.h"
> --#include "va_compat.h"
> --
> --VAStatus
> --vaCreateSurfaces_0_32_0(
> --    VADisplay    dpy,
> --    int          width,
> --    int          height,
> --    int          format,
> --    int          num_surfaces,
> --    VASurfaceID *surfaces
> --)
> --{
> --    return vaCreateSurfaces(dpy, format, width, height, surfaces, num_surfaces,
> --                            NULL, 0);
> --}
> --#if !defined(_WIN32)
> --VA_CPP_HELPER_ALIAS(vaCreateSurfaces, 0, 32, 0);
> --#endif
> -diff --git a/va/va_compat.h b/va/va_compat.h
> -index 41a3f73e7..02cf5667e 100644
> ---- a/va/va_compat.h
> -+++ b/va/va_compat.h
> -@@ -36,78 +36,7 @@
> - extern "C" {
> - #endif
> - 
> --/**
> -- * \defgroup api_compat Compatibility API
> -- *
> -- * The Compatibility API allows older programs that are not ported to
> -- * the current API to still build and run correctly. In particular,
> -- * this exposes older API to allow for backwards source compatibility.
> -- *
> -- * @{
> -- */
> --
> --/**
> -- * Makes a string literal out of the macro argument
> -- */
> --#define VA_CPP_HELPER_STRINGIFY(x) \
> --    VA_CPP_HELPER_STRINGIFY_(x)
> --#define VA_CPP_HELPER_STRINGIFY_(x) \
> --    #x
> --
> --/**
> -- * Concatenates two macro arguments at preprocessing time.
> -- */
> --#define VA_CPP_HELPER_CONCAT(a, b) \
> --    VA_CPP_HELPER_CONCAT_(a, b)
> --#define VA_CPP_HELPER_CONCAT_(a, b) \
> --    a ## b
> --
> --/**
> -- * Generates the number of macro arguments at preprocessing time.
> -- * <http://groups.google.com/group/comp.std.c/browse_thread/thread/77ee8c8f92e4a3fb/346fc464319b1ee5>
> -- *
> -- * Note: this doesn't work for macros with no arguments
> -- */
> --#define VA_CPP_HELPER_N_ARGS(...) \
> --    VA_CPP_HELPER_N_ARGS_(__VA_ARGS__, VA_CPP_HELPER_N_ARGS_LIST_REV())
> --#define VA_CPP_HELPER_N_ARGS_(...) \
> --    VA_CPP_HELPER_N_ARGS_LIST(__VA_ARGS__)
> --#define VA_CPP_HELPER_N_ARGS_LIST(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a12, a13, a14, a15, a16, N, ...) N
> --#define VA_CPP_HELPER_N_ARGS_LIST_REV() \
> --    15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0
> --
> --/**
> -- * Generates a versioned function alias.
> -- *
> -- * VA_CPP_HELPER_ALIAS(vaSomeFunction, 0,32,0) will generate
> -- *   .symber vaSomeFunction_0_32_0, vaSomeFunction@VA_API_0.32.0
> -- */
> --#define VA_CPP_HELPER_ALIAS(func, major, minor, micro) \
> --    VA_CPP_HELPER_ALIAS_(func, major, minor, micro, "@")
> --#define VA_CPP_HELPER_ALIAS_DEFAULT(func, major, minor, micro) \
> --    VA_CPP_HELPER_ALIAS_(func, major, minor, micro, "@@")
> --#define VA_CPP_HELPER_ALIAS_(func, major, minor, micro, binding)        \
> --    asm(".symver " #func "_" #major "_" #minor "_" #micro ", "          \
> --        #func binding "VA_API_" #major "." #minor "." #micro)
> --
> --/* vaCreateSurfaces() */
> --
> --#ifndef VA_COMPAT_DISABLED
> --#define vaCreateSurfaces(dpy, ...)                                      \
> --    VA_CPP_HELPER_CONCAT(vaCreateSurfaces,                              \
> --                         VA_CPP_HELPER_N_ARGS(dpy, __VA_ARGS__))        \
> --    (dpy, __VA_ARGS__)
> --#endif
> --
> --#define vaCreateSurfaces6(dpy, width, height, format, num_surfaces, surfaces) \
> --    (vaCreateSurfaces)(dpy, format, width, height, surfaces, num_surfaces, \
> --                       NULL, 0)
> --
> --#define vaCreateSurfaces8(dpy, format, width, height, surfaces, num_surfaces, attribs, num_attribs) \
> --    (vaCreateSurfaces)(dpy, format, width, height, surfaces, num_surfaces, \
> --                       attribs, num_attribs)
> --
> --/*@}*/
> -+#warning deprecated, keep a empty file because some application may include it
> - 
> - #ifdef __cplusplus
> - }
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
