Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98A5CFA474
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 21:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FC7A40152;
	Wed, 23 Oct 2024 21:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpSclY8HzaH0; Wed, 23 Oct 2024 21:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45F194016F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45F194016F;
	Wed, 23 Oct 2024 21:01:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A614972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58E1660841
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNH8C4hdA_j1 for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 21:01:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51E8F6075A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51E8F6075A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51E8F6075A
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:01:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 404021BF204;
 Wed, 23 Oct 2024 21:01:19 +0000 (UTC)
Date: Wed, 23 Oct 2024 23:01:17 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241023230117.5ba6eb11@windsurf>
In-Reply-To: <20241008222724.3766564-1-james.hilliard1@gmail.com>
References: <20241008222724.3766564-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729717279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qARrlClN27u6PsI6eeLu+1YEkbaMxCW6w9h4/ORxAMI=;
 b=Yl+b1MGSDKYwg0SXZR5IwlPQjUjYAOudFRsSPdLIYrADTBEE2YTNNFv1eMyDbTkBk2yzaf
 iHyUiRLZktnW8k0b9OvEfetFehz465SxI4fQeixeUxW4LOx9rB4s1dod0gbk33efumizbl
 ewcNfVkP2YUfx8kTiB7UJrkx9qI7WyGG/GwW6wHvopaAN2ksXlyzKksmCMOidsaP8OGhtL
 aELHtYiL0ZPxcmAKzk9U1y7EdrEYGgcxkLOhLu9kGKhCzOdXzH+IkvylkP28GTRxxQLOMO
 z66k/fMN6lQJaYNpuwfxjUpCSF2elblvkGO/R6+I0rcZPF8KF7Vnqpc3PxKIxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yl+b1MGS
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python.mk: add hatch setup
 type
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

On Tue,  8 Oct 2024 16:27:24 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> As we have many python packages using the hatch(hatchling) build
> system we should add a setup type for it so that we don't have to
> manually specify the host-python-hatchling dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  docs/manual/adding-packages-directory.adoc |  6 ++---
>  docs/manual/adding-packages-python.adoc    | 14 +++++-----
>  package/pkg-python.mk                      | 31 ++++++++++++++++++++--
>  utils/scanpypi                             |  2 ++
>  4 files changed, 41 insertions(+), 12 deletions(-)

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
