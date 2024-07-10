Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807BFC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 20:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 451A180314;
	Wed, 10 Jul 2024 20:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCkQ63Xh0ZeI; Wed, 10 Jul 2024 20:10:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6358880BF1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6358880BF1;
	Wed, 10 Jul 2024 20:10:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 167521BF599
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 037524132D
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBzbvEknRolB for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 20:10:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A6723406CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6723406CA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6723406CA
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 20:10:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D473C240003;
 Wed, 10 Jul 2024 20:10:44 +0000 (UTC)
Date: Wed, 10 Jul 2024 22:10:43 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20240710221043.55510338@windsurf>
In-Reply-To: <20240710155754.62512-1-buildroot@heine.tech>
References: <20240710155754.62512-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720642245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Ot/pGq8QKVmtTi7Q2Sufe4Hbr7NS98DeXyErhf1/r0=;
 b=CQOuVMKEp7DAMhpUqs2We43h5vMRf7J0zgmIu6Z1PziuoPjWTXY4NGW36M3E1TXpvfIqzQ
 mNEY+o2iD8vbTDDoXucs/VEqXPj1CKHy1SgJOjhqSXzLTcjscmxYz3Uu+v0UADW0Kjx0tU
 B6dk863A+kk5dtklrVViAnZySqe5Oy/6WlpfCLJFsbJ0VlSRy9tHZ8j8UMG5HCDxEmySsU
 XK13kq0CkzGmsDOvqnpOooJcOkkhXIqdRSQ0xKvh60JOu9w7zIMejXzBBfvDmchakqbWBK
 jtesVbJ6mvaSwrstcipR6/LtXbBNbW98WD//B/EAy+rWKapmsbKPtc2OVaW23A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CQOuVMKE
Subject: Re: [Buildroot] [PATCH] package/sqlitecpp: require C++11
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Jul 2024 17:57:54 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> [0] lists gcc 4.8.4 as minimum version. Since we don't have
> a guard for patch versions depend on gcc 4.9
> 
> [0] http://srombauts.github.io/SQLiteCpp/#supported-platforms
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/sqlitecpp/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

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
