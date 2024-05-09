Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A98C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 759DD418BE;
	Thu,  9 May 2024 14:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujhrQXOyU6F8; Thu,  9 May 2024 14:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C18C41561
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C18C41561;
	Thu,  9 May 2024 14:32:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29A001BF990
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1661383D46
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uzPQ9FRj05AY for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:32:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C76E183C38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C76E183C38
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C76E183C38
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:31:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFEDC240005;
 Thu,  9 May 2024 14:31:56 +0000 (UTC)
Date: Thu, 9 May 2024 16:31:55 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240509163155.7eaf7171@windsurf>
In-Reply-To: <20240508204910.751301-1-fontaine.fabrice@gmail.com>
References: <20240508204910.751301-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715265116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KwhdcvOGw9AptWk+s8290PBfF+cv2wc0fgyOyyDBfik=;
 b=RpPFdTttbGRqdOPCvDNJQgwhqpIeisCKCco+s0wiWWZaGgC5L6d/KWHivljW7RguDP4/nA
 oQZLavj3aM2lbEb8HWFN9nYw3x40o32iLvPrMQlUuCE0ad8+/BXff6N/nuV3rkPaRsL9G2
 zi3SZcxH3B/Pzzx4K6dKIn7s8cdS4raLcRB5ISoDVLkeix6g9z3e6ODr2v2bxUZBg3VrEM
 vNvmPwJE/kGpz5NeIdww48a8eYKi/KL9rwbrxsNddzu+NDL7sCMPcGnJsfx4RUPxVloxfF
 mpFJdcyUhs4infyDOj6VYETENj9qPPwHCCb1vrLqP3fgO27ONvflhfOYfnT4yQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RpPFdTtt
Subject: Re: [Buildroot] [PATCH 1/1] package/libjwt: security bump to
 version 1.17.0
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

On Wed,  8 May 2024 22:49:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Use official tarball and so drop autoreconf
> - Update hash of LICENSE file, verbatim copy of the current MPL 2.0 with
>   https://github.com/benmcollins/libjwt/commit/ebebb5027f37a85c40c072a02681e206d31875ca
> - Fix CVE-2024-25189: libjwt 1.15.3 uses strcmp (which is not constant
>   time) to verify authentication, which makes it easier to bypass
>   authentication via a timing side channel.
> 
> https://github.com/benmcollins/libjwt/compare/v1.15.3...v1.17.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libjwt/libjwt.hash | 4 ++--
>  package/libjwt/libjwt.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
