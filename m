Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F32C83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 14:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C51540874;
	Wed,  9 Jul 2025 14:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id exyB-7oposAW; Wed,  9 Jul 2025 14:59:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87244407F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87244407F4;
	Wed,  9 Jul 2025 14:59:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2916C69
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 14:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 269D0608C2
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 14:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJYrMnWwcBQR for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 14:59:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66231608C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66231608C4
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66231608C4
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 14:59:24 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id C2B65E00444; Wed,  9 Jul 2025 16:59:21 +0200 (CEST)
Date: Wed, 9 Jul 2025 16:59:21 +0200
From: Florian Larysch <fl@n621.de>
To: yann.morin@orange.com
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org,
 Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Message-ID: <20250709145921.wuzple2z7jrftmjh@n621.de>
References: <20250611162152.32353-1-fl@n621.de>
 <402a15d9-f995-4513-9ec7-c2061bf3f955@smile.fr>
 <20250706171341.azx6v4b6k524gmsw@n621.de>
 <18ac690e-40e3-420c-8e03-be55aca71ad8@smile.fr>
 <20250707154308.pchu64peqfpfwxqd@n621.de>
 <aGym1lIlT5vSN2V8@yd-6wlzhs3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aGym1lIlT5vSN2V8@yd-6wlzhs3>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1752073161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Orcyk638Rqk8peiVNqNJleO+92+AvAC6swiNNRFJAHM=;
 b=0TirUAk+7ePAufgCjvp2h+7V3h6LRmjcE5j2MqoaEHuUGG6P4awB2i18qIxrytiKBA8sVd
 3dIomlzhUqYKDc0T1ELJ/lx5yDYg4RzJR3/ap/ZcNzrj1iXTxzVcgHhuCRJ49gIGlU7yQ/
 H8ixowZZAzJcKCfz3THiIku7Zqdqd9c=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=0TirUAk+
Subject: Re: [Buildroot] [PATCH 1/1] package/go: make pre-built compiler
 provide target support too
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

Hello Yann,

On Tue, Jul 08, 2025 at 07:04:22AM +0200, yann.morin@orange.com wrote:
> So, I've had a go (aha!) at rewriting a commit log as I understood the
> situation, building upon your initial commit log and trying to account
> for Romain's comments:

Thank you! That does seem more straightforward than the original
message.

I think I now realize where the whole confusion was coming from: The
package in question in our internal tree that made me discover this
problem in the first place was missing the
BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS dependency and thus enabling
"go-bin" *seemed* to work but ended up just building the package for the
host architecture. I didn't realize that this was caused by a packaging
problem on our end and not a Buildroot issue (if the dependency had been
correctly declared, the package would not have been selectable) and I
ended up dragging this into my commit message (the part about native
builds).

Either way, feel free to commit this with your reworded message. Or
should I send a v2?

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
