Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBF8C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E70E684706;
	Sun, 11 Feb 2024 21:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mI0EskLUelFW; Sun, 11 Feb 2024 21:46:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B7F84948
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06B7F84948;
	Sun, 11 Feb 2024 21:46:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A4101BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67D4760FFC
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5lo6RFEnmB_L for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:46:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F3E360FB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F3E360FB8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F3E360FB8
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:46:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FABA20003;
 Sun, 11 Feb 2024 21:46:22 +0000 (UTC)
Date: Sun, 11 Feb 2024 22:46:21 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240211224621.32d6eb40@windsurf>
In-Reply-To: <20240210103634.3502847-1-bernd@kuhls.net>
References: <20240210103634.3502847-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707687982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k8SMjjoGtGek4fQR2YnB+VW99+Ip64yT5joy6vQxh2w=;
 b=LT62RQLAA30h+jdvMkGYOBCvqTcD4hMGoQW+t+s83GWKiI5WbZcRCYNMYjthcgUWfTc+rq
 js8K9PfHfWDRNQYflDg9Gm/+iXCDSZwgU2tXZrEzqiVz+hyayK7r9JdhHM5NespcD39575
 sWuLXHlu4rsQJKIxbrjB9IvUPIF1Nv5VFa7cLObNGQuwsyXPK/RY3KYnA3vBy+X3Xyuusc
 jo2eM4sLsjrN4nq8I/3+K/gClKLBFfQlztLIT7n1kD6kSUnqvrH8dJGi0DJ7a1VbNS79zM
 aqKOZtSfr0SrvjRF7l9KPb8u4dHNOjzg0QjzdKT+jecBLj2Z2hlzO6jD9bsRsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LT62RQLA
Subject: Re: [Buildroot] [PATCH 1/1] package/heimdal: Fix build with
 autoconf-2.72
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

On Sat, 10 Feb 2024 11:36:34 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> +-if test "$enable_largefile" != no -a "$ac_cv_sys_file_offset_bits" != no; then
> ++if test "$enable_largefile" != no -a "$ac_cv_sys_file_offset_bits" != no && test -n "$ac_cv_sys_file_offset_bits"; then

Could you provide more details? I don't see the relation ship between
this change and the build failure.

Also, you're using && while the rest of the test is using -a. And
you're testing if the strong is non empty *after* testing if it's
different from no.

We really need more details.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
