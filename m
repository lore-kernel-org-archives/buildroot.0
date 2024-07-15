Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B13C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 11:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C6C3606CA;
	Mon, 15 Jul 2024 11:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfcN23P77UDf; Mon, 15 Jul 2024 11:41:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B38760780
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B38760780;
	Mon, 15 Jul 2024 11:41:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2EEB41BF3D9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 11:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27C3781174
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 11:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUe5BRwHPIa7 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 11:41:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C71381169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C71381169
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C71381169
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 11:41:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CD411C0003;
 Mon, 15 Jul 2024 11:41:39 +0000 (UTC)
Date: Mon, 15 Jul 2024 13:41:38 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240715134138.4fa8b158@windsurf>
In-Reply-To: <20240212125649.210272-1-buildroot@bubu1.eu>
References: <20240212125649.210272-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721043700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vsegJmyoh/rn0ccAoyw1wq4nnsmbf9ehDBaSPWUhUE=;
 b=WMvAgzIpMkgrMVeBduxE5Zbw3Ba3Pgbb1ZBsJYaEo6BBwf53FGB7pBNdCh2cBADSZrwbeV
 hoj+Z0ZZF8s07MgbTlrY8e+Ny8CUTAhi+VUoYZvBmcOMnYty/6qA2vNKMS/GSTWzyapBMc
 Ik9K7Gj1THA+a1Gbh34zwxELC/MWi1uc+jql6/vDSuOhHvRBPnr1BKw4Nr55p9Gi8LPMHj
 mbSaORX8Cr4EA5CS0U5LXVq1PDxJylAkyjXwsTRYN2IWvUzSSMXnM6npWIZakzv2rqI/qA
 4mbS7w/GSr+P1oaN2xV45UPYbq5NtR2C9JpteK6RUZ3eKe+bIeHfV8+09p9oQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WMvAgzIp
Subject: Re: [Buildroot] [PATCH] support/testing: add python-asn1crypto
 runtime test
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 12 Feb 2024 13:56:49 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  .../tests/package/sample_python_asn1crypto.py       | 11 +++++++++++
>  .../testing/tests/package/test_python_asn1crypto.py | 13 +++++++++++++
>  2 files changed, 24 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_python_asn1crypto.py
>  create mode 100644 support/testing/tests/package/test_python_asn1crypto.py

You forgot the entries in the DEVELOPERS, so I added them and applied.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
