Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27F9C3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 20:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8590840DFD;
	Wed, 24 Jul 2024 20:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsqoSrf-EJwJ; Wed, 24 Jul 2024 20:04:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3550740E3F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3550740E3F;
	Wed, 24 Jul 2024 20:04:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D52F21BF283
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 20:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D10044052A
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 20:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYbgaKGyhhES for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 20:04:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9429B40242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9429B40242
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9429B40242
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 20:04:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B359E0006;
 Wed, 24 Jul 2024 20:04:47 +0000 (UTC)
Date: Wed, 24 Jul 2024 22:04:46 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240724220446.19032907@windsurf>
In-Reply-To: <20240724111358.2142860-1-fontaine.fabrice@gmail.com>
References: <20240724111358.2142860-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721851487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ukamys8hF7vingopPnV5S1pnrYyj3Teoar8xHFU83WQ=;
 b=G82yyMxIWsfjUHB8dwHUh0ZM6rSs/HPhkf/0w7cZy7mH6/e4yUsf5TNysnx0cL8JA9QrFX
 tzli2eUupQAPz/dSNzWkLHETWpRJbeckUaDqa31DnhsORAPZ2/cVaFCygE4iNq2EEuWcT4
 c3T0EIC+EMVTaX/BbPBkZ/T2hzjGmtuo2gcUuAf0tDELi0znBml5ZwiN/fs4QhWROSV2LC
 ia8pVpCXONKLztXMmH+VtPQ448Q+vgtcOimys1/R61IUU9FW5rgFaBaL++LI/I6WyDws3/
 G5Dg57qRkbmdArd/D8xVXJzNnn/l1s4LravmlzQysJ7CamjDkVtI2mspN2ynuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G82yyMxI
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless-regdb: fix crda build
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
Cc: Dimitrios Siganos <dimitris@siganos.org>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 24 Jul 2024 13:13:58 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump to version 2024.07.04
> in commit 213c5c0191be022671aa726902dd7dfef5899c6e and
> https://git.kernel.org/pub/scm/linux/kernel/git/wens/wireless-regdb.git/commit/?id=37dcea0e6e5effb4228fe385e906edba3cbee389:
> 
> /usr/bin/install -m 644 -D -T /home/buildroot/autobuild/instance-3/output-1/build/wireless-regdb-2024.07.04/sforshee.key.pub.pem /home/buildroot/autobuild/instance-3/output-1/target/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
> /usr/bin/install: cannot stat '/home/buildroot/autobuild/instance-3/output-1/build/wireless-regdb-2024.07.04/sforshee.key.pub.pem': No such file or directory
> 
> Fixes: 213c5c0191be022671aa726902dd7dfef5899c6e
>  - http://autobuild.buildroot.org/results/9ace181735305cf8e29e0bbace1aec3796c32978
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wireless-regdb/wireless-regdb.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
