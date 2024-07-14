Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905FAC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68CEF60611;
	Sun, 14 Jul 2024 15:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gaYfDAlPS0lM; Sun, 14 Jul 2024 15:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89B986063E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89B986063E;
	Sun, 14 Jul 2024 15:36:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65DCE1BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5394A81156
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLkIwUXLtEn7 for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0ED2581152
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ED2581152
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0ED2581152
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:36:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EC8A20002;
 Sun, 14 Jul 2024 15:36:36 +0000 (UTC)
Date: Sun, 14 Jul 2024 17:36:35 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240714173635.26c1f327@windsurf>
In-Reply-To: <20240713173149.346681-1-ju.o@free.fr>
References: <20240713173149.346681-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720971396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r9U9qs1RIckit7/UfdpNx3Fst8lLDB+ZEd3AbBft1wU=;
 b=Rp3rUGgHnRf3tTQaaYYoeZeVxs9Kr7a5KX7nFLZVSndCqJ80XyAbx5QY63VDEsC1FLdvLC
 Syp1WmN+3HbMEHJ/CF5P9I7AvcSvHMMbH1K/uL3f5rZSZagOLLAGgCzV3pKvhU8BDfNZiN
 78QPSYBYtAcjqOPu6LRG9fhHIytGnNq/rihKbAfLtkvHcENLlGqTFAPdT3K2u9jjxQGjPp
 Ltxm5HDUrFvXt00TEj4A+m7mTzRXTbnKcJn18ClzwXFAk/REq1cmu/0GCMZ3MZuQKl5d8V
 hdf2TjvvMU5TIQ4QCDlEGsaRzSnawTUhejMiKRNz97AdpoYxJ+JobGgKtkYstQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rp3rUGgH
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new btrfs-progs
 runtime test
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

On Sat, 13 Jul 2024 19:31:49 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |   2 +
>  .../testing/tests/package/test_btrfs_progs.py | 127 ++++++++++++++++++
>  .../test_btrfs_progs/linux-btrfs.fragment     |   1 +
>  3 files changed, 130 insertions(+)
>  create mode 100644 support/testing/tests/package/test_btrfs_progs.py
>  create mode 100644 support/testing/tests/package/test_btrfs_progs/linux-btrfs.fragment

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
