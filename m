Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B27BC19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 15:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 154C981EBB;
	Fri,  7 Mar 2025 15:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3VYQBQRi4zw; Fri,  7 Mar 2025 15:39:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E0A681F39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E0A681F39;
	Fri,  7 Mar 2025 15:39:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94FFE71F
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 15:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81DFE409EE
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 15:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tY5jUnisX9cQ for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 15:39:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=208.88.110.44;
 helo=mail.savoirfairelinux.com;
 envelope-from=luc.beaufils@savoirfairelinux.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2E6AD400F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E6AD400F2
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E6AD400F2
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 15:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 665B29C4038;
 Fri,  7 Mar 2025 10:39:10 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id zql4lxXoBUPf; Fri,  7 Mar 2025 10:39:09 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id E17159C89C2;
 Fri,  7 Mar 2025 10:39:09 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com E17159C89C2
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id kmYrN76EdWr3; Fri,  7 Mar 2025 10:39:09 -0500 (EST)
Received: from jean.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net
 [80.15.101.118])
 by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 1555B9C4038;
 Fri,  7 Mar 2025 10:39:08 -0500 (EST)
From: Luc BEAUFILS <luc.beaufils@savoirfairelinux.com>
To: buildroot@buildroot.org
Date: Fri,  7 Mar 2025 16:38:52 +0100
Message-Id: <20250307153854.2597393-1-luc.beaufils@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
 t=1741361949; bh=9Pok3h3xNobN1WEm6pHB26y/JVwfPIij6ob2qM+VbO4=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=Dcc+6RDZ/cXlP2CphLgnVo9vQP5Z17zgk8sVsu8l3+yRNQEjJQjOUfbjM35DTDo9t
 RWfNpBnt08zlVztgSSH+yUqlZpsmSegthuVPcdruRCK4oF3qQzyGmSbpLYzEtrt7jQ
 Gl90F36+/ydeMNtGJiicbuYqHOlXg82lVz4QDAT8QyNX0knngD+liU5vRXZzSlAPr6
 OeMZlEcpn+RDyfTB/YRt0EN+rr3JKOxdh4r6VHkUzeKS6vL/NMrj2IMZTEYzuybtRJ
 R8IzSnkieKmiwu5nGyaT09PYxgu4Ei9wnFSGJnImWUUYi5HjxPAx1r1bu++SHIxRN5
 aI6DX00cmmuAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=savoirfairelinux.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=Dcc+6RDZ
Subject: [Buildroot] [PATCH v3 0/2] Support for i.MX Code Signing Tools
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Perrot <thomas.perrot@bootlin.com>,
 Luc BEAUFILS <luc.beaufils@savoirfairelinux.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The imx-cst package provides a set of tools to sign and authenticate
code for i.MX processors. The byacc binary is required as a dependency.

The initial series of patches has been written by Thomas Perrot [1] but
does not seem to have been submitted upstream. This series backports
his work and updates the imx-cst version to 3.4.0+dfsg version.

[1]: https://patchwork.ozlabs.org/project/buildroot/cover/20220419092151.91638-1-thomas.perrot@bootlin.com/

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Luc BEAUFILS <luc.beaufils@savoirfairelinux.com>

Thomas Perrot (2):
  package/byacc: add new package
  package/imx-cst: add new package

 package/Config.in.host         |  1 +
 package/byacc/byacc.hash       |  3 +++
 package/byacc/byacc.mk         | 16 +++++++++++
 package/imx-cst/Config.in.host |  9 +++++++
 package/imx-cst/imx-cst.hash   |  3 +++
 package/imx-cst/imx-cst.mk     | 49 ++++++++++++++++++++++++++++++++++
 6 files changed, 81 insertions(+)
 create mode 100644 package/byacc/byacc.hash
 create mode 100644 package/byacc/byacc.mk
 create mode 100644 package/imx-cst/Config.in.host
 create mode 100644 package/imx-cst/imx-cst.hash
 create mode 100644 package/imx-cst/imx-cst.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
