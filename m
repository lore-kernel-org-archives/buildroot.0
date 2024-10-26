Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD033D10C06
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A26AD8125D;
	Sat, 26 Oct 2024 21:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbjrfxokBvN5; Sat, 26 Oct 2024 21:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9940D81276
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9940D81276;
	Sat, 26 Oct 2024 21:03:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07D675C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 041D681276
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwDF3_8ZHz2Q for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:03:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C85798125D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C85798125D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C85798125D
 for <buildroot@busybox.net>; Sat, 26 Oct 2024 21:03:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C602C60005;
 Sat, 26 Oct 2024 21:02:59 +0000 (UTC)
Date: Sat, 26 Oct 2024 23:02:58 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
Message-ID: <20241026230258.3748adb7@windsurf>
In-Reply-To: <20241013090630.256076-1-francois.perrad@gadz.org>
References: <20241013090630.256076-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729976580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KMiYLRCqHPBp2OyVk6/X/5L89VZGYkLXAtvTJnMPmR0=;
 b=cNziI151brhldIb/wgTpO+vi7FtZe1xSAhiJl+wpe/ii1+W5eYM3yX3nAFUhL1e39fWxUO
 o3PWJDFe2p1JGYVKRg95fDRKaBuaoEXGd4wdqeC59pMxhtRmrz7af9U4rLBJ0fFc9hZUJF
 0Iz1xDN890C9C+moDUJEm57BJMlASPKT14CjhuDfCCITGHtKoZwqfpRIm5qz6Aa6bXxJYv
 KCTGVGz/wbxvkn1MxmpGwuX1t44+Yb90ehh8WitbGmnCUGT9Co8A04rKgzTxz5wQ+4161j
 8mYrcJwII8hz/pgubx6dA558F56RRWmDwC409d1xp2p1+CdojWOaDHvDnj+5iQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cNziI151
Subject: Re: [Buildroot] [PATCH] package/lua-uuid: new package
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

On Sun, 13 Oct 2024 11:06:30 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in              |  1 +
>  package/lua-uuid/Config.in     |  6 ++++++
>  package/lua-uuid/lua-uuid.hash |  3 +++
>  package/lua-uuid/lua-uuid.mk   | 13 +++++++++++++
>  4 files changed, 23 insertions(+)
>  create mode 100644 package/lua-uuid/Config.in
>  create mode 100644 package/lua-uuid/lua-uuid.hash
>  create mode 100644 package/lua-uuid/lua-uuid.mk

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
