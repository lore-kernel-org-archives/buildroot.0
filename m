Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A22EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AC8C4082D;
	Thu,  1 Jan 2026 09:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3njdJQ3_oqH; Thu,  1 Jan 2026 09:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F8EE404A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260868;
	bh=/vTPsf2C3QpX53vWEDnKk6eZr40cnUAwS6hKlqGalcs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p2+EekSx1Okhdb1ZLKlI/0oUQCiYLIdnQ+nrMLAoJPfbPvWA5RJOqmF+JKHNzUtcE
	 9F6KkIxTDiWZK1IlSeIr82fPTY/Po+b9u+82QxmxamJHenyzAzJ8P2W9QEA/g6UYuZ
	 6cVJQtZ0UwEc21Q/NNLkkvtarvLnvU0dfZOJCzA51UnF882vl0jEmOD4jlc2qyKMrR
	 17P9NHrfeeykFJqBAZlwelBm5CgmHliRtN3wFGYg8Q0XXUlWIf3QIkNkO55bQI/2hG
	 LOf1VZUdylCmGI7XvTQ8zRP+v/gwvxHJvMCI3HKLD7Qttpv7OqgtaNnCuWZCIzSHor
	 OEAF4W+qdj55A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F8EE404A9;
	Thu,  1 Jan 2026 09:47:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3B36351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA73D401B0
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ohp7KU737G6P for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:47:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B2A55400A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2A55400A5
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2A55400A5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E67521A258F;
 Thu,  1 Jan 2026 09:47:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B6C11606B6;
 Thu,  1 Jan 2026 09:47:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DDC70113B072B; Thu,  1 Jan 2026 10:47:42 +0100 (CET)
Date: Thu, 1 Jan 2026 10:46:17 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104617.18f12f7b@windsurf>
In-Reply-To: <20251231200501.4067983-1-james.hilliard1@gmail.com>
References: <20251231200501.4067983-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260863; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=RTVg3Sg7k/FM/ulSuhzUyX73iou5OAlU7EjZ7oPCNE0=;
 b=tdE2O+UQQTjWp4HMBzXT/EeOO1X3n0tA2fUOu2Iz/ZiSK/RcyII6wxYOFIusGbaxhWBa/b
 gZjkCw8YIhomn5+HyTtTeACvN6GdWoQFq4ngWnjeXUDzdw19X0f5ztbkWnamOTkajcaIC7
 F7KEiXwoAv73ojGcKQavWiDHtVCLlenotYxOjgdvu7YQyBz/+dF9hXVL8AAiaSELk3LcCr
 QJn9xIzSHvaZhLJydFXArn9NQGnbMjSYQHlieV8F+8sF8h0rSmlmXRTxQab7kkF117F22L
 Y/B3jLxytUhVzYxz3j0IM9ziYbEhbOMlaWYbZ4NOk7XKaZPufEhrkJOkAkNT9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=tdE2O+UQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-smbus2: bump to version
 0.6.0
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

On Wed, 31 Dec 2025 13:05:01 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-smbus2/python-smbus2.hash | 4 ++--
>  package/python-smbus2/python-smbus2.mk   | 4 ++--
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
