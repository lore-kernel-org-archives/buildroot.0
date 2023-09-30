Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5ACE77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B45283E28;
	Sat, 30 Sep 2023 14:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B45283E28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QfVqF9T2814i; Sat, 30 Sep 2023 14:08:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5C3783E2B;
	Sat, 30 Sep 2023 14:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5C3783E2B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A249D1BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1585760A6F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1585760A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yq_dW2eJHiZ0 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:08:35 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DDE660A5C
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DDE660A5C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AACEC0002;
 Sat, 30 Sep 2023 14:08:32 +0000 (UTC)
Date: Sat, 30 Sep 2023 16:08:31 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230930160831.11292fee@windsurf>
In-Reply-To: <20230930132822.436857-1-fontaine.fabrice@gmail.com>
References: <20230930132822.436857-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696082912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/W/dAFTdlskEexuZd04U54W3GwXGlzT0TrpJuYbVy4=;
 b=f4p8W3Su4SHA12IXmMsgmWduOxGi1aBJnjm7J/wrQOhnQUPZT6msVhNCGADZU5J7vJqRuj
 1vHg5JzHSuPgSoXHXO6JZoEWs46wba+VUDVP6ulFo11MHuejlpVVQUw0dZHQ2MZi6tuXvg
 yxL4ZVrRzyenSPVsDXzS/3iKmYaB+DT8BAPlvWGznak5II3wonk90CQs8m4pr4+ufqTwE/
 CUBD56kO+2T95UeB+Qa6IqDLyJw8dWg34bDWPmWGV/M2yLZ3iTER006Rj1BS+0VhzsF4wV
 rqw3J+s8Vc3Ed8RIl5kATKBm5V6Lv4E3yYGQiFX0RKK27H6CgTZZnGgYQXYJng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f4p8W3Su
Subject: Re: [Buildroot] [PATCH 1/1] package/open-iscsi: fix musl build
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Sep 2023 15:28:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> ++#ifndef GLOB_ONLYDIR
> ++#define GLOB_ONLYDIR	0x100
> ++#endif

But musl doesn't support this flag, so isn't that wrong? musl will most
likely ignore it. What is the impact on the application if the glob
also matches files, not just directories? Perhaps it breaks the
application behavior. Are you sure we can just blindly do this
workaround?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
