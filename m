Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBBFC25B79
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 17:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A00D94060E;
	Fri, 17 May 2024 17:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0y2xUHNKJyf; Fri, 17 May 2024 17:31:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54B124061D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54B124061D;
	Fri, 17 May 2024 17:31:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A2BA1BF357
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 17:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3487F4018F
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 17:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghoYWPHgAdG8 for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 17:31:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33DEA40104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33DEA40104
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33DEA40104
 for <buildroot@buildroot.org>; Fri, 17 May 2024 17:31:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8E94A61DF6;
 Fri, 17 May 2024 17:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7086C2BD10;
 Fri, 17 May 2024 17:31:45 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 20:31:37 +0300
Message-ID: <20240517173140.24531-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1715967106;
 bh=m01ToGN2pwpIWfQNqgMhgiPVrcbuT13grLtIJC1hp6U=;
 h=From:To:Cc:Subject:Date:From;
 b=CQi5gKbH8nxpo21ZwkpPXiHPiPIT3xHcPdLamH7EdJntQ/TVY8ZT4mhxmqlCEEq1S
 uanqFXdcC2+S15GVBtJkvYsbtR/FzL/eWQfcKUsJy6jSV93MmcT84D/84HTfyj6xfK
 mGlZbV/rXwYGPd9P7abfg+s+aL99pDhYQJtXevAMZZkelY7ozkvvqg6ocwCyueXxWT
 OfX25K15e7jNutUJVkYCylZHgs4DtilESMCHQgslu8QiIJuMOmLVlhawbQGLZ7YHHs
 WTz5CaikiInxIW45Vr4cheTergf9ZKoUNXIlwEMVumhY5JyJFGlTeEaKxaOxfyG/5j
 smRG+SXlIt1pA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=CQi5gKbH
Subject: [Buildroot] [PATCH v2 0/3] swtpm and libtpms host packages
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add swtpm and libtpms host packages.

Testing:

git clone https://gitlab.com/jarkkojs/linux-tpmdd-test.git
cd linux-tpmdd-test
cmake -Bbuild && make -Cbuild buildroot-prepare
make -Cbuild/buildroot/build
build/buildroot/build/images/run-tests.sh

Jarkko Sakkinen (3):
  package/json-glib: add host build
  package/libtpms: add host package
  package/swtpm: add host package

 DEVELOPERS                     |  2 ++
 package/Config.in              |  1 +
 package/Config.in.host         |  1 +
 package/json-glib/Config.in    |  9 +++++++++
 package/json-glib/json-glib.mk |  5 +++++
 package/libtpms/Config.in      | 19 +++++++++++++++++++
 package/libtpms/libtpms.hash   |  2 ++
 package/libtpms/libtpms.mk     | 17 +++++++++++++++++
 package/swtpm/Config.in.host   | 12 ++++++++++++
 package/swtpm/swtpm.hash       |  2 ++
 package/swtpm/swtpm.mk         | 23 +++++++++++++++++++++++
 11 files changed, 93 insertions(+)
 create mode 100644 package/libtpms/Config.in
 create mode 100644 package/libtpms/libtpms.hash
 create mode 100644 package/libtpms/libtpms.mk
 create mode 100644 package/swtpm/Config.in.host
 create mode 100644 package/swtpm/swtpm.hash
 create mode 100644 package/swtpm/swtpm.mk

--
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
