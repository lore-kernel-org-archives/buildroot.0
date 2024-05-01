Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866CFC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D6D81206;
	Wed,  1 May 2024 19:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HF0hqlCO8tH; Wed,  1 May 2024 19:52:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A17F8128A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A17F8128A;
	Wed,  1 May 2024 19:52:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AE2F1BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5358381206
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZJd2x0HRzrI for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:51:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C24F8128A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C24F8128A
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C24F8128A
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:51:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 593EAC0002;
 Wed,  1 May 2024 19:51:57 +0000 (UTC)
Date: Wed, 1 May 2024 21:51:56 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240501215156.2f942c7e@windsurf>
In-Reply-To: <20240330185620.995961-1-fontaine.fabrice@gmail.com>
References: <20240330185620.995961-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714593117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vJKKIYCCFlvbmPl36CM2KteGZ0jv6xDOd5/zi0X1/Fk=;
 b=pdh+OVRetU+BRqLLOC/bT+/iiDVLopp34hsyOBatmo0MZ7dzHpavZSsRd0mAy9+c1Hu0z0
 P7Sqf2bC8KZmLRvVCiMMNaFWMTkZXCL6EG3/fsvKWzE+Xj0T0wy3wDMAnVhJ35tPESpJgi
 t/iwKWP5H+zS5COnosDmMNY9htnY4Ecpzu1CIFblmGZxkLnOli2tRU0uaOHm0EV/cKy3cO
 9ZU09AtdV1+lixV0bnqBozVl1Hea8FecD6pbSLxyKpCbyCNR0c++F//ojx/RVWXiseqMZh
 DjHlAC0vSwbs6P3WMRRLIl8gOMHeY3wCFkZseNpCwkDLtcg6Pub2fpKGIryBtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pdh+OVRe
Subject: Re: [Buildroot] [PATCH 1/1] package/coreutils: drop gmp optional
 dependency
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

On Sat, 30 Mar 2024 19:56:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libgmp is included in coreutils (through bootstrap.conf) since bump to
> version 9.0 in commit 2ee43bad85693d1c96e14f5b39ccb13a8982f50a and
> https://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=13046444888a7e96f48d28fdd5a6ffe03d4ab036:
> 
> configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --enable-static, --enable-shared, --without-gmp
> 
> Fixes: 2ee43bad85693d1c96e14f5b39ccb13a8982f50a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/coreutils/coreutils.mk | 6 ------
>  1 file changed, 6 deletions(-)

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
