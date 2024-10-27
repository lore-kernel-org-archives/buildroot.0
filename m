Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC516D13572
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C09F607FB;
	Sun, 27 Oct 2024 18:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q04tw2SUZzXA; Sun, 27 Oct 2024 18:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A453160889
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A453160889;
	Sun, 27 Oct 2024 18:44:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2758EAEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07F2640550
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8Sg6Ypdn5Va for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F9514056D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F9514056D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F9514056D
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FD1EFF806;
 Sun, 27 Oct 2024 18:44:31 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:42:40 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Martin =?UTF-8?B?SHVuZGViw7hsbA==?=
 <martin@geanix.com>, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241027194240.1e3ad8eb@windsurf>
In-Reply-To: <20241026205412.3625809-1-james.hilliard1@gmail.com>
References: <20241026205412.3625809-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9i74HlLCxMfK6cg3iJbAdHfE+FuiTZi8/Ez41aG7q2E=;
 b=XvbjXMBdD8ATirmE164Sk2iz+nyaHyfdXVkWeuhQmxE7mBqRUClU9Dy5Yv6S37Gmdmq0PF
 5vnYSfjK9Mb8kXKUajV4rzcDolKirdgI4GB+Ak88Z4GSRZJPRujgqE7CnSfllz1fwChL3h
 2SWN9TeRTCKkui8+OmNuzxY9F1OKBGCikWamS0ako1qBoHfoDOd4HnP6nX6QkMZS6ZH+BN
 ZdTmjkmx8hbADLE0dpNwkWrJecry8CH0sk+WmLMlqpPWlg4FOnDkNQIMiWePcLu0XxABaI
 O7v7ii9aEEjcrvrrYFJ2GHNz65XjXXZSvZ72vSftfUt4ux3T2mx+z2h5sqfBxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XvbjXMBd
Subject: Re: [Buildroot] [PATCH 1/1] package/python-marshmallow: bump to
 version 3.23.0
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

On Sat, 26 Oct 2024 14:54:12 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-marshmallow/python-marshmallow.hash | 4 ++--
>  package/python-marshmallow/python-marshmallow.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
