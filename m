Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61A1D185CC
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C76E60DB7;
	Thu,  8 Jan 2026 11:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTi_zg4sNkAI; Thu,  8 Jan 2026 11:03:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B362A60DBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870188;
	bh=jzhOAkCBp8RQ2jyaGO5xmATcVatU6ploSEIrH+ikksQ=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=qCSvtwPfsONYQGadh3adfClDnRXYKdrZb7BRZ7Dh81yI4UYlELLZLVzjD47yDbza/
	 vknosbOJ38EAHGl0tqTr556MZM7jDUc+AD/1rULDnRWEjgcTXL3u7xDwJQiODCwUzo
	 LP+YChQga/76LRGrcaj6LALD+5OatnyRgox7EXPhi8T6WfGVpVR6fFbnI1nVCVBDod
	 u0aluRBM4Klls0xXAkokd3wGXDT7wPrIUkDP7IUJ0DgOnqR/XvD/P2QB25Bpzsunj4
	 wNVfoU1wam9KQSKZbcGbaouXVzU2VauJy42x7NFJhxIs4q56k6CHo4X3/7lB7U4Ya8
	 b5Sm84+xlW69g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B362A60DBF;
	Thu,  8 Jan 2026 11:03:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24180237
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 221DA828BA
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pyCt8QsD9BCX for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:03:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 31FB58291C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31FB58291C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31FB58291C
 for <buildroot@busybox.net>; Thu,  8 Jan 2026 11:03:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3652A4E41FF5;
 Thu,  8 Jan 2026 11:03:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 01D22606B6;
 Thu,  8 Jan 2026 11:03:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6317103C85DB; Thu,  8 Jan 2026 12:03:01 +0100 (CET)
Date: Thu, 8 Jan 2026 12:03:00 +0100
To: Francois Perrad via buildroot <buildroot@buildroot.org>
Message-ID: <20260108120300.01a570c3@windsurf>
In-Reply-To: <20260107200004.665611-1-francois.perrad@gadz.org>
References: <20260107200004.665611-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767870183; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6A59u87WO0wuMnfiqgUk0Odyhm9FnpBo/suTghFUrT8=;
 b=Z6lDCnkxhsoQvVIZdud3gVjlz/IPMBK2Qvo6dCBveZwewGSqHBdhCADpeaXcPkx9NdeAaY
 8AM+rgYqs76TceaXI8r3pJ5+7HUWGKfsBHhewl8GE9qnzhCYxUmm0S8p3XFGEaQgQZ5Hdj
 hHUGNMvUc8UKDIO3EPxtLu7etF6zv0E08tZodWGmBzvPc9/7w0sPOENq+7PdH28jBAWosl
 VpITOgXK0WPUj14X0cyxLdj6TtNY7W9dKRZ0mTmi7HLaMkEhMS/zk+ButEwc6G07+s1rgn
 dT4vRu0Ns51GVA+IBoohyj1jxkfxmdBX87CzKelG1MmOHTt6LGrNDo+e/3p4Zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Z6lDCnkx
Subject: Re: [Buildroot] [PATCH 01/16] package/perl-date-manip: bump to
 version 6.98
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Jan 2026 20:59:48 +0100
Francois Perrad via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-date-manip/perl-date-manip.hash | 4 ++--
>  package/perl-date-manip/perl-date-manip.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Whole series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
