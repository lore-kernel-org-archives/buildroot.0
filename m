Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061FFE83062
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0F7C605B3;
	Tue,  3 Feb 2026 08:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUNwENbVzTjt; Tue,  3 Feb 2026 08:53:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAF396080B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770108832;
	bh=b39aYfUrwzXCx6NkZal89peJapy0gnIA9BeTDkskJE4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hlucgtrg/ltJrk8olrrFuTX6ulLEbQjR3OvK8wv1OIh43+DmuBOT5CN740+OGj73H
	 oLNTsarYsWDU2RietG34HNglgw/z37ooGaXqOmbyV6JtiSbWGX1zKFHwvc59ti90FA
	 Wf7TuSZ4nmtJzvZA+/z79QiH2OcI0bfJoUxiRAStV0iQvXNrDnq+TWZOs4DxyePgAe
	 iYGKUpd1KdNvbsF+++Cw8zV41ibRm8UpjjNl9dl0NGaEMOlEUTsByZxhqYSzdusLFG
	 Z8G0MQbVJFyrTIMxx9cEmBfWpTxJlfyLdXCp2U+TZ2gK/VaTGu1+ago9d8EqRbj9Wk
	 6QhXlYWW1g+3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAF396080B;
	Tue,  3 Feb 2026 08:53:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB594F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B550240445
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnLxAX0qwP0s for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:53:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC034403C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC034403C4
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC034403C4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:53:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 84B1DC211D2;
 Tue,  3 Feb 2026 08:53:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 682DD60728;
 Tue,  3 Feb 2026 08:53:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9B734119A88EE; Tue,  3 Feb 2026 09:53:45 +0100 (CET)
Date: Tue, 3 Feb 2026 09:53:44 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Kris Bahnsen <kris@embeddedts.com>
Message-ID: <aYG3PFVXVNne8e5w@windsurf>
References: <20251230185749.2563723-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230185749.2563723-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770108826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=3JdKeJk5YTxpDHU82YTHcCAeN6dsSbVhBOgVld/DWZ8=;
 b=ITdBJ5gupelN/rm5d3q0sDcMv2E4vxAx55z/awTXmdm0DAyBdp9JU/Lx/9PygBmm65lc52
 T6zR9ksF6+x9YENLlXkoMvno0z3HAfsAsNwVqZ4Nr9HgfGVDBwTUOE/R/u0R8+cmL/tsk3
 VIYXro9xle2WBPMN1nWX2enETr0El19vpxfKIArSgyUpi56s32k5/p2RhnhRJTq2ZFtoQx
 9Vu6Ia9kms1x97EdncefD/JcJrPTbP72PKSlvfsc+2LxcFiUQ/cYODs+4wLua+CfYb+QJD
 c6pPMXAJhzwokZ7AqlDE73Ew5opx5+kt0G516Fnf//OH1vHa1F2RGrzsD72D0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ITdBJ5gu
Subject: Re: [Buildroot] [PATCH v3] package/wilc-driver: redirect URL to
 github benetti-engineering
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

On Tue, Dec 30, 2025 at 07:57:49PM +0100, Giulio Benetti wrote:
> Drop all local patches that are committed to github benetti-engineering
> repositories.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks, applied! We normally don't like too much to use "personal"
Github forks, but your fork is probably as good as Kris fork at
EmbeddedTS, hence we applied.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
