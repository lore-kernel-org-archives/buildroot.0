Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B024C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 21:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9550607EB;
	Mon, 20 Jan 2025 21:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wjlMKFgbdtZ; Mon, 20 Jan 2025 21:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7C3B60AEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7C3B60AEE;
	Mon, 20 Jan 2025 21:02:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CB29169
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B843341398
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8f5jytw0Xbi for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 21:02:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B39F41397
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B39F41397
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B39F41397
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:02:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28D7620005;
 Mon, 20 Jan 2025 21:02:39 +0000 (UTC)
Date: Mon, 20 Jan 2025 22:02:36 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250120220236.42e9d8a1@booty>
In-Reply-To: <20250117080009.774814-6-neal.frager@amd.com>
References: <20250117080009.774814-1-neal.frager@amd.com>
 <20250117080009.774814-6-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737406959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ItCkiRjvy1fAWDnX5oWG+0SyTmQNbWksmW/HX2dNhs=;
 b=d2m8NiMYr5ARPQ+BZMHOk7cO3pricn7UCspaguZFZvDrKok34XvlTV6zVXK0LaZ0Pv6HRi
 jexipZLT+LKz5QzZWYzjQGOn6lnFk+RhC3R5VPpU2RdFSgZT/bmqtm+7bc5g9+qhytkaMM
 5ZUcxGHRZhiN1mvm5zo126f6N7SUJGytYNcXXzOaSzsFAjwCVmusuT8EUcIaJSBwAThrzB
 tUrij/Ev3cTTrS85iD5hWQMcGEv2h1wPKh2DPOP1VB/JX7l5tEJvxGWo0reP+IYF28kR/B
 bC84VkfxdfIG6FbZ4clJQa9+HPQm7ih12cf+3VY6JfrlD8dfGEIWG7Blyol/fQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d2m8NiMY
Subject: Re: [Buildroot] [PATCH v5 6/6] board/zynqmp/kria: update readme.txt
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
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, romain.naour@smile.fr,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 17 Jan 2025 08:00:09 +0000
Neal Frager <neal.frager@amd.com> wrote:

> This patch updates the documentation for Kria SOMs for reflashing
> the new qspi.bin binary file.
> 
> The qspi.bin is a unified binary containing both the boot.bin and
> u-boot.itb files for simplifying the reflashing process and also
> enabling the BIRT for reflashing the qspi.bin image as either
> "ImageA" or "ImageB".
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[Tested writing qspi.bin via U-Boot on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
