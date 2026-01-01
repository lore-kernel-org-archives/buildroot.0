Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA090EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 918A18216F;
	Thu,  1 Jan 2026 09:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5nREaVUd-IU2; Thu,  1 Jan 2026 09:49:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3F4C82144
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260951;
	bh=g9Eg5359V7M4U5A9tKvmz8sf4DKpwduuQ8esU32JQ9Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f1N+G7cF3HBNqJQzaSDNYxhD3CRCQyW/pmlE6zeRyqvYI63nkMP/8oOt+FJ/pkhgR
	 A3hzP/Yup9WLZSV8HypVZOq5o0nSC6Ik5ogm7x0vKdLNzC1Lx6fPQE+0rf7uUdU/IO
	 qvkLJIZ0NXYIY8FQ9r3z0Hw9RTE9376nbWLei67mlpfCPdf1xG3J1rHNvzUms/YcCI
	 cPlV5YJFbkvq+5nN/+czPq8WnG4UU6+B+2EoHT34fdLHAfUHQLHIdir8CY2LpfZDTR
	 8gMQDuFYJpEH6WO3mIep1XNgy/x8t1nhO7y/uZYDET2b0RuFtQfdjtWpBRk2fysfFC
	 /dxwlOVpmB2SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3F4C82144;
	Thu,  1 Jan 2026 09:49:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E554D206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7B8640168
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38N09EPXGIsL for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:49:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D43E0400A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D43E0400A5
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D43E0400A5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2FCE24E41ED2;
 Thu,  1 Jan 2026 09:49:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 06F7B606B6;
 Thu,  1 Jan 2026 09:49:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5C450113B071F; Thu,  1 Jan 2026 10:49:07 +0100 (CET)
Date: Thu, 1 Jan 2026 10:45:58 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104558.3545272c@windsurf>
In-Reply-To: <20251231190624.3980084-2-james.hilliard1@gmail.com>
References: <20251231190624.3980084-1-james.hilliard1@gmail.com>
 <20251231190624.3980084-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260947; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=FGYX9MLaW2GayncFOhvfEATGROF0pS0LTucF9dQ1O3A=;
 b=ylviOPm2dKx6Rgyko6JJOQdStWHeJt4uaYxjAncsnrTo5H2lvjZNWdoAwESQ5WY0gQg6Y/
 D+I9fuHsmZmMxWr5DBsU7TtPyag2cr+5QAWHxDZXV0XPV/pWSkl/Tgg0ovFGqNYFFhyIkj
 eHD/KhNhTOuw7/GE4Q/1Mq7h95D7SrUplRIIQ89BdbvgpDWVl2ix29wnEllfh+piaNlS97
 eGkeZFtyN4vVNdG2fLfQeq7JPZRNqisjU/ykHyok4MWL9pz8f6K9Kqqt7DX8zW6k1NIP6N
 XXE6t8jDev2CnC0EBN4A27LOEHzffOUpRfqKXJFzCWmH+N0SfS3cCng35iMnRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ylviOPm2
Subject: Re: [Buildroot] [PATCH 2/2] package/python-tempora: bump to version
 5.8.1
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

On Wed, 31 Dec 2025 12:06:24 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to move to license generator migration:
> https://github.com/jaraco/tempora/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
> https://github.com/jaraco/tempora/commit/d2b8d7750f78e870def98c4e04053af4acc86e29
> 
> Add new host-python-coherent-licensed build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-tempora/python-tempora.hash | 6 +++---
>  package/python-tempora/python-tempora.mk   | 8 +++++---
>  2 files changed, 8 insertions(+), 6 deletions(-)

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
