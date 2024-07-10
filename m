Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA34C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 605CA60766;
	Wed, 10 Jul 2024 21:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpSP3-ATHr6z; Wed, 10 Jul 2024 21:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66B31608AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66B31608AC;
	Wed, 10 Jul 2024 21:45:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 79A8C1BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 711C74148B
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsOK8srKa5OJ for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F94A4148D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F94A4148D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F94A4148D
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:45:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07ABFFF802;
 Wed, 10 Jul 2024 21:45:32 +0000 (UTC)
Date: Wed, 10 Jul 2024 23:45:31 +0200
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Message-ID: <20240710234531.78118499@windsurf>
In-Reply-To: <20240618130403.3387346-1-mika.westerberg@linux.intel.com>
References: <20240618130403.3387346-1-mika.westerberg@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720647933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bVmXWqIbWy/OQHRlUlWd5ipB7bzZNgRfFEvLCP2vx7E=;
 b=jc/TGoqhjGmEboRqbWEL7zGA9Q4k5r8aEpEGcuBrsnx4jzYF533ZLJsCbyakH2mVbBKwGU
 043E3Q5HlGa5eo6uL/d99Ti/tsO22fofQRnFQLbv7lrH7OGg0wfTgjjt6vqwankVf+oNQI
 kTDvqIH3JFbnfY6D1ovtp2kN216rDbPPlRsQFvbokhirNyVFXjnxKz6ke5UuP/8xQQBhPW
 yQluH2zBI9q94GcGYLajRW3UnQrG6Ym+v5RXXZoVSiHOTjofeEjtikUnDh+STi1v7YXzsB
 WpJVCoZEitp6Q4k+WY+vI9gWdxhMWENHm3EgIaJdNWnJUC225uSr0kE0AswSbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jc/TGoqh
Subject: Re: [Buildroot] [PATCH 1/3] package/tbtools: bump to version 0.4.1
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

Hello Mika,

Thanks for the patch. One comment below.

On Tue, 18 Jun 2024 16:04:01 +0300
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> Update to the latest release of tbtools.
> 
> This should also get rid of the couple of build errors seen on sparc64
> builds.

We really need more than "should" in commit logs, but guarantees :)

So practically speaking, we do expect you do to test that it fixes
sparc64 builds, and if it does, include a reference to the autobuilder
failures that are being fixed. I adjusted the commit log with the
relevant information when committing:

  https://gitlab.com/buildroot.org/buildroot/-/commit/f5251865413c6a50759d6f48b3300dc1be6122fb

Applied with that change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
