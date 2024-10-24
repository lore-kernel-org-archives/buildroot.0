Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9244D0E3F7
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 19:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FD6C60A51;
	Thu, 24 Oct 2024 19:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cs30fLFgKEWH; Thu, 24 Oct 2024 19:29:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF82760A9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF82760A9E;
	Thu, 24 Oct 2024 19:29:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AEDE62316
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 19:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 903754092E
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 19:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJYRqezuIJdw for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 19:29:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 55308407F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55308407F1
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55308407F1
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 19:29:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2402240003;
 Thu, 24 Oct 2024 19:29:22 +0000 (UTC)
Date: Thu, 24 Oct 2024 21:29:21 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Pierre Floury <pierre.floury@gmail.com>
Message-ID: <20241024212921.2cf22044@windsurf>
In-Reply-To: <20241023170447.778547-2-giulio.benetti@benettiengineering.com>
References: <20241023170447.778547-1-giulio.benetti@benettiengineering.com>
 <20241023170447.778547-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729798163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x5pmnOapfgPVxrSkYh2RTIaGAqDPDuxR0BkiAqL/7G4=;
 b=IHLlRqVvwu/B+ey7gdMiVzMUONUQNQJ0t5DFd5UVy+zV7rDAwP1bfe0vXnbiz6BdqltsDU
 0W9jhItPlSBZUmn4rBh2e8EkBEmt1tRIOmLyicQoM4Sv+Zr/hELdr9tZ82jgoHvrB0N7Bq
 msyMeBNwy/i2qPRPBqo8fRmURu+JS5FQFRH4Yx6a/5i8wQhLPLKU+8Cwsi1GlnW944fSY0
 MA23y1djxOPF5VysVBVNeHgRSpJm0fw9Mb+EWtLlwV239U5PKkJqOMwGlYSRo62Vkrgj14
 ELx3RJKkx6OCj9120TXhAyELmbnGiV/TkLvN4ppeiR9oqiArK+jV46iz1e2dag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IHLlRqVv
Subject: Re: [Buildroot] [PATCH] package/trace-cmd: bump to version 3.3.1
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

On Wed, 23 Oct 2024 19:04:47 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/trace-cmd/trace-cmd.hash | 2 +-
>  package/trace-cmd/trace-cmd.mk   | 2 +-
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
