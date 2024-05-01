Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5C5C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C30E41719;
	Wed,  1 May 2024 20:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXDaAfc-OSnN; Wed,  1 May 2024 20:54:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CAA041774
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CAA041774;
	Wed,  1 May 2024 20:54:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B94DA1BF400
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5D9781DF9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SmhVTrYaAvJf for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:54:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9CA1281D34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CA1281D34
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CA1281D34
 for <buildroot@busybox.net>; Wed,  1 May 2024 20:54:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C37FF1BF203;
 Wed,  1 May 2024 20:54:53 +0000 (UTC)
Date: Wed, 1 May 2024 22:54:52 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240501225452.790225c7@windsurf>
In-Reply-To: <20240426180217.20885-1-francois.perrad@gadz.org>
References: <20240426180217.20885-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714596894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqspD5VJPHYxEiEgCpqCk1v+ZlEMsjue8C10lLcX2P8=;
 b=jUwZOo/KJmD6p2eS1NtfxWsiUF3IBYMXq6tk50xdp5G/7+GEkpd1wyWahY3gTo+WPXxzx1
 vUqbclXjQLpKCv+Ye6gun+AN+SKFRrpctPIK/dNVXvRJfzn+eUPD2Wi/99tBUoMhrqoN5B
 xnA+p1ecYmgv0CDuMgoV9tUJ62PpwZj3rQ0trjOSG6JkwNoUIOu7xNm55BFfJc2aNYDjyB
 PPcQW/boaOtZD9mw3ZcNjNzKzF3ovnPopIxQI4iqDgX3ACA/W7IJ5dIBOWNRyw2pecCOOP
 2Dro+CJBy2QLF8CdgZW/j01nx2tRINxo1b3lL1nVfRklWfC1cZJQ47m5zOuIKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jUwZOo/K
Subject: Re: [Buildroot] [PATCH] package/dropbear: bump to version 2024.85
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Apr 2024 20:02:17 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/dropbear/dropbear.hash | 2 +-
>  package/dropbear/dropbear.mk   | 2 +-
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
