Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91751C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 11:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EC7C40787;
	Thu, 26 Jun 2025 11:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnwhftY30Y7z; Thu, 26 Jun 2025 11:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5316C408AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5316C408AB;
	Thu, 26 Jun 2025 11:25:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DCCC1CD
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FC45611CF
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bt3epLxykX-P for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 11:25:33 +0000 (UTC)
X-Greylist: delayed 302 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 26 Jun 2025 11:25:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6AE01611CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AE01611CD
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::42ae;
 helo=smtp-42ae.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
Received: from smtp-42ae.mail.infomaniak.ch (smtp-42ae.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::42ae])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AE01611CD
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 11:25:33 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bSbp26F5WzSfv;
 Thu, 26 Jun 2025 13:20:26 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4bSbp22T8mzb0J; Thu, 26 Jun 2025 13:20:26 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Thu, 26 Jun 2025 13:20:17 +0200
Message-Id: <20250626-strongswan-misc-martin-v1-0-a4c4da74ba9c@cherry.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPEsXWgC/x3MQQqEMAxA0atI1gZssQpeZZhFralmYZREnAHx7
 haXb/H/BUbKZDBUFyidbLxJgasrSEuUmZCnYvCND03nerRDN5ntFwVXtoRr1IMFyVMYc8outQF
 KvCtl/r/jz/e+H6/XabtoAAAA
X-Change-ID: 20250617-strongswan-misc-martin-e2e5bfcf1c45
To: buildroot@buildroot.org
Cc: Martin Elshuber <martin.elshuber@cherry.de>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Martin Elshuber <martin.elshuber@theobroma-systems.com>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 0/3] package/strongswan: support reducing
 privileges and changing piddir
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

This adds support for dropping unneeded capabilities[1], running the
charon daemon as non-root[2] and changing the location of the PID/socket
files used by strongswan (especially useful for sharing minimal amount
of data between containers).

[1] https://docs.strongswan.org/docs/latest/install/reducedPrivileges.html#_dropping_capabilities
[2] https://docs.strongswan.org/docs/latest/install/reducedPrivileges.html#_running_strongswan_as_non_root

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Martin Elshuber (1):
      package/strongswan: add option to specify paths to PID and UNIX socket files

Quentin Schulz (2):
      package/strongswan: allow to drop unneeded capabilities
      package/strongswan: allow non-root user/group to own IKE charon daemon

 package/strongswan/Config.in     | 25 +++++++++++++++++++++++++
 package/strongswan/strongswan.mk | 20 +++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)
---
base-commit: 5f1a38a41f0b6702444940b24bcd0d79a41a0059
change-id: 20250617-strongswan-misc-martin-e2e5bfcf1c45

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
