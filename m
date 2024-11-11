Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C839D3ABF5
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FE58606E6;
	Mon, 11 Nov 2024 20:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dklmHp-iQ7Pj; Mon, 11 Nov 2024 20:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EA51606F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EA51606F7;
	Mon, 11 Nov 2024 20:21:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 461956C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25E904011E
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYrbAg0qEVgd for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:21:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D21AF40101
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D21AF40101
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D21AF40101
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:21:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14217240006;
 Mon, 11 Nov 2024 20:21:47 +0000 (UTC)
Date: Mon, 11 Nov 2024 21:21:47 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20241111212147.384865d6@windsurf>
In-Reply-To: <20241111110541.1934934-2-buildroot@heine.tech>
References: <20241111110541.1934934-2-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731356508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQlUdI5Ig5+2YcY0cnZJ0yJqFXKYz8BiXe1pDsW7RcE=;
 b=Rta5wg2P6yHhT+nnZOlXXvK/zVWFQ7mFJIPInQ3DjvlBKi3A6/qnN6rhZ7CUdgFWdR/cjr
 g+ctW+rQuiEoAdhIROp0hhCE2JCWqht1YP7Rk1vrAH6nYKgj0J/75sVlMGZW6672uj037n
 qNHjL9/rvP8r8+goDl9zoPk35n/olEj+3G3GqjlKd3RckDCHRX999MjbtB/J+dGQyxebc1
 EDsV+CezcMCDTjwUR1EylzIEz5X9Ha6rPuTvLMEIXzehAF4XBMO1BjJ6CavqMWjXK/RQnf
 rfTlhBlEpZ1AzQRE3yU3yWNSrJrPjrZo10Tai88LylzAXEGpYpoD969A/d93bg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rta5wg2P
Subject: Re: [Buildroot] [PATCH v2] package/boost: update download url
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

On Mon, 11 Nov 2024 12:05:39 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> boost moved its package hosting from jfrog to their own url
> provided by the C++ Alliance. According to [0] the old urls
> might cease to exist after December 2024.
> 
> [0] https://lists.boost.org/Archives/boost/2024/05/256914.php
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 
> ---

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
