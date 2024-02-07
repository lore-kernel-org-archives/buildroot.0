Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FF9C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CBAE83B9C;
	Wed,  7 Feb 2024 15:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TZdQ6m-FUJnX; Wed,  7 Feb 2024 15:36:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4173183B9E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4173183B9E;
	Wed,  7 Feb 2024 15:36:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C633E1BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1D5A40568
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQGM73JDj0k9 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:36:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F11F403C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F11F403C9
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F11F403C9
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:36:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4037040003;
 Wed,  7 Feb 2024 15:36:26 +0000 (UTC)
Date: Wed, 7 Feb 2024 16:36:25 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240207163625.75917cf7@windsurf>
In-Reply-To: <20240120232854.1938582-1-ju.o@free.fr>
References: <20240120232854.1938582-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707320186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82qIkhbwwttNuIgmL/3HZiJxpARlICAz1W9/mNFsRJc=;
 b=WDQS89WtMV9rb+9kJ7IaLY3//PIQ7u6l5HAHBXC/0RD6HDKj01OIrrXUz5o0pnuV4RO3eP
 FHYBB2v+xx33odPm+dyVsquKDecmGSS1lIZ0PjaBNuEA3mDyAbg+HPHNHRTOiRp8h5NGPu
 PViPblHU93re9NS4JvCgciHra8Xw2XDemVnlwkJVfOBcmpkhv1RXKX0BTOh4eDH5lOhK9e
 gjvyXsTrLL9ZZSetpkhL7MZ1AR+wdcjmFKtAcpJ+ajr4bIVU+EgitKA2ni41pk5MyeLHT4
 MsNiJHxn4m54jhuiJM+aeusFOWcaQuqKPRu+kEI3KNi+odfw5HtXWNpit4BLFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WDQS89Wt
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add optee-os runtime
 test
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
Cc: Etienne Carriere <etienne.carriere@foss.st.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Jan 2024 00:28:54 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Cc: Etienne Carriere <etienne.carriere@foss.st.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 3780925 with commands:

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
