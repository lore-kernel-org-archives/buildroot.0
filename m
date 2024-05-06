Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0D7C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAFDD60A4A;
	Mon,  6 May 2024 20:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrBJxPYytmOe; Mon,  6 May 2024 20:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDA8260A41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDA8260A41;
	Mon,  6 May 2024 20:43:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B44DA1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0F56401B5
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_GjdHvFUu31 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:43:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 658C3401A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 658C3401A1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 658C3401A1
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:43:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 735F2E0004;
 Mon,  6 May 2024 20:43:34 +0000 (UTC)
Date: Mon, 6 May 2024 22:43:34 +0200
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20240506224334.296e25c3@windsurf>
In-Reply-To: <20240425173213.3772586-1-andriy.shevchenko@linux.intel.com>
References: <20240425173213.3772586-1-andriy.shevchenko@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715028215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mcmFP1uJScNhgCOlsiODIADaDHntytcnY/xbNmb22DQ=;
 b=W0D7IgAwNr3hF7/r9rqcx7ynYNMQhwXW153qDmwN8q48LrFXh1Upl5htfz9UP7yHrIxlJp
 Or5vbsD4MIXBUoJFweHQjwpdSt6guYjk9tSVb2HGFQpwwr42eeC/jaSAvoTPFrMDIIO0MG
 aBt82eP2MiETI7t8cOjyBWfbDkZMmlCRDr9g/rc0qKhNcYdQqLrrvcqiy3I0UQxoarqf5g
 0FzZc1h9xnW0coWXvLRXSQv+49D3llplwxOhCLEeUS+V5+oCj6RY+igEAaPJS0sOMkFHVU
 +ZWmyW+KUDMEL1O0sr1lbe/9UWeJme9+AJ9kK1DuklZhHBk5aLVWMsy5uL+c0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W0D7IgAw
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-firmware: bump version to
 20240410
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 25 Apr 2024 20:32:12 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Updated WHENCE hash due to various new entries for new blobs.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  package/linux-firmware/linux-firmware.hash | 4 ++--
>  package/linux-firmware/linux-firmware.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks both patches applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
