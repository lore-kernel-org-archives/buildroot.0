Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC16C2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD4AB80D6F;
	Sun,  4 Jan 2026 10:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id schv8uBqqTm8; Sun,  4 Jan 2026 10:49:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90A8B80D25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767523744;
	bh=lH08RSX52VggkSmfLX8HDxZ4/nN8jaGSwq/wz/1Dlb0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OdZOr43Dj5GiJKRbO1XlF4WHLxAWSjsl6iIIThHAZxcs2RmvcKR+6nY8I/RV0kkJv
	 UxqhNRPUNH+OVtJCjwMjJYvpj1d5LluK8e9CM/vHy0jmFZPLHMEgVkL/xza4NzA11j
	 wuDZD18u6qs/Kkcuu5JmJUDRa6My4LeerrUqBOs6wlDtBISLZSXOhNJb0ku7QbI5wC
	 ztvDckKHbdzFdxi3dxn1aE5/ipzCtfELpI245j6ZLrL0LTe7QVvyAgv51UrfnzosOT
	 Uzp0nq3oTdusvH6LqzDXPpA3X6/YSmNKJSNbh/tns3/F/u4MZ5+Wcr62LDdH/c1vSy
	 KJAO95LgVfqjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90A8B80D25;
	Sun,  4 Jan 2026 10:49:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE202249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4BB86072D
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7ZSEo_gi36i for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:49:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D20060708
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D20060708
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D20060708
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:49:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AE3044E41F46
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:49:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 85E726072B;
 Sun,  4 Jan 2026 10:49:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 26EAA113B0449; Sun,  4 Jan 2026 11:48:58 +0100 (CET)
Date: Sun, 4 Jan 2026 11:48:58 +0100
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20260104114858.57f59c46@windsurf>
In-Reply-To: <20251218214636.736781-1-ju.o@free.fr>
References: <20251218214636.736781-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767523740; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=RAsCn1H7iUBZRQSOjxoQViXcCHsGPOfcimaT5QNkU+k=;
 b=ibor5lDXGrW/kCxkK5+oDQ5aTTH9ZHWeHJ4J73bPRKKYFnOSKfhI0qMxAV+JZ4ZgzXmj0y
 /LSMYkf5PdJ0+2Wla94WZ9UXx0hka3hgh1sMvUyyUUaZl6xSyDoohquFxvohP9fnK9G9wW
 eeV+gYe5ocID0RCqK/g9rHcM9wf1lVaDfDkdOKgVPi3l+lBJXXO0nyPeB2II20Sm630tlZ
 BcaFCTQDIE5OGSsrVrR4pDW8pA2keTrzMoi+u0Jfkl3pGW6tYgg0HC497QImbZOv5bRBxa
 CTurnBrG2Q9dWDEJr62x0DPLDyEGjhJWmD21zI0nEHgGP0fdEVlRsw/dT6jdiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ibor5lDX
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: add opus-tools runtime
 test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

On Thu, 18 Dec 2025 22:46:35 +0100
Julien Olivain via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                     |  1 +
>  .../testing/tests/package/test_opus_tools.py   | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 support/testing/tests/package/test_opus_tools.py

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
