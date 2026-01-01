Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C39EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 392BF81E53;
	Thu,  1 Jan 2026 09:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Wv5rKShYOLO; Thu,  1 Jan 2026 09:49:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18AFA81EA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260985;
	bh=a3lKMmg/kF3BxigdED/NlstcUGsWOjGhbzs/tsjVFA8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UtdhmzvoQwJTQebPSUZNK53s2UIZzEEZRAz0hIZ1I9QaC5ZKcfahi6yfFTLZQDmra
	 5VT10N0TtSywXz8coomrLuEt3Fs45ivdUw/GAmjQu6nXOv/T0VrO9qzZtuvclFGC92
	 fqOTda/Li7IshG2CMN/ZqoHEpEmbWlqdebDa5y6E76AnJvXEXzsb5W9bTPvZ5JZAvh
	 VGyv8DQerf9MsxnMz15c6dg/rg6XYvBpjeACP403J7U92evfhdIwpk2uyVeapYvne+
	 fZf7PKmNUKOhuGqFBdAQnc2jzpQyTVBJ906bEapDbzdW6MQwuk6InT6ujsJGKTsffd
	 xYIKFMHHPpArg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18AFA81EA5;
	Thu,  1 Jan 2026 09:49:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73438351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59B8B60A5D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9uje_xpjAN6 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:49:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 42D7160A54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42D7160A54
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42D7160A54
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A79651A258F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7E169606B6;
 Thu,  1 Jan 2026 09:49:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E3C31113B071F; Thu,  1 Jan 2026 10:49:39 +0100 (CET)
Date: Thu, 1 Jan 2026 10:47:21 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104721.5efbbe4a@windsurf>
In-Reply-To: <20251231231404.737855-1-james.hilliard1@gmail.com>
References: <20251231231404.737855-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lmrcS8IPjDO77SJCTazd3WBO7eKxde4EX33s6P2Ah6w=;
 b=NK/+LddQc6q3Q3pvyFi42R4aF9EI+DpLndj0kUA1KX4me72AzcUQ1rDGHxwuMe2OoNg8mH
 LXaDRZxnx1EDCLo+nga8i8ayOg79IxV66aTtyNUv4RSuDGmXt4MFDYa3DJWDhsaBuqKHFm
 0waeUQOw2Ri+oXTflfkAlL9ygdKe66zeVEwGUoG3XXWQxyGLl98sbJBDs8cHFIurd6IoA0
 zYfH1yji4hyHvwSS2u7vaRmT5yfiT29B1NuduOcWCyVQXihV5b90/UCLMVGEV4Rl7/gPoE
 PhEnDYEwzFXLAWTFdWJKEzztBWHQ9fJniqFVViUa+zZjG3XfzSpZzAmhC0vBmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=NK/+LddQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-proto-plus: bump to
 version 1.27.0
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

On Wed, 31 Dec 2025 16:14:04 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-proto-plus/python-proto-plus.hash | 4 ++--
>  package/python-proto-plus/python-proto-plus.mk   | 4 ++--
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
