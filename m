Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EB4EEB57B
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 297C681EAC;
	Thu,  1 Jan 2026 09:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqSlwx5ytYLf; Thu,  1 Jan 2026 09:48:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4F7981E5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260907;
	bh=3DymH9PdWKRBSLphMZYyD0T/21INVMW4Tq/3S59KBCM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F83zM/H//nZrLz8NW6WvuIA8nQsRc6mfGIU6rhKt0oUEQecpcUJQ4Z1l7fkqGZ3tr
	 i4cLXIQId4dR+h/J9qiSDBx3RDEEhmZng44yEM5eyPzC/KagfUtXusOvBicTpE7iY2
	 JpKFSONl7PBRnTlj09HZr/UqF+TE+QqcxFnY2ZZI9/aZ0po2vX/Cy01HvxldrUunyV
	 AXNWDJA3WZyhD5ltYv2CeK/cGW0U1BVxFUV3ZURv7WYiVMOl776n/RdkQyyUcfbYyu
	 mdA1TN26dZma6j/TSQoVjacyZ5T4XQSr0PEYvrmUevbeUpaZEQ+zxAXjb2ylqpGosZ
	 GKOu4UQ76y2IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4F7981E5D;
	Thu,  1 Jan 2026 09:48:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F9B2438
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05F2E608EF
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhLz-BnE67w9 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:48:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 00BB3607A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00BB3607A3
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00BB3607A3
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A65D0C1D19A;
 Thu,  1 Jan 2026 09:47:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 60C43606B6;
 Thu,  1 Jan 2026 09:48:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9F12B113B071F; Thu,  1 Jan 2026 10:48:18 +0100 (CET)
Date: Thu, 1 Jan 2026 10:45:52 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104552.2e067c0a@windsurf>
In-Reply-To: <20251231190624.3980084-1-james.hilliard1@gmail.com>
References: <20251231190624.3980084-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260899; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=cFdBw+QNFE5u5/zoY2+U8My3bbUMAdgvkVPrl7wNDCA=;
 b=kQhsHRqNmwiCVkQtWQCQbSypgd0JgtS5WHwnq5mdFr6FWzr7exLDBUMfZraca9t0pX0g+Q
 jCZR3vIXOb0A8B74X5YyXFlUOP7iPMHNK8xnq2a2jNUfQTY82XhgKaR/z+NanNm5tAPoNX
 Vnh/2ty/kXywIrolY/1MktiKstTvlPmM7wUCqrToCQ7mU2VZvq8DVl+OaebmsJYsyNHRIA
 gnx4gch4BSzj1bCJZdgigbm04EFYLiEIQ7FcCwsavFni8zu20O/Pp7K1XhjUCOQq+WS+mt
 Htx7TihtzvsYV9cUbSR9dRd9n1eheeNLA8q1bMYbhilZT96xcMijfEYkhPejVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=kQhsHRqN
Subject: Re: [Buildroot] [PATCH 1/2] package/python-coherent-licensed: new
 host package
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

On Wed, 31 Dec 2025 12:06:23 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-coherent-licensed.hash                  |  5 +++++
>  .../python-coherent-licensed.mk                    | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 package/python-coherent-licensed/python-coherent-licensed.hash
>  create mode 100644 package/python-coherent-licensed/python-coherent-licensed.mk

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
