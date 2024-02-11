Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4981C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9436484D9E;
	Sun, 11 Feb 2024 21:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bvjt-TINB-8p; Sun, 11 Feb 2024 21:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2E7A84E10
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2E7A84E10;
	Sun, 11 Feb 2024 21:48:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2974B1BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1548E4012F
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jWwkFzTSawN for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:48:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81CE74011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81CE74011D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81CE74011D
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:48:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE1F3E0002;
 Sun, 11 Feb 2024 21:48:36 +0000 (UTC)
Date: Sun, 11 Feb 2024 22:48:36 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240211224836.70745fbd@windsurf>
In-Reply-To: <20240209192923.1201371-1-ju.o@free.fr>
References: <20240209192923.1201371-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707688117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qofr2TwFPemrowr/u4ZtHENDKN+4TD5VBWZzqFIyTPE=;
 b=JvMVMFZsMPqBvE1T+DZ8I8Nw196bavaQ8XYmKI0dSFeDMIPKvzy9Qy3HIUNiamFTaYoiYT
 pDX50lvjNrTDOMBk+D76Z5r2kjciOw+8pdlfrU0fRkhsp9yqdUvolaUThQAavdF8ipw6rU
 0mf81wWt3g3KeFFCGXJz8s4UY3ozukYpiDbrYWvOS3NyYeLhfB0gT0iAyU4Dw0U6tU/O7J
 qiqJCYFDWO02H1gFM82ceN027uQ2G+HsvHHBQKY+Lwq7pHpGOBw79fYsJSIxm3EZe5Fw2/
 vVsyCYpt/qqkYTiMqhfNXh6vpWYXrY20cONLwEKZ8l90AxzD8p4HTXKZHBP0UA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JvMVMFZs
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add ghostscript
 runtime test
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

On Fri,  9 Feb 2024 20:29:23 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  2 +
>  .../testing/tests/package/test_ghostscript.py | 48 +++++++++++++++++++
>  .../rootfs-overlay/root/document.ps           |  9 ++++
>  3 files changed, 59 insertions(+)
>  create mode 100644 support/testing/tests/package/test_ghostscript.py
>  create mode 100644 support/testing/tests/package/test_ghostscript/rootfs-overlay/root/document.ps

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
