Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA3FC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 06:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8028406E6;
	Sat, 13 Jul 2024 06:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4JnDcIV4Nj4; Sat, 13 Jul 2024 06:35:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95DD641A08
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95DD641A08;
	Sat, 13 Jul 2024 06:35:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF6CF1BF5A2
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 06:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB3A084632
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 06:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvYgsJZjqwGV for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 06:35:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 869398460A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 869398460A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 869398460A
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 06:35:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A24DE240002;
 Sat, 13 Jul 2024 06:35:38 +0000 (UTC)
Date: Sat, 13 Jul 2024 08:35:37 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240713083537.5c7c0518@windsurf>
In-Reply-To: <20240712115936.493650-1-giulio.benetti@benettiengineering.com>
References: <20240712115936.493650-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720852538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sszqox4y4ujyDUTYb1LkyUVwe+AFrLuxRnzQ4nHlszo=;
 b=Vkzvv+N0fOhMxQGjgeNcUxyYms6rqUllOHfYto8xPIGcY+1NtdBJTz58yYvL63bAKzdEMI
 Sn/KzznNlGihpxVxRhY3mMgc6cMlURa0USpyfNgHvxLSTDSg9c3wedq4GrlQC1rt708BKd
 mrZ0wSwrWrUzfXnTa6KwF+hcPB2S52cPVdvLuGmZP0TB3STf1iC8/W0UYeru7lyjuPyd7t
 /GYtCarYPD0ZhpVBnIvqE+yNnm0uktmTyJQe9YldGhCJ9fOoQ9FCjLAfATfZ44SdvsaZxK
 O4Fq9R722CduheV2ScojSDHOw0aSGW9IK+swJT0pbVmEBHKvFe3RK4gnpZW2Nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Vkzvv+N0
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: bump version to
 2024-07-12
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Jul 2024 13:59:36 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/esp-hosted/esp-hosted.hash | 2 +-
>  package/esp-hosted/esp-hosted.mk   | 2 +-
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
