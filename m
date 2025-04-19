Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B3EC369D2
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 556AF80B80;
	Sat, 19 Apr 2025 21:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPpJs35uRTva; Sat, 19 Apr 2025 21:45:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81E5C80BCD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E5C80BCD;
	Sat, 19 Apr 2025 21:45:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 164CE230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F121E403FE
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kMneS022z47 for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:45:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06D9B4064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06D9B4064A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06D9B4064A
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:45:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C6E943150;
 Sat, 19 Apr 2025 21:45:50 +0000 (UTC)
Date: Sat, 19 Apr 2025 23:45:49 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20250419234549.4a3a0e04@windsurf>
In-Reply-To: <20250331202513.296233-1-ju.o@free.fr>
References: <20250331202513.296233-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeiudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetieeftedvhedvfeelgfefffevhffftdekueektdfhhedugeejheejtdegieetieenucffohhmrghinhepuggvsghirghnrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745099150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5tZrbEq5LId4YzrvUZcfkwwHXy3XAP+XGQ7gclUbB/c=;
 b=GhuXX/3z/W3S0cPYEZxph+Tyj/6y/+6HfFtkP1SGu7EPAE/1uMUU3yETXInrYYPkESwdIF
 RedwbxjL5kuAPDtUoHisiYsJCBt4K1U8OAk1QYMaI08e1ICmcmDjvosLqVbg1k2XF+eLu3
 peABMkWuR4Brwiv71ejAnow90UtZGmxwXiRSXjjqb0mDDuFgP3LMnb1HYsRsNIoHxbsP/2
 hqGmnpg5CqO33yEmd1+G2o/uGF1DIGJykmxpR+5AhKKXCe2QsFp+76X3k0KAlzDn4f7dYu
 rQWxyiKHFc0IcdApyVeJdbY58IKO84jx9XHo8IPTHtXaTILtfc/Ftc2zb6JCNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GhuXX/3z
Subject: Re: [Buildroot] [PATCH 1/1] package/fakeroot: bump to version
 1.37.1.1
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

On Mon, 31 Mar 2025 22:25:13 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://salsa.debian.org/clint/fakeroot/-/blob/debian/1.37.1.1-1/debian/changelog
> 
> This commit removes the package patch, included in upstream version.
> HOST_FAKEROOT_AUTORECONF = YES is also removed, because it is no longer
> needed.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .../0001-Makefile.am-fix-parallel-build.patch | 97 -------------------
>  package/fakeroot/fakeroot.hash                |  6 +-
>  package/fakeroot/fakeroot.mk                  |  6 +-
>  3 files changed, 5 insertions(+), 104 deletions(-)
>  delete mode 100644 package/fakeroot/0001-Makefile.am-fix-parallel-build.patch

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
