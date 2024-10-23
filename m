Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58623CFA464
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 143BB4067F;
	Wed, 23 Oct 2024 20:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZKhIApK2Rju; Wed, 23 Oct 2024 20:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E32E040733
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E32E040733;
	Wed, 23 Oct 2024 20:22:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 965A84960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76A71810EA
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGZWI76iBYKT for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:22:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13527810A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13527810A5
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13527810A5
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:22:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A038E0002;
 Wed, 23 Oct 2024 20:22:14 +0000 (UTC)
Date: Wed, 23 Oct 2024 22:22:13 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241023222213.5af68df6@windsurf>
In-Reply-To: <20241020162225.449121-1-ju.o@free.fr>
References: <20241020162225.449121-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729714935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1gJPq+WU3r3e1SxCnLFZhG6cjkfrY45SpwiENVBGvho=;
 b=UtZ/cALUsn9TLh+EGeKMS6m8zrLJxow3rJKQ0eEb6ySkDkoFnQEoDLjI6Q2+NePawiSt9T
 hxlDy9zdCcTQvja8OQsc1nq2U014VjSlRWOWtmQoQFGafzI+10wvLBxKGv8h2igSMnLOCo
 eZHavvsIZfLtpeU6MJsqe3Jo5cWk4TOs0oy3dwn6C6hfZTH3MJcoNhcDbp6fDldMYq7Y6G
 rUYz14HylS4ASgt1E4YjaBICek/+4Ojb4jcWAbYatlR9lNEJsq6BMLAjW7EQLYzOheDoVA
 Oo2O/gbNgnf64oclHudmu8Iy92nHoELJR5sbJR7EbbYZ0Yzdj8tbpVTIMQ3uaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UtZ/cALU
Subject: Re: [Buildroot] [PATCH 1/1] package/rdma-core: bump to version v54.0
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

On Sun, 20 Oct 2024 18:22:24 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since v53.0, see:
> https://github.com/linux-rdma/rdma-core/releases/tag/v54.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8134295893
> ---
>  package/rdma-core/rdma-core.hash | 2 +-
>  package/rdma-core/rdma-core.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
