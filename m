Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB370C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 12:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EA7080AC4;
	Tue, 23 Jul 2024 12:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0HXIeA6EHcb; Tue, 23 Jul 2024 12:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82B9F80AF9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82B9F80AF9;
	Tue, 23 Jul 2024 12:29:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EDCFA1BF83C
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 12:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8C5F60819
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 12:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLAcZKlFr7-3 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 12:29:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CF50660815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF50660815
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF50660815
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 12:29:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30EF360005;
 Tue, 23 Jul 2024 12:29:14 +0000 (UTC)
Date: Tue, 23 Jul 2024 14:29:13 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240723142913.14d32208@windsurf>
In-Reply-To: <20240723120140.176562-1-fontaine.fabrice@gmail.com>
References: <20240723120140.176562-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721737754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EKnnR6TWBzIARmfzab34tCHvjsgKToxpXb/ZUno8FYM=;
 b=k5nWGHpCukvQ57nBYSwsSjD5ybFJJOdmQf4VBCd2ugoPE01Xd60fEOx0mcrXoH1XCykBFd
 84h8X27v65za8fTZhYRfw2ERUL7RGoUQmSpOkkwhLLj4Jab1Em5Hf0Vw5rTh7+PsXry9gV
 jhpfhzjvuRjthhU+8YFqDLFHNdEKPYUKmWQIjVDmi59jmcHjiOM9ySHbc/NGrm83JOPKbJ
 SCfXynKmAGdjUqtmuvdH6ui2WC7aVbRLHNzFZ69GvkSs9krNLRoAQKZB8ZUB9HGxCQUMw5
 eSVvEZph6ipAeF9sGrKb0UjyzaYZw3MXw/t5GWPqnINHeckfO8uNVmE2NNMPkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k5nWGHpC
Subject: Re: [Buildroot] [PATCH 1/1] package/procps-ng: bump to version 4.0.4
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

Hello Fabrice,

Thanks for the bump. One question below.

On Tue, 23 Jul 2024 14:01:40 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> -PROCPS_NG_VERSION = 3.3.17
> +PROCPS_NG_VERSION = 4.0.4

Going from 3.x to 4.x seems like a "big" bump (not sure exactly how big
it is). Did you review for any new ./configure option that should be
--disable or --without, or some new optional dependencies, etc. ?

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
