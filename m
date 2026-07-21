Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E27C4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 04:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F30B880E13;
	Tue, 21 Jul 2026 04:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V7nhFpo1rb_C; Tue, 21 Jul 2026 04:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 810A980DE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784609177;
	bh=fur0ET/GHmJ/ervNq2gRjg0xk9qrGThykBCbIFTR7n0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qkdw3l9QIciKEvzq1TalwQPejv1YG3cv0MsN82uY8sHLakMvKLxoHBeXLuVse0DNa
	 rRRQzoWIWwiU6zOK8tHx0P16iBJTvlpxo6VAua8IyjStaRq6nlxNoI9EwuyHH055Eg
	 2RVc0mI8XPgDfRkcykFg4c4T+v8D8nDu/LoQi+iKDW0WBE7cO7yboGn0OcSu8+fXBR
	 IqijsDv+ZFQqMpdLk3uhYjU3PCDFN702OqhZ8E348JEtwvotGnwmiOW7ZfeJCIKps2
	 VdyvWcHqee3fEuL9fmcx3jMUqRLWBiFOK2MVJ5pOBWi4nrafqbIH442PRHtO4iWYny
	 jINxdDEw3vZ9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 810A980DE8;
	Tue, 21 Jul 2026 04:46:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80D819E5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 04:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6423B80E01
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 04:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUH9GGHZo0KL for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 04:46:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D84EF80D5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D84EF80D5B
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D84EF80D5B
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 04:46:14 +0000 (UTC)
X-CSE-ConnectionGUID: 5jQCh20pS6S82armxKQHEw==
X-CSE-MsgGUID: zpZQ2MnTQoiOFEOR3EOfJQ==
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 21 Jul 2026 06:46:11 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 06:46:11 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43;
 Tue, 21 Jul 2026 06:46:10 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 21 Jul 2026 06:46:09 +0200
X-CSE-ConnectionGUID: 9KhPcH8XSPWHYqWvZT4VBg==
X-CSE-MsgGUID: NAI1OR+uTF6BBKwEA0F5tw==
X-IronPort-AV: E=Sophos;i="6.25,176,1779141600"; d="scan'208";a="452586709"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 21 Jul 2026 06:46:08 +0200
Message-ID: <aedfb2053549dcdb73c7b124ffe9fd8f93f2af8d.1784609165.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1784609165.git.yann.morin@orange.com>
References: <cover.1784609165.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX501.corporate.adroot.infra.ftgroup
 (10.115.26.25) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1784609175; x=1816145175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fuGFBvgE97FViQUvphwsf/lO7jrMVnxEpSw2BMrRRqc=;
 b=RZ2IkXbs4mPJn5W8jrIbMBAf+ORpTs8fsR3onpeBZYaaIEd3yRKuNvhi
 mH5sNNHsEKgQTRhWrQ625GJcFmo5WZkGf6ZRcQapCIcMpM1HPpaACZo0i
 SFt1+PkrCDu44UmTf9MzdnYY6jqzTqLATCrgqcYUpdAye4tR2kVxsVN7N
 pOzQVGdgYqGqcG/K6wJZNlEaOWB535DtHeSesZN8jy4vP2KBU1hDNViTI
 OELnKuBaXCxP4s+6reRXr9tTWr8RPZ5bd+Q2bYaoj4Q4zPjkZrxhvgvoG
 CuMlUl/QRNjXYPOnLbSmGSe9jQ3q6ESuLN8VmI4t7U5jY8skNT1tY/Uxq
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=RZ2IkXbs
Subject: [Buildroot] [PATCH 1/2] package/libqmi: bump to version 1.38.0
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
Cc: yann.morin@orange.com, Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Aleksander Morgado <aleksander@aleksander.es>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 3962e925ce..b3af29df4f 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  e254fafdd916a78a27126e6d72ae436662487f59c7de84d4d40286059af89093  libqmi-1.36.0.tar.gz
+sha256  8ee3b3a9002f2b45c825deade85710db006e01674f5f9359d351c192cc926015  libqmi-1.38.0.tar.gz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index c14caa3113..5bf737634f 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.36.0
+LIBQMI_VERSION = 1.38.0
 LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
