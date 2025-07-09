Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8120C83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 21:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60ACC4081E;
	Wed,  9 Jul 2025 21:13:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtF-nRoItPb3; Wed,  9 Jul 2025 21:13:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8F7040A4A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8F7040A4A;
	Wed,  9 Jul 2025 21:13:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C57815F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 21:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82AF840A62
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 21:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_vDF9zHykOp for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 21:13:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::236;
 helo=relay16.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 97CFE40A4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97CFE40A4A
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97CFE40A4A
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 21:13:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2D0544A4E;
 Wed,  9 Jul 2025 21:13:28 +0000 (UTC)
Date: Wed, 9 Jul 2025 23:13:27 +0200
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
Message-ID: <20250709231327.0ed2fa35@windsurf>
In-Reply-To: <20250709200737.408235-1-thomas.perale@mind.be>
References: <20250709200737.408235-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefkeeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsehmihhnugdrsggv
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1752095608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KH3CXuSCBFYGvC9/Vg4OGRFJhOj8RFSfRGGvCohpbKo=;
 b=h6XUt3DxuLMHKthuAOouCe+RZt0roY+4YZsXbBoDzXkF29jXT98ogkivvPNH4X8UnpNQZJ
 JdQ5Z+YH0pF6vsLSoDhklhYDBKZqMXYiqTSM3g29oT9mkB08WLd4KG27ePVVUSsgIuIOOR
 sxARVkqsN4fMCqoeFhOx5wr5pCR0nuy012LXfSzfm5876xr29xyEm1YFIuusRd/0Ntg4Dw
 HJBE2Fsvnq3mYQLeyox2eUYOeFV0XKhLKvKWnWHS2ph3QB+M/MLpinFK2Ac8DzLCbiLch+
 bk/SYZ+3DL1SOYKYOE6epXat6gRjurpuCTR/TPG2+9kZOmrsd+1dfLio+vIs5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h6XUt3Dx
Subject: Re: [Buildroot] [PATCH] package/softether: fix various build errors
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

On Wed,  9 Jul 2025 22:07:36 +0200
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

> This packages hasn't been bumped since 2019 & no-one is following it on
> the DEVELOPERS list. Given the increasing number of patches and
> difficulty to maintain it, I think it's a good candidate to be removed.

Totally agree.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
