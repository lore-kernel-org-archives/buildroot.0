Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A68C27C53
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 23:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4145F844A1;
	Wed,  5 Jun 2024 23:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_rolPLxC8FA; Wed,  5 Jun 2024 23:35:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A099844A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A099844A3;
	Wed,  5 Jun 2024 23:35:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06A0A1BF5A5
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 23:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6EB54174D
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 23:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6n1jgVdDZxaV for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 23:35:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55;
 helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB80F402F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB80F402F5
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB80F402F5
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 23:35:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 10138CE19E1;
 Wed,  5 Jun 2024 23:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0876BC2BD11;
 Wed,  5 Jun 2024 23:35:10 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Thu,  6 Jun 2024 02:35:00 +0300
Message-ID: <20240605233503.23516-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1717630511;
 bh=crgAK7cnXM9Dk60JIZlGKQ/8zcbz2LLCU+B5Mxn0oLw=;
 h=From:To:Cc:Subject:Date:From;
 b=qJFctDFnW3KxpFR2ET75fcr49p8fWaHZBUD1tIWp8k6YdZlGTtbfr+2AXh0PHAqUg
 ObimKlfPDxx7PJV81OTA6HKjSlsZcLcWuD0vzccXP/9iXWD8LNgTiFC1OKd1dxyiOB
 fGJ3xWiDEL0GWU+6AapWQv4/JfmlzRKSS88xNLgX2B7Vk9sygwyRy2lkxeUFaLKRzI
 0w4KBJGKOU+RtmuCNX6zZszSJLx2f7dSTq4H17F8uozK951TelxaefxI0EgcF9Bav9
 qL3xOzQggwg1XKc13Ku97xP9Khf80QVnbp4eUMBjmafJUV6Z+Hn6IwwIelyLz/GBAe
 cy1SkiLs+Sx6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qJFctDFn
Subject: [Buildroot] [PATCH v7 0/3] swtpm and libtpms host packages
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add swtpm and libtpms host packages.

Jarkko Sakkinen (3):
  package/json-glib: add host build
  package/libtpms: add host package
  package/swtpm: add host package

 DEVELOPERS                     |  2 ++
 package/Config.in.host         |  1 +
 package/json-glib/json-glib.mk |  6 ++++++
 package/libtpms/libtpms.hash   |  2 ++
 package/libtpms/libtpms.mk     | 18 ++++++++++++++++++
 package/swtpm/Config.in.host   | 11 +++++++++++
 package/swtpm/swtpm.hash       |  2 ++
 package/swtpm/swtpm.mk         | 23 +++++++++++++++++++++++
 8 files changed, 65 insertions(+)
 create mode 100644 package/libtpms/libtpms.hash
 create mode 100644 package/libtpms/libtpms.mk
 create mode 100644 package/swtpm/Config.in.host
 create mode 100644 package/swtpm/swtpm.hash
 create mode 100644 package/swtpm/swtpm.mk

--
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
