Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E04AC3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 22:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF122408C1;
	Wed, 10 Jul 2024 22:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5WrNA6gtNII; Wed, 10 Jul 2024 22:17:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9F3641576
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9F3641576;
	Wed, 10 Jul 2024 22:17:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9142F1BF593
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CD4641576
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1fiBIYrGVon for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 22:17:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09A0E408C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09A0E408C1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09A0E408C1
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 22:17:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38D751BF203;
 Wed, 10 Jul 2024 22:17:12 +0000 (UTC)
Date: Thu, 11 Jul 2024 00:17:11 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240711001711.7baf7843@windsurf>
In-Reply-To: <20240710220644.629642-1-ju.o@free.fr>
References: <20240710220644.629642-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720649832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vK9BsfWAaxfh/dNYfTkSTEcNspejFu8Y2O/+adRx2rE=;
 b=fJzEisDIG+i61EembMZK4BIIMNppyu3Pn3ebY4a/3J8CjVZ6my9rFCdw7L4lYzxNNmQsPl
 4AekRfYX9XzJlZwa1qAwfC1pi+JGUdo/5aGP/GTT03n0hiY+xHHToY08vav/14m87hg7eA
 YkWlK/fmDichJh42Us31lYTK5LSHWGsoJHaaH9ioCoDEpmneclt0WGTDFBXuQz0bi6lhmq
 XXMJGxnkgAkr1bGJZw8P6XfeVwr+SYpqtpquFS4h1dtOPJpW7xlnrOe+CMQw8F9h1q6BB/
 4+7Kxiq6dgn7Qr6TGqqpDUBmwmMCtPEuZo1W3VuYYsaAgtgC4hdqYBl+RRkH7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fJzEisDI
Subject: Re: [Buildroot] [PATCH 1/1] package/pinentry: bump to version 1.3.1
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

On Thu, 11 Jul 2024 00:06:44 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=blob;f=NEWS;h=a07d18953341a4eb65c9873e64c06bc7c642606d
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/pinentry/pinentry.hash | 4 ++--
>  package/pinentry/pinentry.mk   | 2 +-
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
