Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CFDCA0EE9
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A7B161528;
	Sat, 16 Aug 2025 20:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRJ-J9NP5TPB; Sat, 16 Aug 2025 20:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C43CB61525
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C43CB61525;
	Sat, 16 Aug 2025 20:31:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17C71223
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1540061523
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bQj_R1M4O_d for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:31:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D438C61520
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D438C61520
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D438C61520
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:31:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B5011F47A;
 Sat, 16 Aug 2025 20:30:58 +0000 (UTC)
Date: Sat, 16 Aug 2025 22:30:57 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
Message-ID: <20250816223057.689bd7f2@windsurf>
In-Reply-To: <20250813201355.6232-1-fl@n621.de>
References: <20250813201355.6232-1-fl@n621.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedutdffhfdvgeeuleduuefgleehieefueeujeejvefhteeujeetjeetvddufffhffenucffohhmrghinhepsghuihhlughrohhothdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepfhhlsehniedvuddruggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755376258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6jvvL4f7RqZ1V6YT7B1/mJw/BjqH+swbsc21wpcnSY=;
 b=CBrqnroxuZ+TE5ZJEF1N/FLYAOeRVZ0MJ7KFlq4yYSyR/N+2udRHfPGWdYLbIaUHv9MKWf
 Wj/pNakFTviquyV6CM7DcfOesO0vSW/qMv34L1UgvEYjjUIrk3clhlUAZOo5V0AttjArYe
 uYRVTtxoJ0jAGVbgvE9IVcDdSfqqpK0Yhvy13ncuT6altKbJQPBf4duX6RUAqH/2M93SmJ
 tyQNR1pBjy0TJl31lJGygTlcDbuW1D7i0IdtWaxkf4k0FzNtKyA9yCqKc1qoSop3xltb/D
 7GpMHskisuJoatVGY1ZKRotb6KeYt61lWOXy0z8zC7FHM/faBqVvMzxr4b9ulw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CBrqnrox
Subject: Re: [Buildroot] [PATCH 1/1] package/start-stop-daemon: fix build
 issues with musl and GCC 14
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

On Wed, 13 Aug 2025 22:13:54 +0200
Florian Larysch <fl@n621.de> wrote:

> Unlike glibc and uClibc, musl doesn't play tricks with transparent
> unions for the second argument to bind() to accept the various sockaddr
> variants, but rather just defines it as "struct sockaddr*". As GCC 14 no
> longer allows arbitrary implicit pointer casts, this results in a build
> error. Import the upstream patch that adds the cast.
> 
> Fixes: https://autobuild.buildroot.org/results/00b/00b42a35a80c2deb61f2cd40aedd231597bbb290
> Signed-off-by: Florian Larysch <fl@n621.de>
> ---
>  ...t-sockaddr_un-to-struct-sockaddr-on-.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/start-stop-daemon/0003-s-s-d-Cast-struct-sockaddr_un-to-struct-sockaddr-on-.patch

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
