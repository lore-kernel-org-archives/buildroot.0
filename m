Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F073C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4135741883;
	Fri, 12 Jul 2024 13:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbEv87C6Bk08; Fri, 12 Jul 2024 13:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0937241886
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0937241886;
	Fri, 12 Jul 2024 13:33:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97DD61BF59E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83B8C4043E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MifaOfrVBziM for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:33:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EC4CE40273
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC4CE40273
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC4CE40273
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:33:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 247D3240003;
 Fri, 12 Jul 2024 13:33:20 +0000 (UTC)
Date: Fri, 12 Jul 2024 15:33:19 +0200
To: Saeed Kazemi <kazemi.ms@gmail.com>
Message-ID: <20240712153319.19609811@windsurf>
In-Reply-To: <20240302191215.2743208-1-kazemi.ms@gmail.com>
References: <20240302191215.2743208-1-kazemi.ms@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720791200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRHjzXbu3fUgBZVu+wj7jhz8AgpQ8bLEoswn2xW3gP8=;
 b=Rl1C7/ZCAcb/oL2zwukzlZWQeTpoDsAP/a222CIz86CAd++NhEUzLQhl0Pb46rQPCjeoQZ
 RaNuYtvBMbiGpCX3tQUPVW0q/548gMFu1dtwaLxTKL3+SraR0xAF+JxMgybBPIdZB5Ordb
 z4ae5nplGabpjV40dv2924fpmhS8C6ojJb4tusRKnMdbyqiR2DckW64+9NtOVYuXudHofP
 XviPDriOjAwfw/thY0yXY3fW8TvRBN6jNWysRFmspJ2/Nfojts20we4zJ6Ikunzi0+wCxd
 vLKCcwXs9m2LEKVDrq2YifNLflH987NutdhMVBQhpU9ABa7dz/jGEBGY8+atwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rl1C7/ZC
Subject: Re: [Buildroot] [PATCH 1/1] package/zoxide: new package
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

On Sat,  2 Mar 2024 20:12:15 +0100
Saeed Kazemi <kazemi.ms@gmail.com> wrote:

> A smarter cd command. Supports all major shells.
> 
> https://github.com/ajeetdsouza/zoxide.git
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
> ---
>  DEVELOPERS                 |  1 +
>  package/Config.in          |  1 +
>  package/zoxide/Config.in   | 11 +++++++++++
>  package/zoxide/zoxide.hash |  3 +++
>  package/zoxide/zoxide.mk   | 12 ++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/zoxide/Config.in
>  create mode 100644 package/zoxide/zoxide.hash
>  create mode 100644 package/zoxide/zoxide.mk

I had to fix up the hash file a bit because we did some changes to how
Cargo packages are vendored, but other than that it looked good: patch
applied! Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
