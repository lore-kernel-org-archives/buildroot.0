Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AF5CE7A9A
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B4EB4051D;
	Thu,  5 Sep 2024 20:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoByWvnpezAu; Thu,  5 Sep 2024 20:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 790E340A27
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 790E340A27;
	Thu,  5 Sep 2024 20:23:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25B0D1BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1388F606F0
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4uyFb8AoPee for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:23:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 03DA060AF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03DA060AF1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03DA060AF1
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:23:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4731320002;
 Thu,  5 Sep 2024 20:23:39 +0000 (UTC)
Date: Thu, 5 Sep 2024 22:23:38 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20240905222338.5369e8e3@windsurf>
In-Reply-To: <20240905085713.383116-1-adam.duskett@amarulasolutions.com>
References: <20240905085713.383116-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725567819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/l7F0UmxNEeXsCISoQ/d2sQ7hdqzAWRBn//e25c+qEQ=;
 b=A7foZXPsNKU/03m+VzQPcIy0NjhDDELBjGrDr88LuJv+EvY+U6ONxu4SMS+bRM5naJiDiG
 drwPIHHCYEEFLnj+5GxiPhmN2Z0GuSTKfuhc7YBIyHI1j5afd2Yp0NikwMNwQRZP/sAXn4
 0slcjO+TXj7ljRsaW5qPaPtrkqiE6jazuQrwqUXJHoDkdHkrvWoNjmQvdg+oF1qqDPd8rb
 icly2mvuS4CmtS5rqPgCVWO9Oh8bccsYi0x9hHwGiJ1hnDK9QfYWWfi03lZPlBIu7C+yqm
 zqG2EJaUP40eluI1kq+4KQchjPE3UvWdm1/BglRNIdmrXb4yOLm48qxdZdASUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A7foZXPs
Subject: Re: [Buildroot] [PATCH 1/4] package/depot-tools: bump version to
 62fc3a1d244368a430ffd7a6b55377a6dfd5e348
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

On Thu,  5 Sep 2024 10:57:10 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/depot-tools/depot-tools.hash | 2 +-
>  package/depot-tools/depot-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, series applied to next!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
