Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B120CF8541
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38F5241C18;
	Wed,  2 Oct 2024 21:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7SjPLviDSsh; Wed,  2 Oct 2024 21:03:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 343CE4303A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 343CE4303A;
	Wed,  2 Oct 2024 21:03:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 502C01BF30E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CD066114E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kedsg1TeDj0N for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:02:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BAD160778
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BAD160778
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BAD160778
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:02:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C4DF1BF203;
 Wed,  2 Oct 2024 21:02:54 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:02:53 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241002230253.7ede1567@windsurf>
In-Reply-To: <20240926181507.196624-1-james.hilliard1@gmail.com>
References: <20240926181507.196624-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727902974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RvdT7Fhcj1lwz61OyxIOlQrX1Ziej0RH7ib4HropkUY=;
 b=Gzjrf5UN4XO45L3sjHZwUpdi4vcnQQuN8WIiKlPo0gF22kaxu5MjELinu18KYpnUOH2iyK
 YoaPty2THvXQBRKyk85mlwEgmOKKBkuid82vSwAgIiY+GTkh2gNH2H/UnFnm6GldSh2xpc
 1vt45wtKBRvXESKVeAEumAYIy78Fp6HZ26PQNDx/IM8ehLH/YnYKkaTjzt8517px0Ct51G
 Z2Ufdo93G9Z88eh4l9qfjL3ec2RD4Gy7QVphqr+LYQFjJCKfN9Rf2CQoigkZNedCOr1OXE
 asq+EaTrMlpWljvui6MVZnS+0KobKBbXxyG3r/wpFakbGWOR+keiyugayeQKmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Gzjrf5UN
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.7.4
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

On Thu, 26 Sep 2024 12:15:07 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-maturin/python-maturin.hash | 2 +-
>  package/python-maturin/python-maturin.mk   | 4 ++--
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
