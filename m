Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FA1C369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 849A9607FF;
	Sat, 19 Apr 2025 21:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hiCNi4tG9ZP1; Sat, 19 Apr 2025 21:43:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD7306084C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD7306084C;
	Sat, 19 Apr 2025 21:43:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43A0422F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF77F40645
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7b3lIxkog-af for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:43:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DC3ED403FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC3ED403FE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC3ED403FE
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:43:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0200C1FCE8;
 Sat, 19 Apr 2025 21:43:00 +0000 (UTC)
Date: Sat, 19 Apr 2025 23:43:00 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20250419234300.00c1a07a@windsurf>
In-Reply-To: <20250331200302.207790-1-ju.o@free.fr>
References: <20250331200302.207790-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeiudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevkeduveehudevteeijefhffefueejteetjedutdfhieegjeeujeevhfdtgfefudenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745098981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=esazklFTNMIGe3XO6W890o+Cd5BmFg/GZNXNNQXIyKk=;
 b=RH4uItrQMRiE1waU2fhlrLMKxigiSeaDXS4AN9iZMq1NNwfWrvlhn97TxpKOY9iUR75dX8
 tWvb0OcwEnrfy8Z62pPJ8kyBLAcT6MkmYgPedJhYD4cu+7ZCNozYLAS1Ui8e4Dz4K+Bmyj
 iM+FM6114VuzJ5QjI+5d24n3wxwcoTI9bMEqpmpM0dDjbzpZcqSr/nGEudHLcWDYYI8snk
 ZlHadAlTPu/hT7vp8zoJ+qiJjJiO+GZFcd9jD+ERwKrJUwIzsHV8FWbW7wZc2Nf9WGLtou
 A7eIuVzUdlnb5B6MSMQxZo9xArA14kJWiuoVthgPosL7XLEl4gD5WybUf8uRZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RH4uItrQ
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: weston: fix the weston
 shutdown test
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

On Mon, 31 Mar 2025 22:03:02 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Commit [1] "support/testing: improve weston test reliability" moved
> out the wait time from the emulator (to run on the test controller).
> 
> While doing so, the sleep time which was initially _after_ the
> "killall weston" invocation to in stop_weston() was incorrectly
> moved before the command invocation. In this state, the test can
> succeed on fast host computer running the test. But it will most
> likely fail on an average computer.
> 
> This commit fixes this issue by moving the sleep time after
> the command invocation.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/6561a5d773d8e159556e2b911b315e3b5a0b89b1
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  support/testing/tests/package/test_weston.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
