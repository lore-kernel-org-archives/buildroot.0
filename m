Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42251EE49A5
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 13:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E770940162;
	Wed, 11 Sep 2024 13:49:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pg3DDKpqwLzT; Wed, 11 Sep 2024 13:49:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A73E4029F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A73E4029F;
	Wed, 11 Sep 2024 13:49:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F8451BF342
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B61D60AC7
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cjEkLue7Qltl for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:49:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E221608D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E221608D7
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E221608D7
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:49:12 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e1a7e54b898so6485191276.2
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 06:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726062551; x=1726667351;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=99ruOvR6litEmjRRpH0APhytwYKLb3wt+OFObGNca/8=;
 b=TT1Wgj7yBqUhWl5SrgNiOmm4/VKpt61w7plXzWXeiWB8d3OT75s451PIw1djvJ/pKv
 2IpUeN9yr4lRkG2n4aqNvfqVljwvSoheAMacm81EU798OIIxa19BiBhf7LCZxnIaa5rY
 JXsahbB8N/LrWOiWbXsQ7rqrdQQouDSuOEfw7/6xCiqZAyNmtwliNGCZreXfkezQvXSu
 gowGlxjahU/NEi25dbTztYMeCwj/ai9D85LprEf1ZZRayPer8FOx35jhtRkwpVIULMBQ
 HzKW4Gqqq8EffW8iQmPfDTqN36TmxEeNLMmbM5Mp8uWFI/pKC8JVHVlnwMcgBgfAm703
 Fuxw==
X-Gm-Message-State: AOJu0Yznjkyq43A4IKa6Ckv6LABvligQiYVRaB1me5whjUvXuEZrdGOd
 ++ZOKD+NEsvD2KIRVeIV/p27F0tuytJOgsRbS64M+xPiagbJwErA63awi36Ggo3gWBTdV5EUkGB
 qFwfL4cHeCWtZeyA3kP5l9wHtR/4=
X-Google-Smtp-Source: AGHT+IH1lkno/JbVHtzMmEEGPA8IQCOBVdZ57kzEkeiyb+6gwV05Iy4vFlf1WcvkRzAK4P/jNYJTpdGOuHcOK3zGAlE=
X-Received: by 2002:a05:690c:5:b0:6af:55ec:3cd7 with SMTP id
 00721157ae682-6db451542a8mr154560187b3.28.1726062550900; Wed, 11 Sep 2024
 06:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240911131503.2305836-1-christian@klarinett.li>
In-Reply-To: <20240911131503.2305836-1-christian@klarinett.li>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Wed, 11 Sep 2024 15:48:59 +0200
Message-ID: <CA+R_deo8j1NWt8BkPJwFViVAOgmHe0h4TY9mXvu1YcY0fBYpJw@mail.gmail.com>
To: Christian Hitz <christian@klarinett.li>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726062551; x=1726667351; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=99ruOvR6litEmjRRpH0APhytwYKLb3wt+OFObGNca/8=;
 b=Bnf6+/7bHmugwNveSXbpSJsxDLDKRFw+0wMYqak1i49Pa2PXQ5G1URVz8A01rdTAWH
 SyVKAmXV1/lvCY4eppT+tfsJPcWqK1h3ni2TObWAjK3bHw1JJ8yt0uvK6Fb/jJ4DDaum
 NG8uQf6Bqtka+KR/ATkwy3vkQUrRVkecsUHk5aypXHzcS6cITZoWQfCSrYil4ENAato6
 HdCr9Or2W6PdH8WOUrqvH38SaIv83xAW7AM+gBpCu4er4iccReGw+Z00luhKHQygMzKT
 WcntAejn7lpUu1Zo8bbbeUbQRzUB277FwqIMseDtheweNBY8vBUdu/xDNRjBd02AcHWq
 4QdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Bnf6+/7b
Subject: Re: [Buildroot] [PATCH] package/qt6/qt6scxml: new package
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
Cc: Christian Hitz <christian.hitz@bbv.ch>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ons. 11. sep. 2024 kl. 15:15 skrev Christian Hitz <christian@klarinett.li>:
>
> From: Christian Hitz <christian.hitz@bbv.ch>
>
> Cross-compiling requires the host variant of the same package.
>
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> ---
>  package/qt6/Config.in              |  1 +
>  package/qt6/qt6scxml/Config.in     | 11 ++++++++
>  package/qt6/qt6scxml/qt6scxml.hash | 11 ++++++++
>  package/qt6/qt6scxml/qt6scxml.mk   | 40 ++++++++++++++++++++++++++++++
>  4 files changed, 63 insertions(+)
>  create mode 100644 package/qt6/qt6scxml/Config.in
>  create mode 100644 package/qt6/qt6scxml/qt6scxml.hash
>  create mode 100644 package/qt6/qt6scxml/qt6scxml.mk
>
> diff --git a/package/qt6/Config.in b/package/qt6/Config.in
> index 29c1c25c7f..4cbb60322c 100644
> --- a/package/qt6/Config.in
> +++ b/package/qt6/Config.in
> @@ -49,6 +49,7 @@ source "package/qt6/qt6declarative/Config.in"
>  source "package/qt6/qt6languageserver/Config.in"
>  source "package/qt6/qt6mqtt/Config.in"
>  source "package/qt6/qt6opcua/Config.in"
> +source "package/qt6/qt6scxml/Config.in"
>  source "package/qt6/qt6serialbus/Config.in"
>  source "package/qt6/qt6serialport/Config.in"
>  source "package/qt6/qt6shadertools/Config.in"
> diff --git a/package/qt6/qt6scxml/Config.in b/package/qt6/qt6scxml/Config.in
> new file mode 100644
> index 0000000000..23561f61bc
> --- /dev/null
> +++ b/package/qt6/qt6scxml/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_QT6SCXML
> +       bool "qt6scxml"
> +       select BR2_PACKAGE_QT6DECLARATIVE

According to dependencies.yaml qtdeclarative is optional:


> +       help
> +         Qt is a cross-platform application and UI framework for
> +         developers using C++.
> +
> +         The Qt SCXML module provides functionality to create state
> +         machines from SCXML files.
> +
> +         https://doc.qt.io/qt-6/qtscxml-index.html
> diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6scxml.hash
> new file mode 100644
> index 0000000000..6c39be214a
> --- /dev/null
> +++ b/package/qt6/qt6scxml/qt6scxml.hash
> @@ -0,0 +1,11 @@
> +# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtscxml-everywhere-src-6.7.2.tar.xz.sha256
> +sha256  20ecf93506d48f27b492ad3dd9d88830e08d642faec3071ce53396a8ae05c86f  qtscxml-everywhere-src-6.7.2.tar.xz
> +
> +# Hashes for license files:
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
> +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
> +sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
> diff --git a/package/qt6/qt6scxml/qt6scxml.mk b/package/qt6/qt6scxml/qt6scxml.mk
> new file mode 100644
> index 0000000000..a455b01257
> --- /dev/null
> +++ b/package/qt6/qt6scxml/qt6scxml.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# qt6scxml
> +#
> +################################################################################
> +
> +QT6SCXML_VERSION = $(QT6_VERSION)
> +QT6SCXML_SITE = $(QT6_SITE)
> +QT6SCXML_SOURCE = qtscxml-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6CONNECTIVITY_VERSION).tar.xz
> +QT6SCXML_INSTALL_STAGING = YES
> +QT6SCXML_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +QT6SCXML_CMAKE_BACKEND = ninja
> +
> +QT6SCXML_LICENSE = \
> +       GPL-2.0+ or LGPL-3.0, \
> +       GPL-3.0 with exception(tools), \
> +       GFDL-1.3 (docs)
> +
> +QT6SCXML_LICENSE_FILES = \
> +       LICENSES/GPL-2.0-only.txt \
> +       LICENSES/GPL-3.0-only.txt \
> +       LICENSES/LGPL-3.0-only.txt \
> +       LICENSES/GFDL-1.3-no-invariants-only.txt
> +
> +QT6SCXML_CONF_OPTS = \
> +       -DQT_HOST_PATH=$(HOST_DIR) \
> +       -DBUILD_WITH_PCH=OFF \
> +       -DQT_BUILD_EXAMPLES=OFF \
> +       -DQT_BUILD_TESTS=OFF
> +
> +QT6SCXML_DEPENDENCIES = \
> +       host-qt6scxml \
> +       qt6base
> +
> +HOST_QT6SCXML_DEPENDENCIES = \
> +       host-qt6base
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> --
> 2.46.0
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
