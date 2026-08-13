Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128FAC5B572
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 14:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D023D6085D;
	Thu, 13 Aug 2026 14:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZId9L5wR6RCM; Thu, 13 Aug 2026 14:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34DC560A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786631910;
	bh=z19ZxMf4V8LHOrPndTihB8gFraWt8k/SHWZv5Y8kdd4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OpiODYk3U0bppDnQAGyE1AxfbBXn0+0KoumQArVlXVa9S+0MwlKilZjm1XNoEjBj4
	 YkDDLA1BgRuPtkTiGatJ4lMA/j82Gomydf9U7lGzzhe6VGlNoD7WtEHoYDs2euHiGU
	 MSag6EKGz+zRPws5jcS3Q5rvcct1aHu6Akd0WYT5q9YbeaISp3o8Yk4YOaahnaFssp
	 sqd1O7E6WAeNoJYsJJVDDHou6jZ/1gQrsPpnJIDEnh4MAqs8ASCtRMhZEXJMw+PMOF
	 BtbNsuXIps6QJNwyBrfiNrBK8AmTvPmg4hPmBN8fThYdEUWv2zsct4enASoGOmuJ6j
	 nxd9cMVmpvkqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34DC560A4C;
	Thu, 13 Aug 2026 14:38:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35CCE1B8
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 14:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E91840133
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 14:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BgtnwTfYgF2w for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 14:38:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C41F400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C41F400AC
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C41F400AC
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 14:38:26 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4956242332dso160955e9.2
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 07:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786631904; x=1787236704;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/dF64bzWniUAcBVBU6R7k6Z28aXZEbGIyMGEXn40yuA=;
 b=pMQXClEiKWe6QFZ82Sx71mKgimE/gyQ8cqvkynfxDY7pLiSoqfQD1SceT0ACzHNPAX
 xAmatKQuGGvhdxAbI8JjIOOM6o+6f38ni+TdtMb0lDn/QRMM6SoOK66xvrg9KvDDJIeD
 +fbBXkYUiFRy9zW49+kqAUcVfWiLFqw1mcwXJdnS8Fi+uDiXHUsAriehDsAle3pZB4nI
 E9nyYMszv4pz/+CrxYjZEu+wWJp2E06/XURp4CydmZP6ZqkQaQvUm+W5MHuJxjRMhFPY
 s0bPRbLCVFK4lfHPzVIMQfI+5JwWmzxdaOlDp5ypPGTC0z6LY2Bqtmsmp3zSOWLFvfxh
 sICQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqJsORFC7p+oZ/umfXKatFWJ54kD56MYYXQ7qsr4H48L/clTgejKy4Osm/OcX1DG3dxPw7C+5aCoKM=@buildroot.org
X-Gm-Message-State: AOJu0YxCjriwEx56NiAdxorl/WO8kPL9w+3mpgTr4Q/9KsRgBdL/zylA
 BUFy1/X9VNmgFc3CK52GOBpy+i6WyR1mFkdK36K0ezAUwsRXZ3fPe+p3TXh1gjy3ki4=
X-Gm-Gg: AR+sD13XiI6Z3Wg+jj53M6wyo2HEX1U91EBTmQskgJa7C+X9ZqbfLWRFT69dRmwK+kO
 Hg4xToSSZUI6jX4QHY4ik6fp0/G+LMWQE4WYu7OVITB6TupVF2epp6VC3V4nQROuZKmpv1PiZC0
 Qj684nnCTDFnrPySgKyMlSLEjkjircHmA3u7lMuMmvUCQbV9E5k5KHur1koy8tJdGLrmqe7an4A
 kAdSAQO9y+RJrc/sy4GjBQvFaF8IIGJfZnncFYC5CEaWVXSZjbwn7DoC4X6NrtRet2v/kLTHH+f
 S+LX5IhRGupnockhttoQ7z5ZrBNlIwD/WpNfY3dRDMt1jblUdrEgkaOQbd/2rUT1lUJ+FqZ/5t2
 OVvElRl/Jb63tgH0Rr4Qe3OWyb5EWKAK3LuA4EkyAV0oPVXD57XUmsjRbtrI47kvEPqNjOA8vLL
 sMgL/HveEChaTil/ydEBp6uQYRcZTKgctml2runYFqXYVXm+QC1OOSg6dKjZ0hd/JsCsofRuVqa
 jF9OHuKct+WVtzIPoSidsgU+hNy/cM3CPTFHcYSSP387AAdKDbn9Lt/kukC
X-Received: by 2002:a05:600c:3511:b0:499:521d:bff1 with SMTP id
 5b1f17b1804b1-4998219b6e9mr56952695e9.2.1786631904293; 
 Thu, 13 Aug 2026 07:38:24 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a56133csm6968664f8f.7.2026.08.13.07.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 07:38:23 -0700 (PDT)
Message-ID: <a207d4fc-58f0-4205-8de4-5b1d2627d8fb@mind.be>
Date: Thu, 13 Aug 2026 16:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Conghao Hu <ocd2057try@gmail.com>, buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>
References: <20260809060542.31279-1-ocd2057try@gmail.com>
Content-Language: en-US
In-Reply-To: <20260809060542.31279-1-ocd2057try@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786631904; x=1787236704; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/dF64bzWniUAcBVBU6R7k6Z28aXZEbGIyMGEXn40yuA=;
 b=CW+0s32GM3XGxbDqmQbSqpe9KG60lUWVDIr2A+D0XeJ/f1rkbv8RYdtS73Mslu5sKf
 bZzsjDw9q0jrONqwMr+/RS2GjsLr3+DuYR0lVSTpx4Tl1DDUen0eQzTaaij6+KKlw0ml
 9pBc00bTUY+3SgOw1cNseYNf+a3EQTQIw1hNgdQESGzgTZLYNVnxToPnois9nUTf0tDN
 ZUIPTFGjwSiBYF94QdZRkQRcKembVzx4gjkRCQ2+C2ejCAAzp78yvZxX7cEBnr1Sfrqj
 myhYYhxXNWN6avNzWvo/roJhf9B9W3NMrPpepRl9WgqZrB8KXXNKL9XRVOYvbpUQEEJp
 PN7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CW+0s32G
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/qt6: bump version to 6.8.4
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Conghao Hu,

Thank you for your contribution !

On 9/08/26 08:05, Conghao Hu wrote:
> For details see:
>   - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.2/release-note.md
>   - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.3/release-note.md
>   - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.4/release-note.md
>
> Qt 6.8.4 LTS source archives use the everywhere-opensource-src prefix. The qtmqtt and qtopcua repositories use the v6.8.4-lts-lgpl tag.
On https://security.buildroot.org/2025.02.x/component/qt6base I see that 
there is currently CVE-2025-5683 affecting Qt6.8, which is resolved in 
Qt >=6.8.5.

I am not familiar at all with Qt so I might miss something, but would 
you care to explain why you only bumped to 6.8.4, and not a more recent 
version on the 6.8 branch ?

Kind regards,
Titouan
> Signed-off-by: Conghao Hu <ocd2057try@gmail.com>
> ---
>   package/qt6/qt6.mk                                     | 4 ++--
>   package/qt6/qt6base/qt6base.hash                       | 4 ++--
>   package/qt6/qt6charts/qt6charts.hash                   | 4 ++--
>   package/qt6/qt6core5compat/qt6core5compat.hash         | 4 ++--
>   package/qt6/qt6declarative/qt6declarative.hash         | 4 ++--
>   package/qt6/qt6graphs/qt6graphs.hash                   | 4 ++--
>   package/qt6/qt6languageserver/qt6languageserver.hash   | 4 ++--
>   package/qt6/qt6mqtt/qt6mqtt.hash                       | 2 +-
>   package/qt6/qt6mqtt/qt6mqtt.mk                         | 2 +-
>   package/qt6/qt6multimedia/qt6multimedia.hash           | 4 ++--
>   package/qt6/qt6multimedia/qt6multimedia.mk             | 2 +-
>   package/qt6/qt6opcua/qt6opcua.hash                     | 2 +-
>   package/qt6/qt6opcua/qt6opcua.mk                       | 2 +-
>   package/qt6/qt6quick3d/qt6quick3d.hash                 | 4 ++--
>   package/qt6/qt6quicktimeline/qt6quicktimeline.hash     | 4 ++--
>   package/qt6/qt6scxml/qt6scxml.hash                     | 4 ++--
>   package/qt6/qt6serialbus/qt6serialbus.hash             | 4 ++--
>   package/qt6/qt6serialport/qt6serialport.hash           | 4 ++--
>   package/qt6/qt6shadertools/qt6shadertools.hash         | 4 ++--
>   package/qt6/qt6svg/qt6svg.hash                         | 4 ++--
>   package/qt6/qt6tools/qt6tools.hash                     | 4 ++--
>   package/qt6/qt6tools/qt6tools.mk                       | 4 ++--
>   package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash | 4 ++--
>   package/qt6/qt6wayland/qt6wayland.hash                 | 4 ++--
>   package/qt6/qt6websockets/qt6websockets.hash           | 4 ++--
>   25 files changed, 45 insertions(+), 45 deletions(-)
>
> diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
> index 33cbf7551f..056e30fac1 100644
> --- a/package/qt6/qt6.mk
> +++ b/package/qt6/qt6.mk
> @@ -5,8 +5,8 @@
>   ################################################################################
>   
>   QT6_VERSION_MAJOR = 6.8
> -QT6_VERSION = $(QT6_VERSION_MAJOR).1
> -QT6_SOURCE_TARBALL_PREFIX = everywhere-src
> +QT6_VERSION = $(QT6_VERSION_MAJOR).4
> +QT6_SOURCE_TARBALL_PREFIX = everywhere-opensource-src
>   QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
>   
>   QT6_GIT = git://code.qt.io
> diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
> index 94269047c5..57707befbf 100644
> --- a/package/qt6/qt6base/qt6base.hash
> +++ b/package/qt6/qt6base/qt6base.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtbase-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  40b14562ef3bd779bc0e0418ea2ae08fa28235f8ea6e8c0cb3bce1d6ad58dcaf  qtbase-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtbase-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  532dfbf3fa3cbc68fa37441ea9e81c5009da044eaecda78ffaeafd8bd125532f  qtbase-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files
>   sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
> diff --git a/package/qt6/qt6charts/qt6charts.hash b/package/qt6/qt6charts/qt6charts.hash
> index 215d18c576..3fd8accd59 100644
> --- a/package/qt6/qt6charts/qt6charts.hash
> +++ b/package/qt6/qt6charts/qt6charts.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtcharts-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  2edea3f16e248ef508d99332798645b7f5ab6edbbf2e3d7d78fb674156f07d29  qtcharts-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtcharts-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  2120c2927c8a72dcdd55082e9464ddbe6409f1b2b5a3e97331e597e9d6a3b531  qtcharts-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
> diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
> index ba13da8d4e..91ff19f35e 100644
> --- a/package/qt6/qt6core5compat/qt6core5compat.hash
> +++ b/package/qt6/qt6core5compat/qt6core5compat.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qt5compat-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  05c8c088b4cd8331fa8a9c8b7ff7c42a088cb112e673eae5708048d0131264fc  qt5compat-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qt5compat-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  9c1e9a3801887eb986d0bf2e09bbaa833ec1275cd315ef7aff23d14c37ec1081  qt5compat-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files:
>   sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
> index 81b8ca929b..6dcf206930 100644
> --- a/package/qt6/qt6declarative/qt6declarative.hash
> +++ b/package/qt6/qt6declarative/qt6declarative.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtdeclarative-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  95d15d5c1b6adcedb1df6485219ad13b8dc1bb5168b5151f2f1f7246a4c039fc  qtdeclarative-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtdeclarative-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  e4e68aad4c07fbb9da670ecd621fabe51b56a2bfcce8da775653bdf8dcd768fc  qtdeclarative-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files:
>   sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6graphs/qt6graphs.hash b/package/qt6/qt6graphs/qt6graphs.hash
> index 59d35d9e66..99652991cb 100644
> --- a/package/qt6/qt6graphs/qt6graphs.hash
> +++ b/package/qt6/qt6graphs/qt6graphs.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtgraphs-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  1e46e3de69936835652ab40ef8caf5824ea71e26871274561fb65ec142d54a80  qtgraphs-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtgraphs-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  3b0a2502c88ca02ae57814f432b46155d56f1e4fe263352e31260a9ff5fb2ab5  qtgraphs-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
> diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
> index a330ecb323..0ad4652327 100644
> --- a/package/qt6/qt6languageserver/qt6languageserver.hash
> +++ b/package/qt6/qt6languageserver/qt6languageserver.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtlanguageserver-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  865e9436c1432a53e38a30625b6cee60bf72553ff508047115513a233c8e6d7e  qtlanguageserver-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtlanguageserver-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  747a8e406d6b67c6b724f35a34849489ca7859161392e9dffa979113fecc6ac9  qtlanguageserver-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files:
>   sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
> index f13fbaab9c..9cea2ae2f1 100644
> --- a/package/qt6/qt6mqtt/qt6mqtt.hash
> +++ b/package/qt6/qt6mqtt/qt6mqtt.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  757c96a645b81e858c19b5407d54b3a40ee288d04ffadc9a96dd52e50c6d8d6b  qt6mqtt-6.8.1-git4.tar.gz
> +sha256  ac5827afaa10bfbcb3e473d53f422715e53b6732d19987249195c17a534e0f1a  qt6mqtt-v6.8.4-lts-lgpl-git4.tar.gz
>   
>   # Hashes for license files
>   sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6mqtt/qt6mqtt.mk b/package/qt6/qt6mqtt/qt6mqtt.mk
> index 00c6705cc8..9bec4d3d28 100644
> --- a/package/qt6/qt6mqtt/qt6mqtt.mk
> +++ b/package/qt6/qt6mqtt/qt6mqtt.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT6MQTT_VERSION = $(QT6_VERSION)
> +QT6MQTT_VERSION = v$(QT6_VERSION)-lts-lgpl
>   QT6MQTT_SITE = $(QT6_GIT)/qt/qtmqtt.git
>   
>   QT6MQTT_INSTALL_STAGING = YES
> diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
> index cddafb56a8..7e9e720554 100644
> --- a/package/qt6/qt6multimedia/qt6multimedia.hash
> +++ b/package/qt6/qt6multimedia/qt6multimedia.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtmultimedia-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  75fa87134f9afab7f0a62c55a4744799ac79519560d19c8e1d4c32bdd173f953  qtmultimedia-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtmultimedia-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  01737014580d97fe6768ba4bf95b81233c488c8349dfb5b8861e48b6930c7ad2  qtmultimedia-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files
>   sha256  f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec1df  LICENSES/BSD-2-Clause.txt
> diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
> index c2a9d250cf..c9160a0e81 100644
> --- a/package/qt6/qt6multimedia/qt6multimedia.mk
> +++ b/package/qt6/qt6multimedia/qt6multimedia.mk
> @@ -68,7 +68,7 @@ QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
>   QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
>   # libxext/libxrandr are needed for ffmpeg plugin to build with X11
>   # support:
> -# https://code.qt.io/cgit/qt/qtmultimedia.git/tree/src/plugins/multimedia/ffmpeg/CMakeLists.txt?h=6.8.1#n198
> +# https://code.qt.io/cgit/qt/qtmultimedia.git/tree/src/plugins/multimedia/ffmpeg/CMakeLists.txt?h=v6.8.4-lts-lgpl#n198
>   ifeq ($(BR2_PACKAGE_XORG7),y)
>   QT6MULTIMEDIA_DEPENDENCIES += xlib_libXext xlib_libXrandr
>   endif
> diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
> index 627450af60..6e910ca7fe 100644
> --- a/package/qt6/qt6opcua/qt6opcua.hash
> +++ b/package/qt6/qt6opcua/qt6opcua.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  0283f634707bf5c88ed30fec604bf7ea3bc22620cd060517812f9fb6304f254b  qt6opcua-6.8.1-git4.tar.gz
> +sha256  53b80bc87ed164844f1cc742063f8b7735f3ad7219ef0c8fa91b1be569d3e3c6  qt6opcua-v6.8.4-lts-lgpl-git4.tar.gz
>   
>   # Hashes for license files
>   sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6opcua/qt6opcua.mk b/package/qt6/qt6opcua/qt6opcua.mk
> index 28771ba8a5..b4e1d0908e 100644
> --- a/package/qt6/qt6opcua/qt6opcua.mk
> +++ b/package/qt6/qt6opcua/qt6opcua.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT6OPCUA_VERSION = $(QT6_VERSION)
> +QT6OPCUA_VERSION = v$(QT6_VERSION)-lts-lgpl
>   QT6OPCUA_SITE = $(QT6_GIT)/qt/qtopcua.git
>   QT6OPCUA_SITE_METHOD = git
>   QT6OPCUA_INSTALL_STAGING = YES
> diff --git a/package/qt6/qt6quick3d/qt6quick3d.hash b/package/qt6/qt6quick3d/qt6quick3d.hash
> index 960cda69ad..f6f626e3ad 100644
> --- a/package/qt6/qt6quick3d/qt6quick3d.hash
> +++ b/package/qt6/qt6quick3d/qt6quick3d.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtquick3d-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  3f3d345e6c95fcd40ab37e6a37cd31811e5d239dea8e142e632d4ea41bf20ce7  qtquick3d-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtquick3d-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  a1e6239c20115f0f5bd08d6c5f288f0a79f6e98ce0e910665bb6b3545b231d43  qtquick3d-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files
>   sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
> index b042b4e2f8..db56e0dd1a 100644
> --- a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
> +++ b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtquicktimeline-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  fdbc198e27fd7bce0801fb3cfa336e81932607e6a36c97ae8394880eedfe12a3  qtquicktimeline-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtquicktimeline-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  c0eec3e952e9f4d4acc843054dbcb23662359e768e968747554311e5dec39e2c  qtquicktimeline-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
> diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6scxml.hash
> index f239f18dd3..b63f57e319 100644
> --- a/package/qt6/qt6scxml/qt6scxml.hash
> +++ b/package/qt6/qt6scxml/qt6scxml.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtscxml-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  2f406f44cfacd6eddb90468012a5d1d99d7a64ec05a21a2a7eda9dfc12614fd6  qtscxml-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtscxml-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  639bb421b25e3b7b0db00b9e3b2086d7504e44cbacaea11fe4dbecaccae1b1da  qtscxml-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files:
>   sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
> index 9777633b85..e98609effe 100644
> --- a/package/qt6/qt6serialbus/qt6serialbus.hash
> +++ b/package/qt6/qt6serialbus/qt6serialbus.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtserialbus-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  40788d92ec5c3ae297818e9f9eea9d21e398a54fa3fd8ddd530d324548ed15da  qtserialbus-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtserialbus-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  23782360cf662e8a2f3272e9f5a105b70d6c35ee10ed37775b5d68bae0b2f5f0  qtserialbus-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files:
>   sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
> index d30c297d0f..25fe084e1f 100644
> --- a/package/qt6/qt6serialport/qt6serialport.hash
> +++ b/package/qt6/qt6serialport/qt6serialport.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtserialport-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  098e72a5c06d7db003e3eea1b0ed72d7308e3ea9cb9e89b538816dc96c938395  qtserialport-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtserialport-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  8a91c7fd4839795f1ab6b3673ad51be7c84bf9c1fa50b88f8e08b46ddb8e11bb  qtserialport-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files:
>   sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
> index 015ec5b96f..9de49be57d 100644
> --- a/package/qt6/qt6shadertools/qt6shadertools.hash
> +++ b/package/qt6/qt6shadertools/qt6shadertools.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtshadertools-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  55b70cd632473a8043c74ba89310f7ba9c5041d253bc60e7ae1fa789169c4846  qtshadertools-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtshadertools-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  379a70692b52903b82897869112c4759f7f6f4e76abc4987700e9cdd87c87ebd  qtshadertools-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files:
>   sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
> index cd7a148fb7..df47d8e87d 100644
> --- a/package/qt6/qt6svg/qt6svg.hash
> +++ b/package/qt6/qt6svg/qt6svg.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtsvg-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  3d0de73596e36b2daa7c48d77c4426bb091752856912fba720215f756c560dd0  qtsvg-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtsvg-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  e2a83b315b97eeaffa1d3f17e8192436541fe53e62171e82c7311c56ee9aac07  qtsvg-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files:
>   sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
> index ede1608ec4..c53f37f064 100644
> --- a/package/qt6/qt6tools/qt6tools.hash
> +++ b/package/qt6/qt6tools/qt6tools.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qttools-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  9d43d409be08b8681a0155a9c65114b69c9a3fc11aef6487bb7fdc5b283c432d  qttools-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qttools-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  c6030ea66d7be1ca7e3b40578beb35b0f4ff4014277d8e051d3219759f6ab399  qttools-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files:
>   sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
> index fd32b3352a..2bfcff4cc2 100644
> --- a/package/qt6/qt6tools/qt6tools.mk
> +++ b/package/qt6/qt6tools/qt6tools.mk
> @@ -37,7 +37,7 @@ QT6TOOLS_CONF_OPTS = \
>   	-DQT_BUILD_TESTS=OFF
>   
>   # Disable clang support in qt6tools for now, as version 17 is needed:
> -# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1
> +# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=v6.8.4-lts-lgpl
>   QT6TOOLS_CONF_OPTS += -DFEATURE_clang=OFF
>   
>   QT6TOOLS_DEPENDENCIES = \
> @@ -55,7 +55,7 @@ HOST_QT6TOOLS_CONF_OPTS = \
>   	-DQT_BUILD_TESTS=OFF
>   
>   # Disable clang support in qt6tools for now, as version 17 is needed:
> -# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1
> +# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=v6.8.4-lts-lgpl
>   HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_clang=OFF
>   
>   HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
> diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
> index 60b9ab08de..142f9425c0 100644
> --- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
> +++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtvirtualkeyboard-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  1022a3bc4093ec732e85b659158c8a70a31eecbd0dfef4e4f6c67f474f89a264  qtvirtualkeyboard-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtvirtualkeyboard-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  7bfe9a4d1ded37e1e10e28098dccf1768e75ec26bb0d1d27fcb3d83988397d98  qtvirtualkeyboard-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files:
>   sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
> index a378097eb4..8ab0f5a21b 100644
> --- a/package/qt6/qt6wayland/qt6wayland.hash
> +++ b/package/qt6/qt6wayland/qt6wayland.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtwayland-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  2226fbde4e2ddd12f8bf4b239c8f38fd706a54e789e63467dfddc77129eca203  qtwayland-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtwayland-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  b2475cfae9f5b8f40ea456b762cc634e7d083873aa554eb63954ee20e8a7bb8b  qtwayland-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files:
>   sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
> index 789f51a71d..665c3e0008 100644
> --- a/package/qt6/qt6websockets/qt6websockets.hash
> +++ b/package/qt6/qt6websockets/qt6websockets.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtwebsockets-everywhere-src-6.8.1.tar.xz.sha256
> -sha256  e4cfdae8760bedd1c2b00429a6c9bf88cc11c5018dcb46bde277fb1edf341e3f  qtwebsockets-everywhere-src-6.8.1.tar.xz
> +# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtwebsockets-everywhere-opensource-src-6.8.4.tar.xz.sha256
> +sha256  acadb896c557659fe8a2f29f130ad3553c1497524a1bf5165aacd346e1349521  qtwebsockets-everywhere-opensource-src-6.8.4.tar.xz
>   
>   # Hashes for license files:
>   sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
