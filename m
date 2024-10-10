Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7731D24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A633541579;
	Thu, 10 Oct 2024 21:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqa13CUkw4Ye; Thu, 10 Oct 2024 21:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BDB441591
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BDB441591;
	Thu, 10 Oct 2024 21:37:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC3311BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB9FA60BE5
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjQA7uJmDkBy for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C32460BE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C32460BE0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C32460BE0
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ACD8040003;
 Thu, 10 Oct 2024 21:36:25 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:36:04 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233604.662020c8@windsurf>
In-Reply-To: <20241009183142.3884122-1-james.hilliard1@gmail.com>
References: <20241009183142.3884122-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RaP1kjg5iaSD5qhCgscPpQCSLa0A2yBPWWr5iNMv0z4=;
 b=crHLEZGRV68nnFswF6PB4YDbJIIno3QO3VyXu6hglTr9S2l8oFOAknaXOztss1BKqFNbsn
 BqDKbWx4Ps2qDxHzzSGj7tfHITSCdZkA4kpQlLb7pIm2CiJlucyrx/eNMDgvioSs8TSkd8
 +RgVoHGZlhrUqYS/AuN6MBl9wtXqOjp/nZdIo7X0CNzcfEzkkIUEjQMfTts2ZJ0FfMmGpf
 umdlKUSqbi+ocLVvquwXKUJCy6lBW7TdEjhQtu53Mh7zU21Txp4XQihI8b2jL1jjHA266v
 6ZYtBvWBbyi5ACwv/K1kBj/svLIPD6HMzd5khvf+i3DG7NhdG8EyX7jkJKVUNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=crHLEZGR
Subject: Re: [Buildroot] [PATCH 1/1] package/python-webargs: bump to version
 8.6.0
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
Cc: Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  9 Oct 2024 12:31:42 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Migrate from setuptools to flit build backend.
> 
> License hash changed due to year removal:
> https://github.com/marshmallow-code/webargs/commit/0917b88a60385cb12a9fa543ca5b7f6a0d6bb336
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-webargs/python-webargs.hash | 6 +++---
>  package/python-webargs/python-webargs.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)

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
