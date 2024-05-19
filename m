Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C15C25B75
	for <buildroot@archiver.kernel.org>; Sun, 19 May 2024 21:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09F04605F2;
	Sun, 19 May 2024 21:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Exnstvvy6eJA; Sun, 19 May 2024 21:02:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13435605F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13435605F8;
	Sun, 19 May 2024 21:02:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C93611C426E
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 21:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8BDD40356
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 21:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HmuW3KlS1Tcp for <buildroot@lists.busybox.net>;
 Sun, 19 May 2024 21:02:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=145.40.73.55;
 helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 940AA40355
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 940AA40355
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 940AA40355
 for <buildroot@buildroot.org>; Sun, 19 May 2024 21:02:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 34225CE0A14;
 Sun, 19 May 2024 21:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CF7C32781;
 Sun, 19 May 2024 21:02:42 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Mon, 20 May 2024 00:02:32 +0300
Message-ID: <20240519210235.8493-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1716152563;
 bh=zZWku805zNiVVDY0OUJ6NSOO8bowy83nIiRkCH4ksAU=;
 h=From:To:Cc:Subject:Date:From;
 b=jgIJzOIvQL7EvNBFtRRyUgw18TN2gQeijYAbnm+P8x86SrjcPEupgygPy+mLdmSVy
 0pIFy0V9geC2kTDd6mwNb9OKyJ99nfoYfyvrVMVEsEBzdlBfnVWbH7a2jPW+G5Y1o9
 c8jOxk3bHW2uyuZ8QXLNeEkG3Mp7DzHQnty0akAvb2CEk47TUTIYXa/tlgR9eLGp7v
 6PYS0d9ewHE+V72Q4CFqGvQGadvohygw2Vrv3wid5VjIYuZSYOcH6L2dXQq+NC4I89
 Wab0A0vwADKUubMU+XrMBu96ajYn5PfUl/yR0cMCHJJz9I/PQ9KFNuAwxRHaiIFk2X
 k+BW63Ftha88Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jgIJzOIv
Subject: [Buildroot] [PATCH v3 0/3] swtpm and libtpms host packages
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
 package/Config.in              |  1 +
 package/Config.in.host         |  1 +
 package/json-glib/json-glib.mk |  6 ++++++
 package/libtpms/Config.in      | 20 ++++++++++++++++++++
 package/libtpms/libtpms.hash   |  2 ++
 package/libtpms/libtpms.mk     | 21 +++++++++++++++++++++
 package/swtpm/Config.in.host   | 11 +++++++++++
 package/swtpm/swtpm.hash       |  2 ++
 package/swtpm/swtpm.mk         | 24 ++++++++++++++++++++++++
 10 files changed, 90 insertions(+)
 create mode 100644 package/libtpms/Config.in
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
