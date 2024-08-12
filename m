Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FFCC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 19:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDA104027F;
	Mon, 12 Aug 2024 19:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojaDY42cUnd5; Mon, 12 Aug 2024 19:20:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5D614028D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5D614028D;
	Mon, 12 Aug 2024 19:20:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E53FD1BF59A
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 19:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF39A606A2
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 19:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcMx7ywBe-_Z for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 19:20:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB7DD60653
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB7DD60653
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB7DD60653
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 19:20:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA33E40003;
 Mon, 12 Aug 2024 19:20:46 +0000 (UTC)
Date: Mon, 12 Aug 2024 21:20:45 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240812212045.46e44a9c@windsurf>
In-Reply-To: <ZrmalIJlys/dTgYy@waldemar-brodkorb.de>
References: <ZrmalIJlys/dTgYy@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723490446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lpil0gdVWZaoJNDD+ZFlBlrHMJh65nkPEb0IUfW8pQQ=;
 b=WAC1ypncyXrwCI9pADrMjCcahQA2hYj9q/DfIE1C4AIz4HuPk/KTu5+7c0PUnXpeM770sb
 dORqKua7rNI8fusO7DXjDMI+5uw5t/3X8aQ42quyRJ999d0xei4w4xyywI0MeY+esHFnWD
 Pfrxs0P10GCBTlcGhm7Pv6Q+CocCBuTiGoc3LFPnrMw+zXzp4U3uWJGoOoePHgm9Zg+wB3
 AWYTkni8cuhHW72fRmBMOva5/lYigyEDLd77Bz5cyyy/jqE9jaJhSAGkTfsuWTfBYe0XvH
 vHUGBpV5Kf3gMVZzF+fcrXNEV0SuOUN6vhWwISCX3o5muURG9jEVs8WoMIkNPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WAC1ypnc
Subject: Re: [Buildroot] [PATCH] package/unbound: allow TFO for uClibc-ng,
 add user
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

On Mon, 12 Aug 2024 07:16:04 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> uClibc-ng toolchains have MSG_FASTOPEN since 2018 so no need
> to disable support for TCP fastopen.
> 
> Add the missing unbound user, which prevents unbound daemon
> startup on boot.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/unbound/unbound.mk | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)

Thanks for this patch, but could you make it two patches? Indeed,
adding the unbound user is a fix, so we will want to backport it, while
the other one is really a "new" feature.

Also, could you change to "enable tfo-client", because TFO server was
already enabled, it's really TFO client that wasn't.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
