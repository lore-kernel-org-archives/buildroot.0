Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2429FE95396
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 12:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E906160717;
	Wed,  4 Feb 2026 12:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhMG_c1HfD38; Wed,  4 Feb 2026 12:44:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7063760C2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770209076;
	bh=4UMjTfO75iz+PJahfMyjHT42NPWQefBMFfgcbu7wGdQ=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cdbLi95EHMg7UjaOC83rz0Fw7TvzTs7C8k1NDsSYaow6zOdU/LqqO+2O+5F7SMAO5
	 qhqE5MM6CyYMWRWQU4k3zWrmVDIaFpZsVI2NaZ/QLAsnyKGT4I27eiart88BF89rwD
	 xXxQv8vqf7o8HdnOp2rPdINumwiHTbfRfPMAvDQlNPXIXd6IHLHefKUrV3wemm8+36
	 O2peYxWdkSiLig7Wxgwoq/n6EgkDd65kOhkK6UDcsEDuIczP+JiZgc9XkOR2ye87ih
	 VTDTJXR6toRXdXPtDDWWlYQuo1r7esLjCYfkroBP1pHHj7XVDOXZ1F8JpspGqivAPz
	 5a2hHk1OdhsDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7063760C2A;
	Wed,  4 Feb 2026 12:44:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EF46173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F74B80C24
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfzraMcj5NbX for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 12:44:32 +0000 (UTC)
X-Greylist: delayed 430 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 04 Feb 2026 12:44:31 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5D4980B49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5D4980B49
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5D4980B49
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:44:31 +0000 (UTC)
X-CSE-ConnectionGUID: VNCa5HOgRHSpAeUr2u9gZg==
X-CSE-MsgGUID: zd27lEkhSdemEX2mUVCRmw==
Received: from unknown (HELO opfedv3rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 04 Feb 2026 13:37:18 +0100
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 13:37:18 +0100
Received: from OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 4 Feb 2026 13:37:17 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Wed, 4 Feb 2026 13:37:16 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 04 Feb 2026 13:37:16 +0100
X-CSE-ConnectionGUID: oV1t3+m4SBmd996nbLqMKw==
X-CSE-MsgGUID: /iyR37mASbKqNrGdAUie1w==
X-IronPort-AV: E=Sophos;i="6.21,272,1763420400"; d="scan'208";a="388482140"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 4 Feb 2026 13:37:14 +0100
Message-ID: <ea7cef9a9d5fae4f69e8e177a54202c60b6ba13a.1770208629.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1770208629.git.yann.morin@orange.com>
References: <cover.1770208629.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX602.corporate.adroot.infra.ftgroup
 (10.115.26.30) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1770209072; x=1801745072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FjvDNhL7/SZht1GlPA/65hrLR2EPcFN8UU5p+ISfDhM=;
 b=IQG1wCbWaEM/qR42//HXnvRcwMGJE8XWL803l5ucCUqQKXIsPUoN1z0f
 n2HQi7qDZGDVCIFMBAz/J6zMtF75AbudgmykWiZVpC7aiAxFnkacwQ4LD
 iHhzk9UOaH9S7/JBTYmdgl0z1zHwnaovm/np6cBI0AGgT8FA5bJN8n/qN
 iHd/5xiBPC3aHynjBFTsKid9x+DsoTG85RTempbryEGqptr7+IsZUROEz
 eozFD4jttYoV7j9I+9zN1BwVkIbJqv8EmhmRNQX3OFn84ko3yz45GOSxw
 qpRroXO2r8Hu1UlYQei5gONkrFZRvOGsuQiSVVPjjqG7pEA6VFHPdWx6D
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=IQG1wCbW
Subject: [Buildroot] [PATCH 1/3] package/blake3: explicitly disable
 threading & examples
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

Use of threading requires a C++20 compiler, and the oneTBB
implementation. oneTBB is missing from Buildroot, but a system
one may be used if found.

Even if the default for threading is disabled, explcitly state so, in
case the default changes in the future.

Also disable examples, we don't and won't need them.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/blake3/blake3.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
index 9d1323192c..1055a2c073 100644
--- a/package/blake3/blake3.mk
+++ b/package/blake3/blake3.mk
@@ -10,6 +10,10 @@ BLAKE3_SUBDIR = c
 BLAKE3_LICENSE = Apache-2.0 or Apache-2.0 with exceptions or CC0-1.0
 BLAKE3_LICENSE_FILES = LICENSE_A2 LICENSE_A2LLVM LICENSE_CC0
 
+HOST_BLAKE3_CONF_OPTS = \
+	-DBLAKE3_USE_TBB=OFF \
+	-DBLAKE3_EXAMPLES=OFF
+
 # The package is a dependency to ccache so ccache cannot be a dependency
 HOST_BLAKE3_ADD_CCACHE_DEPENDENCY = NO
 
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
