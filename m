Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEF8C98305
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 21:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DAAD61570;
	Fri, 16 Jan 2026 21:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuVEw0FD4ZLw; Fri, 16 Jan 2026 21:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3BD261577
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768600718;
	bh=l5byoVnlULwfhfuaAqHzfl0X+aB8n8yDBmayxlDd810=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=axNFviVo1I0QDPAcYehWrKOmoCLlwVFAOxnmPRCpoA59M75CaTP4fffXGkE6tZC77
	 GgVh0+wsWRLLgTR7LMuNtLqiYOtIt+VwNvX1aSsLRdqhlLSG+83Z602B2P6rU7StaF
	 F4mNh3+8q4CAm7D5effzr54Edwreg7vnVvNuy7T8PUldilHkyc1vk2k6JBF79JhqMc
	 qIp37tbOIiwcMZceEXOnQ0Qxo81izUWpEPpiEWDGk8MzXNzx/tiP0gc/QQlxQckbAI
	 3VW6YgBxaoS4uVXY8noLywL3gvWFfko/qKiNwu+MXA0gdFrpLH0tHheRUZcPKXzNfw
	 VwFJidM/OWfMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3BD261577;
	Fri, 16 Jan 2026 21:58:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D4EE2CC
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23EA184D69
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9s6ubXCrRs04 for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 21:58:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 61BC484D5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61BC484D5C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61BC484D5C
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:58:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9938F1A28C2
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:58:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 705A9606F9;
 Fri, 16 Jan 2026 21:58:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DC00E10B68EAC; Fri, 16 Jan 2026 22:58:33 +0100 (CET)
Date: Fri, 16 Jan 2026 22:58:33 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aWq0fGV-MoKkcl7Q@windsurf>
References: <20251220170623.155785-1-bernd@kuhls.net>
 <20251220170623.155785-4-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251220170623.155785-4-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1768600714; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=PxCbYYxio0PzxFRZSg1xSbFAUI99tmsPdz26+jSbJVQ=;
 b=g/HpwG/MYAZAn4oIEeFOUNfGd5nsEv/Rk3gHzqXZveMzN+YEqGcavfpTaHS/KIQ1wGSdBi
 t4lNPoJ0vjDaBkcj9+cehZxoN80H9c5E075ka0CrnSK+NBoFEdowJuXObDx7d/20kkpmLt
 LvakWwW71GvVELVYQiDGlvvFPIkkXKqZxhuLyCnjNEdveqS1juNRwYxn/YFd/wDm2bkyNw
 k6NfWtjTpsq3Lut7s9z+BYxmPCLQiHdA9X7o7DZoWqSawzCM/+eRApoTBqhQGrdjo0qL4a
 kszxdDbNaKJwz7f1+RpWRxJfqMZH0P812MHqZfYSafOm/cORhcUe04h5xuW6+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=g/HpwG/M
Subject: Re: [Buildroot] [PATCH 4/4] package/util-linux: bump version to
 2.41.3
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

On Sat, Dec 20, 2025 at 06:06:23PM +0100, Bernd Kuhls wrote:
> Release notes:
> https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.3-ReleaseNotes
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
