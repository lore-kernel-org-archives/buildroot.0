Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CF5C0219E
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA844072E;
	Sat, 14 Sep 2024 22:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MeTvogDbfn77; Sat, 14 Sep 2024 22:01:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3338040C3F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3338040C3F;
	Sat, 14 Sep 2024 22:01:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C0CA1BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A1054072E
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxMlHB-1NxmX for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:01:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72B91419C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72B91419C8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72B91419C8
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:01:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C94820002;
 Sat, 14 Sep 2024 22:01:00 +0000 (UTC)
Date: Sun, 15 Sep 2024 00:00:59 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240915000059.59d2f947@windsurf>
In-Reply-To: <20240906215553.1737885-1-bernd@kuhls.net>
References: <20240906215553.1737885-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726351260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=POkdU5gbFUdGFf++OrgSTE49HbJGuuvySgkmIt+nFe0=;
 b=PLoKe+QbJTUpeD0aBeDdt+/zo4M8Y8k7/XJ6ozNLzO87HdSeg6dWGM+nCJBRTKELlC6pOq
 BUN2yrMJOyy2rW+3hvV2RhAPOJ23X60N1DdL1kPo9I8hK9b2QaEnW4eOnxmJb1RoyLffrv
 6pG8tnH+hv+Sf3VZqyHP0jzNSsoqUlyvNpVrOSHCpWG5/ahGRo8boXoQ5vvYrmcqR8IJLM
 tbIy2MmzXGpyr+rEz2KtNWHU8M0TpdI/EHfUOjbN+wI2xzU+LrNff/dxgXeOJnTRPKLy06
 BknGxcPc+PQBBUkICoBNx/TCa3q3S0KWFe49P/wGOZ+1056g99erjsk6pYbSWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PLoKe+Qb
Subject: Re: [Buildroot] [PATCH 1/4] package/libvpl: bump version to 2.13.0
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  6 Sep 2024 23:55:50 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libvpl/libvpl.hash | 2 +-
>  package/libvpl/libvpl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Series applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
