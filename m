Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D5BCD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D8C860BBC;
	Fri,  5 Jun 2026 12:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7TTOFjF9ucRB; Fri,  5 Jun 2026 12:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E378961072
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663813;
	bh=3UwdQCTCe8Y847Q4lUIXYd2FnS/YtQ0quSKrSKLMEe4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N+h0RursWV4tChZooUTyEYuKb3pS48EDZPr4MvCE8tLauQkmv0G1rQS7bPKvayx0w
	 +Y+dtypMn8eLPvlkBfiJD0gRtz0mDY2isfeGGBQju8q9wjd595NCoQCb4CAiqQD6FC
	 3X8jqg9XcIvV9cBmrOtF+7wWpjCgHX1+22YDNwNZp7X0yg7u8dIkF+LlMLFF2Vh01E
	 H6zc+ylyQhf9NXxxZQ2CYxOB2aSrLcwRtJwme9vqxhIYEQEp7zfhv6hlLVKOWEdzwa
	 rZECOVbpGbLPAO5DhuHWyvxOmZpioVAjsAElHInjqHMmh76m2bk01znc/inDp5D1/N
	 zdmPgmas6NZDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E378961072;
	Fri,  5 Jun 2026 12:50:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC9AB388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D9AF41EF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vCQGQZwFLMj for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3DD1841EEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DD1841EEE
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DD1841EEE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:09 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-46013161068so944811f8f.2
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663807; x=1781268607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QUHUd4vBprM0f3qJEijjyUNJdVUxHvgMWsi27ZStE1s=;
 b=Wg5E5EadB5cBVPCBSPi1p2BzGUOmYJtR8Klmp8YL0wfV3jnaOKz8npczDfRoabp1h2
 iufJHvaAVCEWO9Wl/Wk/xcFwn28PCFgwh/6lwKbCVxGQWZ8y4bEFY9tRPZ0xwufUjx9Q
 6QVe+oTaB786PaqZDDjLo9WKSG53Lyq0wRQ8QsyvLdXEyjoM9CdYjugoxobL6TN07q5T
 3nDNF7GIBWvwhPrNFu0J0vxiSMxqvpn+qpSKEE5GkzA9sCYJyuuWV+Bb1ZmilNDhPAKD
 VBEzZfHdHEFBPXWRfeku6V3jnXJpP5AlI33U7cUGWdoOG65/NIeJB7QjkdpNvuluwf3p
 9u+w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8+EG/24APz4xXr7Fk7/cfVyoVBeuMdM6CvXnYa4Aah6e8jLG3xF8wnoPZGOPGepuDQ9v91Wi9fJ6k=@buildroot.org
X-Gm-Message-State: AOJu0YyY4mpbYaioS9EHxUxoa15x3oDcF+Bf5izqRwZy8ek74Q66HC52
 LVnCM6H6gOffd4xZYnUfZGTJf8n5OTdsYi81kkbhib+1bxhgkPihbSl8YmRxsg0iQI4=
X-Gm-Gg: Acq92OESZlr0VJssflFXh8yZYIZoUExFtTnNR+gd7FzMofVE2LTqQcs+aGn2ofJJTx4
 7kEBRNkZdYt4SObT937oYCLsrkSdpQAYYHuFZyWj7xvX20X/+3zi4kJETN98rmlbfpNWvRPxc9Q
 fZa6a3vh6el1H2ZlmMSkc01bacnWq8Vhb6u+kp8p7hvCzrQLNPXBl/8Ppmz92uWfhh8vdQOT4hb
 7p16wOa38jHXiihWIkm86oVdpGpLK0PVDyhGz0iFlLerbxU0zIEjLtKQa9gDw1+RPnnaLlQx/XV
 /P0D728oxVzhQ1m0pRXFwa/eWANHJu1nkz13RlNZ0qeyZiZirVzUVNimyKSYHoht/ifXJn3zHlX
 oK3iIeZR+J++HH3amwmgV3si+23Ch2aH4uGgSv57udGGVv9FjJLQdYouo9Vdwh2Vjeb3/c2OVRv
 PtnbfXkKoVREaY/m8D83h0RCHbfw==
X-Received: by 2002:adf:e509:0:b0:441:239e:2bb8 with SMTP id
 ffacd0b85a97d-460304f0ad9mr4696783f8f.7.1780663807199; 
 Fri, 05 Jun 2026 05:50:07 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2f5612sm24394400f8f.15.2026.06.05.05.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:06 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:05 +0200
Message-ID: <20260605125005.272451-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260224182016.2631828-1-bernd@kuhls.net>
References: <20260224182016.2631828-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663807; x=1781268607; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QUHUd4vBprM0f3qJEijjyUNJdVUxHvgMWsi27ZStE1s=;
 b=UWE3C0VKNQ7ypYqMYX5ReLy3peUz8IoIdWY7bqrkRCK8o9HPKMr/WbvR7MstqksjqH
 FEWT3YX9yApmF79vF0GzJnZLrwVd6DuvgQR29OKjaTCS8Z/Az5dOs7jQK+fxCuzQgNpX
 FamU74kPreATlIg3aHynuJwtQU4t73qzVByvp1/6kXC+b2oZC1pOn2qrkeX+s0IDBBWI
 73DEFtJBQo6wTo6CMYwy1xex97vI4frEBRi6/ctTWPfLF+Qto85mUoH5z1qBm+1tALpc
 5bt3efnUGVFVKKo24LxnuG4El7RMRHINBwanp28zV+8pyObVG5BKmMmKRROqDsALhwVu
 ILnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UWE3C0VK
Subject: Re: [Buildroot] [PATCH 1/3] package/vlc: replace wayland-scanner
 patch with upstream commit
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
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  .checkpackageignore                           |  1 -
>  ...t-possible-to-override-wayland-scann.patch | 39 +++++++++++++++
>  ...o-use-AC_PATH_PROG-to-check-for-wayl.patch | 50 -------------------
>  package/vlc/vlc.mk                            |  1 +
>  4 files changed, 40 insertions(+), 51 deletions(-)
>  create mode 100644 package/vlc/0008-configure-make-it-possible-to-override-wayland-scann.patch
>  delete mode 100644 package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 695e0d50c6..3ad99d0eb1 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -975,7 +975,6 @@ package/vlc/0004-Fix-build-error-using-uClibc-by-adding-sys-types.h.patch lib_pa
>  package/vlc/0005-Don-t-assume-strerror_l-is-available.patch lib_patch.Upstream
>  package/vlc/0006-posix-remove-ancient-run-time-fallback-to-real-time-.patch lib_patch.Upstream
>  package/vlc/0007-Add-support-for-freerdp2.patch lib_patch.Upstream
> -package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch lib_patch.Upstream
>  package/vlc/0009-modules-video_filter-opencv_example.cpp-fix-build-wi.patch lib_patch.Upstream
>  package/vlc/0010-opengl-missing-library-check.patch lib_patch.Upstream
>  package/vpnc/0001-Makefile-allow-to-override-the-PREFIX-variable.patch lib_patch.Upstream
> diff --git a/package/vlc/0008-configure-make-it-possible-to-override-wayland-scann.patch b/package/vlc/0008-configure-make-it-possible-to-override-wayland-scann.patch
> new file mode 100644
> index 0000000000..b89687ec74
> --- /dev/null
> +++ b/package/vlc/0008-configure-make-it-possible-to-override-wayland-scann.patch
> @@ -0,0 +1,39 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Yann Lochet <yann@l0chet.fr>
> +Date: Fri, 25 Nov 2022 16:20:45 +0100
> +Subject: [PATCH] configure: make it possible to override wayland-scanner
> +
> +When cross-compiling, PKG_CONFIG might pick up the wayland-scanner
> +from the sysroot.
> +
> +Upstream: https://code.videolan.org/videolan/vlc/-/commit/75e52f617bf3273f4883b56c4175d68211e02d14
> +
> +[Bernd: rebased for 3.0.23]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + configure.ac | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index a91fc73172..5e8821dea9 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -3277,6 +3277,7 @@ AS_IF([test "${enable_wayland}" = "yes"], [
> +     ])
> + 
> +     AC_MSG_CHECKING([for the Wayland scanner])
> ++    AS_VAR_SET_IF(WAYLAND_SCANNER, [],[
> +     PKG_CHECK_EXISTS([wayland-scanner], [
> +       WAYLAND_SCANNER="$(${PKG_CONFIG} wayland-scanner --variable wayland_scanner)"
> +       AC_MSG_RESULT([${WAYLAND_SCANNER}])
> +@@ -3284,6 +3285,7 @@ AS_IF([test "${enable_wayland}" = "yes"], [
> +       AC_MSG_RESULT([not found])
> +       AC_MSG_ERROR([$(${PKG_CONFIG} --print-errors wayland-scanner)])
> +     ])
> ++    ])
> + 
> +     have_wayland="yes"
> + 
> +-- 
> +2.47.3
> +
> diff --git a/package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch b/package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
> deleted file mode 100644
> index 2b74fe0d39..0000000000
> --- a/package/vlc/0008-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 27635f902831fac898586f1f3dc98369f12582c9 Mon Sep 17 00:00:00 2001
> -From: Bernd Kuhls <bernd.kuhls@t-online.de>
> -Date: Sun, 26 Aug 2018 12:51:04 +0200
> -Subject: [PATCH] configure.ac: also use AC_PATH_PROG to check for
> - wayland-scanner
> -
> -When cross-compiling the .pc file might point to the wrong
> -wayland-scanner binary (target rather than host) resulting in a
> -non-executable and wrong scanner.
> -Try searching the PATH first, and if that fails fall back into
> -pkg-config.
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ----
> - configure.ac | 19 +++++++++++--------
> - 1 file changed, 11 insertions(+), 8 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 4808b8becf..a18641ed23 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -3140,14 +3140,17 @@ AS_IF([test "${enable_wayland}" != "no"], [
> -       AC_MSG_ERROR([$(${PKG_CONFIG} --print-errors 'wayland-protocols >= 1.4')])
> -     ])
> - 
> --    AC_MSG_CHECKING([for the Wayland scanner])
> --    PKG_CHECK_EXISTS([wayland-scanner], [
> --      WAYLAND_SCANNER="$(${PKG_CONFIG} wayland-scanner --variable wayland_scanner)"
> --      AC_MSG_RESULT([${WAYLAND_SCANNER}])
> --    ], [
> --      AC_MSG_RESULT([not found])
> --      AC_MSG_ERROR([$(${PKG_CONFIG} --print-errors wayland-scanner)])
> --    ])
> -+    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
> -+    if test "x$WAYLAND_SCANNER" = x; then
> -+        AC_MSG_CHECKING([for the Wayland scanner])
> -+        PKG_CHECK_EXISTS([wayland-scanner], [
> -+          WAYLAND_SCANNER="$(${PKG_CONFIG} wayland-scanner --variable wayland_scanner)"
> -+          AC_MSG_RESULT([${WAYLAND_SCANNER}])
> -+        ], [
> -+          AC_MSG_RESULT([not found])
> -+          AC_MSG_ERROR([$(${PKG_CONFIG} --print-errors wayland-scanner)])
> -+        ])
> -+    fi
> - 
> -     have_wayland="yes"
> - 
> --- 
> -2.18.0
> -
> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
> index 07aeefd193..0ce6662353 100644
> --- a/package/vlc/vlc.mk
> +++ b/package/vlc/vlc.mk
> @@ -527,6 +527,7 @@ VLC_CONF_OPTS += --disable-udev
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_WAYLAND_PROTOCOLS),yy)
> +VLC_CONF_ENV += WAYLAND_SCANNER=$(HOST_DIR)/bin/wayland-scanner
>  VLC_CONF_OPTS += --enable-wayland
>  VLC_DEPENDENCIES += wayland wayland-protocols
>  else
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
