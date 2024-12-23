Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD704E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 07:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AEC6607A4;
	Mon, 23 Dec 2024 07:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Np2qOQ7vh-Hy; Mon, 23 Dec 2024 07:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 958DD6089D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 958DD6089D;
	Mon, 23 Dec 2024 07:27:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 587ADD8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42D87415F6
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MxKAHbnnCqmA for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 07:27:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0801441607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0801441607
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0801441607
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:27:28 +0000 (UTC)
X-CSE-ConnectionGUID: pZSVpr1aQge1Ok5rHxt0sQ==
X-CSE-MsgGUID: xGaTWZgzQhaeVufCQ+qFPQ==
Received: from unknown (HELO opfedv3rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 08:27:27 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Dec 2024 08:27:26 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Mon, 23 Dec 2024 08:27:25 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Dec 2024 08:27:25 +0100
X-CSE-ConnectionGUID: oeNtWHDfSiSXszL8M0sEYw==
X-CSE-MsgGUID: 3SEUKTc1R9yG+q7+oYZTOA==
X-IronPort-AV: E=Sophos;i="6.12,256,1728943200"; d="scan'208";a="237596673"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Mon, 23 Dec 2024 08:27:19 +0100
Message-ID: <7ef05c6e9599af2b62821a708761e26242e1f8f6.1734938835.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734938835.git.yann.morin@orange.com>
References: <cover.1734938835.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX402.corporate.adroot.infra.ftgroup
 (10.115.26.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1734938850; x=1766474850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TzqfM9wWRs5GReZo7ZNy3sL1cXXqaLzLdLfxamniGAE=;
 b=AOHxjpwubVCG2NqmxXcNwWUK3i4G8s7A468B647ugMqGFTq1rR/x7V0a
 KrP4EtlZQ9mjjufsE2sh49WqE89BcYJAcIw0F7hcKEB6cnfkzpHmj9tr0
 KsClk8KuXbh36/sk+VDKaiYatIKV/B0RbkGCAdr4CIlmKDAbzV+Eim2vO
 bNtcTG1ZkD4GeCD+TJ+wpUecmcYGJQH77F5AUArvZoXZUWJx3hLdNwckL
 RQxFVvK8Vf0dmv2qazf/bBLZfsWQw9fGsJI6Uz92MUnjxoQgFpB4BzeCM
 TOkXQMnd1aG62Jw+vYjotM4HXhxRKXjiZBZrqYuZRzDkjBeTnLHgPhIfk
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=AOHxjpwu
Subject: [Buildroot] [PATCH 4/5] utils/get-developers: sort reported
 developers
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

The list of reported developers is not ordered: that may leave the
impression (when receiving a patch) that a Cc is more important than
another, by virtue of being earlier in the list.

Also, the ordering changes on every call.

Report the developers in an alphabetically order, so that there is no
confusion anymore, and so the ordering is reproducible across calls.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 utils/get-developers | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/get-developers b/utils/get-developers
index b45e617bff..3253ce5d6b 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -98,6 +98,7 @@ def __main__():
                 if i in dev.infras:
                     matching_devs.add(dev.name)
 
+        matching_devs = sorted(matching_devs)
         if args.email:
             for dev in matching_devs:
                 print(dev)
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
