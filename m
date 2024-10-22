Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB542CDD0D7
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81F3A60885;
	Tue, 22 Oct 2024 19:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-l3GhOY4E4K; Tue, 22 Oct 2024 19:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F30F60804
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F30F60804;
	Tue, 22 Oct 2024 19:18:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E8E8963
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BDB040613
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64VdDU6SoYSL for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:18:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16037405C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16037405C1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16037405C1
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:18:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 324661BF204;
 Tue, 22 Oct 2024 19:17:59 +0000 (UTC)
Date: Tue, 22 Oct 2024 21:17:57 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241022211757.0f74ac13@windsurf>
In-Reply-To: <20241013200239.2816650-1-james.hilliard1@gmail.com>
References: <20241013200239.2816650-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729624679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/oIJ4EHXi+QUEDN6FLu+izYm6kaWVwsY2gnS1VRZu4=;
 b=M8vcuvUl8of8fOnBmKxQaCCToHuL7bsWT6JpICZeCfQOSw8qwwTvuP+S0Sf/6lSAUL4+Mf
 Vw4RaIUw73J00P7BbmCeU0PrvXLtY8wlMqGkvVSqCWBrKUdnbo4tV+hiUseiKRORqXHYp/
 y5yod18d67UUl75yej9s+kepG1aJPq4oWg7p6bBpxiYKAlLLTw7hJAo6gCttwTzHVmUib3
 00sWW+BKrdLFO+Tj+iFm3UaEdu55Hmg1/sXxAS3knR+LSvUMNgjizbMp6vP1i5mGtT5HLB
 Ix19MRuSLNGxEvklfBelCKQsB4jEDfMZRBkrtyaKOcIxMMfshuQQPKKEc++RWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M8vcuvUl
Subject: Re: [Buildroot] [PATCH 1/1] package/python-zope-interface: bump to
 version 7.1.0
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

On Sun, 13 Oct 2024 14:02:39 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> We need to pass the --skip-dependency-check build option since
> python-zope-interface uneccesarially restricts the maximum
> setuptools version.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-zope-interface/python-zope-interface.hash | 4 ++--
>  package/python-zope-interface/python-zope-interface.mk   | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)

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
