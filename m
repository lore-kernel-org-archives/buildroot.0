Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8D0C4829B
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 22:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3407241A75;
	Fri,  9 Feb 2024 22:00:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hPvBYIzgLjl5; Fri,  9 Feb 2024 22:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F371640545
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F371640545;
	Fri,  9 Feb 2024 22:00:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DD721BF3AE
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 22:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B48660839
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 22:00:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nos6mKBYPG4D for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 22:00:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B4D5607FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B4D5607FF
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B4D5607FF
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 22:00:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27F0EE0009;
 Fri,  9 Feb 2024 22:00:08 +0000 (UTC)
Date: Fri, 9 Feb 2024 23:00:08 +0100
To: Alisa Volk <aolvolk@salutedevices.com>
Message-ID: <20240209230008.615bf94e@windsurf>
In-Reply-To: <d63d6a13-770c-4a4c-bad3-c4d97a54d747@salutedevices.com>
References: <20240115142744.70711-1-aolvolk@salutedevices.com>
 <20240205180959.5c662ae1@windsurf>
 <d63d6a13-770c-4a4c-bad3-c4d97a54d747@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707516009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NtaWNcYSjvujT+pCrwKua+MlEHs2KOWrOOWHk3A1CSo=;
 b=dRCeRyqUNBHGqepQif52Cvx9B/Eh5xffgN+zXUYoSvcR8i/CaA8p/5hgQFheEjRHjG8P7i
 hwZOXvW9k9SCrUj9vIyBYEavnL3AcrnwXyzaxj4qhulbZTJa2K9u0nolxvKYzHoOJFoj8x
 7VcddbJUhdCL/LAgjLYIUJdwL/MMyGs4XC5KpC8pO2AY5TtXf42owf1530wzObAIa/X3IE
 IttVxziZEf0a2hUlxE5X1BWfXLWHXD3ARS1Byhx17XX3X58tBBcJb0T/sI5wjBfkBCJOK2
 fnFalDZtDzwef4rUDa1pveOLiZqxob5NbRmsAoLVgfVE4pIdtDjAnXPM4PERZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dRCeRyqU
Subject: Re: [Buildroot] [PATCH] package/ifplugd: add option to override
 sysconfdir
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
Cc: ovlevin@salutedevices.com,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alisa,

Your e-mail wraps very weirdly the messages you reply to, as it forgets
the quotation mark on the second line of the quoted text.

On Fri, 9 Feb 2024 14:02:14 +0300
Alisa Volk <aolvolk@salutedevices.com> wrote:

> The init script is auto-generated, and the path to ifplugd.conf file 
> inside it is configured with sysconfdir option.

Correct, I hadn't realized this init script was installed. Usually,
Buildroot provides its own init scripts. My suggestion here will be to
patch/override this init script in your root filesystem overlay, or
using a post-build script.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
