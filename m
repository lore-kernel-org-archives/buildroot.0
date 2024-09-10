Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271A4EE01E8
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D84E0608C9;
	Tue, 10 Sep 2024 20:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHIp90L2Lmxt; Tue, 10 Sep 2024 20:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C24B8608DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C24B8608DC;
	Tue, 10 Sep 2024 20:51:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5421A1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF25540361
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqvMGLohSJPK for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:47:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 57ABD4024D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57ABD4024D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57ABD4024D
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:47:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77923C0003;
 Tue, 10 Sep 2024 20:47:07 +0000 (UTC)
Date: Tue, 10 Sep 2024 22:47:06 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240910224706.1079b583@windsurf>
In-Reply-To: <20240909145715.65981-1-fiona.klute@gmx.de>
References: <20240909145715.65981-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726001227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y2gY1+vYxMoeKCvqlAh5jLc/PW9/t6Tgav98yl9rqCk=;
 b=mNXV0TIEDedfhiTOm+dztCnXcBYU38AL3DqPwk8gSJF6LqOecbq2Mx7QX5Q/p56+meGgMh
 VnBTB4HIEjt0ivMWkBYpcN3AmYpeKpKjsql1x2iEoWmgo4GIa8UjJhGGZNfLlKX8na9uOb
 IcQZBr5lNTfdgVnvkzO/GM0ggzVYdfDVyho9SL5O44GiCaUHcbtLEr25L8iDZCUkUdzFO1
 Yyj5XLauUcGNpe5lBNQjUEsiY1kUop9AvrO0x2Yg6cQ44dv+IV3cv3Bw90gRwlo1OygYO5
 /QZgO5onv7yQ7ofvhlurqRKjupvdH89AXhDm3wS6KtEluOHn0G58s4aRVcP7Pw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mNXV0TIE
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: bump version
 to 1.48.10
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
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  9 Sep 2024 16:57:15 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Upstream changelog:
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.48.10/NEWS?ref_type=tags
> 
> Packaging changes:
> 
> NM removed UPower suspend/resume support because it has been removed
> from UPower, the new fallback is consolekit.
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/05ef682bb5bf16a4de2cef4ed9eba4f9473ff19d
> 
> Add patch required to build with musl due to changes in imported
> libsystemd code (merged upstream in 1.49.x dev branch):
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/118e3117fe48f18cb2175b3cbc95a6ea3ced28b2
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> Supersedes the 1.48.8 patch I sent a while ago, no fundamental differences.

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
