Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257A7C021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E05D0406C2;
	Sat, 14 Sep 2024 21:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3YWIf6JIxkn; Sat, 14 Sep 2024 21:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4F5B40C3F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F5B40C3F;
	Sat, 14 Sep 2024 21:53:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86AC61BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75DE4840F6
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9Yj9t9XWzRu for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:53:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7718A840B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7718A840B2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7718A840B2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:53:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 789C760002;
 Sat, 14 Sep 2024 21:53:40 +0000 (UTC)
Date: Sat, 14 Sep 2024 23:53:39 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240914235339.36b12213@windsurf>
In-Reply-To: <20240914211748.1271243-1-james.hilliard1@gmail.com>
References: <20240914211748.1271243-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726350820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5gjyobG/0ZEEixEMtXQiOnRTsrYb5oXoN5jIKyEMc8=;
 b=XKT7Gq0ATwr1MpwdakzOOX1OZOpB26pTJtFeUfA//RvDcmvjrAfeDIgvSU4D4pSz2OrKF3
 af3vMw9iK4SnYV0s2igpjqL+exFlepCyiQwEWDB+AlEi8VDeUwjCFOZIp8Re/HjMgRiRRf
 ApUlJ/+BRzuGzGTJpABo77V5HFSy1ogBrR52rfPtJ9RWmlDguD8Q5TGpKVwretQkbhvz9m
 JOf/g31fgg2ETp+PKLavYTIAWvvtXyfjuj3JMnas1/FEao/OckT9dTcMHOnq1ndCFli/IT
 DX/1LBQf8sYXZ/U5dLzA2phDFQMAeZLO9nnnrlOLsau8gamGSijl3SKLheFXkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XKT7Gq0A
Subject: Re: [Buildroot] [PATCH 1/1] package/python-alsaaudio: bump to
 version 0.11.0
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

On Sat, 14 Sep 2024 15:17:48 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-alsaaudio/python-alsaaudio.hash | 4 ++--
>  package/python-alsaaudio/python-alsaaudio.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
