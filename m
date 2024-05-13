Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECD0C25B78
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 22:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE04541578;
	Mon, 13 May 2024 22:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1R7eFt5DcoK; Mon, 13 May 2024 22:13:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA0694159D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA0694159D;
	Mon, 13 May 2024 22:13:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 055D81BF395
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5C414035A
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KH0ikDbYlEAq for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 22:13:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=jesseevg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7DB734031E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DB734031E
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DB734031E
 for <buildroot@buildroot.org>; Mon, 13 May 2024 22:13:38 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-dcd7c526cc0so5283434276.1
 for <buildroot@buildroot.org>; Mon, 13 May 2024 15:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715638417; x=1716243217;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w7ArxFcYZxN0NpkHwrbZT+zKZAiKdsPztRs5Mkgp4hI=;
 b=R4mCtJXemg2tAOtOzra9v9pXQjwjkMiGL2hFfemSFeb/lYiOzWRz5VMxvG3ZEXE8Yb
 MV9uGyXQYzCJNwltVCKtXsMFRLG43lnIbrxXd+rLPDkAmUrr+4LlFLtxh+Q/I1ZVCqIX
 mpWjuSdv2ffwN3a0+oDLgIJrOlPkbSxpJGZDbvpv1mX8SCx42TkBSqT6RQ3eBKw7bXPc
 OUSDF92tgoqHgic3w9QqkmKAqEhMp1K35SN+gGZagRtPJUrpodEgziEFErexc/qinhBx
 HRLromeab/hCcADGIShhPUcqIf0WIlKQKjdFCJDzsmWt3j0GwBPQWywD3lyDxvNRrzhY
 2Kgw==
X-Gm-Message-State: AOJu0YwFIJJZfFo2tTCLm/IEbJig0PKToqRkKSPsq2z0bb5L0FWghh+k
 XtNecOQwQjzkTB+zK4E9iRgJzcFf4uLPJREYhhAPM/z0YN5U/V1brdLrGIxsyMnhDejZDP7TEsH
 7F/LDC+vQ/oPTLbWNCJylc0UDmGqkbtGTIzs=
X-Google-Smtp-Source: AGHT+IERjQaVxxfyQL7UmJAECFUyiG1VJitFMTB+MmjhRHUdS14oTiWIZw9MZn61DAyrm5pred66HewbSSjv6IVFPvk=
X-Received: by 2002:a25:aaec:0:b0:dee:609c:b7bb with SMTP id
 3f1490d57ef6-dee609cba1fmr8313727276.23.1715638417054; Mon, 13 May 2024
 15:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
In-Reply-To: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Tue, 14 May 2024 00:13:25 +0200
Message-ID: <CAMdwsN-8B9D+SncpXEfgmfpQOYXqk3EBW4oCay_7UrL7=f37sQ@mail.gmail.com>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715638417; x=1716243217; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w7ArxFcYZxN0NpkHwrbZT+zKZAiKdsPztRs5Mkgp4hI=;
 b=S3WKyxCfSSgYoRlJA+jjxiVkBkyk5RceWxCr6fqjP5UaMOb7ne0CLznA+UVBIPJWkV
 z0PJq3C7ZHK9v+HTTmmTh/S/sEVV0JlbGVqXdlofiQaGKpvLad8ezAxCgl3pPbQqJmlF
 AFl5CwFjHlEhSaCgOmNTG6fcypayxgmDbWXisCvfLs96RsG060Tb5SsopUDuhy19iRax
 FdW6JtOniHrOlETL/tQwTIkafvFgVUBwU28FEWLYld8dJsjC++YDi8uiYSjyYQl8t9oj
 fKsx5LUzIs/Do5SR42Fg/2G3Dkf5nlm6braKpO4KrMvW16/NKtAqMxxKAqIvBIa3WYbu
 K96Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S3WKyxCf
Subject: Re: [Buildroot] [PATCH v4 01/14] package/qt6: bump version to 6.7.0
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8346640038110173023=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8346640038110173023==
Content-Type: multipart/alternative; boundary="0000000000006968c906185d3250"

--0000000000006968c906185d3250
Content-Type: text/plain; charset="UTF-8"

Op di 14 mei 2024 om 00:03 schreef Roy Kollen Svendsen <
roykollensvendsen@gmail.com>:

> From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
>
> For details see [1], [2], [3], [4], [5], [6], [7], [8] and [9].
>
> [1]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.0/release-note.md
> [2]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.1/release-note.md
> [3]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.2/release-note.md
> [4]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.3/release-note.md
>
> [5]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.0/release-note.md
> [6]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.1/release-note.md
> [7]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.2/release-note.md
> [8]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.3/release-note.md
>
> [9]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.0/release-note.md
>
> We also apply the associated CVE-2024-33861 patch from:
>
> https://download.qt.io/archive/qt/6.7/
>
> As Jesse Van Gavere noted:
>
> "This is not applicable to 6.4.3, the affected versions are detailed in
> the bugzilla report below and it's only 6.5.0+
> So this seems perfectly valid to go along with the version bump.
>
> OpenSUSE report:
> https://www.suse.com/security/cve/CVE-2024-33861.html
> Bugzilla report clarifying affected versions
> https://bugzilla.suse.com/show_bug.cgi?id=1223917"
>
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
> Changes v3 -> v4:
>   - Explain why the associated CVE-patch should be part of this series
>     (suggested by Thomas)
>   - Squash the CVE-patch into this patch.
>   - Add CVE-ID to QT6BASE_IGNORE_CVES. (suggested by Thomas)
>
>  package/qt6/qt6.mk                            |  4 +--
>  .../0001-Fix-CVE-2024-33861-for-Qt6.7.patch   | 36 +++++++++++++++++++
>  package/qt6/qt6base/qt6base.hash              |  4 +--
>  package/qt6/qt6base/qt6base.mk                |  2 +-
>  .../qt6/qt6core5compat/qt6core5compat.hash    |  4 +--
>  package/qt6/qt6serialbus/qt6serialbus.hash    |  4 +--
>  package/qt6/qt6serialport/qt6serialport.hash  |  4 +--
>  package/qt6/qt6svg/qt6svg.hash                |  4 +--
>  8 files changed, 49 insertions(+), 13 deletions(-)
>  create mode 100644
> package/qt6/qt6base/0001-Fix-CVE-2024-33861-for-Qt6.7.patch
>
> diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
> index 1edb252c96..b87cb6748d 100644
> --- a/package/qt6/qt6.mk
> +++ b/package/qt6/qt6.mk
> @@ -4,8 +4,8 @@
>  #
>
>  ################################################################################
>
> -QT6_VERSION_MAJOR = 6.4
> -QT6_VERSION = $(QT6_VERSION_MAJOR).3
> +QT6_VERSION_MAJOR = 6.7
> +QT6_VERSION = $(QT6_VERSION_MAJOR).0
>  QT6_SOURCE_TARBALL_PREFIX = everywhere-src
>  QT6_SITE =
> https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
>
> diff --git a/package/qt6/qt6base/0001-Fix-CVE-2024-33861-for-Qt6.7.patch
> b/package/qt6/qt6base/0001-Fix-CVE-2024-33861-for-Qt6.7.patch
> new file mode 100644
> index 0000000000..f016788017
> --- /dev/null
> +++ b/package/qt6/qt6base/0001-Fix-CVE-2024-33861-for-Qt6.7.patch
> @@ -0,0 +1,36 @@
> +From 7f88945625f560796c86a267086f163e74c1407b Mon Sep 17 00:00:00 2001
> +From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
> +Date: Sun, 12 May 2024 07:15:32 +0200
> +Subject: [PATCH] Fix CVE-2024-33861 for Qt6.7
> +
> +Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com
> >
> +Upstream:
> https://download.qt.io/archive/qt/6.7/CVE-2024-33861-qtbase-6.7.diff
> +---
> + src/corelib/text/qstringconverter.cpp | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/corelib/text/qstringconverter.cpp
> b/src/corelib/text/qstringconverter.cpp
> +index b5749843..fd45ccf2 100644
> +--- a/src/corelib/text/qstringconverter.cpp
> ++++ b/src/corelib/text/qstringconverter.cpp
> +@@ -1954,7 +1954,7 @@ struct QStringConverterICU : QStringConverter
> +         const void *context;
> +         ucnv_getToUCallBack(icu_conv, &action, &context);
> +         if (context != state)
> +-             ucnv_setToUCallBack(icu_conv, action, &state, nullptr,
> nullptr, &err);
> ++             ucnv_setToUCallBack(icu_conv, action, state, nullptr,
> nullptr, &err);
> +
> +         ucnv_toUnicode(icu_conv, &target, targetLimit, &source,
> sourceLimit, nullptr, flush, &err);
> +         // We did reserve enough space:
> +@@ -1987,7 +1987,7 @@ struct QStringConverterICU : QStringConverter
> +         const void *context;
> +         ucnv_getFromUCallBack(icu_conv, &action, &context);
> +         if (context != state)
> +-             ucnv_setFromUCallBack(icu_conv, action, &state, nullptr,
> nullptr, &err);
> ++             ucnv_setFromUCallBack(icu_conv, action, state, nullptr,
> nullptr, &err);
> +
> +         ucnv_fromUnicode(icu_conv, &target, targetLimit, &source,
> sourceLimit, nullptr, flush, &err);
> +         // We did reserve enough space:
> +--
> +2.45.0
> +
> diff --git a/package/qt6/qt6base/qt6base.hash
> b/package/qt6/qt6base/qt6base.hash
> index cb111bd405..0f45826a45 100644
> --- a/package/qt6/qt6base/qt6base.hash
> +++ b/package/qt6/qt6base/qt6base.hash
> @@ -1,5 +1,5 @@
> -# Hash from:
> https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtbase-everywhere-src-6.4.3.tar.xz.sha256
> -sha256
> <https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtbase-everywhere-src-6.4.3.tar.xz.sha256-sha256>
> 5087c9e5b0165e7bc3c1a4ab176b35d0cd8f52636aea903fa377bdba00891a60
> qtbase-everywhere-src-6.4.3.tar.xz
> +# Hash from:
> https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtbase-everywhere-src-6.7.0.tar.xz.sha256
> +sha256
> <https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtbase-everywhere-src-6.7.0.tar.xz.sha256+sha256>
> 11b2e29e2e52fb0e3b453ea13bbe51a10fdff36e1c192d8868c5a40233b8b254
> qtbase-everywhere-src-6.7.0.tar.xz
>
>  # Hashes for license files
>  sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb
> LICENSES/Apache-2.0.txt
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/
> qt6base.mk
> index 6857725ef5..b8040e395b 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -9,7 +9,7 @@ QT6BASE_SITE = $(QT6_SITE)
>  QT6BASE_SOURCE =
> qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
>  QT6BASE_CPE_ID_VENDOR = qt
>  QT6BASE_CPE_ID_PRODUCT = qt
> -
> +QT6BASE_IGNORE_CVES = CVE-2024-33861
>  QT6BASE_CMAKE_BACKEND = ninja
>
>  QT6BASE_LICENSE = \
> diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash
> b/package/qt6/qt6core5compat/qt6core5compat.hash
> index 0735df3af2..1eb0b5b460 100644
> --- a/package/qt6/qt6core5compat/qt6core5compat.hash
> +++ b/package/qt6/qt6core5compat/qt6core5compat.hash
> @@ -1,5 +1,5 @@
> -# Hash from:
> https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256
> -sha256
> <https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256-sha256>
> d4b249abb823d575eee9045c24d924ba8d1276e6be7735b287689991d998aa7a
> qt5compat-everywhere-src-6.4.3.tar.xz
> +# Hash from:
> https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qt5compat-everywhere-src-6.7.0.tar.xz.sha256
> +sha256
> <https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qt5compat-everywhere-src-6.7.0.tar.xz.sha256+sha256>
> 9d49d4fd8345d8a40b63e0b65cd49c1d8286e33a7f1409bf1316763f654e19f5
> qt5compat-everywhere-src-6.7.0.tar.xz
>
>  # Hashes for license files:
>  sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash
> b/package/qt6/qt6serialbus/qt6serialbus.hash
> index 98c8931962..17d5090076 100644
> --- a/package/qt6/qt6serialbus/qt6serialbus.hash
> +++ b/package/qt6/qt6serialbus/qt6serialbus.hash
> @@ -1,5 +1,5 @@
> -# Hash from:
> https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialbus-everywhere-src-6.4.3.tar.xz.sha256
> -sha256
> <https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialbus-everywhere-src-6.4.3.tar.xz.sha256-sha256>
> b6446a7516d1f04e561c00f9c50ce4d39dad72150f067722ba759f00b4b34366
> qtserialbus-everywhere-src-6.4.3.tar.xz
> +# Hash from:
> https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtserialbus-everywhere-src-6.7.0.tar.xz.sha256
> +sha256
> <https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtserialbus-everywhere-src-6.7.0.tar.xz.sha256+sha256>
> 498193a9860664f8a55f676656c45af179ac13d48184af43fc58ddf795bb76dd
> qtserialbus-everywhere-src-6.7.0.tar.xz
>
>  # Hashes for license files:
>  sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6serialport/qt6serialport.hash
> b/package/qt6/qt6serialport/qt6serialport.hash
> index 9341978d86..cd51fbe435 100644
> --- a/package/qt6/qt6serialport/qt6serialport.hash
> +++ b/package/qt6/qt6serialport/qt6serialport.hash
> @@ -1,5 +1,5 @@
> -# Hash from:
> https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256
> -sha256
> <https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256-sha256>
> 5f97ad9067efa39a8a2a39fbbc1e03d2191f305733d9c2f3060f8017ecfc95de
> qtserialport-everywhere-src-6.4.3.tar.xz
> +# Hash from:
> https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtserialport-everywhere-src-6.7.0.tar.xz.sha256
> +sha256
> <https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtserialport-everywhere-src-6.7.0.tar.xz.sha256+sha256>
> b1f02a3d8c9cc8ba2ffa7cca3749f1f147d327e8dfc633fd4ec3cb770d7981c9
> qtserialport-everywhere-src-6.7.0.tar.xz
>
>  # Hashes for license files:
>  sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6svg/qt6svg.hash
> b/package/qt6/qt6svg/qt6svg.hash
> index bb239cb012..32c1a79a5c 100644
> --- a/package/qt6/qt6svg/qt6svg.hash
> +++ b/package/qt6/qt6svg/qt6svg.hash
> @@ -1,5 +1,5 @@
> -# Hash from:
> https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtsvg-everywhere-src-6.4.3.tar.xz.sha256
> -sha256
> <https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtsvg-everywhere-src-6.4.3.tar.xz.sha256-sha256>
> 88315f886cf81898705e487cedba6e6160724359d23c518c92c333c098879a4a
> qtsvg-everywhere-src-6.4.3.tar.xz
> +# Hash from:
> https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtsvg-everywhere-src-6.7.0.tar.xz.sha256
> +sha256
> <https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtsvg-everywhere-src-6.7.0.tar.xz.sha256+sha256>
> 1518f40e08ff5e6153a6e26e5b95b033413ac143b70795dc1317e7f73ebf922d
> qtsvg-everywhere-src-6.7.0.tar.xz
>
>  # Hashes for license files:
>  sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> --
> 2.45.0
>
>
Acked-by: Jesse Van Gavere <jesse.vangavere@scioteq.com>

Of course testing a huge module like Qt fully is difficult given all the
possible options but with these new iterations I tested them as good as I
could and I feel confident this series is good to go as-is, great work Roy.

--0000000000006968c906185d3250
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Op di 14 mei 2024 om 00:03 schreef Ro=
y Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com">roykol=
lensvendsen@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">From: Roy Kollen Svendsen &lt;<a href=3D"mailto:roy.kollen.s=
vendsen@akersolutions.com" target=3D"_blank">roy.kollen.svendsen@akersoluti=
ons.com</a>&gt;<br>
<br>
For details see [1], [2], [3], [4], [5], [6], [7], [8] and [9].<br>
<br>
[1] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.0=
/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/c=
git/qt/qtreleasenotes.git/about/qt/6.5.0/release-note.md</a><br>
[2] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.1=
/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/c=
git/qt/qtreleasenotes.git/about/qt/6.5.1/release-note.md</a><br>
[3] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.2=
/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/c=
git/qt/qtreleasenotes.git/about/qt/6.5.2/release-note.md</a><br>
[4] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.3=
/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/c=
git/qt/qtreleasenotes.git/about/qt/6.5.3/release-note.md</a><br>
<br>
[5] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.0=
/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/c=
git/qt/qtreleasenotes.git/about/qt/6.6.0/release-note.md</a><br>
[6] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.1=
/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/c=
git/qt/qtreleasenotes.git/about/qt/6.6.1/release-note.md</a><br>
[7] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.2=
/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/c=
git/qt/qtreleasenotes.git/about/qt/6.6.2/release-note.md</a><br>
[8] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.3=
/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/c=
git/qt/qtreleasenotes.git/about/qt/6.6.3/release-note.md</a><br>
<br>
[9] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.0=
/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/c=
git/qt/qtreleasenotes.git/about/qt/6.7.0/release-note.md</a><br>
<br>
We also apply the associated CVE-2024-33861 patch from:<br>
<br>
<a href=3D"https://download.qt.io/archive/qt/6.7/" rel=3D"noreferrer" targe=
t=3D"_blank">https://download.qt.io/archive/qt/6.7/</a><br>
<br>
As Jesse Van Gavere noted:<br>
<br>
&quot;This is not applicable to 6.4.3, the affected versions are detailed i=
n<br>
the bugzilla report below and it&#39;s only 6.5.0+<br>
So this seems perfectly valid to go along with the version bump.<br>
<br>
OpenSUSE report:<br>
<a href=3D"https://www.suse.com/security/cve/CVE-2024-33861.html" rel=3D"no=
referrer" target=3D"_blank">https://www.suse.com/security/cve/CVE-2024-3386=
1.html</a><br>
Bugzilla report clarifying affected versions<br>
<a href=3D"https://bugzilla.suse.com/show_bug.cgi?id=3D1223917" rel=3D"nore=
ferrer" target=3D"_blank">https://bugzilla.suse.com/show_bug.cgi?id=3D12239=
17</a>&quot;<br>
<br>
Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@=
gmail.com" target=3D"_blank">roykollensvendsen@gmail.com</a>&gt;<br>
---<br>
Changes v3 -&gt; v4:<br>
=C2=A0 - Explain why the associated CVE-patch should be part of this series=
<br>
=C2=A0 =C2=A0 (suggested by Thomas)<br>
=C2=A0 - Squash the CVE-patch into this patch.<br>
=C2=A0 - Add CVE-ID to QT6BASE_IGNORE_CVES. (suggested by Thomas)<br>
<br>
=C2=A0package/qt6/<a href=3D"http://qt6.mk" rel=3D"noreferrer" target=3D"_b=
lank">qt6.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +--<br>
=C2=A0.../0001-Fix-CVE-2024-33861-for-Qt6.7.patch=C2=A0 =C2=A0| 36 ++++++++=
+++++++++++<br>
=C2=A0package/qt6/qt6base/qt6base.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 4 +--<br>
=C2=A0package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0.../qt6/qt6core5compat/qt6core5compat.hash=C2=A0 =C2=A0 |=C2=A0 4 +--=
<br>
=C2=A0package/qt6/qt6serialbus/qt6serialbus.hash=C2=A0 =C2=A0 |=C2=A0 4 +--=
<br>
=C2=A0package/qt6/qt6serialport/qt6serialport.hash=C2=A0 |=C2=A0 4 +--<br>
=C2=A0package/qt6/qt6svg/qt6svg.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 4 +--<br>
=C2=A08 files changed, 49 insertions(+), 13 deletions(-)<br>
=C2=A0create mode 100644 package/qt6/qt6base/0001-Fix-CVE-2024-33861-for-Qt=
6.7.patch<br>
<br>
diff --git a/package/qt6/<a href=3D"http://qt6.mk" rel=3D"noreferrer" targe=
t=3D"_blank">qt6.mk</a> b/package/qt6/<a href=3D"http://qt6.mk" rel=3D"nore=
ferrer" target=3D"_blank">qt6.mk</a><br>
index 1edb252c96..b87cb6748d 100644<br>
--- a/package/qt6/<a href=3D"http://qt6.mk" rel=3D"noreferrer" target=3D"_b=
lank">qt6.mk</a><br>
+++ b/package/qt6/<a href=3D"http://qt6.mk" rel=3D"noreferrer" target=3D"_b=
lank">qt6.mk</a><br>
@@ -4,8 +4,8 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-QT6_VERSION_MAJOR =3D 6.4<br>
-QT6_VERSION =3D $(QT6_VERSION_MAJOR).3<br>
+QT6_VERSION_MAJOR =3D 6.7<br>
+QT6_VERSION =3D $(QT6_VERSION_MAJOR).0<br>
=C2=A0QT6_SOURCE_TARBALL_PREFIX =3D everywhere-src<br>
=C2=A0QT6_SITE =3D <a href=3D"https://download.qt.io/archive/qt/$(QT6_VERSI=
ON_MAJOR)/$(QT6_VERSION)/submodules" rel=3D"noreferrer" target=3D"_blank">h=
ttps://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submod=
ules</a><br>
<br>
diff --git a/package/qt6/qt6base/0001-Fix-CVE-2024-33861-for-Qt6.7.patch b/=
package/qt6/qt6base/0001-Fix-CVE-2024-33861-for-Qt6.7.patch<br>
new file mode 100644<br>
index 0000000000..f016788017<br>
--- /dev/null<br>
+++ b/package/qt6/qt6base/0001-Fix-CVE-2024-33861-for-Qt6.7.patch<br>
@@ -0,0 +1,36 @@<br>
+From 7f88945625f560796c86a267086f163e74c1407b Mon Sep 17 00:00:00 2001<br>
+From: Roy Kollen Svendsen &lt;<a href=3D"mailto:roy.kollen.svendsen@akerso=
lutions.com" target=3D"_blank">roy.kollen.svendsen@akersolutions.com</a>&gt=
;<br>
+Date: Sun, 12 May 2024 07:15:32 +0200<br>
+Subject: [PATCH] Fix CVE-2024-33861 for Qt6.7<br>
+<br>
+Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roy.kollen.svends=
en@akersolutions.com" target=3D"_blank">roy.kollen.svendsen@akersolutions.c=
om</a>&gt;<br>
+Upstream: <a href=3D"https://download.qt.io/archive/qt/6.7/CVE-2024-33861-=
qtbase-6.7.diff" rel=3D"noreferrer" target=3D"_blank">https://download.qt.i=
o/archive/qt/6.7/CVE-2024-33861-qtbase-6.7.diff</a><br>
+---<br>
+ src/corelib/text/qstringconverter.cpp | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/corelib/text/qstringconverter.cpp b/src/corelib/text/qstr=
ingconverter.cpp<br>
+index b5749843..fd45ccf2 100644<br>
+--- a/src/corelib/text/qstringconverter.cpp<br>
++++ b/src/corelib/text/qstringconverter.cpp<br>
+@@ -1954,7 +1954,7 @@ struct QStringConverterICU : QStringConverter<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const void *context;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ucnv_getToUCallBack(icu_conv, &amp;actio=
n, &amp;context);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (context !=3D state)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ucnv_setToUCallBack(icu_c=
onv, action, &amp;state, nullptr, nullptr, &amp;err);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ucnv_setToUCallBack(icu_c=
onv, action, state, nullptr, nullptr, &amp;err);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ucnv_toUnicode(icu_conv, &amp;target, ta=
rgetLimit, &amp;source, sourceLimit, nullptr, flush, &amp;err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// We did reserve enough space:<br>
+@@ -1987,7 +1987,7 @@ struct QStringConverterICU : QStringConverter<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const void *context;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ucnv_getFromUCallBack(icu_conv, &amp;act=
ion, &amp;context);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (context !=3D state)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ucnv_setFromUCallBack(icu=
_conv, action, &amp;state, nullptr, nullptr, &amp;err);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ucnv_setFromUCallBack(icu=
_conv, action, state, nullptr, nullptr, &amp;err);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ucnv_fromUnicode(icu_conv, &amp;target, =
targetLimit, &amp;source, sourceLimit, nullptr, flush, &amp;err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// We did reserve enough space:<br>
+-- <br>
+2.45.0<br>
+<br>
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base=
.hash<br>
index cb111bd405..0f45826a45 100644<br>
--- a/package/qt6/qt6base/qt6base.hash<br>
+++ b/package/qt6/qt6base/qt6base.hash<br>
@@ -1,5 +1,5 @@<br>
-# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.4/6.=
4.3/submodules/qtbase-everywhere-src-6.4.3.tar.xz.sha256-sha256" rel=3D"nor=
eferrer" target=3D"_blank">https://download.qt.io/official_releases/qt/6.4/=
6.4.3/submodules/qtbase-everywhere-src-6.4.3.tar.xz.sha256<br>
-sha256</a>=C2=A0 5087c9e5b0165e7bc3c1a4ab176b35d0cd8f52636aea903fa377bdba0=
0891a60=C2=A0 qtbase-everywhere-src-6.4.3.tar.xz<br>
+# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.7/6.=
7.0/submodules/qtbase-everywhere-src-6.7.0.tar.xz.sha256+sha256" rel=3D"nor=
eferrer" target=3D"_blank">https://download.qt.io/official_releases/qt/6.7/=
6.7.0/submodules/qtbase-everywhere-src-6.7.0.tar.xz.sha256<br>
+sha256</a>=C2=A0 11b2e29e2e52fb0e3b453ea13bbe51a10fdff36e1c192d8868c5a4023=
3b8b254=C2=A0 qtbase-everywhere-src-6.7.0.tar.xz<br>
<br>
=C2=A0# Hashes for license files<br>
=C2=A0sha256=C2=A0 e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff=
9e1c89cb=C2=A0 LICENSES/Apache-2.0.txt<br>
diff --git a/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noref=
errer" target=3D"_blank">qt6base.mk</a> b/package/qt6/qt6base/<a href=3D"ht=
tp://qt6base.mk" rel=3D"noreferrer" target=3D"_blank">qt6base.mk</a><br>
index 6857725ef5..b8040e395b 100644<br>
--- a/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a><br>
+++ b/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a><br>
@@ -9,7 +9,7 @@ QT6BASE_SITE =3D $(QT6_SITE)<br>
=C2=A0QT6BASE_SOURCE =3D qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERS=
ION).tar.xz<br>
=C2=A0QT6BASE_CPE_ID_VENDOR =3D qt<br>
=C2=A0QT6BASE_CPE_ID_PRODUCT =3D qt<br>
-<br>
+QT6BASE_IGNORE_CVES =3D CVE-2024-33861<br>
=C2=A0QT6BASE_CMAKE_BACKEND =3D ninja<br>
<br>
=C2=A0QT6BASE_LICENSE =3D \<br>
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/q=
t6core5compat/qt6core5compat.hash<br>
index 0735df3af2..1eb0b5b460 100644<br>
--- a/package/qt6/qt6core5compat/qt6core5compat.hash<br>
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash<br>
@@ -1,5 +1,5 @@<br>
-# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.4/6.=
4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256-sha256" rel=
=3D"noreferrer" target=3D"_blank">https://download.qt.io/official_releases/=
qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256<br>
-sha256</a>=C2=A0 d4b249abb823d575eee9045c24d924ba8d1276e6be7735b287689991d=
998aa7a=C2=A0 qt5compat-everywhere-src-6.4.3.tar.xz<br>
+# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.7/6.=
7.0/submodules/qt5compat-everywhere-src-6.7.0.tar.xz.sha256+sha256" rel=3D"=
noreferrer" target=3D"_blank">https://download.qt.io/official_releases/qt/6=
.7/6.7.0/submodules/qt5compat-everywhere-src-6.7.0.tar.xz.sha256<br>
+sha256</a>=C2=A0 9d49d4fd8345d8a40b63e0b65cd49c1d8286e33a7f1409bf1316763f6=
54e19f5=C2=A0 qt5compat-everywhere-src-6.7.0.tar.xz<br>
<br>
=C2=A0# Hashes for license files:<br>
=C2=A0sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb4=
2ed1dcce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6se=
rialbus/qt6serialbus.hash<br>
index 98c8931962..17d5090076 100644<br>
--- a/package/qt6/qt6serialbus/qt6serialbus.hash<br>
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash<br>
@@ -1,5 +1,5 @@<br>
-# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.4/6.=
4.3/submodules/qtserialbus-everywhere-src-6.4.3.tar.xz.sha256-sha256" rel=
=3D"noreferrer" target=3D"_blank">https://download.qt.io/official_releases/=
qt/6.4/6.4.3/submodules/qtserialbus-everywhere-src-6.4.3.tar.xz.sha256<br>
-sha256</a>=C2=A0 b6446a7516d1f04e561c00f9c50ce4d39dad72150f067722ba759f00b=
4b34366=C2=A0 qtserialbus-everywhere-src-6.4.3.tar.xz<br>
+# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.7/6.=
7.0/submodules/qtserialbus-everywhere-src-6.7.0.tar.xz.sha256+sha256" rel=
=3D"noreferrer" target=3D"_blank">https://download.qt.io/official_releases/=
qt/6.7/6.7.0/submodules/qtserialbus-everywhere-src-6.7.0.tar.xz.sha256<br>
+sha256</a>=C2=A0 498193a9860664f8a55f676656c45af179ac13d48184af43fc58ddf79=
5bb76dd=C2=A0 qtserialbus-everywhere-src-6.7.0.tar.xz<br>
<br>
=C2=A0# Hashes for license files:<br>
=C2=A0sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb4=
2ed1dcce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6=
serialport/qt6serialport.hash<br>
index 9341978d86..cd51fbe435 100644<br>
--- a/package/qt6/qt6serialport/qt6serialport.hash<br>
+++ b/package/qt6/qt6serialport/qt6serialport.hash<br>
@@ -1,5 +1,5 @@<br>
-# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.4/6.=
4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256-sha256" rel=
=3D"noreferrer" target=3D"_blank">https://download.qt.io/official_releases/=
qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256<br>
-sha256</a>=C2=A0 5f97ad9067efa39a8a2a39fbbc1e03d2191f305733d9c2f3060f8017e=
cfc95de=C2=A0 qtserialport-everywhere-src-6.4.3.tar.xz<br>
+# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.7/6.=
7.0/submodules/qtserialport-everywhere-src-6.7.0.tar.xz.sha256+sha256" rel=
=3D"noreferrer" target=3D"_blank">https://download.qt.io/official_releases/=
qt/6.7/6.7.0/submodules/qtserialport-everywhere-src-6.7.0.tar.xz.sha256<br>
+sha256</a>=C2=A0 b1f02a3d8c9cc8ba2ffa7cca3749f1f147d327e8dfc633fd4ec3cb770=
d7981c9=C2=A0 qtserialport-everywhere-src-6.7.0.tar.xz<br>
<br>
=C2=A0# Hashes for license files:<br>
=C2=A0sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb4=
2ed1dcce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.has=
h<br>
index bb239cb012..32c1a79a5c 100644<br>
--- a/package/qt6/qt6svg/qt6svg.hash<br>
+++ b/package/qt6/qt6svg/qt6svg.hash<br>
@@ -1,5 +1,5 @@<br>
-# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.4/6.=
4.3/submodules/qtsvg-everywhere-src-6.4.3.tar.xz.sha256-sha256" rel=3D"nore=
ferrer" target=3D"_blank">https://download.qt.io/official_releases/qt/6.4/6=
.4.3/submodules/qtsvg-everywhere-src-6.4.3.tar.xz.sha256<br>
-sha256</a>=C2=A0 88315f886cf81898705e487cedba6e6160724359d23c518c92c333c09=
8879a4a=C2=A0 qtsvg-everywhere-src-6.4.3.tar.xz<br>
+# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.7/6.=
7.0/submodules/qtsvg-everywhere-src-6.7.0.tar.xz.sha256+sha256" rel=3D"nore=
ferrer" target=3D"_blank">https://download.qt.io/official_releases/qt/6.7/6=
.7.0/submodules/qtsvg-everywhere-src-6.7.0.tar.xz.sha256<br>
+sha256</a>=C2=A0 1518f40e08ff5e6153a6e26e5b95b033413ac143b70795dc1317e7f73=
ebf922d=C2=A0 qtsvg-everywhere-src-6.7.0.tar.xz<br>
<br>
=C2=A0# Hashes for license files:<br>
=C2=A0sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb4=
2ed1dcce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
-- <br>
2.45.0<br>
<br></blockquote><div><br></div><div>
<div>Acked-by: Jesse Van Gavere &lt;<a href=3D"mailto:jesse.vangavere@sciot=
eq.com" target=3D"_blank">jesse.vangavere@scioteq.com</a>&gt;</div><div><br=
></div><div>Of
 course testing a huge module like Qt fully is difficult given all the=20
possible options but with these new iterations I tested them as good as I
 could and I feel confident this series is good to go as-is, great work=20
Roy.</div>=C2=A0 <br></div></div></div>

--0000000000006968c906185d3250--

--===============8346640038110173023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8346640038110173023==--
