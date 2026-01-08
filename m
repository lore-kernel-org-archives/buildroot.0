Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA18D185C6
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22BDE81F82;
	Thu,  8 Jan 2026 11:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rf18OnYnQfib; Thu,  8 Jan 2026 11:04:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E8748193E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870241;
	bh=zeMtNXcIcxRECMvJ7ICRowOdlrMEhTsQIBZX9MRV4lc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GLUAOs6MjvOMLPMEuervISULRPQqyJLscfCuQQDtyBpXmZKoBGDdwMI9mA7j/okJ5
	 yGQ6ZtZ+vwwyTZrvl9mLDJwCBewsTuIV+ZajWi6tbTMq0GmLjM61WqwprXGbstqqW6
	 9d+vqQ+ma9qBK/WxS8wG1ngIQYZGgTRwOnxutyibFfHE2Dq9wkNtmZ4xAX7GtWwHS2
	 jNvkadoYPGSvAJDJobTCSPaHvhIxOu6TVshBMaHM7NYLhRTJZBhErfT6ByqbVm0Eou
	 KBkC8MW9fo9zXb6SB73w2FmPjxXTRP5UeJ9hqih+5B1a9LuQRAjxo8UjqjigkG6Ud4
	 hFAGL+cfPDZ/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E8748193E;
	Thu,  8 Jan 2026 11:04:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CADEF436
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD7ED8193E
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2ghFThi7Guv for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:03:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC2A980A74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC2A980A74
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC2A980A74
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:03:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 05C611A26FC;
 Thu,  8 Jan 2026 11:03:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CE375606B6;
 Thu,  8 Jan 2026 11:03:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 35F8C103C85DB; Thu,  8 Jan 2026 12:03:56 +0100 (CET)
Date: Thu, 8 Jan 2026 12:03:55 +0100
To: Andrew Barnes <umbramalison@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260108120355.72ce8f40@windsurf>
In-Reply-To: <CAKJ_wKQ_LgbnSBhJ0JQ1kybB_Uq7PpCq9_ewHP3m3FuyPK=QKg@mail.gmail.com>
References: <CAKJ_wKQ_LgbnSBhJ0JQ1kybB_Uq7PpCq9_ewHP3m3FuyPK=QKg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767870236; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=HQ9hP1qjI11YBfOVzCiwpS2wOX95MNn730o5SBoJlOY=;
 b=U/B21pfuRWisnwE3P0nuXuT1owcF+iGjduC3dPXR8W/6NJtcLHUZSSBd7gbluDi/cvQmVk
 9wkC0kCww4J+/YwP3CLEk8gEfoetNg6Bs8QLOjjK5H9kvOE9biJe0eAVsMpCrouWhyyE7H
 6HT3A5/FA5s6GEsLoXOb3PwiCSyUBWQ9cx4XE34wA7U+mJn1oOgxRLokSs++kMAjRLL0+P
 AIJoy3O+me7xzrCcoG+98fxW7ogsBgEonnTeMZr0DAIKm/IeYPVA9w1VSLDdPNMr7LyNAB
 sD0rFTXvfX8gKPvlzUgfdj8swzwBaTMKgjwYcd5+vLxiYMd1qLTugImpL8HIfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=U/B21pfu
Subject: Re: [Buildroot] QT6 won't compile with external toolchains
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

Hello Andrew,

On Wed, 7 Jan 2026 13:36:51 +0000
Andrew Barnes <umbramalison@gmail.com> wrote:

> Using either bootlin or ARM external toolchains, the QT6 packages complain
> that they can not find math.h or stdlib.h:

I know you did this on IRC, but could you provide here a minimal
defconfig that exhibits the issue? (And that doesn't depend on anything
we don't have access to, like custom kernel/U-Boot, etc.).

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
