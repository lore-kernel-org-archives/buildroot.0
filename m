Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2B1C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 09:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA59380B6E;
	Tue, 23 Jul 2024 09:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwPfyCxUBJbY; Tue, 23 Jul 2024 09:42:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9CD2811F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9CD2811F6;
	Tue, 23 Jul 2024 09:42:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 017541BF3AA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E29B2409F5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRuqJtQK6B0t for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 09:42:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9ED104027F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9ED104027F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9ED104027F
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:42:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACA511BF20D;
 Tue, 23 Jul 2024 09:42:42 +0000 (UTC)
Date: Tue, 23 Jul 2024 11:42:41 +0200
To: Geoff Levand <geoff@infradead.org>
Message-ID: <20240723114241.60013a2d@windsurf>
In-Reply-To: <1301e4f4-8667-48a9-82b1-7042aad06168@infradead.org>
References: <1301e4f4-8667-48a9-82b1-7042aad06168@infradead.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721727763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R6twWDaiwwIl3Hethx1jpu3ZlTy/howxWfU5mP25Hsc=;
 b=HAaVFfTYzW06uMsAzSlcUAqWMkKm6tQKeJ4+61QENehQj3sqF2ywyBJ03MGhkHfJkqn2fr
 UBolVHAqYPHwXmiYg01QW3yunTY0COMbCdn44/oSgOUecGz8b4R0dUos6pm8qTiuAHuU7o
 MFnqgctaKS28J0LAfYTHV3QdYaiGOQoY1ikvy2PwiBahCrnPVxbpXS6oXIVbeUbLhTnUOm
 1h98llc1cttWLD47aZkOvfSERaZH1ODvnod3/WPMYLXZ146CRBpRCo48Qb2xfPKP803cWg
 +96JIbljRjHwsLWZsW0PPUXFfQ6YSn6S0ofXeA91UpmNLzwYsLba4SvvDI5ZjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HAaVFfTY
Subject: Re: [Buildroot] package/flannel: Bump to version 0.25.5
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

Hello Geoff,

On Tue, 23 Jul 2024 18:27:58 +0900
Geoff Levand <geoff@infradead.org> wrote:

> Signed-off-by: Geoff Levand <geoff@infradead.org>
> 

Your patch was missing a --- separator here, for some reason.

Also, minor nit, I prefer a lower-case letter for the commit title, i.e
"bump to version ..." instead of "Bump to version ...". No particular
reason for this, other than being consistent with the vast majority of
the commits that we do.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
