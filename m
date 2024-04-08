Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28792C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 20:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7E16408C5;
	Mon,  8 Apr 2024 20:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94ncarq0pau1; Mon,  8 Apr 2024 20:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0188340CA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0188340CA1;
	Mon,  8 Apr 2024 20:38:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 808D91BF2A7
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ADBA6075D
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SpBHQbq5z4pN for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 20:38:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E63C605C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E63C605C1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E63C605C1
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 20:38:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74D3AE0003;
 Mon,  8 Apr 2024 20:38:46 +0000 (UTC)
Date: Mon, 8 Apr 2024 22:38:45 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20240408223845.2c3514e5@windsurf>
In-Reply-To: <20240403100101.4183149-1-buildroot@heine.tech>
References: <20240403100101.4183149-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712608726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i81q0VY33JbWKmD2OIzswc4fVDQmEsPPkRAIViZ2iMU=;
 b=cNVwRN2/MjDopF8ctzlN87OmEIUhynOQqWHQIFVnC1laPU4qTGtMVBW/0q5TIXaweQNCFv
 AFB6fUlEg+WnpRPec1MJyZ5NaIopno1195u2THh/TZ855Jtgkkj+Wjs3A+gvjjNDnDDu+I
 B2vGFZ+GBIngZit/fdXeuRmvGP8gRkTfsT/kI697kHPir3i+3M2x4xHtFjJr+gZZvToEwE
 UdhMFY5mebNRDIHnjvYGMJKUgBAsgcPBYXd1M4dHE1Tcmy90+O1FiD/IOaEhl3fFFOG15r
 33xLGt6cLopaAzTFCmA5AntZ6WF1NTWCmFhZtyUB+FIJJRsWA7ZuSdIECKTP7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cNVwRN2/
Subject: Re: [Buildroot] [PATCH] package/re2: bump to version 2024-04-01
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

Hello Michael,

On Wed,  3 Apr 2024 12:00:59 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> ---
>  package/re2/re2.hash | 2 +-
>  package/re2/re2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks a lot, but we need your patches to have a Signed-off-by line to
be applicable. Could you resend an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
