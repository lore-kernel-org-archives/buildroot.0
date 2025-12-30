Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F23E95A8D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42D7460B98;
	Tue, 30 Dec 2025 13:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVfC-hy7PPX5; Tue, 30 Dec 2025 13:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49A7460B3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099856;
	bh=NJqxv2oTz4XUkLBYcC3nDG1LSBb8wH/sN0/339yKrws=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PeQRUB/eUrCOQ8jIsj8TyzyZfVeMtsIJbMJkeYGDJq1osSiZuR1bVDzqVsLjWJFAo
	 LUFDMji4eych+NVmsqsT95x0WDi46H5dm4QE8/lfIsWXBX9XNZo8m1MjAZirPfXDyc
	 6d/3QLDRXovRFLdm46M/l/j6OelCfOM51aVuq7bzRDsOYr0+ZTN3VE57/d0slb/F9Y
	 TqNjhDptHzBdSwBKiAtMYnFv6SQuKQIc0oz1tEoxCYGY4bXSz5vk1DHAGAtISUocdT
	 v98nXyfp4nHbmSZV93m+2B9MU1XHajNeQuLDZimVd/0xF3dZmYa/IKuQnj2mWKhANW
	 dAnTMq25+6hSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49A7460B3F;
	Tue, 30 Dec 2025 13:04:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2CBE177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4C4E4013F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d60dnhn0BwSx for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:04:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D72E4013B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D72E4013B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D72E4013B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 82EF5C1D737
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:03:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 188F66072C;
 Tue, 30 Dec 2025 13:04:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 33896113B0392; Tue, 30 Dec 2025 14:04:10 +0100 (CET)
Date: Tue, 30 Dec 2025 14:02:28 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20251230140228.5150cab9@windsurf>
In-Reply-To: <20251228221311.2757812-1-james.hilliard1@gmail.com>
References: <20251228221311.2757812-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767099850; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=57P+Q5iZuNh/NC4RfM1sbCkVjsz1JuVsLpJHahlVAW8=;
 b=xJDwhuj2xgbhLBgC2xaxJJNb+9IyKSLz9c339ia1x74O2lYbIMMzq2CJaOkMYnaLbTKb2x
 +PANs5fE1iejdHbMJ8WgRMskBjC9cHGQ/IqNr2rX8sFpdtRcMZvIXYrHmPP877+AOkDrrj
 sRDgItxc2fn85+a2yUgxTo2zbT7Sbd2vCCCS/GQcxATyNdw/5CNCOuhLY07GcRTiGWtQGu
 1duXUCgeG7B/NgqsYgSXRORnAFtlB62hLOejyRDk702OiQ2jCxgd3P23BwLL9oDSgG5jxj
 n3FknVAlNGUwzX698lj4GqoHN3/pXUg8ETbcwJC9yztEXx+aVSmCrvEC03VZyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=xJDwhuj2
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pypika-tortoise: bump to
 version 0.6.3
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

On Sun, 28 Dec 2025 15:13:11 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pypika-tortoise/python-pypika-tortoise.hash | 4 ++--
>  package/python-pypika-tortoise/python-pypika-tortoise.mk   | 4 ++--
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
