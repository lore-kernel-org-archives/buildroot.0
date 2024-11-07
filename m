Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB6FD5AE71
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 08:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70F37820EB;
	Thu,  7 Nov 2024 08:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3utja-EHTtYs; Thu,  7 Nov 2024 08:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E5B5840A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E5B5840A5;
	Thu,  7 Nov 2024 08:03:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF620C2
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABFD061094
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNw89wo3Vw8A for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 08:03:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A688F6108C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A688F6108C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A688F6108C
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:03:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1DA66000C;
 Thu,  7 Nov 2024 08:03:40 +0000 (UTC)
Date: Thu, 7 Nov 2024 09:03:02 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Martin =?UTF-8?B?SHVuZGViw7hsbA==?=
 <martin@geanix.com>, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241107090302.413a501a@windsurf>
In-Reply-To: <20241105183202.1431500-1-james.hilliard1@gmail.com>
References: <20241105183202.1431500-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730966621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFDkHty0mjIYN/pk7Ulk28HQ0nZSNMhF8LJQcmGYKZg=;
 b=P4XzyqndV96qt/d7jWs/uCyUYkbkSKGJk3U9kdT9Q0w6PSwWYg+/1N3QIP3MuOZFkPbYzS
 yv6WHPkYlEj4u6UFa37S3dxdkTvBQSaORe6gHGsUdlcYBvU3AFH3jMY9JAHQ2EYROCQbvQ
 MMtJjwOn8gH7ksbXmL4d7rNFBIWNrysEv7cEheNmwDkFvZIV04NR4VBRBS6rXTb/AGdn/9
 YEzZtqM69qPognCo2kdTMkjvVsJsnb0bWxjhxOE/Y5tpM1Jah/hHv8g4eNZHroDtAhIje0
 nPvA7TEzt/n1LifEEOcuqdmrUJZsIW2BVruye/oFVSqzcyq/AayUOi17qaxP7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P4Xzyqnd
Subject: Re: [Buildroot] [PATCH 1/1] package/python-apispec: bump to version
 6.7.1
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

On Tue,  5 Nov 2024 11:32:02 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-apispec/python-apispec.hash | 4 ++--
>  package/python-apispec/python-apispec.mk   | 4 ++--
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
