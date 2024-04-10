Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45559CD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1558660EE3;
	Wed, 10 Apr 2024 21:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzlkpvXHukMl; Wed, 10 Apr 2024 21:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 043D760EE5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 043D760EE5;
	Wed, 10 Apr 2024 21:46:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB7E61BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E59404036A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id auUrMu-5MYSJ for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:46:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A811540359
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A811540359
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A811540359
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:46:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1D4B20003;
 Wed, 10 Apr 2024 21:46:08 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:46:08 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240410234608.05aef408@windsurf>
In-Reply-To: <20240326225031.224022-2-giulio.benetti@benettiengineering.com>
References: <20240326225031.224022-1-giulio.benetti@benettiengineering.com>
 <20240326225031.224022-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712785569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6C/W1id0lv+RWv0ePPjsAB8SUUrCszZXq+Q3sofQ6BI=;
 b=MJlpcey3zyFyDDrsq8GFV4NqJD/pz/tojkral4pSigReaDLyM+aasWHYbL3Ou6oNSERij2
 XKnP09X/1ZsRF5efbx0oWIOy9sxogpUK0Ic5JByBBtzAUn9htU63y8H5YfvUJ9ui3IcE4j
 Kg0QeM64LLOROTGoqFjtkxa0jvcX3V5Em2FLmh2k+50pDcLvsvGKls6icVev07DbvxMmN7
 2xSu96YsKATx3OBB+eD5ME7A86KDAjJ0Jv0K/c1qhkpj/kYW81N9EZtl7ZY3iYFzGGULSj
 3eiuiuRsKqqDhyYN8H/JWgRQQ+O4sokjsJ7hGpoA0VNjMv3CRW9y5HkHAxWk0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MJlpcey3
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: bump to 2024-03-25
 version
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Mar 2024 23:50:30 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This version allows to build with Linux 6.9.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8192eu/rtl8192eu.hash | 2 +-
>  package/rtl8192eu/rtl8192eu.mk   | 2 +-
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
