Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78B5C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FF1640276;
	Mon, 22 Jul 2024 16:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPHtXnYZDP4z; Mon, 22 Jul 2024 16:25:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBC1B402FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBC1B402FD;
	Mon, 22 Jul 2024 16:25:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE12E1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC3136059E
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loz4TxCW6-c8 for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:25:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C29356059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C29356059A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C29356059A
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:25:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C52C20009;
 Mon, 22 Jul 2024 16:25:50 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:25:50 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240722182550.208fd08d@windsurf>
In-Reply-To: <20240719052700.3427830-1-james.hilliard1@gmail.com>
References: <20240719052700.3427830-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721665551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cQxzSuQO6t53EWDPSo1fpMDKa5GqKUEeKrxAl44J4ws=;
 b=ImG//IIxUphu/n84hS2co3wYrSNz8i2PMkQ4RnHbp2EbPeeBbZNkRUhxTTHZvFTeZVH3IB
 Ucvx33mK6HHTKOk2VGdosaEhxYlp+XbO8e33eU9LY7HQesIK7QW0ptP9Y1EBB5tkJJ95FM
 tT5GRmMW430JXQ84L6TI2BUwh0CnOyf+pgj7E4qz91GAHncLMopASOYix1AvQ55lwqtQdU
 upwwp2pK5J9YM9fTM8LCUFiz9qUg5126/YRwLjrQGyLrJZXncMsyRzhJ/Mu8cyKQyA6gIq
 rzCd/saTm2AzQ35dKLsk2jnMXUramKP5gtA4fUNqZRfzrvrvpk6mzSZNNmu6uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ImG//IIx
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to
 version 71.0.3
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

On Thu, 18 Jul 2024 23:27:00 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Rebase add executable patch.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../0001-add-executable.patch                  | 18 +++++++++---------
>  .../python-setuptools/python-setuptools.hash   |  4 ++--
>  package/python-setuptools/python-setuptools.mk |  4 ++--
>  3 files changed, 13 insertions(+), 13 deletions(-)

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
