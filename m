Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EC2E95A8D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9360060B90;
	Tue, 30 Dec 2025 13:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmY2cVUrxVxk; Tue, 30 Dec 2025 13:04:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 617F960B7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099867;
	bh=fbjFt0mWVxzSIdZZQdm0VNjyLDAmR+A2hBmd+chDwYQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ovClQY4fRDG7QlDCjXLsvo+OZEZCxpl+AyB2aorNGi9saXAC6Ap+Shy+AXXAd52hU
	 6vO2wZeHC+dvdLg0oZlBjbYxtHXeYjH4cMe+/5kQ3JHNFFOPot6ZwQCij0tNsZr2bL
	 Sq3FXY4fNVsrqRIve7paCjt71Qydc0hWLpVbta8IqrfcPcOJrujisg581NYRGYazeE
	 dwgNRM4/qKaGPwDh5kqt3sVgGcLyf9HgUE+S8MSo1+4fzBh2lzl/B5vV9yAboasM+f
	 HKJJMaBB7RUwEnj3G4Di/NYWqrV7DkQxpYsD48S9N1XEsuohZtZXRoHkuQxmwGig8O
	 I30lsUv6F8EhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 617F960B7D;
	Tue, 30 Dec 2025 13:04:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88D23177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BB3B40796
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2mYdhugO7I1 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:04:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 78E064077B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78E064077B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78E064077B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DAA9AC1D734
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:03:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 727C36072C;
 Tue, 30 Dec 2025 13:04:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EBE34113B0392; Tue, 30 Dec 2025 14:04:21 +0100 (CET)
Date: Tue, 30 Dec 2025 14:03:43 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
Message-ID: <20251230140343.6e3f9eb5@windsurf>
In-Reply-To: <20251229005849.3125827-1-james.hilliard1@gmail.com>
References: <20251229005849.3125827-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767099863; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Rwnemx2yZx3UUq9kCnQmLqJLxOvBrnRjTgDM67yqnsk=;
 b=hr8Xyc8dyhrS+n9tqyqf+OUM6DRwzIzEB/LyYwpKjcSMUAsd2Hj2ltAbuKVvswf6Q17Jr+
 BPczydPzWg+gVVPICEpc8HW0/UyfChKoNuozfNcdhHPEE+vhUgfdj23gz9AqKfxIqpxMQJ
 4e/oONrjrfQ4BC6WX71JzBTlWwKhL9NxHu2KBYcgHNJ82nrlMtjGI7P+q4XU8owbpUP9Ah
 edrwx6T42+kY6a3iUYBDS5gvIjwHV3cDDK93iepRfb7OIDOgMc45ATe3K3Y+zW1eTfy9Wl
 MFIPqZloCKafAe5YqIDzIV0IqWGz/S8kyGBtqyaqBs/5UucMjVQ83htSKkWxvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=hr8Xyc8d
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to
 version 2.48.0
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

On Sun, 28 Dec 2025 17:58:49 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
>  package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
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
