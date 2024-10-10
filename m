Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B7AD2444F
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7472141576;
	Thu, 10 Oct 2024 21:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgYrUcWN5WIT; Thu, 10 Oct 2024 21:37:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9C7D41648
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9C7D41648;
	Thu, 10 Oct 2024 21:37:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AC121BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AAD060BEB
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vysh12j_sVH4 for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 348CE60BE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 348CE60BE0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 348CE60BE0
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A98540004;
 Thu, 10 Oct 2024 21:36:38 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:35:25 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233525.31516bc6@windsurf>
In-Reply-To: <20241009175850.3869401-1-james.hilliard1@gmail.com>
References: <20241009175850.3869401-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZtpY9X1OUfiXdBC53Z7UkxfoePGE2s0VKkWc2svB0c=;
 b=dHWH49nvgFHGcJk1yiWhewmCY0PpQmhBUVPYKLo1S4g5NBgJ+xueU2lHoke6AIs3ZRmlMV
 VlkV5mjlF+7FwLumQ0ssbO3g83KvGs2HXrchT/DKQVeY4gb6XKuxYIPF2z26GygWK6Z7Uu
 xILyWBbFhJQb7CrFJvYdvQM7Bq97LxZ1tumcHsSYnD42DSsBF6hn7LtVyFaOUJKpT65RlD
 emLgMeBXRGofxuyRRekWlDTKQQD1/PEErDvdS6Rbq5LC74U6b4qVmUnH/m2sxjQ2Rpp0k4
 ppMu+iFO+3YyFXGN4ulXdQpx1fsmr9ZPmpBXleoIxcJifr1BZui5SxeDHqG1IQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dHWH49nv
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to
 version 2.16.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  9 Oct 2024 11:58:50 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
>  package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
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
