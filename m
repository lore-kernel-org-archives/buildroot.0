Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A145CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02A934187D;
	Wed,  3 Apr 2024 19:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VyvKUnOsofju; Wed,  3 Apr 2024 19:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF5864188F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF5864188F;
	Wed,  3 Apr 2024 19:52:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E1481BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BB7260716
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNql81B8vxyb for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:52:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E405F6070D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E405F6070D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E405F6070D
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:52:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30C1840002;
 Wed,  3 Apr 2024 19:52:45 +0000 (UTC)
Date: Wed, 3 Apr 2024 21:52:44 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240403215244.17435eb5@windsurf>
In-Reply-To: <20240328215547.67028-1-fontaine.fabrice@gmail.com>
References: <20240328215547.67028-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712173965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ao22RAsiHLsRMwDP/blEtjceSTLmTq+hr2mw84Tc+gs=;
 b=njeFos7fZNePf7zTHsdp/N8JrzcD2FLnqyQgVHLl0/acUlf3j2t8U6Bm8bt2Dmgte9tDCR
 wPHvBupiySpXT987GlxuZtGvliV8TO/lFkEK/aiG0nBYuSOBGH729QXeiF3rv3ErXmBxYZ
 Q4q6EaCpzIqXDwf+OlFNPtaR17roa+0Ptcmae48II8vi8IhV1D5vtQEXsnojlmkJgEz7eo
 5fa3Oc0meqpHFU8cQvZPepc5XyGQf19My06OR/RaB+kigWInkfD/3P1zilPpimj5AZ6xyF
 5l0HNYgPCKxwRKnLYM3j02lj/hQ+zznv6wgM6t0ajstc3LsnOjK72Cu1PE9QDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=njeFos7f
Subject: Re: [Buildroot] [PATCH 1/1] package/freeipmi: bump to version 1.6.14
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

On Thu, 28 Mar 2024 22:55:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://lists.gnu.org/archive/html/freeipmi-announce/2024-01/msg00001.html
> https://lists.gnu.org/archive/html/freeipmi-announce/2024-01/msg00000.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/freeipmi/freeipmi.hash | 2 +-
>  package/freeipmi/freeipmi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
