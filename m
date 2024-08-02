Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A739AC3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 17:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76D1684508;
	Fri,  2 Aug 2024 17:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcOMShecsJV6; Fri,  2 Aug 2024 17:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D62284509
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D62284509;
	Fri,  2 Aug 2024 17:51:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98C311BF41C
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 826924018A
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyiUvXW9UafD for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 17:51:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38E8A4017A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38E8A4017A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38E8A4017A
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 17:51:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A208520005;
 Fri,  2 Aug 2024 17:51:32 +0000 (UTC)
Date: Fri, 2 Aug 2024 19:51:31 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240802195131.7169e924@windsurf>
In-Reply-To: <20240723132058.629476-1-fontaine.fabrice@gmail.com>
References: <20240723132058.629476-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722621092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X094ikJJfsY80kZ55RrACvvCvooj973MXEYe04xpFQo=;
 b=XgmDrI2+zHDKXkZ4j9PuOCIzVCaWve6xtMxaz2TZm1b2F3+CSw+AvU4UaLvYCV48k1c5bY
 juKMdi9lwu9v1XmHOg060t26yDGsgjTyksUt46QqY9pvAGh4JrOE5UZ0bBg/YX//iY3+kS
 I8uYwd6jqF3RL905HXaZl53hNM2TxwRAxixKohlaWYnLa7xWgVGVTbyjjD0Hm7JqdE04FO
 4hwa5kQ0wybyWSEJwqWBH/X23JlCY2asACINEYJ+hPCTbnTa7Nz5JzwxVtZ5NJ6ubKOs6Q
 SFR68A8bf+HkScpUnX/XsrzsoHZAD0raJRQtk0HBUrF1pR4Fn6Ysxa954+qL2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XgmDrI2+
Subject: Re: [Buildroot] [PATCH 1/1] package/pistache: needs NPTL
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

On Tue, 23 Jul 2024 15:20:58 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> pistache needs NPTL as it unconditionally uses pthread_setname_np since
> https://github.com/pistacheio/pistache/commit/b283c32963a7cb0500cf69555d320a6e9e252850
> resulting in the following uclibc build failure since commit
> 82e61bed8208857d5d13c384c89086c4dd4e1e79:
> 
> ../src/common/reactor.cc: In lambda function:
> ../src/common/reactor.cc:512:25: error: 'pthread_setname_np' was not declared in this scope; did you mean 'pthread_setcanceltype'?
>   512 |                         pthread_setname_np(pthread_self(),
>       |                         ^~~~~~~~~~~~~~~~~~
>       |                         pthread_setcanceltype
> 
> Fixes: 82e61bed8208857d5d13c384c89086c4dd4e1e79
>  - http://autobuild.buildroot.org/results/b2b22e4f9684aca0246650673fd8c33019712ddf
>  - http://autobuild.buildroot.org/results/1597bfe2a57cd3aef54d331447dd81cae020d434
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pistache/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

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
