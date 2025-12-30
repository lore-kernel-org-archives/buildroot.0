Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1932BE95A8D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6E9860BBA;
	Tue, 30 Dec 2025 13:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wO6Q3jTDtixD; Tue, 30 Dec 2025 13:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC5DD60B89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099931;
	bh=HXLJ8BmHQyeMRPEqI1K1o1/w71dj8KsyRMpInJUwYso=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n0AGr0R56Z8m5dbPMiB2zhr39eu0AcdhFEv1lh15SgkzYzXQPk8BqBa1wel0kfaM+
	 qIKywR67zjWqDiPzX4kWx74zSkfpQG6L8jBJdbpagF32A+S2mC1hPB5iL19aBMM8gT
	 HENY5/eijMvN39c2w/1lHFSHfXuy6sOIWwaox9yk7NOoaDLrqCpxMH4bj12tzwgP7q
	 SvAPNi4/oULpC1wQIgkrbunM3KpSgazIyKXAucyJsrgS5jznGCjhKGJL+Ndo6lbqaL
	 XlF/wQZI7TLn3GdKajHZgwxKjy2/gosn750Lm4jyIEfAjMUqjSSFeXmQhJtcX1DFo5
	 1KIsf81ws/3zA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC5DD60B89;
	Tue, 30 Dec 2025 13:05:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC846D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE7064077B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KgJU1t9sRvIJ for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:05:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D323B40796
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D323B40796
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D323B40796
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:05:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9CED6C1D734;
 Tue, 30 Dec 2025 13:05:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 33DCE6072C;
 Tue, 30 Dec 2025 13:05:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 48155113B0643; Tue, 30 Dec 2025 14:05:26 +0100 (CET)
Date: Tue, 30 Dec 2025 14:03:55 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20251230140355.2c0158e7@windsurf>
In-Reply-To: <20251229054619.3499351-1-james.hilliard1@gmail.com>
References: <20251229054619.3499351-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767099926; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=jcLzjdkzyF2ERJ2nK3lUh7ABVxPViA4M+xwpG6ZHV54=;
 b=KPbjkcUDgUdr5ElgunFdaDTGknKmU1QFeLxiKmCMEfiitCr9HG6oNK+XqYQYkjZnkgbtbu
 5/kM8eZVcaTc5BhlXxw2m//EVeql10IjYMJS6LCaYpWcvbr9ooL0M7DNtUoYKCWGkyiJQ5
 7wCDrTR+ZbZi96wCAH1cuXq43oHiap2rI65P8475hHTbP2Hw9di3oHuDZwOVmEKQiujxh2
 +DhDaYsy/Q2cM255rBLC29p296EhWk8fUxtNNa9dlU5RwmRFs6N2e+IuIiJkeI1lkOoVtX
 1r3d3h1jvxrVSOYV2XOgYplnMy5f4VYyksfr5zK20pejMaLNPtACoUHe6iKpJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=KPbjkcUD
Subject: Re: [Buildroot] [PATCH 1/1] package/python-selenium: bump to
 version 4.39.0
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

On Sun, 28 Dec 2025 22:46:18 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-selenium/python-selenium.hash | 2 +-
>  package/python-selenium/python-selenium.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
