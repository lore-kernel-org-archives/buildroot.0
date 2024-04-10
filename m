Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B82CD1284
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDD0560EA9;
	Wed, 10 Apr 2024 21:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4MV2G7uof330; Wed, 10 Apr 2024 21:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A9D160EAB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A9D160EAB;
	Wed, 10 Apr 2024 21:47:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 075141BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E89734036A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IZgAjyUXspJ for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:47:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CEAB140359
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEAB140359
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEAB140359
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:47:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9751DE0002;
 Wed, 10 Apr 2024 21:47:51 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:47:49 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240410234749.3ab49d42@windsurf>
In-Reply-To: <20240327162207.148920-1-romain.naour@smile.fr>
References: <20240327162207.148920-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712785672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6mG8rVmFLy+y0gd/x3H0syogTX9nnWsQk01TRHKLlIc=;
 b=NmEDUsFKZGW204vBlF3pcumw2WgQ5hjp0EAzzYncEEYm7CpXvctxNjHtJsCKNgTxvibF+8
 pxiRAum7Zq07XaIggNVegHTb+OVQB390FKU8LA2BwBSCcBxj2/+XxzO7i01ohbOaysU+nI
 5s+b/ayJyrGCGaAhljx7XtEdDcxlnSrj99p4iDE+/2mJTeCqbXfBesIJCU39Pt2RL5N0cl
 QLJihI4LWvrLeRKhtVzhD4XFC4QepiHE1rLpilSpzUFAn07HoSt/o83TxzM68WqRakaWGh
 U3HsLNk6o4bW1EMxEjJ+0FCLyyk3dKJ40llEW/8TjaxBe+XmZXvvt9F25ViLfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NmEDUsFK
Subject: Re: [Buildroot] [PATCH] package/python-service-identity: add
 missing python-cryptography dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Mar 2024 17:22:07 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> The last version bump removed python-pyopenssl runtime dependency but
> doing so also removed the python-cryptography runtime depdency [1] that
> is actually a direct runtime dependency.
> 
> While at it, update BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> dependency comment.
> 
> [1] 6008f2b1b901be1374ac201b5e560cca61b4b61e
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/6477656983 (TestPythonPy3ServiceIdentity)
> 
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/python-service-identity/Config.in | 4 ++--
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
