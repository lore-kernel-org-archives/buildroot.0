Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50348CF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16EB040A40;
	Sun, 13 Oct 2024 10:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASbCpy76EvLx; Sun, 13 Oct 2024 10:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA8B840F9C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA8B840F9C;
	Sun, 13 Oct 2024 10:48:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17FE71BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13EAE409C4
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTgulEPOvH7C for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:47:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C26A409B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C26A409B5
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C26A409B5
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:47:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5064AC0004;
 Sun, 13 Oct 2024 10:47:54 +0000 (UTC)
Date: Sun, 13 Oct 2024 12:47:07 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241013124707.33950631@windsurf>
In-Reply-To: <20241011172515.2759554-1-james.hilliard1@gmail.com>
References: <20241011172515.2759554-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728816474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6IRtie8kJ8y8pV4Kjnk5mGjSciMr6k1WCtPIhM98PY=;
 b=nVIzAq2TOOQxjzXataLBTxP684ZQlalPzXlP2P+ZpU0P1ysiAIfQM/rW7NlYCfcUgVXaJS
 ZXKIGECEHESSspGvs71Ycn77gzk5KV67y1RsQndiPkb/FBUXWiyqYow/jVh1JC/rKE3pXg
 6Q0ZkaaSSjxYMH+dimfRLHSp5spFfwuXfhOl0DD4yDxhuUmAcKkVxN1tdsaYR4droWp6Ew
 o7A1eSDmkBDdF7OYXIBUd5T0vGVeDQceBmlENWh5enJcaX7z2BYt8uADqfUw+F7ZeDllG1
 otKN3GVdpn48jaFuQdLDMHSL0gzWbQ2qw+4aOSoj2LKPiWyY8t0U8O727I9i2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nVIzAq2T
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.10.10
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

On Fri, 11 Oct 2024 11:25:15 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-aiohttp/python-aiohttp.hash | 4 ++--
>  package/python-aiohttp/python-aiohttp.mk   | 4 ++--
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
