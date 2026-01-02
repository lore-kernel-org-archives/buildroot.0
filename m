Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F9AFA3727
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40115403AC;
	Fri,  2 Jan 2026 22:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eqt88XMK2urQ; Fri,  2 Jan 2026 22:46:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BD5B40376
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767393962;
	bh=5h6gq5EdRTj0PxnYXZzT93Fnb2t35SdajeXEwu4QwU4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k7kGmyfYx6SD0v31r6FQh5JuV2jhWDjKHK3CUXLcVO8b77+li5DFNH6kWb1IQaZpe
	 nuQTP4g2N3+NHyhkxyxYUCjPvHfeZwCM9XmKTuamyMP+sf3VmwHnJfaxmA/pbcuyBl
	 yI53/BY+L07giw6IztYLO6rqmMt1JJxvdiO5z2TCGueWJYQMSCWfd3GUc08Bjl7m/b
	 UYJigg0TPWcuhBcr9z7LVcinFGSxN2L2v4B0idoK2LbKAdi0YWkHJIe9IHhqOmPCE3
	 Zt+M9vJ6ufSQVmuEk4P56EJhxfj1biw92XVHrvEi5GPdXv9M25XCAxCfwepcAAB7+9
	 80yNLmHfeso8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BD5B40376;
	Fri,  2 Jan 2026 22:46:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DF03249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 142B940376
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kB3JvMADO6Xq for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:46:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4BE6740354
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BE6740354
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BE6740354
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:46:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 939931A2538
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:45:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 68DB0606C7;
 Fri,  2 Jan 2026 22:45:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 74378113B023D; Fri,  2 Jan 2026 23:45:57 +0100 (CET)
Date: Fri, 2 Jan 2026 23:45:56 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Esben Haabendal <esben@haabendal.dk>
Message-ID: <20260102234556.5cf9b17c@windsurf>
In-Reply-To: <20260102222238.458970-1-james.hilliard1@gmail.com>
References: <20260102222238.458970-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767393958; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Mag8vTUjOT6VDIwA8SWHM9lSmwsg8h+qzTSH3vP6yWo=;
 b=X//rM6oQ0CsoAOGpoOniT11N1uHPPoPfSa+ay4pwzH0ynO2xQF6PcNMDUtb9g8ENMHJPMY
 bXkcckoruqpvjf9bHOM8buovxzVnKPOeKXlXca2DvsqYvzJPjYjbQxXhymIdqsrHroYKKH
 BK5PLMQoHW1KqnUBw4r29VlY2ezTdLNF+ZFq95P1whwX4p7THCSKTA6aUIPNg21opZpEP3
 qVk98FxS0tt815vvHE9bmKy3Awb4lgoa4ZcP2X0qlZtw1YpTrhUtMKtPfwzdQ8+60goSwn
 NrHXbFO27EybTAFi3KJCmfRnUa3KZoMjaPQKQmc0b6lOzDe3Iy3USsevfAC72g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=X//rM6oQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-kiwisolver: bump to
 version 1.4.9
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

On Fri,  2 Jan 2026 15:22:38 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add new host-python-setuptools-scm build dependency.
> 
> License hash changed due to year update:
> https://github.com/nucleic/kiwi/commit/728f5661fdd021c68dac1b914b3c8610a46b2e7e
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-kiwisolver/python-kiwisolver.hash | 6 +++---
>  package/python-kiwisolver/python-kiwisolver.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
