Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6962AC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39CDC412F9;
	Sat, 13 Jul 2024 14:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPEPsXSTL4k9; Sat, 13 Jul 2024 14:19:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2465341361
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2465341361;
	Sat, 13 Jul 2024 14:19:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08DFB1BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03EEF80FA0
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-d2TgdZUO4o for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:19:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9635480F7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9635480F7C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9635480F7C
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:19:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C405BC0003;
 Sat, 13 Jul 2024 14:19:28 +0000 (UTC)
Date: Sat, 13 Jul 2024 16:19:27 +0200
To: <yann.morin@orange.com>
Message-ID: <20240713161927.4fe23a5e@windsurf>
In-Reply-To: <07e738074928626377bb888bbe53888e79fe070a.1698941362.git.yann.morin@orange.com>
References: <cover.1698941362.git.yann.morin@orange.com>
 <07e738074928626377bb888bbe53888e79fe070a.1698941362.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720880369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Az6XXiPQxSW9NG2NNMzlCTP6YKQgYYF5nFMJ4glIDLE=;
 b=jAJabC5tGdl97Uoi/b2DDi3zWXytexq16RRplRCGwX/WIzbF+pgoro2HN07OGaTNTGI3RJ
 HYocuE5R49Er36TRBrIynUneQnxGviNVy1Pt8drrKT1eHAus0sNUg3DzpygJcwffrgA5mX
 YZjTsu4Ptzi40nwaASzlggGCa4t4tSaBvn2j0QgekiTz+xrvojBNWBI/1M3Sk4ct4VwkN1
 VapV8CVR9Cw3ynDKZ0LWIp2zHs3rS2zEzozxeHrtSWS5xjWGLiP04R4uhXKELq3MrNi/mj
 DOjLYdV9WzlxGyEe1t+qcJM4E8+NMAMslMYit/SwrBFJCaxApG+h7Kt8sSiLZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jAJabC5t
Subject: Re: [Buildroot] [PATCH 7/8] package/libgpgme: add host variant
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 2 Nov 2023 17:09:26 +0100
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> libgpgme is needed by skopeo (to come in a followup patch).
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> ---
>  package/libgpgme/libgpgme.mk | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

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
