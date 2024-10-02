Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9184DCF8541
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D39041C94;
	Wed,  2 Oct 2024 21:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FPryDXsPjmZ; Wed,  2 Oct 2024 21:03:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03CA541061
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03CA541061;
	Wed,  2 Oct 2024 21:03:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2A411BF30E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA99E81EF1
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kq5cythq8ZPy for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFA6581ED9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFA6581ED9
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFA6581ED9
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:02:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3951040002;
 Wed,  2 Oct 2024 21:02:51 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:02:50 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241002230250.35b8e5ca@windsurf>
In-Reply-To: <20240926165959.48462-1-james.hilliard1@gmail.com>
References: <20240926165959.48462-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727902971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qhNdW3+n254wwwrb7dgNSHXVE+bxCXsmyohDpKa4Idw=;
 b=pSFQeHEDInb3/O9Vewx90S9yTbArrgG3B9ORLjO/k0eTnF/0pryVQH9jK5cOjrVFR6WKSL
 hF9B0o3qCZITjWJFnHnQbh5eBfhCBwzXIWu02smEzY63zpGPBkHqserkcBZWNgSjbgKv/Z
 wV5d8zvmSIu6yvvXWgAP4xWIz218u0YjMbcpZl8f2qkVO9NHbc9/anKXOZbocU3ZTO7zkC
 1FClb9qyDNFJK1/Qx8EQT7aUWpAu8fKXPlrsy99PS1834K4XCXeeH8QKofdg9rMtYFcO7N
 2uRx5SJvjjErZVsBrmeHwXUovkEQaub/uDxNOKnHJAkNqTBSQmJPFw96DF+Rhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pSFQeHED
Subject: Re: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to
 version 4.54.1
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

On Thu, 26 Sep 2024 10:59:59 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-fonttools/python-fonttools.hash | 4 ++--
>  package/python-fonttools/python-fonttools.mk   | 4 ++--
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
