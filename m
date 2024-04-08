Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B3CCD1292
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 21:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C277941452;
	Mon,  8 Apr 2024 21:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vj9kCZNBdFM; Mon,  8 Apr 2024 21:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1DE941463
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1DE941463;
	Mon,  8 Apr 2024 21:01:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CAD41BF2A7
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28B6840803
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DwJYtAd1h1tN for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 21:01:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C3E39407FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3E39407FA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3E39407FA
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 21:01:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CD1D40002;
 Mon,  8 Apr 2024 21:01:53 +0000 (UTC)
Date: Mon, 8 Apr 2024 23:01:52 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240408230152.4deaaba4@windsurf>
In-Reply-To: <20240407103436.796428-1-fontaine.fabrice@gmail.com>
References: <20240407103436.796428-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712610113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yWcpkDW55ETxhzNGl3Q3h2fpOZAcsIkhDvx2QQHquQs=;
 b=K0qIYuyaWavIbhMxh/IRgkR1IBU2t93PSOuGrbRo+C9pmAU1xFa0wsDcUK+e5xl4WjtAk4
 iUxEfpfvu4Nnbh3FTwGpj4lled9vNVvDtLSVWTYClU4WHic5MYPXDOcIBazu3xH516PeaO
 1WI+5qrG7kWsft0t+gG2MCS6LgpYRsrQM4nteNLgoc24qDTgExKC/obxB8xuSUQBDB+abk
 fUsZr4C1AKRS1t7BEVsvJwF5S6AQAtzwGpyzVVok1D5cizm8mt8KWBU13Sv6w03klv50Bl
 4cO2fh15JiglxB6erOZ+ID3Q8jtZCbi9LgG7lKEQM+gIEkP0B8NdbZ3p0Q2YBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K0qIYuya
Subject: Re: [Buildroot] [PATCH 1/2] package/python-urwid: bump to version
 2.6.10
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Apr 2024 12:34:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://urwid.org/changelog.html#release-2-6-10
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-urwid/python-urwid.hash | 4 ++--
>  package/python-urwid/python-urwid.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
