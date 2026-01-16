Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6EBC982C3
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 21:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28C54615A2;
	Fri, 16 Jan 2026 21:00:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HA7aaAALom_O; Fri, 16 Jan 2026 21:00:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD5FB60B99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768597219;
	bh=jDO5+uLDXnUzAWSZ3DN9nzdMC7mb62XFVmUMyC2Ia94=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IyePSJKDJlKWTgAYE7J8S9+mXlDRSVMDpT+OnOCeEyKNw3mKAacB2qEU6eSneLESy
	 7C1ozsqdGRgKd1NrzihhCxxxJ6nlUj62yQQFOcqdW9XknyQXxpMYVY1Ee1Ro6j/Vtz
	 MOciLpkvPYwkCOfofe17z9EaxUBQEXe1QTu/P2PlWPLSmKtiF0v/fJu1UMrGtChNS+
	 lHEDg5Gk7XmKndKDXIGNU8qIJnXnPZ7PRFQX0q1oKSeAnrVA4+I0R8pw9LB4L/cLJX
	 wU+7KHOMtQev0Jj7la3EF90IiOdBq+o7wFeodNM4ZMtuWeCbovFmDJSCiKDDr2D6/u
	 lOnXsGb6voUFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD5FB60B99;
	Fri, 16 Jan 2026 21:00:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B81B62D1
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DBCC60B99
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_Y477PS62x8 for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 21:00:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D2FB6600CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2FB6600CA
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2FB6600CA
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 21:00:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0B47DC1E48C
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 20:59:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BAB08606F9;
 Fri, 16 Jan 2026 21:00:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 33F6610B68E15; Fri, 16 Jan 2026 22:00:14 +0100 (CET)
Date: Fri, 16 Jan 2026 22:00:13 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <aWqmusvfT6TaQFdF@windsurf>
References: <20260106200115.1985522-1-bernd@kuhls.net>
 <20260106200115.1985522-5-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260106200115.1985522-5-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1768597214; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=AGOCQP0t/Ue3gK1CcAECCMbuF5RfLiu7hxehfoXYBDg=;
 b=pJBG4abiYbHacu9n5WmyBnCTiv4hFK73phoaJpcCM7mBT2HZN1WFVkhJIBSu8XNmCofcc8
 dVEQgNlU5WAXE+4pF52MtX5EEaLJtFbmIewlKhW34e/bMaXv3DW6/7fxmS0jIovDe0A5TE
 krzuPWqhQ+siJQA8f212azm05/NtQdNBuaAuhau+ieq1qi03iMFZnFexOiVqgFCg1X0YvX
 rh+dMsE2ucYG0NUR5R6Yc/qndP0Qbz/PCrCPXJmTWqD7WRCHvdm1YdbJ5xF0e9CX0X5CrC
 NELyZn6+Vh8rRJHQIxaW8RhZOBR/n54QHqDxXQDgcKS8VojkEFnnXlssv0p2MQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=pJBG4abi
Subject: Re: [Buildroot] [PATCH v2 4/9] package/criu: remove package
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

On Tue, Jan 06, 2026 at 09:01:09PM +0100, Bernd Kuhls wrote:
>  comment "Legacy options removed in 2026.02"
>  
> +config BR2_PACKAGE_CRIU
> +	bool "criu has been removed"

"select BR2_LEGACY" was missing here, which was causing a warning. I
fixed that up when applying.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
