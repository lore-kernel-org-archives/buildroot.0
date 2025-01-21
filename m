Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8B0C0218B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 15:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AF576077B;
	Tue, 21 Jan 2025 15:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HCrhFjQSC9m; Tue, 21 Jan 2025 15:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 551DB60860
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 551DB60860;
	Tue, 21 Jan 2025 15:36:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6435959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 823E1413E8
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbHMEcvVSuhO for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 15:36:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0CCE941271
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CCE941271
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CCE941271
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:36:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C042820005;
 Tue, 21 Jan 2025 15:36:26 +0000 (UTC)
Date: Tue, 21 Jan 2025 16:36:25 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250121163625.2f3a3c5c@booty>
In-Reply-To: <20250121102222.1335874-4-neal.frager@amd.com>
References: <20250121102222.1335874-1-neal.frager@amd.com>
 <20250121102222.1335874-4-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737473787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wAsb4ZAlLnmd6AAMmyHO03LAt3oAoEQgqyx5yFjKNj8=;
 b=UaNlfZ6ZatR3/Qj9rTKph2uto3zi0HfcnlM3P9BeKs8JnXlUeM2qeGgqqkpTLAI7vKFnoO
 DL5R3i2tDOY3aVnbgnk8VBbDDa0mLFaEfJkKoTkHGpJD7zgF+oJcBowFFoeF/r5OnbL/1j
 4lF+6zelvvXNi8Hq8u90bXc/u0imcp/Xolf/B2hZ0Fn+uYKrYurkaRpsmIj+m56i4swOGH
 DWjb9vKlbD9QiNa5LOXFgtl4fRzmT0BzuFHp19wVwqT9NR6Li8gqyiqqnMVPzJu5vio9YF
 W4cH9GFL0iBPdrOGrTIDWQVBYzENkre39IM5Sn2W6K+bYL8zF45d8/SyrIlAtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UaNlfZ6Z
Subject: Re: [Buildroot] [PATCH v3 4/4] configs/versal_*: migrate to
 xilinx-embeddedsw
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, romain.naour@smile.fr,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 Jan 2025 10:22:22 +0000
Neal Frager <neal.frager@amd.com> wrote:

> Migrate versal defconfigs to xilinx-embeddedsw package for building
> versal plm and versal psmfw applications.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
