Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951BAC433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 00:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06983817AF;
	Sat, 29 Jan 2022 00:39:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NrW9Iic1TYRe; Sat, 29 Jan 2022 00:39:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54302817A4;
	Sat, 29 Jan 2022 00:39:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 220E01C1190
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 00:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D61F60879
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 00:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJ60APc0n-wK for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 00:39:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC6756080B
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 00:39:09 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 b15-20020a4a878f000000b002dccc412166so1818612ooi.11
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 16:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HKQuEQbjS8LkkDihqmE4OsQNKXlUp5O2s7kneJtTD3U=;
 b=CrOUuI9ShDK/cqSoclGWfguScCxtPqLqAV25lHtrz0VwAVT3EOcT4xrf+L1AT0fWKj
 JnoTlJ84F0D1wJv7pKCmJq3P1BoC2aAKrcKbR5RkFKWkLkBW1cu0u9bktRUz5QfLrSvA
 ++MtJ/ppgpDldJgulbDlSl/mn15Qr/LepKRovx9x3vOj2cgMmqAJEbOcPwPICUViQOSn
 vAVY0qYY9MQaAdBkEu5rehE5u9eSiy5cleBhpFfb1wVjhZJQCAHxyrp4athukjN9NtmX
 jpTGodAQA6Lhps8dRC2FooYkDxVGY2xv8By7O2oaLDRgRRrTujBWifbcJ01FM09kej5b
 O2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HKQuEQbjS8LkkDihqmE4OsQNKXlUp5O2s7kneJtTD3U=;
 b=Ia59Wz4ELQzdD8cyCXVL9yRkEF3KO+CgslnB2Of4iJZhxFjMddnW96Kh+hxVL3om6J
 VBbRjWAm9uWcbdUVAJ0sVOGn02R6GU1oPVAlOv+ClCGC+qRviTQPrqWvd83IdajwqDke
 NBIATlrHtVVFDiLrQAqUxXlGlMB4vlzQJ8YyPrMbxs5j8ED2a5xh03xEzIgn04eXA4OE
 nVdgppAAFejyPDee44pz2cpIlE8xmIJuoHsbIX+N8UzNi7sI3CwujufiiYM6GUqUGerF
 5LyLKXodPz3b6jtqrbMcQyrzUMXw0zoeAhNJBumKgCkcrsNeHJOBnbBDXNz1yFiBiGDE
 xAwQ==
X-Gm-Message-State: AOAM532FaYcmnTCCSGKeu0ec6TyUh/GefNeyPhgHxV5hNWA4stmPAK4F
 zShaLH9Q/K3eeNQti3R4/3Ob2JOU/G2BUMn8usM=
X-Google-Smtp-Source: ABdhPJwdoXJA8jthSUqL4i8nFSLDDOt0Mnp7bJStL9x686d8U7ElVDZgZh8eUhUKmxffJdWSUTw/8rkbEx/PCO8d3Bg=
X-Received: by 2002:a4a:e965:: with SMTP id i5mr5532844ooe.22.1643416748859;
 Fri, 28 Jan 2022 16:39:08 -0800 (PST)
MIME-Version: 1.0
References: <20220116214955.3231899-1-fontaine.fabrice@gmail.com>
 <20220116214955.3231899-2-fontaine.fabrice@gmail.com>
In-Reply-To: <20220116214955.3231899-2-fontaine.fabrice@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 28 Jan 2022 17:38:57 -0700
Message-ID: <CADvTj4oZCjtb9pNt-UzzJhpK4eqGatW1sGbrJBdJNDop7jys7A@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/3] package/qt5/qt5webkit: fix build
 without opengl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Corjon <corjon.j@ecagroup.com>, Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jan 16, 2022 at 2:51 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Fix the following build failure without opengl raised since bump to
> version 5.212.0-alpha4 in commit
> df0b0fe6919c0d0f3750f439a3cfa765232bd569:
>
> CMake Error at Source/cmake/OptionsQt.cmake:592 (message):
>   Qt with OpenGL support is required for ENABLE_OPENGL
>
> WebKit2 unconditionally depends on TextureMapperGL.h and tools builds
> QtTestBrowser which unconditionally depends on QtOpenGL
>
> Fixes:
>  - http://autobuild.buildroot.org/results/5604555279f99ba0221dd8d0baf9ab4d7cca3aed
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/qt5/qt5webkit/qt5webkit.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
> index 3af1918a46..de3c428fbe 100644
> --- a/package/qt5/qt5webkit/qt5webkit.mk
> +++ b/package/qt5/qt5webkit/qt5webkit.mk
> @@ -20,6 +20,16 @@ QT5WEBKIT_LICENSE = LGPL-2.1+, BSD-3-Clause, BSD-2-Clause
>  # in the archive.
>  QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
>
> +ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL),y)
> +QT5WEBKIT_CONF_OPTS += \
> +       -DENABLE_OPENGL=ON \
> +       -DENABLE_WEBKIT2=ON
> +else
> +QT5WEBKIT_CONF_OPTS += \
> +       -DENABLE_OPENGL=OFF \
> +       -DENABLE_WEBKIT2=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
>  QT5WEBKIT_DEPENDENCIES += xlib_libXcomposite xlib_libXext xlib_libXrender
>  endif
> @@ -29,6 +39,7 @@ QT5WEBKIT_DEPENDENCIES += qt5declarative
>  endif
>
>  QT5WEBKIT_CONF_OPTS += \
> +       -DENABLE_TOOLS=OFF \
>         -DPORT=Qt \
>         -DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
>         -DUSE_LIBHYPHEN=OFF
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
