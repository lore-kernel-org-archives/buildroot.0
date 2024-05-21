Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF59C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 10:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34FD881FD4;
	Tue, 21 May 2024 10:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82RDjudO301a; Tue, 21 May 2024 10:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D8C881E3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D8C881E3B;
	Tue, 21 May 2024 10:32:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0701C5114
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 10:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 830A681E3B
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 10:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54FAAJSA9F8l for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 10:32:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 543EA81E28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 543EA81E28
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 543EA81E28
 for <buildroot@buildroot.org>; Tue, 21 May 2024 10:32:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 19D0761E01;
 Tue, 21 May 2024 10:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64BF9C2BD11;
 Tue, 21 May 2024 10:32:02 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 13:31:51 +0300
Message-ID: <20240521103154.32660-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1716287522;
 bh=PIf9Ke6PmUOQP+OclR7M+/XfTGSgZvN0H7aHHuCmF1I=;
 h=From:To:Cc:Subject:Date:From;
 b=NfTIkL8kq3HDEm3KE1UzxQ9kGXMmxFt9Mc7jcaKUWuzMVMg81wyP36vQGYwqHPDHH
 MbuhwG8Hax8+dQEeZhAwY3/kIV3Rr/SYrA1Rx5GHG5qOcPVwFb/ynHqUGORh2AzRBl
 bJOHBWT42y19wBDn9wQEGUZMtVRA5kDHT0CFnLMDsSQom5vHUWHlb7uxUnRbVB0+ee
 YEYj4BfG9lt9JgKbQaZMuMewcLk/3uP/zoeIVWQCXcpOhu+kAYpsTCLVHD37FYNgAD
 vKxa9xvwIL7eajaD/cRNqVF6tUtMrc+FPkOdpJjrueCLKFPBPSN64hbrlWU9U03Ilf
 WwoF2MtonLFBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NfTIkL8k
Subject: [Buildroot] [PATCH v4 0/3] swtpm and libtpms host packages
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
 package/libtpms/libtpms.mk     | 18 ++++++++++++++++++
 package/swtpm/Config.in.host   | 11 +++++++++++
 package/swtpm/swtpm.hash       |  2 ++
 package/swtpm/swtpm.mk         | 24 ++++++++++++++++++++++++
 10 files changed, 87 insertions(+)
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
