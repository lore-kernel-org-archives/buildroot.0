Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC78CE74ACF
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 20:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ACC9418E9;
	Tue,  3 Dec 2024 20:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGi14aYfCVYa; Tue,  3 Dec 2024 20:40:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 645D8418AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 645D8418AB;
	Tue,  3 Dec 2024 20:40:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E720236E
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C284610D7
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2j15y7fbLxd for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 20:40:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB2D2610EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB2D2610EC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB2D2610EC
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 20:40:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C945219F57E;
 Tue,  3 Dec 2024 21:39:57 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:45476])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Dec 2024 21:39:57 +0100
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 21:39:57 +0100
From: Julien Olivain <ju.o@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241202084506.3251747-1-aperez@igalia.com>
References: <20241202084506.3251747-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <94142843bd680045fc97a661604a768f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733258399;
 bh=DBYeFE7ZDYb97+r3x7AUAMA32PSi1hwq+XELP1ONmFI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lixCQBRj6E4KTdsz/7+hAg1PPpJA8pCF5xCHG6C3h8Y2E9kEyb/NgNP7hkhUqExNU
 D9P9udagO4CcDqhbu6PhBesPFH4gnlUbTLdrJjvd4u2mdA8CZacSyov94sIDQt7odd
 ujak1+RUZ7HcUpFM+0Ufn0MasPOw8pzXtd05M3E1+Cjw1P6d4EhYu5OfKocNMPU/41
 /F1EGElElAvg0rvE95QminuHmEYrNccGxh1WXZYwdTDZmTDYJw4I4r0Xfd73WZP140
 1tdJ019c5hsXRqS9Npybobs8SFT5kkpjRkIRzdFaO1q62w7Pd4BXbZtBVJSA9Q/zmW
 EVSrh+/LTi5Hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lixCQBRj
Subject: Re: [Buildroot] [PATCH/next] package/sysprof: bump to version 47.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/12/2024 09:45, Adrian Perez de Castro wrote:
> This is a bugfix release, which mainly improves reliability, fixes a
> issues when profiling WebKit, and adds a new counter for dropped perf
> events. Release notes:
> 
>   https://gitlab.gnome.org/GNOME/sysprof/-/blob/47.2/NEWS
> 
> The patch to allow building with older GLib versions has been included
> in the 47.1 release and therefore gets dropped.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to next, thanks.

> ---
>  .../0001-build-reduce-GLib-requirement.patch  | 30 -------------------
>  package/sysprof/sysprof.hash                  |  4 +--
>  package/sysprof/sysprof.mk                    |  2 +-
>  3 files changed, 3 insertions(+), 33 deletions(-)
>  delete mode 100644 
> package/sysprof/0001-build-reduce-GLib-requirement.patch
> 
> diff --git a/package/sysprof/0001-build-reduce-GLib-requirement.patch 
> b/package/sysprof/0001-build-reduce-GLib-requirement.patch
> deleted file mode 100644
> index fb83e210fe..0000000000
> --- a/package/sysprof/0001-build-reduce-GLib-requirement.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From c34fba6fe5c3ecd2028461a4317bd2916e2a09d7 Mon Sep 17 00:00:00 2001
> -From: Christian Hergert <chergert@redhat.com>
> -Date: Mon, 16 Sep 2024 09:48:15 -0700
> -Subject: [PATCH] build: reduce GLib requirement
> -
> -This is kept lower so that you can build without GTK on older systems.
> -
> -Related: 
> https://gitlab.gnome.org/GNOME/sysprof/-/commit/530b4a9d121c8659148c36ce67f2ce415443baa5#note_2223853
> -Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> -Upstream: 
> https://gitlab.gnome.org/GNOME/sysprof/-/commit/e5382d1b8cae4d829751938ce39c2e5fbc419064
> ----
> - meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 63a31894..696b87be 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -45,7 +45,7 @@ need_libsysprof = (need_gtk or
> -                    get_option('tests'))
> -
> - dex_req = '0.6'
> --glib_req = '2.80.0'
> -+glib_req = '2.76.0'
> - gtk_req = '4.15'
> - polkit_req = '0.105'
> -
> ---
> -2.46.2
> -
> diff --git a/package/sysprof/sysprof.hash 
> b/package/sysprof/sysprof.hash
> index ca025674a7..1d7373e16d 100644
> --- a/package/sysprof/sysprof.hash
> +++ b/package/sysprof/sysprof.hash
> @@ -1,5 +1,5 @@
> -# From 
> https://download.gnome.org/sources/sysprof/47/sysprof-47.0.sha256sum
> -sha256  
> 7424c629434660654288c04248998c357d1ce87ee1559fd44df1980992ef5df5  
> sysprof-47.0.tar.xz
> +# From 
> https://download.gnome.org/sources/sysprof/47/sysprof-47.2.sha256sum
> +sha256  
> e4b5ede9fd978ec3f0d5a0d44d0429a6d201c362bf6cb4527319031ae462c54f  
> sysprof-47.2.tar.xz
> 
>  # License files
>  sha256  
> 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  
> COPYING
> diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
> index 81c0a4a6ee..13b3de175e 100644
> --- a/package/sysprof/sysprof.mk
> +++ b/package/sysprof/sysprof.mk
> @@ -5,7 +5,7 @@
>  
> ################################################################################
> 
>  SYSPROF_VERSION_MAJOR = 47
> -SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).0
> +SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).2
>  SYSPROF_SOURCE = sysprof-$(SYSPROF_VERSION).tar.xz
>  SYSPROF_SITE = 
> https://download.gnome.org/sources/sysprof/$(SYSPROF_VERSION_MAJOR)
>  SYSPROF_LICENSE = GPL-3.0+
> --
> 2.47.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
