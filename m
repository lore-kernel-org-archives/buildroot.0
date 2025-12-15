Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1685D5B16C
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 14:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B71E98125A;
	Mon, 15 Dec 2025 14:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6L9oSXdPSwEb; Mon, 15 Dec 2025 14:23:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0256881227
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765808581;
	bh=Rz0/UG4bKR7YzGHvpcrx69IPkFp3nSkelYZNMNGSe1Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dPYmJ99O1GqEPKQirAOn80SlOD+1ECAghrTqs1ZowZMi/V2jO6ZgfaaOKz6/EIPZf
	 laiIvthDNFLjLERgWHFnTdrrmpkirAun+QHzGDk2lsay/LOVSaBre4C1+MlzIUdMHe
	 GYj94AE4pSAGIm4fFt5MHnUeDz+shT0zX3ZAsWz0shEj5z9lfuEeBWdTiOlOXTUjGC
	 rOEpHugf8p6iHh+B7mduz7x4hCdbKs5C7PkwXv1DRx7OjN7LH0PuKGgN70DnNzwgYE
	 IvTQPLQbfC5fqa0IFrpKQYOxEzZdLdSxVjI25gbz3lTr48jIheL3bVMNvTA2Iosfoo
	 lNsrKSaSINUdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0256881227;
	Mon, 15 Dec 2025 14:23:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B520118
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56BE7407D9
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CbdloMHl3CrX for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 14:22:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47D194047D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47D194047D
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47D194047D
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:22:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C68291A21BF;
 Mon, 15 Dec 2025 14:22:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 94F1660664;
 Mon, 15 Dec 2025 14:22:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9BB93119423E7; Mon, 15 Dec 2025 15:22:49 +0100 (CET)
Date: Mon, 15 Dec 2025 15:22:48 +0100
To: Bryan Brattlof <bb@ti.com>
Cc: Sadik SM <s-sadik@ti.com>, <buildroot@buildroot.org>
Message-ID: <20251215152248.52dbb210@windsurf>
In-Reply-To: <20251215140051.om5xtszi4xumpdjh@bryanbrattlof.com>
References: <20251215132425.136858-1-s-sadik@ti.com>
 <20251215140051.om5xtszi4xumpdjh@bryanbrattlof.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765808571; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=RvsO0961waVYe78EmmToMvZHHSPxk2kR2N28hK7fBLs=;
 b=Rd5nVWwVqQeOiJC/UhxlSLi6uY+AmgEYco5HKA3ytnzXeHdgyjJM5uTtYN+kRLK2J8aTm7
 faimu+grbCQPBlVHDYMXudFXi/ZSxDBWTE02kBTsds7tkxJFRaPp+0xXjMASHy041DhRtQ
 BGBnx+21dQAaXSYNpAgI69sTWbwV1Z5NdNK5VFpw509OiQFeee/KvJXPPtzpqyu61mlQJE
 bOowUfKG/5bfdSrfSNvbL6ALDuXcQ3ljk+y12Mq5cPx4Kh/6gca+lbXJAAag538FzE+1Mv
 oXvUc72XX0SAGd0JBwUNCKTKFR/8vWDv2I4h4tHJKM8Hec0LN/nsS5n55dgL/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Rd5nVWwV
Subject: Re: [Buildroot] [PATCH] package: new: add k3conf tool package
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

On Mon, 15 Dec 2025 08:00:51 -0600
Bryan Brattlof <bb@ti.com> wrote:

> Works for me! I wonder if we should call out the kernel needs to provide 
> /dev/mem for this tool[0] 
> 
> [0] https://git.ti.com/cgit/k3conf/k3conf/tree/common/mmio.c#n39

You can always do:

define K3CONF_LINUX_CONFIG_FIXUPS
        $(call KCONFIG_ENABLE_OPT,CONFIG_DEVMEM)
endef

if you want to be sure it is enabled.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
