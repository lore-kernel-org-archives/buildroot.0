Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66536C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3672580EA4;
	Wed,  1 May 2024 19:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDgHfsNJnFHr; Wed,  1 May 2024 19:54:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F2E38188D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F2E38188D;
	Wed,  1 May 2024 19:54:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF8421BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC8A040598
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iyHZUNyEKPBx for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:54:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AAF1740567
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAF1740567
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAF1740567
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:54:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF1FFE0002;
 Wed,  1 May 2024 19:54:08 +0000 (UTC)
Date: Wed, 1 May 2024 21:54:08 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240501215408.73ee6720@windsurf>
In-Reply-To: <20240420105441.35505-1-ju.o@free.fr>
References: <20240420105441.35505-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714593249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVwXxKJJpVuhxcVXghfPqa83uF/D+WvUg9IRyDV2as8=;
 b=nPxJx0XAxG3OZB6knaZOi455pJaAkHoHnqP4YbruPpm10w3kGF0GcomYYti7qKdPnxybIs
 1UXzxWHrqP25pHoRjWdZh1c+nV3y+AzVhVgTbBYhYTKpU2TbME6fqRtHYr8KMWAbPa9lf9
 L49i/0YPCt6q8iTDwbjauPPZv7DR4zx2yrzcqgohNu8ZGbMb7TYWEa7CYIhDdoUaEOQij4
 qE+sFNkEoVjPg6sL1hQWfB0kJ4gqJIxvcLy37vcawiWyAyuzigBz9zMPu7V0VAysv2+P3D
 qPYvNNRGpyn3zmvbQoekOLGcUeDA+pBdM+0AXqG4br3oYcbCQ2tsytp7muagmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nPxJx0XA
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add iperf runtime test
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

On Sat, 20 Apr 2024 12:54:41 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                  |  1 +
>  support/testing/tests/package/test_iperf.py | 23 +++++++++++++++++++++
>  2 files changed, 24 insertions(+)
>  create mode 100644 support/testing/tests/package/test_iperf.py

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
