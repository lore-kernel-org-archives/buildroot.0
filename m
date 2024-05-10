Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6481CC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0DCA4244D;
	Fri, 10 May 2024 20:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcm-NJ84U6mD; Fri, 10 May 2024 20:08:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7A08423FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7A08423FA;
	Fri, 10 May 2024 20:08:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC1451BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D220D846F0
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOOwvf2jl1FO for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:08:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BBF60846EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBF60846EE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBF60846EE
 for <buildroot@busybox.net>; Fri, 10 May 2024 20:08:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FD3D1C0002;
 Fri, 10 May 2024 20:08:00 +0000 (UTC)
Date: Fri, 10 May 2024 22:07:59 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240510220759.2e69c748@windsurf>
In-Reply-To: <20240404162938.33317-1-francois.perrad@gadz.org>
References: <20240404162938.33317-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715371681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bL9hGX17iHkLlYUX8Qq7LkFA5GJgiXkRII6Yl5pYTqU=;
 b=Mzzwgmzs+o+9NlU0mXyvABhbTdnIQAkQdYRQHubwxsGLUPGVWI65mIFAZ+Auq9OYBebkKR
 Wn78G977WNbczQpAb9mXp5T47MsooCrwgGMZUdHf9IUBwlpQsUygn6ebu6HwjC3pFAaAaW
 8EwjhSAtoANeChsMnd6lSS5m/INuI2tJ10A8nIl/cQEkfUndvxJGi8jaUJ+JsgfQZ5Lnel
 GQCU89uLMru2jy9z8Z/aUYqiDjxmNKnJ0tEqUr7Dd7Qi/YQN469wr0Ap+g3JmDibwYHV9g
 q8wwdd9JH/SUB3+SjoZn+cUqktDZCu2XpbnH2aGWqyZH9e3Yi4Uz8qRUuTvkOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mzzwgmzs
Subject: Re: [Buildroot] [PATCH v2 1/2] package/lmdb: new package
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  4 Apr 2024 18:29:37 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  DEVELOPERS             |  1 +
>  package/Config.in      |  1 +
>  package/lmdb/Config.in | 13 +++++++++++++
>  package/lmdb/lmdb.hash |  3 +++
>  package/lmdb/lmdb.mk   | 32 ++++++++++++++++++++++++++++++++
>  5 files changed, 50 insertions(+)
>  create mode 100644 package/lmdb/Config.in
>  create mode 100644 package/lmdb/lmdb.hash
>  create mode 100644 package/lmdb/lmdb.mk

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
