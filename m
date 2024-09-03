Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9216ACD343F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55974401B1;
	Tue,  3 Sep 2024 21:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYTdvfOO_Y8S; Tue,  3 Sep 2024 21:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 303A6401E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 303A6401E4;
	Tue,  3 Sep 2024 21:02:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 744E61BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61633606E3
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SASjRbpccIYO for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:02:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB3456058D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB3456058D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB3456058D
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:02:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03BDDFF804;
 Tue,  3 Sep 2024 21:02:22 +0000 (UTC)
Date: Tue, 3 Sep 2024 23:02:22 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20240903230222.0019371b@windsurf>
In-Reply-To: <20240902181743.528003-1-petr.vorel@gmail.com>
References: <20240902181743.528003-1-petr.vorel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725397343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Q4w3A4AiZhMKlZ2k4oVoQTn9P/ecqr+xkSZVLczIzY=;
 b=hKCr4KlWxF/sboOV0uByQY9+JH9nQvZW4cLUsMP4/CoryJzd34eUvpQVu0q6dRV2dHmOhn
 RyZK88ut7aFQPKLBJuDMnQWwSoShXpkwdcOqSLU1MbuM1MgMJc2a/U4GgnsdkRyE5TehI6
 5PzhTCpiipYF8RaXBcmrVCYbU2kEk4wzTUZJl+PQ0ctaCSn9v6SHsWDP/qjSKoFbkYYLYH
 cmQpa1ujv3ajftfkfdKyAQ5IOKmnBxZOTTMPihFUpQ+l5/rI9ev5FTd+ZRsTMFp0CCj441
 9/SU82WbN2rPxTVF3CiYSbLEXQsRvfikJNongbCJlPlA8q+As55xLY1guy/A9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hKCr4KlW
Subject: Re: [Buildroot] [PATCH 1/1] package/ima-evm-utils: bump version to
 1.6.2
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

On Mon,  2 Sep 2024 20:17:42 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> This version also reintroduced COPYING COPYING.LGPL, therefore add them
> to IMA_EVM_UTILS_LICENSE_FILES.

It would have been good to explain here why the LICENSES.txt file gets
changed (since you change its hash).

I fixed that up with an explanation (after diffing the file
before/after), and applied to next. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
