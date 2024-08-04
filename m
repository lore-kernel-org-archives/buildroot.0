Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CE2C3DA7F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 20:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 754C380E24;
	Sun,  4 Aug 2024 20:46:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5zbK_0vh1_i; Sun,  4 Aug 2024 20:46:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A5F981016
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A5F981016;
	Sun,  4 Aug 2024 20:46:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 854761BF4DD
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72C926063D
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFpekwNqydNn for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 20:46:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6DDA86062F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DDA86062F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DDA86062F
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 20:46:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 981631C0002;
 Sun,  4 Aug 2024 20:46:31 +0000 (UTC)
Date: Sun, 4 Aug 2024 22:46:30 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240804224630.7003e628@windsurf>
In-Reply-To: <Zq9RyIKN5dTsJ4C4@waldemar-brodkorb.de>
References: <Zq9RyIKN5dTsJ4C4@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722804391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Ca+WAmc0MDlHoKsMQ3f0Zn0zD2BQl3hwX7OpD2Ullg=;
 b=at3GPZGNu8rHnjtHCeO8ICIpVzl2h6E/htIfoK+OdvI3ENccjzGxCg9tcef1fb7Wy2CeFF
 Z9MyPDCtxlCIa7NebKrMa3N3Enho7OwS/n0D47eOn3VHFed8aa4NB7zYstMoX37SolaxL6
 vRvJqgjOBywwXVeuT4GAdiGt5CZJXsS5wpz+MHsUI7M/MDMwJtZ4NMxgWM4vyEnzuSKKQq
 zee1p3j4DjD49XoaZWYhChLz2V/nKmW1Pcz97EdLWcEaehkGLxfRIG4cTMZOTQUgWRGgSk
 SICaLQZwZBaCPHrdwVoTYVDvm7SncNGcQMEOgqPjPU1ZQcCyoEiVMyBciXRD5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=at3GPZGN
Subject: Re: [Buildroot] [PATCH] package/libgpg-error: update to 1.50
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

On Sun, 4 Aug 2024 12:02:48 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/libgpg-error/libgpg-error.hash | 4 ++--
>  package/libgpg-error/libgpg-error.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
