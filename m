Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F75FCD4F50
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28ACD60762;
	Mon, 18 May 2026 18:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HmwohFQ1hZDf; Mon, 18 May 2026 18:48:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6801760745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779130108;
	bh=OS0fe2gpJqGKPV0/mhVwByErl6C/TSLLEdld9/yHLF0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ds/z9kbbuB5jURsiutrc/IExV1T66MP7wgmxJUJUMQVQIeVeW1eJ525BIQJRpNzBI
	 fFBlzg4XkGuEVgvBNAJJgBWKUtbd/wSbYNYT+FdKfSWq3c1R405UggdwknV8mSl6/Z
	 2NUU1aF8paq6l3c6a53o9zxVme0iyIDZXA2JHpuVAlfyGNNREtwFJ05JNOzEA0nVDk
	 fpBP3eCJFv7I8wzStIRNACj3+SlGUUfSy54QKum94fwLnV0yw6mILfgW/x6aqgeqm4
	 UUqTWSrH+0ZftgwVHrSp0XNKFiJAkf4IvQO+YbSpZfbK3A6T+kkMGLV5EPD9ziWJEG
	 2S+7z6f2RSW/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6801760745;
	Mon, 18 May 2026 18:48:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 617A8282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 532424096D
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iK0iUv5RINBw for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:48:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3431640929
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3431640929
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3431640929
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:48:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5363BB97BE3F; Mon, 18 May 2026 20:48:23 +0200 (CEST)
Message-ID: <79384995-eb3d-415f-99f1-6028af550c82@rnout.be>
Date: Mon, 18 May 2026 20:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jack Rubacha <rubacha.jack03@gmail.com>, buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260514174120.17886-2-rubacha.jack03@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260514174120.17886-2-rubacha.jack03@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779130104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=PTDMttGx7OT1a386Ong9H9Yc3eM1mcm73NwYBiDHMso=;
 b=MXyOynHbAaKkf/FeGrUnJq3as6/3WhXcX+X7IouC4G3ZUurhp9WXJkqZKjgTAxm7Ae5VGV
 9h3VG1ia5R9PZD6cpb6d5smVLflfeJ6Prn6IAuvKHbL4uRCKE3wpJF4vRNUQll5SwKvImO
 T47AOvsvwmNdWN/dPYuEwf8OOe5EL2T0hflzMXc/GwKJKLHMJnqJ47ZECowEmVqVsC6EhW
 FMug2miMJTQuFgVF8cF9aHz2aGv2twuQfJwnrwF+3Znf/082N8ZOqhmeXip6BXY7trkUZ3
 +93U8sr4uCVhRSE+PKOH8OZQKVIMAecqKKIgPczdHF41pjteemkr2SYN0NkcZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MXyOynHb
Subject: Re: [Buildroot] [PATCH v4] package/qt6/qt6grpc: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/05/2026 19:41, Jack Rubacha wrote:
> Adds the QT GRPC module (containing Qt Protobuf as well).
> 
> Signed-off-by: Jack Rubacha <rubacha.jack03@gmail.com>

  Wow, an update after a year! Congratulations for your dedication.

  Applied to next, thanks!

  Regards,
  Arnout

> ---
> Changes v3 -> v4:
>   - Update .hash to Qt 6.9.1
> 
> Changes v2 -> v3:
>   - Make license GPL-3.0-only
>   - Add newline for readability
>   - Alphabetize host dependencies
> 
> Changes v1 -> v2:
>   - Remove 'selects BR2_PACKAGE_HOST_QT6BASE' as it is a make dependency
>   - Changes help text to clearly state both modules
>   - Adds a git repository link to the help text
>   - Cleans up license files to show all necessary files, matches hashfile
>   - Make multiline clauses alphabetically ordered
> ---
>   package/qt6/Config.in            |  1 +
>   package/qt6/qt6grpc/Config.in    |  7 ++++++
>   package/qt6/qt6grpc/qt6grpc.hash | 10 ++++++++
>   package/qt6/qt6grpc/qt6grpc.mk   | 43 ++++++++++++++++++++++++++++++++
>   4 files changed, 61 insertions(+)
>   create mode 100644 package/qt6/qt6grpc/Config.in
>   create mode 100644 package/qt6/qt6grpc/qt6grpc.hash
>   create mode 100644 package/qt6/qt6grpc/qt6grpc.mk
> 
> diff --git a/package/qt6/Config.in b/package/qt6/Config.in
> index 10594691cf..9c297b321e 100644
> --- a/package/qt6/Config.in
> +++ b/package/qt6/Config.in
> @@ -48,6 +48,7 @@ source "package/qt6/qt6charts/Config.in"
>   source "package/qt6/qt6core5compat/Config.in"
>   source "package/qt6/qt6declarative/Config.in"
>   source "package/qt6/qt6graphs/Config.in"
> +source "package/qt6/qt6grpc/Config.in"
>   source "package/qt6/qt6languageserver/Config.in"
>   source "package/qt6/qt6mqtt/Config.in"
>   source "package/qt6/qt6multimedia/Config.in"
> diff --git a/package/qt6/qt6grpc/Config.in b/package/qt6/qt6grpc/Config.in
> new file mode 100644
> index 0000000000..3d82cfcb0c
> --- /dev/null
> +++ b/package/qt6/qt6grpc/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_QT6GRPC
> +	bool "qt6grpc"
> +	help
> +	  This package provides the Qt GRPC and Protobuf modules:
> +
> +	  https://doc.qt.io/qt-6/qtgrpc-index.html
> +	  https://code.qt.io/cgit/qt/qtgrpc.git/
> diff --git a/package/qt6/qt6grpc/qt6grpc.hash b/package/qt6/qt6grpc/qt6grpc.hash
> new file mode 100644
> index 0000000000..bbf30f2a2d
> --- /dev/null
> +++ b/package/qt6/qt6grpc/qt6grpc.hash
> @@ -0,0 +1,10 @@
> +# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtgrpc-everywhere-src-6.9.1.tar.xz.sha256
> +sha256  c34c869e203289b0fd695a1e5391840bc51b919a8b55e1ed1ff36b4cb923a750  qtgrpc-everywhere-src-6.9.1.tar.xz
> +
> +# Hashes for license files:
> +sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSE.Apache-2.0.txt
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
> +sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSES/LicenseRef-protobuf.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
> diff --git a/package/qt6/qt6grpc/qt6grpc.mk b/package/qt6/qt6grpc/qt6grpc.mk
> new file mode 100644
> index 0000000000..8b1c511fef
> --- /dev/null
> +++ b/package/qt6/qt6grpc/qt6grpc.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +# qt6grpc
> +#
> +################################################################################
> +
> +QT6GRPC_VERSION = $(QT6_VERSION)
> +QT6GRPC_SITE = $(QT6_SITE)
> +QT6GRPC_SOURCE = qtgrpc-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6GRPC_VERSION).tar.xz
> +QT6GRPC_INSTALL_STAGING = YES
> +QT6GRPC_SUPPORTS_IN_SOURCE_BUILD = NO
> +QT6GRPC_CMAKE_BACKEND = ninja
> +QT6GRPC_LICENSE = GPL-3.0-only
> +
> +QT6GRPC_LICENSE_FILES = \
> +	LICENSE.Apache-2.0.txt \
> +	LICENSES/BSD-3-Clause.txt \
> +	LICENSES/GFDL-1.3-no-invariants-only.txt \
> +	LICENSES/GPL-3.0-only.txt \
> +	LICENSES/LicenseRef-protobuf.txt \
> +	LICENSES/Qt-GPL-exception-1.0.txt
> +
> +QT6GRPC_CONF_OPTS = \
> +	-DBUILD_WITH_PCH=OFF \
> +	-DQT_BUILD_EXAMPLES=OFF \
> +	-DQT_BUILD_TESTS=OFF \
> +	-DQT_HOST_PATH=$(HOST_DIR)
> +
> +QT6GRPC_DEPENDENCIES = \
> +	host-pkgconf \
> +	host-qt6grpc \
> +	qt6base
> +
> +ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
> +QT6GRPC_DEPENDENCIES += qt6declarative
> +endif
> +
> +HOST_QT6GRPC_DEPENDENCIES = \
> +	host-protobuf \
> +	host-qt6base
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
