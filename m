Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DAFE7716F
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 21:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56A2980C34;
	Wed,  4 Dec 2024 21:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5HxxIfa8DjGU; Wed,  4 Dec 2024 21:52:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 636C3822B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 636C3822B9;
	Wed,  4 Dec 2024 21:52:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8A241DD9
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3C5C607C6
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5goRXjZMYVI for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 21:52:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 605BD60744
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 605BD60744
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 605BD60744
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:52:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D281C60002;
 Wed,  4 Dec 2024 21:52:49 +0000 (UTC)
Date: Wed, 4 Dec 2024 22:52:48 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Cc: buildroot@buildroot.org
Message-ID: <20241204225248.065dbf00@windsurf>
In-Reply-To: <43db1477-708a-44fb-8cf9-ef418d376045@mind.be>
References: <20241204204806.159596-1-thomas.petazzoni@bootlin.com>
 <43db1477-708a-44fb-8cf9-ef418d376045@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1733349170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BjpeidrMsHHUIUaJB/VZB9HkBCfleOqlLc/3/e0eQcE=;
 b=H3ZnLtHT4xAMon3cFJAWmiu9aPCqIQhI/qjpaHtxcO6eWRiCeYL+XnQHtJyHl5uEP7+alF
 +EmmUrr3hSZdkWlGKEnNsiHpciKvyA/4wg8ZpSSiNWLOtAPxDM92kg4uNdYAshoJYlJf5a
 R5xDJexIkKtfbCwXMFIpKHKq/ktFxsJAkwTULTnQEl+sJ0rXKkkcCdF9Ccs78jw9QwYocI
 xMSvLYP//IshJyPD2OUaWh9Q6ToyxmBMpSgD7G1KnKrBpOg17xqVHX3cb3UDEP+/7ovBJy
 Reevj6/N9GK9KFXLAOrEIw7CNymvmPTRBQkQycMnyY5ZCY0DniZruCj8pHvKFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H3ZnLtHT
Subject: Re: [Buildroot] [PATCH 0/3] Fix two android-tools build issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 4 Dec 2024 22:48:11 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>   Series applied to master,thanks. Though I don't like the "we're too far from 
> upstream" part too much :-)

Me neither of course... but that android-tools stuff is really really
far from upstream. I recently discovered
https://github.com/nmeum/android-tools/ which seems to be an attempt
at having a "common" place for a CMake build system for those
android-tools.

They also have lots of patches, though:
https://github.com/nmeum/android-tools/tree/master/patches

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
