Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83685C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 21:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5002240543;
	Mon,  8 Apr 2024 21:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MsWMSDmMPrAl; Mon,  8 Apr 2024 21:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54DAC405F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54DAC405F0;
	Mon,  8 Apr 2024 21:43:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 063FD1BF2A6
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E735B60829
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWAiLWy0X4jo for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 21:43:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D791E607AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D791E607AF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D791E607AF
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 21:43:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BE5540002;
 Mon,  8 Apr 2024 21:43:06 +0000 (UTC)
Date: Mon, 8 Apr 2024 23:43:05 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240408234305.5df31270@windsurf>
In-Reply-To: <20240403055157.9627-1-bernd@kuhls.net>
References: <20240403055157.9627-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712612586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ant3RASLv16obgqwbXUBEp/JNkc/lxdw8CX34Q1H4mI=;
 b=Ivtmgs8Ai7Rt+izCIpkRdwWIDhWqnMLtQclRANc7PFbJqjNA2f6gI2hAPA2+PUbT5imWlz
 a+GxwZYPXmCXvqKavZ3hF3Ha3HyDFV6DZ7bRj8GZhW5JZWePtFDj9XCXcxWwMoBi8EAQdJ
 8a5fNDKRTRQNRw3obs5Zi8BvGpYK+SEHkCvMK++sSE7SjmkVk3UeYRj9wyC2/N/GVkFDaR
 gsUrhhPGspO75B7wZ4Zj5aiZ8MRPvUFUKSsUxX7ofREMb7uSJmxzJhPtme+eax7nwKn6qt
 LAprVpLy+ORAjCpdxwt9m0WhriKJioWu/gHdbY0KYWrR0bSolU/b9WPBuTTRCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ivtmgs8A
Subject: Re: [Buildroot] [PATCH 1/2] package/onevpl-intel-gpu: bump version
 to 24.2.0
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

On Wed,  3 Apr 2024 07:51:56 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/onevpl-intel-gpu/onevpl-intel-gpu.hash | 2 +-
>  package/onevpl-intel-gpu/onevpl-intel-gpu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
