Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EA8D5B86F
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0A8860F9C;
	Mon, 15 Dec 2025 22:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sktft-ys4aw1; Mon, 15 Dec 2025 22:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C8D460F2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765838005;
	bh=KXQ6EwsX7ui7tNnE22HskPr7fnU5BCjRwbHnhcErbWo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lhC1wHxD75FgYTFPDQBVY3S5DEPHRG2UhuqthLD7+8z8fYDdFKxEWxtpLxqZ8NRjN
	 EHoomEX9QmiMWTIlY4BK14p3CjZV1JLUB/yZsV73P1iIjgUq9M/pR/DR3mN2icFPyz
	 4VoNJSfYT/gD3vpUygpaP4qUOzJvSozbhqpcLbPpnZ9ksPQh+oOi3zTfJl6lB1hj6V
	 61wWleVlNM97AssCzrUfnGW3YMbfHe69xTxdJelMmdIhfp0S79+crEc4uWGV9o/JoW
	 dEjiIAFKjguUzxgzRMRwKEwjkCR1xXp9bwIzipy/WpJNyWV7KxIH060vorgh4BqGw4
	 yGFWrbwaDT9rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C8D460F2D;
	Mon, 15 Dec 2025 22:33:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83B4F255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80CE440894
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hvncFZnGHlF for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:33:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B8184014E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B8184014E
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B8184014E
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:33:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B6E961A21F7;
 Mon, 15 Dec 2025 22:33:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7A9A260664;
 Mon, 15 Dec 2025 22:33:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 91976119424C8; Mon, 15 Dec 2025 23:33:18 +0100 (CET)
Date: Mon, 15 Dec 2025 23:33:17 +0100
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Christian Hitz <christian@klarinett.li>, Zoltan
 Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>, Jesse
 Van Gavere <jesseevg@gmail.com>
Message-ID: <20251215233317.522f966e@windsurf>
In-Reply-To: <20250610122924.431830-1-roykollensvendsen@gmail.com>
References: <20250610122924.431830-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765837999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=rFYhNN5K0i89jbr61bv1zWM1/GoTOy4TqQZaa7RzeVA=;
 b=1U/PHMvhv1/hMmoft0Mlo9mfvVp8gu5haDDwloHpqzKr9zs2C/oyGKOh9zvgD9wOgfBkqg
 YgHl/vMgrKKtt9+PisS8B9dNYPAM1Apv8lR+cPlRCKOVAMk6n7ab/6JBQhYdp0kKlkZcg8
 mlQV3JxO6SsmwbQdNhfoR7/R8b8TnXNcbq5jl3wtdIc4/m3SAJCXHOdeqiSt52M/T2qZVz
 yMZs8MSFyi0CRkoefyJsNaMoJ2fuXwpgqqEXF/s4ipQ+4yS/S7k1mikBcPtqi1XR4MNt/M
 l4Ynu+WxYNFW47eMsDJoWc/EoQr5eqWT6vzb3i286WyZDdCOAdTZeS68pvG21w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=1U/PHMvh
Subject: Re: [Buildroot] [PATCH 1/6] package/qt6: bump version to 6.9.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 10 Jun 2025 14:29:15 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> For details see:
>  - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.2/release-note.md
>  - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.3/release-note.md
>  - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.9.0/release-note.md
>  - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.9.1/release-note.md
> 
> Qt6 Multimedia:
> legal-info broke because license files were removed. This problem was fixed
> by removing the corresponding hashes and LICENSE_FILES entries.
> 
> Qt6 SVG:
> Fix legal-info after license file was removed.
> 
> Qt6 Quick 3d:
> Fix legal-info after license files were removed.
> 
> Qt6 Virtual Keyboard:
> Fix legal-info after change in license file.
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
>  package/qt6/qt6.mk                                   |  2 +-
>  package/qt6/qt6base/qt6base.hash                     |  4 ++--
>  package/qt6/qt6charts/qt6charts.hash                 |  4 ++--
>  package/qt6/qt6core5compat/qt6core5compat.hash       |  4 ++--
>  package/qt6/qt6declarative/qt6declarative.hash       |  4 ++--
>  package/qt6/qt6graphs/qt6graphs.hash                 |  4 ++--
>  package/qt6/qt6languageserver/qt6languageserver.hash |  4 ++--
>  package/qt6/qt6mqtt/qt6mqtt.hash                     |  2 +-
>  package/qt6/qt6multimedia/qt6multimedia.hash         | 12 ++----------
>  package/qt6/qt6multimedia/qt6multimedia.mk           |  8 --------
>  package/qt6/qt6opcua/qt6opcua.hash                   |  2 +-
>  package/qt6/qt6quick3d/qt6quick3d.hash               |  6 ++----
>  package/qt6/qt6quick3d/qt6quick3d.mk                 |  4 +---
>  package/qt6/qt6quicktimeline/qt6quicktimeline.hash   |  4 ++--
>  package/qt6/qt6scxml/qt6scxml.hash                   |  4 ++--
>  package/qt6/qt6serialbus/qt6serialbus.hash           |  4 ++--
>  package/qt6/qt6serialport/qt6serialport.hash         |  4 ++--
>  package/qt6/qt6shadertools/qt6shadertools.hash       |  4 ++--
>  package/qt6/qt6svg/qt6svg.hash                       |  5 ++---
>  package/qt6/qt6svg/qt6svg.mk                         |  3 +--
>  package/qt6/qt6tools/qt6tools.hash                   |  4 ++--
>  .../qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash   |  6 +++---
>  package/qt6/qt6wayland/qt6wayland.hash               |  4 ++--
>  package/qt6/qt6websockets/qt6websockets.hash         |  4 ++--
>  24 files changed, 42 insertions(+), 64 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
