Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F72C369DC
	for <buildroot@archiver.kernel.org>; Thu,  1 May 2025 19:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ACEF40850;
	Thu,  1 May 2025 19:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9G2otBnEt_k4; Thu,  1 May 2025 19:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9844F40918
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9844F40918;
	Thu,  1 May 2025 19:39:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56F1D113
 for <buildroot@buildroot.org>; Thu,  1 May 2025 19:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D6E440934
 for <buildroot@buildroot.org>; Thu,  1 May 2025 19:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKurgJuunVSX for <buildroot@buildroot.org>;
 Thu,  1 May 2025 19:39:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8155740918
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8155740918
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8155740918
 for <buildroot@buildroot.org>; Thu,  1 May 2025 19:39:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id F2CFF19F522;
 Thu,  1 May 2025 21:39:43 +0200 (CEST)
Received: from 2a01:cb1d:9279:be00:c208:5c5d:a534:6e05
 via 2a01:cb1d:9279:be00:c208:5c5d:a534:6e05 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 01 May 2025 21:39:43 +0200
MIME-Version: 1.0
Date: Thu, 01 May 2025 21:39:43 +0200
From: Julien Olivain <ju.o@free.fr>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250430091815.97571-1-titouan.christophe@mind.be>
References: <20250430091815.97571-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <c53194a44903d1c72e540da23f829be1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746128385;
 bh=7tNOuh62KATY/GTIY+UkPCvMK9/K17RIgXpXXcnrQ9k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XdXuX4cVi5G77+A0Ldv54gJTk8hrmDcNBxZtymTR6qG19bcmtbQOQWbjsN4/GA2A4
 w6y9ZTpoaPW4dvb8vnGpS5F47/r0syaPnmDgrdt58tu75lpNlQQyWes7DRUNYEHS9b
 Yi7W8ruthgw6/GKx5FKvRgjZ6FAAES5RSMJksM9eitbpTRmXCVhZXEmVeCjtQRTHT2
 6svnQiFiaILRROPmBZn+p3OO2WBifZTP527WHdbubmdWq6v5mYE1sltx6VZV8LoiSI
 TGQpNS7dHaWnM9RX/7YUUwZI7XD8SWYL9Ln/xaXzu9I8PpnIngF1AL9+rYfd+GyuuY
 ZzpxPPCunluyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XdXuX4cV
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: update email for Titouan
 Christophe
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/04/2025 11:18, Titouan Christophe via buildroot wrote:
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
