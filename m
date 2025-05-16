Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0261AC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 14:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9088B839D8;
	Fri, 16 May 2025 14:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UemMLkrBMRlT; Fri, 16 May 2025 14:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B984C839B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B984C839B4;
	Fri, 16 May 2025 14:49:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0860B1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E23DD4057B
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxRBtqA390Xy for <buildroot@buildroot.org>;
 Fri, 16 May 2025 14:49:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CBE0B4025F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBE0B4025F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBE0B4025F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 14:49:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2B3143A2B;
 Fri, 16 May 2025 14:49:35 +0000 (UTC)
Date: Fri, 16 May 2025 16:49:34 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <20250516164934.30f9efa4@windsurf>
In-Reply-To: <Z-4CjumMkTD4gck1@waldemar-brodkorb.de>
References: <Z-4CjumMkTD4gck1@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeftdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeliedvffefieduheehteduvdekvddvfeevteehteelgfdvgfeltddtveevteefgfenucffohhmrghinheprghsthgvrhhishhkrdhorhhgpddtrdhmugdpghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopeifsgigsehophgvnhgrughkrdhorhhgpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747406975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GxmuMFzel2wK3KQl1mV7spiyWhyCsvQ0+7EMgcvGzgg=;
 b=cP10K1uD1clWPHbN1q2R7nbAcUiKBWXgWRQ4zmsJdaW3HRkSUkJbLrTCp9jBl4Pyyqy8FQ
 qOeGGcdaBYynVJX5sg+iR69P7bndqSHlci13ouAAXaY73tY9200lsiJcsclTI+6Pi4jQXv
 E2xogoCUDLZ3d/lx4yaboQKMDiy21CgEzKgl7422PM7D3fcGmmz4wiA37Zn9qYaSsOdPvX
 aCDwWzE00QdWGj3jGEtUd4Bjq5Esgymf2b0GgxVIMI7XUDa54EDP3+9cbT3Yj/ilSxt2Y2
 RVXT9jj3lPm1Uo187cCRJLyY26xSgfl2eYPmWbbtcbMPMhOfZliQ9bgXnnfgkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cP10K1uD
Subject: Re: [Buildroot] [PATCH v2] package/asterisk: update to 22.3.0
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

Hello Waldemar,

On Thu, 3 Apr 2025 05:37:50 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> For a changelog see here:
> https://downloads.asterisk.org/pub/telephony/asterisk/ChangeLog-22.3.0.md
> 
> Changes made by the package maintainer:
> - add systemd service file
> - run asterisk as non-root user asterisk
> - build pjsip as bundled source code, but download it like
>   sound files
> - remove unused configure options
> - chan_alsa was removed upstream in commit
>   de3ce178ab0282445cf25161b49f3737ac2d20ff
> 
> See here for the reason behind using the bundled pjsip:
> https://github.com/asterisk/asterisk/issues/671
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> - v1 -> v2:
>   - add a comment about the pjsip issue to the Makefile (Arnout)
>   - update commit log to include link to chan_alsa removal (Arnout)
>   - update systemd file with a comment where it come from and
>     what changed to the orginal file (Arnout)
> ---
>  package/asterisk/asterisk.hash    |  4 +++-
>  package/asterisk/asterisk.mk      | 31 ++++++++++++++++++-------------
>  package/asterisk/asterisk.service | 23 +++++++++++++++++++++++
>  3 files changed, 44 insertions(+), 14 deletions(-)
>  create mode 100644 package/asterisk/asterisk.service

It is obviously not amazing that we have to use a bundled pjsip, but oh
well, for now it will do the job. It'd be nice to continue to follow-up
with upstream (either asterisk or pjsip or both) and see if ultimately
the issue can be fixed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
