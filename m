Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB1AE7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 22:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E34960E07;
	Mon, 16 Dec 2024 22:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1dFeAyh4vLv; Mon, 16 Dec 2024 22:04:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDABA60E47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDABA60E47;
	Mon, 16 Dec 2024 22:04:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D79EC5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27CDD60BC2
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swZIjOWBYvZQ for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 22:04:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E4B1E60E07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4B1E60E07
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4B1E60E07
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 22:04:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94B6C1BF204;
 Mon, 16 Dec 2024 22:03:59 +0000 (UTC)
Date: Mon, 16 Dec 2024 23:03:57 +0100
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Message-ID: <20241216230357.3c64084f@windsurf>
In-Reply-To: <20241216-fix_quickjs_prefix-v1-1-88ed52e67b76@bootlin.com>
References: <20241216-fix_quickjs_prefix-v1-1-88ed52e67b76@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734386640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3MvJeK5enR+75Oq1yi2wutHM/zEjqSw9UmpebYg970=;
 b=HQLOBP2CzTQIiYVFecoirU+gHygp/8MZLMk1v3FGTH2FNzdAzPuUytjJuQN0p/F73r2ARO
 MLWwx8AkrV8fGur2InImq/1f7AJwFzzW5gsvPZ33cy1haqpmF6tFojvXDelg8loISE3Kc4
 pVGyoU7suc5+FX2xhyWmbzOBC8XlxIAprxMk+meVVMHyGyzw1avyZnS/A+wyi1V0OC1Qp5
 Co5U/QWGYvkxeHNlrguyVy9aWeSFfn+Xh8YUp+U1fa+tdDXIASmqg/TzsQ3Ns3o/ODGnm+
 qKbWF4LF5TzL3Pkb+O1aepR9wlV2259UNW4AyZpmQsiSHfpsuSwF4n6okPPmNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HQLOBP2C
Subject: Re: [Buildroot] [PATCH] package/quickjs: fix typo in prefix
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
Cc: =?UTF-8?B?TWlxdcOobA==?= Raynal <miquel.raynal@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Mon, 16 Dec 2024 22:30:52 +0100
Thomas Bonnefille <thomas.bonnefille@bootlin.com> wrote:

> The quickjs Makefile expects the variable PREFIX to be set [1] but
> prefix is set instead.

... by Buildroot's quickjs.mk.

> Without this parameter quickjs is installed to /usr/local by default [2]
> instead of /usr as requested.
> This commit fixed this error.

s/fixed/fixes/

Also, you want to add:

Fixes: https://gitlab.com/buildroot.org/buildroot/-/issues/15

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
