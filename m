Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DBBC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 17:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E564401F6;
	Sun, 14 Jul 2024 17:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gEFAteOej5vY; Sun, 14 Jul 2024 17:04:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 612A7402A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 612A7402A8;
	Sun, 14 Jul 2024 17:04:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A91C11BF32B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2DB74010D
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5idMrvBKGzm for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 17:04:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 411BA401F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 411BA401F6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 411BA401F6
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 17:04:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 410851BF203;
 Sun, 14 Jul 2024 17:04:16 +0000 (UTC)
Date: Sun, 14 Jul 2024 19:04:15 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240714190415.40d9c9d6@windsurf>
In-Reply-To: <20240714163429.2331461-1-ju.o@free.fr>
References: <20240714163429.2331461-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720976656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmzzyGSiqPoUog+WgV5bMy4/wJytY1pLZuRRWYdz4tU=;
 b=arO87XENeXF8JV9tQzEbwnVIbtnNQ64mj2ByQ7yv6BDlviGUnbq+zrOCi6xxlS/NxRAhOZ
 34o7fN4iXBTQujX48PwgJZFQGO8AxqzMUqIbAXcimtcVERcv+twBfPf5A1Jb3pb4PEhPqO
 V0jBD506fs6zwjDlMMGhmPWyTVhnSkYJMfKOVv89AUU0Hz5bhjYcTci97QiQd5Ry+3V+Rk
 PpkXaX2niqepQZRzMmOWYrnEMY789z4LW8bEvkpYZD1GYFCuHGaByy/N5fUCB6SGlvriUv
 DY4ayiuCzaT/3MjyTs1TF8OEfT52a6L5buhbj4ynwp0Lr9BxYuhLtxEbFhsfHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=arO87XEN
Subject: Re: [Buildroot] [PATCH v2 1/1] package/btrfs-progs: bump version to
 6.9.2
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

On Sun, 14 Jul 2024 18:34:29 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since v5.16.2, see:
> https://github.com/kdave/btrfs-progs/blob/v6.9.2/CHANGES
> 
> This commit also adds two patches:
> - one to fix compilation with gcc 5.x and 6.x.
> - another to fix compilation with uClibc-ng
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Changes v1 -> v2:
> - Improve the package printf.h detection logic,
>   as suggested by Thomas in:
>   https://lists.buildroot.org/pipermail/buildroot/2024-July/757857.html
> ---
>  ...compat-fix-fallthrough-definition-fo.patch | 63 ++++++++++++++
>  ...uClibc-ng-compatibility-for-printf-f.patch | 85 +++++++++++++++++++
>  package/btrfs-progs/btrfs-progs.hash          |  2 +-
>  package/btrfs-progs/btrfs-progs.mk            |  5 +-
>  4 files changed, 153 insertions(+), 2 deletions(-)
>  create mode 100644 package/btrfs-progs/0001-btrfs-progs-kerncompat-fix-fallthrough-definition-fo.patch
>  create mode 100644 package/btrfs-progs/0002-btrfs-progs-add-uClibc-ng-compatibility-for-printf-f.patch

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
