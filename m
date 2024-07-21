Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47465C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08A74605F0;
	Sun, 21 Jul 2024 16:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scvpKOLtrXgU; Sun, 21 Jul 2024 16:17:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10B3960605
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10B3960605;
	Sun, 21 Jul 2024 16:17:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9942B1BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86FAE60605
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISQaqSIpKL6H for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:17:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B00F605F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B00F605F0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B00F605F0
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:17:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 170FFE0003;
 Sun, 21 Jul 2024 16:17:21 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:17:21 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240721181721.279e4f7c@windsurf>
In-Reply-To: <20240719173723.546583-1-ju.o@free.fr>
References: <20240719173723.546583-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721578642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BWX3KYao4xd8ko4nIfa+74xA1E2Mg/T1V9jhByVTFb4=;
 b=iqN4vSvVdiBIJXCHo/0HVHvPSDIcBCOy7PRX52/BPM/KQvZEPH67X5P63nJ40hIO4eMJr0
 NaCwzxOamvMHR85KhmSeEVb1hqQiSiCwCocALHLD5EDJIvjK0oNO8kJmj+FDjiIlFTekni
 6xf6yJK6tZ/fkp/wYSrZjZQj1ShBNYW17oGbcbq5HJmbE/xvd+FHpSQ724xvdrCVv55rLS
 enUHVYk3zN3l4aFcf9hV7pN/hWta+/QFpwTsdiiLBERI1EzE/ceZFw0n0jUCdG1IRS63v4
 hlPD+tyv/h0WGzIr/C+eqYRA0e+NGVlENhIFSaTIjUR2R/rL3Z5gedh6hwZouQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iqN4vSvV
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.29
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

On Fri, 19 Jul 2024 19:37:23 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For release announce, see [1].
> 
> This commit removes the package patch, which is now included in this
> new version.
> 
> The license hash also changed, due to a FSF address update. See [2].
> This commit also adds a comment in the hash file about the pgp
> signature check.
> 
> [1] https://lists.infradead.org/pipermail/kexec/2024-July/030452.html
> [2] https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=f53bcef5063c70960b2b8eb8990722d5c9d1b99e
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  ...uilding-on-x86_64-with-binutils-2-41.patch | 94 -------------------
>  package/kexec/kexec.hash                      |  6 +-
>  package/kexec/kexec.mk                        |  2 +-
>  3 files changed, 5 insertions(+), 97 deletions(-)
>  delete mode 100644 package/kexec/0001-Fix-building-on-x86_64-with-binutils-2-41.patch

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
