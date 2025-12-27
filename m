Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E4CE92704
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 752C7406DE;
	Sat, 27 Dec 2025 15:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiGNRfPav_Z5; Sat, 27 Dec 2025 15:18:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 611254068F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766848720;
	bh=Hby6GTFIqnof5yPxkfplhST0V91CPjpFagYAn++H/9M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nO71dj90H7a6aGVRRpdpxtmSh+YehNBi2dkWTRZR+zFD0s5zKDrEEzzOJ04lJCA6H
	 903VKAA5PeIBFU+NMDEhZ2tQuAA2Cmwbs3704K/rNG/lKDcKxCeWJQsmpjRuaQrUvu
	 TSwjlXQke5iM3cXm6rqpWiFhWjKbwnvXuyid4fZSan/XrlIx/lXNwgmhLdRUqb4WX+
	 I7rkrWLJpNa6Fb9YLCt7tYBEb8qgbB6ctV9r1LebFDuPaBIZRQ8+mBoDfTXQ8WsEXf
	 qYx/Be60bjTHm5rvEwWOdjqhIQ/YjpmenOohSmy0dorQiYNVOIpyQn5pRtTXbgJ0rS
	 cfBDRHyOlH/sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 611254068F;
	Sat, 27 Dec 2025 15:18:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50264D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F27E40254
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90RpKVU-KUlL for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:18:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E9DC4024C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E9DC4024C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E9DC4024C
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:18:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 79CB94E41E17
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:18:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4E58360725;
 Sat, 27 Dec 2025 15:18:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4C774119784FF; Sat, 27 Dec 2025 16:18:35 +0100 (CET)
Date: Sat, 27 Dec 2025 16:18:34 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Laurent Charpentier <laurent_pubs@yahoo.com>
Message-ID: <20251227161834.44fd1919@windsurf>
In-Reply-To: <20251214171531.1496512-2-bernd@kuhls.net>
References: <20251214171531.1496512-1-bernd@kuhls.net>
 <20251214171531.1496512-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766848715; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=H3zNykiZxegIJ8rs773Sfnja+juvCtUia1iyfrUz7cA=;
 b=Np+EKGGmC81QKRbrc4NXiDsltNzEhRii4rJ9OVLSMLNlKSTkrLT2uNT/piP3U6LnaHgGyW
 O/t4MF3CIu24/xlJRhZpZwVmI9Y6XrJQKummQVD9ScFOVv2gibAMtiSpscUYjdXOAMWN/O
 EcT+QNPMQAl2899Zlo1XODNMRUej7897m32d9ZhCf5BUUNQF67bl3iml/fC4Fj2VEjOU7M
 WMsu5u7QgvOlReXNE7aX9fpZ3aK/j5HxDnyf8juoPXW0YWayCnJPh7t8NF/zE3cQwnFwMx
 hBOPgyxXUU9gcrLyvpiA268X7EHRUXnyyX/YKsqS/NulwoY/1FS5zwGug8yhJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Np+EKGGm
Subject: Re: [Buildroot] [PATCH 2/2] package/open-lldp: bump version to 1.1.1
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

On Sun, 14 Dec 2025 18:15:31 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> https://github.com/intel/openlldp/blob/v1.1.1/ChangeLog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/open-lldp/open-lldp.hash | 2 +-
>  package/open-lldp/open-lldp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
