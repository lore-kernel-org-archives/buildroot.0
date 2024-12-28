Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADB1E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 22:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8621360900;
	Sat, 28 Dec 2024 22:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id azkndqti83-G; Sat, 28 Dec 2024 22:33:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F924608FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F924608FE;
	Sat, 28 Dec 2024 22:33:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44965C8
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CBC8810E0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CWYCb0c-BPw for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 22:33:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 62B3080FA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62B3080FA7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62B3080FA7
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:33:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59A2760002;
 Sat, 28 Dec 2024 22:33:08 +0000 (UTC)
Date: Sat, 28 Dec 2024 23:33:07 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Christian Hitz <christian@klarinett.li>,
 Andreas Naumann <ANaumann@ultratronik.de>, Zoltan Gyarmati
 <zgyarmati@zgyarmati.de>, Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20241228233307.1c78f501@windsurf>
In-Reply-To: <20241213115820.655993-1-roykollensvendsen@gmail.com>
References: <20241213115820.655993-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735425188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQGSXaIUtzL6wRWM7y/4oUrzESGNyCbc3u8Zv+3LldU=;
 b=LevmGEPA+irv7dRO134Tm+WgpWkntBtWVVlzqu57aV1lUVB6tlBaMwb3GNnewZR/S/9V+A
 ZpD4K9Kmyk1dHESbC/KVCv1mcSg4Ci7FY/snu9IPOP5rQCXArR4S3K03ZkvZ4ljJ61dbUS
 UIE8xQJVEjDwRTP7+j9BqxhHSjAS7BUmaoI+ED2FyOPRxVyagHEA6s7IwWAyLc6E/U2aVX
 tE8/w6ks7tc/Z0KTF/mX9b7eAKWxJ2j3NKlG1GFFBVin64W1DqfBk43mKL/RTgGm8ceAkR
 jQXs1rnJB/RaVFM4uddNQ0wJFrG9tEJehEZYyqDH1rfPlcSKEfEI7U1FSZtdhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LevmGEPA
Subject: Re: [Buildroot] [PATCH 1/8] package/qt6: bump version to 6.8.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 13 Dec 2024 12:58:08 +0100
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> For details see:
>  - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.1/release-note.md
>  - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.0/release-note.md
> 
> qt6serialport:
>  - Fix legal-info. LICENSES/Qt-GPL-exception-1.0.txt was removed from
>  Qt6 Serial Port. This broke make qt6serialport-legal-info, so we had to
>  do some minor modification to the qt6serialport package.
> 
> qt6declarative:
>  - Remove patch from qt6declarative, since it's already included in this
>  version.
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
>  package/qt6/qt6.mk                            |  4 +--
>  package/qt6/qt6base/qt6base.hash              |  6 ++--
>  package/qt6/qt6charts/qt6charts.hash          |  4 +--
>  .../qt6/qt6core5compat/qt6core5compat.hash    |  4 +--
>  ...1-Fix-build-with--no-feature-network.patch | 28 -------------------
>  .../qt6/qt6declarative/qt6declarative.hash    |  4 +--
>  .../qt6languageserver/qt6languageserver.hash  |  4 +--
>  package/qt6/qt6mqtt/qt6mqtt.hash              |  2 +-
>  package/qt6/qt6opcua/qt6opcua.hash            |  2 +-
>  package/qt6/qt6scxml/qt6scxml.hash            |  4 +--
>  package/qt6/qt6serialbus/qt6serialbus.hash    |  4 +--
>  package/qt6/qt6serialport/qt6serialport.hash  |  5 ++--
>  package/qt6/qt6serialport/qt6serialport.mk    |  3 +-
>  .../qt6/qt6shadertools/qt6shadertools.hash    |  4 +--
>  package/qt6/qt6svg/qt6svg.hash                |  4 +--
>  package/qt6/qt6tools/qt6tools.hash            |  4 +--
>  .../qt6virtualkeyboard.hash                   |  4 +--
>  package/qt6/qt6wayland/qt6wayland.hash        |  4 +--
>  package/qt6/qt6websockets/qt6websockets.hash  |  4 +--
>  19 files changed, 34 insertions(+), 64 deletions(-)
>  delete mode 100644 package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch

Thanks, entire series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
