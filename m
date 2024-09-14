Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143CEC021AC
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 20:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8A1581E8E;
	Sat, 14 Sep 2024 20:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-xr84RLs2QG; Sat, 14 Sep 2024 20:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13A7B81EC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13A7B81EC7;
	Sat, 14 Sep 2024 20:03:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 199A71BF2AA
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83F53607A6
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PYx2Okp79BPG for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 20:03:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 79EEC605FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79EEC605FE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79EEC605FE
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 20:03:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F3191BF206;
 Sat, 14 Sep 2024 20:03:11 +0000 (UTC)
Date: Sat, 14 Sep 2024 22:03:10 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240914220310.6052f1ba@windsurf>
In-Reply-To: <20240914185039.2757610-1-giulio.benetti@benettiengineering.com>
References: <20240914185039.2757610-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726344191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D4HN0wfeb9LOEzvPrWxVnQ/v9mSDQVzqJznSEiX4S9E=;
 b=Pi0IiW81zw8rHzvEhv8ewUJlpMqt6Doyg91j6yhVaDdJia9yLZRYpewSsNedHUY9cgCCo0
 urY4/PnQhqTMLKYaP+xPsic8rXe4jRW08lL8uCyEnUcQ6Ly9UTue9J2zp129WL/LGiFpFY
 wRagFY3BLu78uGjuKauIaUFFr6MMRrL99kMIXq6WDwcZ2rGmjbqO/k3uSRBsSFKIqKeh9W
 TU0ewU07+wFfUvr7afvN23i9a1B6Ce8mFol5/jCVoqWcrHqdxVkeiA5ix+bmBePSKQRvW9
 Ok+fygglE4KZboVbLmU7L3LMXD0/EreZ1MIWxmaKuqIXvsKW+/+O8Ff+SH95jw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Pi0IiW81
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.104
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Sep 2024 20:50:39 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libnss/libnss.hash | 4 ++--
>  package/libnss/libnss.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
