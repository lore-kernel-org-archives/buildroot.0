Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C018DC021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B25640715;
	Sat, 14 Sep 2024 21:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uaSAxPz5U38F; Sat, 14 Sep 2024 21:53:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AAAE4070A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AAAE4070A;
	Sat, 14 Sep 2024 21:53:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C4111BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A4DA401DD
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpsrQzJx4qGQ for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:53:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 444B140130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 444B140130
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 444B140130
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:53:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D13F20002;
 Sat, 14 Sep 2024 21:53:36 +0000 (UTC)
Date: Sat, 14 Sep 2024 23:53:34 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240914235334.67cfbe22@windsurf>
In-Reply-To: <20240914210815.1178351-1-james.hilliard1@gmail.com>
References: <20240914210815.1178351-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726350816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PBF62zS6C40CvTdE2e7SRBsC+r1JSW8FnAK+o6IAqwg=;
 b=R+Lo1sgJEllroXlMja6oA8AwAfMkwlg1kueohAwEtEMsIRwa5A8rJYFtzz9ZU0LqmXosOd
 rfxdCgewBsYwf2V+uH6mo9BXp4fkc8G7FhtdC563BlrT0USG6y2lDivCRanwb3gRr19H4q
 +auzPn//hbFKxSr8QAkgBebq+Ap6l+8zWmrYMppOKqaYt0N8qNc5Jqz8bIhv7ydd4xxeC6
 BlhBRoVL4tDob+TxDqMehFnLcngnFmAID+xlevjyFaQRWdols/T6977/LXF1kVjYL+StRB
 N288PSWE6Lr4tvTxSbmjzaUbqrsNtgbJfem8SwDijy7LyKPDvG+jIsuVEC5C8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R+Lo1sgJ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.13.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Sep 2024 15:08:15 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to year update:
> https://github.com/sqlalchemy/alembic/commit/8829bd64a70708ef9144604ea0f0a5179d07ccbe
> 
> Pass --skip-dependency-check build option due to python-alembic
> unnecessarily restricting the maximum setuptools version.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-alembic/python-alembic.hash | 6 +++---
>  package/python-alembic/python-alembic.mk   | 5 +++--
>  2 files changed, 6 insertions(+), 5 deletions(-)

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
