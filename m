Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D035D5B158
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59A6560C16;
	Mon, 28 Oct 2024 22:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoRuJvmRo2Ag; Mon, 28 Oct 2024 22:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6556A60C18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6556A60C18;
	Mon, 28 Oct 2024 22:02:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15A43AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0124A40015
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fil6OS-3Beo for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:02:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F61B40153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F61B40153
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F61B40153
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:02:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A411F1C0007;
 Mon, 28 Oct 2024 22:02:37 +0000 (UTC)
Date: Mon, 28 Oct 2024 23:02:36 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241028230236.25a22c21@windsurf>
In-Reply-To: <20241014234559.3433222-1-james.hilliard1@gmail.com>
References: <20241014234559.3433222-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730152958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aj08W00PMKFX/Op4YY+MrUpGpTr5g7Q69n+s4JFgJoo=;
 b=SWAmf2CDkPiZAjDOv4sGs8XLSVyhyIvV1wwY0HWHVBQWQHi+yiC8sf80egfVgyXjNaKX/r
 V6UH5yrYAPiDy4CGk8m06a1a5NQHQA0SDok66kxAj+rfJtDUzqB05Ci+E6hS8TdgqxxR9m
 PHBKWzW+6ujN8cROIb3cVt9N0Ut1MnGpTxe2rOQJNLI8+ZTxh9G1H93uz3xdwjE1EtVNSr
 BVeLOYf54JuHoehoNdTuweZpAaPaJ9cro9B2dh/307c9P1NuaL7pJs7mHAiKAd+zCYmGvj
 ODeLb7RnemzG1j93LcGedM/NQeknSnYPmlHhhjQnsDtKdJjtlRqitbo87wWKAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SWAmf2CD
Subject: Re: [Buildroot] [PATCH 1/1] package/python-uvloop: bump to version
 0.21.0
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

On Mon, 14 Oct 2024 17:45:59 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-uvloop/python-uvloop.hash | 4 ++--
>  package/python-uvloop/python-uvloop.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
