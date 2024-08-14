Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A32BC52D7F
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 21:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9802608F5;
	Wed, 14 Aug 2024 21:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 91pmLiKtvPfG; Wed, 14 Aug 2024 21:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED599608F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED599608F6;
	Wed, 14 Aug 2024 21:45:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CDE71BF97D
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48FE4608F6
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 21:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSSU9sOroVt8 for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 21:45:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2EE0360A4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EE0360A4A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EE0360A4A
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 21:45:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55E7B240003;
 Wed, 14 Aug 2024 21:45:14 +0000 (UTC)
Date: Wed, 14 Aug 2024 23:45:13 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240814234513.0212c941@windsurf>
In-Reply-To: <ZrrlqhreN1oOJBdA@waldemar-brodkorb.de>
References: <ZrrlqhreN1oOJBdA@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723671914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NsxQsdcHwjD/P2bQq1Q/HpPEql0OkwL0hEYKCu8xrEA=;
 b=oL81sc4j3batsiUrqj2PoUvlOzuuuVyOASsTgse+VAhX3uDKUGEN2I6IwmsE5G62Ivk2Oi
 2qnbcrY5AUjQflboOinLu6F4y4z/Xy7EuG+9t3L9LMIq0+nlF45irywIxjA7nQ7gJvH9ap
 VZWLCm2aLG9X/g37g9r7ZL26xrbputrrJ/Yp4WhuAA8nbI1k15VZp8oUzaCi+10XPc0uHU
 19QMuX/dAHd4j/kDz3sKbPu4nrZjV6izb4ajr3+y8dGkleRnnOwXSu7ttlOLmrhrraG7N4
 aCQm1KqBcYYluuV0K8BKZ3tidtQmkLx6K5kRZZGytmAotOJoe/Ik3Aj/Kr8e2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oL81sc4j
Subject: Re: [Buildroot] [PATCH v2 next] package/unbound: enable tfo-client
 for uClibc-ng systems
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

On Tue, 13 Aug 2024 06:48:42 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> uClibc-ng systems have MSG_FASTOPEN since 2018 so no need
> to disable support for TCP fastopen client mode.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2:
>  - split patches this one goes to next, suggested by Thomas P.
> ---
>  package/unbound/unbound.mk | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
