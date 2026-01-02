Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1B7FA3751
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8779580963;
	Fri,  2 Jan 2026 22:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQXv0nK3p_SE; Fri,  2 Jan 2026 22:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 695D8807CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767393947;
	bh=38+ItpUBZFLno80d/b/i6DJKoc5QtnDCN64YpdFlWxY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e0oOM0g/J2c3jsd+YbjGHORgG7Wdv2JBLvMXxbHqw5NgXwQotU/CzPtSn2gwo1Ozv
	 6Hp6J8acN4dLinPOUNakfaa6wGfYkoS0/TM5RVLG2UPJcoxNqras64+mXvRlRBWigR
	 YIslYlk11G8MVbPb/1ZHDm+6bB+yjDGbgPBc4krOCdBNDLgZrLZ41maLwdAxTCkucW
	 0GWw8qlMp9GzOEF8RdmBGQXnyz0PE9nYSFIYz4fIUXZmqmFzhf3VohwyoOXa5Xi5Ld
	 y7bagoKwu62611NjVDZj8RXV6IBB5cfqWU1/ceZ6GAYIoNNUy5uOFcgQZGfd82IfFy
	 Z20fcdLy3AHDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 695D8807CC;
	Fri,  2 Jan 2026 22:45:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A4FCF249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B549605A0
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrpoLSKrzSPR for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:45:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C0F6600C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C0F6600C9
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C0F6600C9
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:45:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D0F4F4E41EFF;
 Fri,  2 Jan 2026 22:45:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A53B2606C7;
 Fri,  2 Jan 2026 22:45:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 80525113B023D; Fri,  2 Jan 2026 23:45:42 +0100 (CET)
Date: Fri, 2 Jan 2026 23:45:41 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Ludovic Desroches
 <ludovic.desroches@microchip.com>
Message-ID: <20260102234541.22a89709@windsurf>
In-Reply-To: <20260102222920.470122-1-james.hilliard1@gmail.com>
References: <20260102222920.470122-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767393943; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/d4WXaew4O7Ov04XJmwVlafSUuzflVLqgXxwe/rJDeY=;
 b=xvVNe3uhBkVcvIJZ2/L0uBqOauAyz7p0hwTtw5dj+jjumh/ti7fL877dHxUCqiJrd98Bt5
 3bafBQ3SdB6UCr2gJ1Ydbzz4nAcwy+pjYfjpSZoalEYcLUwTc0EPv7ApjpUYiLeotJ3Ssq
 4VV+j72Toi+gJySbDqyx3zhfZ1cLjVie7ScOTKaMLQFywvOlzqq1ldICmohab08srysNo1
 dzynes9RIfxzCWjaqktw6huhRH4xDcLoDcTDQB24tURs3vAYlmamzbeSi/lJrk/2a+DI9X
 tEdwqZF7QYIepbU7JfwnyB4CNOC05ZBpNrStr5o44yvm6vocX8AYJvIsQnAE4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=xvVNe3uh
Subject: Re: [Buildroot] [PATCH 1/1] package/python-keyring: bump to version
 25.7.0
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

On Fri,  2 Jan 2026 15:29:20 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to move to license file autogeneration:
> https://github.com/jaraco/keyring/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
> https://github.com/jaraco/keyring/commit/d2b8d7750f78e870def98c4e04053af4acc86e29
> 
> Add new python-coherent-licensed build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-keyring/python-keyring.hash | 6 +++---
>  package/python-keyring/python-keyring.mk   | 8 +++++---
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
