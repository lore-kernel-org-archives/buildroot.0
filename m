Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AEAC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0E986141E;
	Wed,  7 Feb 2024 19:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yz9glX4veSWO; Wed,  7 Feb 2024 19:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D732161429
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D732161429;
	Wed,  7 Feb 2024 19:00:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFC151BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E989F401AE
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qzWGfCZjyxki for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:00:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45A484013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45A484013F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45A484013F
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:00:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C23C60009;
 Wed,  7 Feb 2024 19:00:15 +0000 (UTC)
Date: Wed, 7 Feb 2024 20:00:08 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240207200008.3a125f1c@windsurf>
In-Reply-To: <20231130211910.2298144-1-james.hilliard1@gmail.com>
References: <20231130211910.2298144-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707332415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JgNSONUfmIMWQFNzv300E7RHREEk1LMj9t40VRvi2PY=;
 b=KY4QR+3bRWNlSCJo1njXFpNrLX7b0bXo3q2Qd+I42dzjSJ+9omJpymVmWUm3UGus4OokSM
 wbT/cUOKSabAizZn9T79wqN37SlVwBnyuH730h+RKMQPJwebspt+5bswiZC437hPRGeF7e
 wFoW2eP/7gkQ6QbDiNpRBHc82MdFJuQtstdt/uxU4VJEoVMWuoCIYHCpVKFI/UId1E4ynR
 fVTH/BH1gpAhcpLIFYwDAr+/+uK0FeFTZo08aihEW9cWst5O/9AE+L2VAW14JIC2LyCZTd
 92nJvHcY22Hlgj5wFlc7DtBUj5uLLYL71DRY8Ouu+4HYbBD628SUGdbLFP8d6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KY4QR+3b
Subject: Re: [Buildroot] [PATCH 1/1] utils/scanpypi: use a set comprehension
 for dependencies
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

On Thu, 30 Nov 2023 14:19:10 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> This ensures that we don't have duplicate dependencies.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  utils/scanpypi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
