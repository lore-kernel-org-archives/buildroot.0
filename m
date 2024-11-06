Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9B9D59F7A
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 22:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BC6760ACD;
	Wed,  6 Nov 2024 22:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAjJJs3stMio; Wed,  6 Nov 2024 22:27:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5DF660AD3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5DF660AD3;
	Wed,  6 Nov 2024 22:27:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6861F4C38
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 615766069B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yL6YzeFH5R3 for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 22:27:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F0D96061B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F0D96061B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F0D96061B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:26:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B8D51BF206;
 Wed,  6 Nov 2024 22:26:58 +0000 (UTC)
Date: Wed, 6 Nov 2024 23:26:57 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241106232657.09424310@windsurf>
In-Reply-To: <20241105174410.1397628-1-james.hilliard1@gmail.com>
References: <20241105174410.1397628-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730932018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHR4UoefHHPWrMM0xRKLTYtfWoB3kXZcHJ4h4wikaDI=;
 b=HhzQ9XZFI+NdOsDmr+mxlbd3oBgKPE29zEMkjJFkzqT8YXOZJYwUqI9ZSrio0THzx3X2uU
 5jFdbNJqTtLUe+N54Di2hlN+UnzXikdlqJrGFQFbXdUZxsunSh8sJOvp8gR+vXKhQ2L7G5
 W936j+dyjjbtqOL5SEMLFDkec4vDhT7u47XKba3tTMMZuDJr+7jnkEZ6u3ZrZI7Nm98gPu
 Qai0n2cKmU456vWzEcSl4esf1xRpyxxJa1kVo2X2piPofCc7NdvrzA1e0s4iZxoNeENU5D
 jOhC+WHTK4YreiooENEuhXhxOk5tEc3oQR+tAWNxQEWJzn/v8VGhplWjvRxFrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HhzQ9XZF
Subject: Re: [Buildroot] [PATCH 1/1] package/python-zeroconf: use poetry
 setup type
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

On Tue,  5 Nov 2024 10:44:10 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Use the new poetry setup type which automatically pulls in the
> host-python-poetry-core dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-zeroconf/python-zeroconf.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

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
