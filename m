Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4476EC3DA5D
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 096CE40EB1;
	Wed, 17 Jul 2024 21:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zPjcm5RCvrNs; Wed, 17 Jul 2024 21:44:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D74FF40EC6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D74FF40EC6;
	Wed, 17 Jul 2024 21:44:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF1981BF385
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC20D40EC4
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLbaGW780AGY for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:44:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A58C40E85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A58C40E85
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A58C40E85
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:44:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A520FFF802;
 Wed, 17 Jul 2024 21:44:30 +0000 (UTC)
Date: Wed, 17 Jul 2024 23:44:29 +0200
To: Romain Naour via buildroot <buildroot@buildroot.org>
Message-ID: <20240717234429.0c74e678@windsurf>
In-Reply-To: <20240627075441.4116645-3-romain.naour@smile.fr>
References: <20240627075441.4116645-1-romain.naour@smile.fr>
 <20240627075441.4116645-3-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721252670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K9vfR8RqgUy3zTE3or5OzpCDlFW3zkfGf8q0TpmK6rc=;
 b=EkpSxmHpid1Z73+7zBlovtAHJ4FdD6RsRXp5f+xtUqhP7DGfV39/i/WtU+aRFVdMC7kH3A
 nGdamIR8y3j8sikDWtY5ob5BI/g1HWpmH976Vi/RKbDj5kmcEA40Td6qSG3FRH3Mhky84P
 qh1QHdVkeVuYo/d3S2k9NoiAHOjK6hUyRjOLeBKxZPf8+E8DlkkxKoG8DZuStQup8zNpnF
 9L3XJ8l8xcWQSSkBX4WP+09JOEqg9femDEBtA98Jd3ySyGSF3YoOQ9Dni6ayfGmznqzZOQ
 EZjLHgVvjytPtYo1a/w0HBgS4OjxzaV6V/cjfBpmzdyOp2pA4iMtdYJv0V+wFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EkpSxmHp
Subject: Re: [Buildroot] [PATCH 2/6] package/tpm2-openssl: new package
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Jun 2024 09:54:37 +0200
Romain Naour via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  DEVELOPERS                             |  1 +
>  package/Config.in                      |  1 +
>  package/tpm2-openssl/Config.in         | 17 +++++++++++++++++
>  package/tpm2-openssl/tpm2-openssl.hash |  3 +++
>  package/tpm2-openssl/tpm2-openssl.mk   | 19 +++++++++++++++++++
>  5 files changed, 41 insertions(+)
>  create mode 100644 package/tpm2-openssl/Config.in
>  create mode 100644 package/tpm2-openssl/tpm2-openssl.hash
>  create mode 100644 package/tpm2-openssl/tpm2-openssl.mk

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
