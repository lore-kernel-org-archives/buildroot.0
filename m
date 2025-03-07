Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DE2C282DE
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 10:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04A0E6088D;
	Fri,  7 Mar 2025 10:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPPwc_PDL49o; Fri,  7 Mar 2025 10:09:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27905608A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27905608A9;
	Fri,  7 Mar 2025 10:09:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFE761C9
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 10:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF9C4404E4
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 10:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d17vI1_zw7uf for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 10:09:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=208.88.110.44;
 helo=mail.savoirfairelinux.com;
 envelope-from=luc.beaufils@savoirfairelinux.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8977D40505
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8977D40505
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8977D40505
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 10:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 036699C8A58;
 Fri,  7 Mar 2025 04:59:39 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id BzPdwQ7BwTew; Fri,  7 Mar 2025 04:59:37 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id B9FA69C89D8;
 Fri,  7 Mar 2025 04:59:37 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com B9FA69C89D8
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 6gWNNxtrOs3z; Fri,  7 Mar 2025 04:59:37 -0500 (EST)
Received: from jean.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net
 [80.15.101.118])
 by mail.savoirfairelinux.com (Postfix) with ESMTPSA id D65B19C41DB;
 Fri,  7 Mar 2025 04:59:36 -0500 (EST)
From: Luc BEAUFILS <luc.beaufils@savoirfairelinux.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luc BEAUFILS <luc.beaufils@savoirfairelinux.com>,
 Thomas Perrot <thomas.perrot@bootlin.com>
Date: Fri,  7 Mar 2025 10:59:02 +0100
Message-Id: <20250307095904.19075-1-luc.beaufils@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
 t=1741341577; bh=DjgajlfRJVlyQY7+UIrjqJGU6i/dMApeF25t8Da6Qzk=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=So7sV0dMbqhk5zmWjykpIAFjfwpis0NtHxvgUpJQ2PpNEz1PM6P2CUcBQbYH1cTnN
 EqyWUGhddU06LR2tyc/2VXWM2l2miCWl7PISXChcL3NSGy9Gx1wUiiWqukcyp2W9Tq
 yIH0NpcI4JYe0nQYucVYrVpw4GFM/Qtdhx9kV6Xxt2EPexWROJKTOrxBT4VKUJVxkh
 lhWTK1dnsaaTn7Y6EZG7cFoLo63hnLKHttAdtLp8x6tSKaqoW7F/1+upRobmIsYixh
 CRcxPpEf+xpI9jjVc8sI1OZH3f/5R7y2Mux15+6Nz4DlRawUoay2HL/1OEvy76D3Zy
 lGsR8z2DOwhtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=savoirfairelinux.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=So7sV0dM
Subject: [Buildroot] [PATCH v2 0/2] Support for i.MX Code Signing Tools
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
 package/byacc/byacc.hash       |  3 ++
 package/byacc/byacc.mk         | 16 +++++++++++
 package/imx-cst/Config.in.host |  9 ++++++
 package/imx-cst/imx-cst.hash   |  3 ++
 package/imx-cst/imx-cst.mk     | 50 ++++++++++++++++++++++++++++++++++
 6 files changed, 82 insertions(+)
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
