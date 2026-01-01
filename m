Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0114EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C82B081F11;
	Thu,  1 Jan 2026 09:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xGjmhdVFbBv; Thu,  1 Jan 2026 09:49:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A321481E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260940;
	bh=cN0t4wv/SKMLKPLf/V5mXUlKD6MoSVLsBB+d6D2ZP28=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gp/iDRNkOXVWVEy48hkmFuVZGj5hWDy+opEJ6Ba97TK6X/IawiXB400fyDUAO5bWb
	 ttkPv1W9gDq8XxnbEnGq7Quj9J0ln/n4nhajOFxLjO6PLuY/leND83lh/sUeuqp2bF
	 2e9RzCPke/P67tmvf0KwaCOlb23Rt6rj62vRDjxfPdibDA8NVq8OGjhfybYl0C99gw
	 YcRPcBgGamufX1XRWodlKKE6+EWxzsBlDqeCLejbe3HLbup5hLzXnAfOcT1fqIfZkg
	 19WQWug7RoB67JnsITXAcXZBjZFTQRkzBNQu72u344PXZJfSepU2zPdV5NM5T+LVy4
	 tHQU1Pj8cWWlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A321481E7D;
	Thu,  1 Jan 2026 09:49:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B6078206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C3AF60A54
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQTlY_VD-5OJ for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:48:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 88253607A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88253607A3
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88253607A3
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B6DA94E41ED2;
 Thu,  1 Jan 2026 09:48:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8FBAA606B6;
 Thu,  1 Jan 2026 09:48:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E5976113B074D; Thu,  1 Jan 2026 10:48:55 +0100 (CET)
Date: Thu, 1 Jan 2026 10:45:29 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104529.48183fe5@windsurf>
In-Reply-To: <20251231183759.3934416-1-james.hilliard1@gmail.com>
References: <20251231183759.3934416-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260936; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EdcjcEZJEnZwGiMjZzQ8qoAeet6t/YNw0mscHCV4t38=;
 b=BbFktmG5o4K5yVQT/GK+dqnCIz1VpztRFaTf+bW8SVSmMD3KYnDKFEwWKsRix4Sy9R8Vup
 o0Z+hAMyDBJ+JTi31hjUAnQVmvl1TVReQb+Y59pblCJ24Od519DHMMvxWwnr1QBhDHZPCU
 ibHPsrTFLogElzUF9RK2vLs8pwe5vLmCoRwshNbNAY9GTmFBquhR0fI6VpmuWHGa/qtWbX
 drpFIj+CMQM+I1P7jr3qCXOlkgKmOl8c2UoBYJC72LpSieVUYL97w5jAFZI3SoFJvdmsBj
 c+Syt2w2jcJ9tk32cH6EVMO89Ty8T86EiN4Oc9Y8ZLOtqot3riOwtZL3ItQmPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=BbFktmG5
Subject: Re: [Buildroot] [PATCH 1/1] package/python-xlrd: bump to version
 2.0.2
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

On Wed, 31 Dec 2025 11:37:59 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-xlrd/python-xlrd.hash | 4 ++--
>  package/python-xlrd/python-xlrd.mk   | 4 ++--
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
