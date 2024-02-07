Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD927C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E52B14226B;
	Wed,  7 Feb 2024 19:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M5FU8M0C2_pS; Wed,  7 Feb 2024 19:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68B7342257
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68B7342257;
	Wed,  7 Feb 2024 19:52:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43BA51BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31C6C6147E
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F54-fymCxIZj for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:52:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2DE4D6147D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DE4D6147D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DE4D6147D
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:52:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4950C60003;
 Wed,  7 Feb 2024 19:52:30 +0000 (UTC)
Date: Wed, 7 Feb 2024 20:52:29 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240207205229.1ff8abfc@windsurf>
In-Reply-To: <20231104231506.2669884-1-james.hilliard1@gmail.com>
References: <20231104231506.2669884-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707335550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FR77Uk38EjmXhbpezKbshON8UHE+XI6x1+rkzjq2Ydk=;
 b=osNn3OfQL4ZLiNXKbEKQbJ7VW1E3AxKhK1WzEh9FdGGUWXHPfZbJ+BWsCfHZWE1Hcfh9q3
 PO4JQGVBrgmZUIKejeBkyAEgjYCJN9wXLmTu2yhnAuEFpb6H8izcNhJu5WkZhZ+vb+y3in
 aMi3DJ91e8PMzGBCO5Cy2L6zybw0bCOmvY+FvJXQ0HyeICjEl+M5Jr+YL0EX2jEev9aep1
 bY1lE91dSniFq55HOsOzOSTBuLsZGc4uJAy9o9vWEEl2x3CELtQR6hb9GVRrSyWTAjr+QD
 sOwefB/3u18UpI82wcgEDG98SidthMUnwEBHF7SwYoJ/d4OaDdI03ayOYXptSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=osNn3OfQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiocoap: bump to version
 0.4.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 17:15:06 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License file moved:
> https://github.com/chrysn/aiocoap/commit/8f2e96d76bcf1f6f8d7b8065b5c5865afa50d20f
> https://github.com/chrysn/aiocoap/commit/065945fb7f34db33f641199aceb527527c1a3431
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-aiocoap/python-aiocoap.hash | 6 +++---
>  package/python-aiocoap/python-aiocoap.mk   | 6 +++---
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
