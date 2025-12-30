Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95ECE95A79
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1E8360B52;
	Tue, 30 Dec 2025 10:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCMs-Nt9Lasu; Tue, 30 Dec 2025 10:59:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF93760B0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767092388;
	bh=Ra3Qnn/kCsGGFUJPrqLr7fJE4UvfU2UIbbrXDgkAbGU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UkJyd4sy2TmUDAM4w/wsS3fT7Sm2uHyLy9VgiBHPAAo719UgVZkmpuD4plY+e5QVz
	 j+iYUeFBFVDdRNgwyBwOequY3sPxNWlS2kBv1AU/JHZVB5duYvF1EC00ZWIClCwkit
	 cnLqzGxYxMSU2QeLS20+O/4ZAkR6z/d/SPkX2kgECDCm4/E3ZR62fwMboL74TEfE97
	 Sj5JGjOov3mDMXruOC3A4QrREcXojT0fCS9wG6BW10VsuPeSSfYsksPexDZcI6PofG
	 6YNPNjSV0wAr46LxYxD30EhjFGqeiiiWVJsUqvPjkwfNlSXsVvNgw8gfZqQOZeabf9
	 X3FUq0cBqvIGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF93760B0D;
	Tue, 30 Dec 2025 10:59:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D88E177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EC17404C6
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOhN6FOQYyWa for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:59:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF635403B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF635403B8
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF635403B8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:59:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5A0A01A252D
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:59:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2D1536072C;
 Tue, 30 Dec 2025 10:59:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 37C83113B0794; Tue, 30 Dec 2025 11:59:42 +0100 (CET)
Date: Tue, 30 Dec 2025 11:59:40 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Knight <james.knight@collins.com>
Message-ID: <20251230115940.093899e4@windsurf>
In-Reply-To: <20251229184244.3593579-1-bernd@kuhls.net>
References: <20251229184244.3593579-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767092383; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=k08oHQsRJEbLAdPyi8MkzpP3KIgY4hfYnnKLFQprfsM=;
 b=oW9GQ8V4RKBkIWJ8YnzMLDgKECM5DqXzWC3gshj0YnSkoo3ssACwNgZ0xNRVeZq9vZLBot
 R/bZFpfz/mxfZIWOhsB1f8ku5qOsTcdlYTssPVv/BankRRY/V9ANqVCTsD+MjlpTk1kfay
 otXylC54CYNNRlIZaCrYBUvf8dE8RLLycKOCt49m22URPnesqsH9MNqxl08XdFZS5eeKe5
 rG0lmU33mI/wSLfVJhqE0NL8aU/H4Jizb4JBJtyax8ZEkgiPPgkZSbTQYZhMa1/MdKDzJ9
 UhVxO7MZSiKtu2L7OVnMi7baCplGFRlpwz22uKtVXq0+WPZ1YlK7lspsId9WwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=oW9GQ8V4
Subject: Re: [Buildroot] [PATCH 1/1] package/libpqxx: bump version to 7.10.4
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

On Mon, 29 Dec 2025 19:42:44 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> https://github.com/jtv/libpqxx/blob/7.10.4/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libpqxx/libpqxx.hash | 2 +-
>  package/libpqxx/libpqxx.mk   | 2 +-
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
