Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6279C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C4E740108;
	Mon,  5 Feb 2024 11:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C4E740108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7aAu26xb-VZy; Mon,  5 Feb 2024 11:13:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DD4A40168;
	Mon,  5 Feb 2024 11:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DD4A40168
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8721C1BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FD1860736
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FD1860736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cY_U27yfxi51 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:13:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 086EE60672
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 086EE60672
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3391324000A;
 Mon,  5 Feb 2024 11:13:10 +0000 (UTC)
Date: Mon, 5 Feb 2024 12:13:09 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240205121309.20362244@windsurf>
In-Reply-To: <20240128215205.3690716-1-fontaine.fabrice@gmail.com>
References: <20240128215205.3690716-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707131590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/kTyXj6IjdxiaAWNjMHAunYMU9R84/yX2S1E2nIjDAM=;
 b=eq/uQlM7+HK3CLe+dBwQcS69Pc09Hogqa+mV//Lj0KdRljCNAsxkeYJewnw7eYBmaogG5r
 SPq0kSQOPYh4GX+r4qde2MZmjkhe7Dn2gFXXfcH6n8L4Xjok5ZalhA23F1c+LliQTcmp5n
 mfCBOde76fecB6Qt939YXCvitN/mWAOiP+KcrefPF6dfsPh8U99jRNCQjdsZWO5pOTDvCe
 /DFPdnwOyvMHiY6oym6IrHjZYFnntLmsqWp8p1O4Uv/uBEr0v0VIm5m2cZDmptmvC9vNCQ
 TzatvhcrHmooXJ8K6Q3NJCmAM1GO8VT3HGnlD6Bieh/VtC4e7nZsXY3FpdtNvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eq/uQlM7
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: drop libnl dependency
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
Cc: Vadim Kochan <vadim4j@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 Jan 2024 22:52:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libnl is not needed to build frr since the addition of the package in
> commit 26d82d006ba15777d19892b327bde343d82a9ff5
> 
> No mention of libnl found in https://github.com/FRRouting/frr or
> https://docs.frrouting.org/projects/dev-guide/en/latest/building.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/frr/Config.in | 1 -
>  package/frr/frr.mk    | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)

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
