Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D962D24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF54341387;
	Thu, 10 Oct 2024 21:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H3_opKSUzkoM; Thu, 10 Oct 2024 21:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A52DA4167F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A52DA4167F;
	Thu, 10 Oct 2024 21:38:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 519181BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 332A7413D1
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSW1yg2mTwko for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 732F9404F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 732F9404F0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 732F9404F0
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C04C640006;
 Thu, 10 Oct 2024 21:36:42 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:34:28 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233428.6c7fecf0@windsurf>
In-Reply-To: <20241009161158.3809830-1-james.hilliard1@gmail.com>
References: <20241009161158.3809830-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=42lcjkKPgS/CjafifzX0S5M61Inaew4qvAdyAdit5KI=;
 b=a/PRBjIqwrUPYThMpN7UarQXq411AKZhLH0poQ1OzBz0hXEtKvGaiKKFkpf2JiNSJOROcX
 gYR7EKLSODNJt0x0T5M9sxxeNz9e+PwC5T6BIUQqa316SPyTe9eCKTbegTRKX9syxhjfuk
 vczDwyFfa9Vm/zwnSvCPkvCd5I8TTc3V8Plh1j4HR/qRjz/oGYXkpw2ErOZzkzs17fikH/
 P+UAQemAwgtCWatQGAv2HKkxlSWA6zj+y4JHVFzRNkWQmOq3BLyMZvECWyG8gGvzs5QKLW
 h+Undig3llD09/rDjAYlkVWjSnfNkaJj/2fUu7jgwTh3GpO61xsgnES+lZLKgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a/PRBjIq
Subject: Re: [Buildroot] [PATCH 1/1] package/python-fire: bump to version
 0.7.0
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

On Wed,  9 Oct 2024 10:11:58 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop no longer required python-six runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-fire/Config.in        | 1 -
>  package/python-fire/python-fire.hash | 4 ++--
>  package/python-fire/python-fire.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 5 deletions(-)

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
