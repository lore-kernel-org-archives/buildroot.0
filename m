Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FE8C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 22:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B320684F75;
	Sun, 11 Feb 2024 22:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URzUeztAclpG; Sun, 11 Feb 2024 22:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D649984FC3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D649984FC3;
	Sun, 11 Feb 2024 22:12:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7FD71BF44A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4FF34173A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xZs_yg1guGef for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 22:12:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C4C5C409D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4C5C409D0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4C5C409D0
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 22:12:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EED4220003;
 Sun, 11 Feb 2024 22:12:19 +0000 (UTC)
Date: Sun, 11 Feb 2024 23:12:19 +0100
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240211231219.39c02e88@windsurf>
In-Reply-To: <20240207171513.2673706-1-buildroot@bubu1.eu>
References: <20240207171513.2673706-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707689540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kcEGFU/sXOtWnM5yWXHdbnq6sA705Kp6SbZQchXNPOw=;
 b=B7GzgHWGGr5k7dQZ8k30521VO92N3mUkdJJzD8RybzUHB7w05E2rMOhCmapGQBYIch192a
 GAfVwpJmlHzmsR5C9mEGcaNowbvuGVqCYrBiHhKPARxyC5wuwrhELlCvcolARR8WH0GlPs
 lCIiTr3uPy1uhANvOyEwl+cmAsyHX1i1ZCEMNiQU2DKmLNwOp0DwmYEPDrZluNfnycCnmK
 8eEUlTTkQFFwImP/G6wr52KmuBgfBCqmIHEx41BHSjBQQldqNSDYVnACKhqDDnSN1Fbadg
 wKFF6l1x4+VhBwYzy1yXffm3EMDFNMTvreUBtM5mf16NA7F4uQXVX3yWmhFRCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B7GzgHWG
Subject: Re: [Buildroot] [PATCH] support/testing: remove hardcoded sleep
 from python-flask test
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
Cc: Lionel Flandrin <lionel@svkt.org>, Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Feb 2024 18:15:12 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Similar to the new fastapi test, instead of waiting for a hard coded
> amount of time we can retry every second until the server is available
> and abort if after the timeout we still didn't manage to connect.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  support/testing/tests/package/test_python_flask.py | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

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
