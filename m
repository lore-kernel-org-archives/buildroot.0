Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43BFC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 14:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8462D60638;
	Tue, 16 Jul 2024 14:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsxqy5-OAKxJ; Tue, 16 Jul 2024 14:43:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9230860A3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9230860A3B;
	Tue, 16 Jul 2024 14:43:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40DE41BF37F
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 14:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B9E660A3B
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 14:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jn9HYNgM84Ct for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 14:43:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED7B960638
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED7B960638
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED7B960638
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 14:43:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2A5C2000B;
 Tue, 16 Jul 2024 14:43:39 +0000 (UTC)
Date: Tue, 16 Jul 2024 16:43:38 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240716164338.502625c2@windsurf>
In-Reply-To: <20240716124021.2386621-1-buildroot@bubu1.eu>
References: <20240716124021.2386621-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721141020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rl/eL/7sRfPXGNO1vXvrYYgIQLShLQfyi1Cj8xqiSlA=;
 b=UftmxpOYXppG4YhlW4ymi61ZF0onJqxXEudAQ6y/o6494waL+59GagLAPOFnYqD6Dd+Kqz
 03bYyAndlngJAQTOL+robC1MGPipUsAXfd8S53bYcqOoKjenEtWcO65qrMi4MvLByxg5ph
 ud7iiMN6hvRiPtT7vT4C5gyleS2+CJw5E4c3yGFDm/iPwPMySGfij2q+P4MpClIiDUsWa9
 Y7NhWxpXivXpO/nzp0ew+iqX4IEskD9kagYA4T85Wid3ILKCkDpCRQiG98QL8i0rqCV2Tg
 AgDn4ZNb1uGCGDoW1Ezvy7/osv0detLx3x4mD23rYsBEDDCKZztAFnkN5MiruQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UftmxpOY
Subject: Re: [Buildroot] [PATCH] package/tio: bump to 3.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 Jul 2024 14:40:21 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Dependencies changed: inih dependency was removed, glib2 and lua added.
> Tio's meson build system fails to find luajit, so exclude that,
> otherwise all versions of lua >= 5.1 are supported.
> 
> Retested the build for sparc and sparc64 and the compile issues have
> been resolved upstream by reworking the baudrate selection code quite a
> while ago[1].
> 
> Disable installation of man pages with new build option.
> 
> [1] https://github.com/tio/tio/commit/a23be7f2c2bacef428b0e50aa93e37e5b52bdd56
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/tio/Config.in | 23 +++++++++++++----------
>  package/tio/tio.hash  |  4 ++--
>  package/tio/tio.mk    |  6 ++++--
>  3 files changed, 19 insertions(+), 14 deletions(-)

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
