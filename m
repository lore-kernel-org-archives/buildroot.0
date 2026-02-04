Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C13E95398
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 12:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9306580CB0;
	Wed,  4 Feb 2026 12:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rv7AR2kyYO62; Wed,  4 Feb 2026 12:44:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F7A680CAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770209079;
	bh=JwpCP+sxejqGSrg6bSilU3rVA16rSy+gTGEj4f6+2Do=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L+cMhsSqL/flYPD/SCZf9jXklZwPWuB/9lrC2bHPcoWhagJFB6O/iu6ehtupYnkhY
	 1By95HEy9jybRdAayYWnash/E6U7iSOgEW0vfvwfNxUbIQz0WxA8SlctlscvVXkW6M
	 qndAtCHjJvPg7Z8Mf14XUcRTz+9Z5Z757mrkOG13MJsncl8pRHsA/UegVbqtq/gqEc
	 JpcPJYHBghUTFpr3YoOokU1bqSVRsWKtEc9hcK8LSNpPzg3+84rmVW7lJoYwcs0eif
	 oX+3pX5CDImcrBwsVe0ZtFNr5IKUX78rfTxY0ab114iaR8GLlm0oKvz4iIoa8rOFDg
	 NAZbIVvh6odEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F7A680CAB;
	Wed,  4 Feb 2026 12:44:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94A16F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DB9380C92
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id un0irZ0PuoHn for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 12:44:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E119280BE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E119280BE9
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E119280BE9
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:44:32 +0000 (UTC)
X-CSE-ConnectionGUID: 0g55sNtaQAWZ2Lp6DlapHA==
X-CSE-MsgGUID: nXM7wtjJQD2rJXVgcft5+Q==
Received: from unknown (HELO opfedv3rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 04 Feb 2026 13:37:22 +0100
Received: from unknown (HELO OPE16NORMBX508.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 13:37:22 +0100
Received: from OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] by
 OPE16NORMBX508.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 4 Feb 2026 13:37:21 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Wed, 4 Feb 2026 13:37:20 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 04 Feb 2026 13:37:19 +0100
X-CSE-ConnectionGUID: +Haii3ZwSKeDZFImLEfQ1g==
X-CSE-MsgGUID: IXjgOs+ESkaowSyjeTDmCg==
X-IronPort-AV: E=Sophos;i="6.21,272,1763420400"; d="scan'208";a="388482273"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 4 Feb 2026 13:37:16 +0100
Message-ID: <b2d5a34a036132c546c17f2f3687b8ccf7c0e967.1770208629.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1770208629.git.yann.morin@orange.com>
References: <cover.1770208629.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: ope16normbx505.corporate.adroot.infra.ftgroup
 (10.115.27.25) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1770209073; x=1801745073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KZmgEfvxejfbizeCWFb9QUpNt7BwtJIJTcvNtrwZglU=;
 b=XxJVUH58uRTR3QUCXa6sNqBdpLfT56PV135t5rZKI5s6V9iN4bBFZbLQ
 xoMRRmEcf3kqtvl5ViBgGAHMUNKDFP6RbbfwrBKLB0QLHsQTXyujuqM/F
 V7OclBDGUOGYZt/ejvLgnJhaA4u6KUMfck74wS5iGbX/qm+AbyxSZRUUP
 9gMPIcujsQZ+x/mLx2V8aVRr+kAqhBXQBuMCznIEeoJHD3GJHGPpnZEZA
 C6nnAzrM5AeBJGQUI+URwDYREDe23SDFczwZW1woDYJJ4/J3xFsNGkFtl
 Yd52FBPgkbzuNep1drXY74y9KkI6kErEJj5tpFKof3JesytHDSR6JCOb6
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=XxJVUH58
Subject: [Buildroot] [PATCH 3/3] package/blake3: add target support
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

From: "Yann E. MORIN" <yann.morin@orange.com>

Blake3 unconditionally enables C++ support, which unconditionally
requires C++20 when built with cmake >= 3.12, even when this is not
required.

Fixing this does not look trivial, and rather than botching the build,
just require C++20, available from gcc 8.x onward.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/Config.in        | 1 +
 package/blake3/Config.in | 8 ++++++++
 package/blake3/blake3.mk | 6 ++++++
 3 files changed, 15 insertions(+)
 create mode 100644 package/blake3/Config.in

diff --git a/package/Config.in b/package/Config.in
index 258ad1883d..864db99d02 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2122,6 +2122,7 @@ menu "Other"
 	source "package/avro-c/Config.in"
 	source "package/basu/Config.in"
 	source "package/bdwgc/Config.in"
+	source "package/blake3/Config.in"
 	source "package/boost/Config.in"
 	source "package/c-capnproto/Config.in"
 	source "package/capnproto/Config.in"
diff --git a/package/blake3/Config.in b/package/blake3/Config.in
new file mode 100644
index 0000000000..afad6541d9
--- /dev/null
+++ b/package/blake3/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_BLAKE3
+	bool "blake3"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8  # C++20
+	help
+	  BLAKE3 is a cryptographic hash function.
+
+	  https://github.com/BLAKE3-team/BLAKE3
diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
index a2094fc4c0..9218e5bbba 100644
--- a/package/blake3/blake3.mk
+++ b/package/blake3/blake3.mk
@@ -10,6 +10,11 @@ BLAKE3_SUBDIR = c
 BLAKE3_LICENSE = Apache-2.0 or Apache-2.0 with exceptions or CC0-1.0
 BLAKE3_LICENSE_FILES = LICENSE_A2 LICENSE_A2LLVM LICENSE_CC0
 
+BLAKE3_INSTALL_STAGING = YES
+
+BLAKE3_CONF_OPTS = \
+	-DBLAKE3_USE_TBB=OFF \
+	-DBLAKE3_EXAMPLES=OFF
 HOST_BLAKE3_CONF_OPTS = \
 	-DBLAKE3_USE_TBB=OFF \
 	-DBLAKE3_EXAMPLES=OFF
@@ -23,4 +28,5 @@ HOST_BLAKE3_CONF_OPTS += \
 	-UCMAKE_C_COMPILER_LAUNCHER \
 	-UCMAKE_CXX_COMPILER_LAUNCHER
 
+$(eval $(cmake-package))
 $(eval $(host-cmake-package))
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
