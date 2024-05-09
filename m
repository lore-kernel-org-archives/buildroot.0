Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DA8C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FE5583DE9;
	Thu,  9 May 2024 15:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egn2GlHPkLeo; Thu,  9 May 2024 15:42:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4A3283DF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4A3283DF3;
	Thu,  9 May 2024 15:42:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52A721BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3304B83DE9
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKQxurlrY6-U for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:42:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED63F83DE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED63F83DE6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED63F83DE6
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:42:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C97A51BF204;
 Thu,  9 May 2024 15:42:31 +0000 (UTC)
Date: Thu, 9 May 2024 17:42:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240509174230.1040c292@windsurf>
In-Reply-To: <20240411173326.2498113-1-bernd@kuhls.net>
References: <20240411173326.2498113-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715269352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h07tZcbbx+rpOx+O9b3ORag1RiSibJbxtC7YGKLOoIw=;
 b=XYH2837Cx/jozPCiN1/JcI9OOMJ1LTw5613efvxmoOMK2Vy+WAc6ThZmgcAp6nKdVLxCt4
 XI1S4wrQM/umao1bYcs+fUeImlD2zcpVLTmRZfcKpEDlyr8GbJX+eVZYA2eVFog75hcd3j
 IASwj1YSskIGiTzpY3TlpN9kx96lIQ+qiZ3aIN2dK3hIuoKMkJQ1QJ1Q3m3uRkibniEJa7
 c4e7oghvZchbeohIl+r73Ge9YYV4bTSnl1JF0qgMCoBhkdeKtvttkYBGM5CkN8WnvgCnjs
 Jlz8EurGDqU1+SkCgzvuGE2iOZobtbFWAIsm/YdHMGseBVCbRfjeJ91IeGzC5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XYH2837C
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.19.6
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

On Thu, 11 Apr 2024 19:33:26 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://www.samba.org/samba/history/samba-4.19.6.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
