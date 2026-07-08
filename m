Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0C8C43458
	for <buildroot@archiver.kernel.org>; Wed,  8 Jul 2026 04:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F11B560E20;
	Wed,  8 Jul 2026 04:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M43Kil2TZADo; Wed,  8 Jul 2026 04:57:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3D4660E17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783486646;
	bh=rQEuTDbwCm1mMIrKYfmYGj+tD/Xs5wdb9/48dEZOO1M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=nJphHLIqd4F4Tej5UgtmDF2OW/ZJhYfjM1/ZSKGTRysdhUq9J3dagDrF0zG/znY5o
	 ZOm8LY3xxhiLHJTNOinpfM0Cx/ApLhgiQN5dYoe04HtFwkKbGxr1C9GhPTjf9Lj50k
	 2+8HNHIPtsRQYAauFkY0Z3V5WbpT2W2G7Pp5MW73cqKn7Ksa5i8B07wbyE4l+O5zpI
	 Q8UwhdEQRKJ0+9k57DL+FSVDjZyaC+qjV/+iYHaTIhCZqRLn/K2aeyRvIIr4Xlg3yr
	 JTiY7rPwxKBHcvdsqL6ZBkuU6ptyQAD35PznGh+Dtrnx9XhqqGe5+a5y25hsjM/p8j
	 pvcAECGQn/cSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3D4660E17;
	Wed,  8 Jul 2026 04:57:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4428C15C
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 04:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A30A4062D
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 04:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W72_Roo_D-IL for <buildroot@buildroot.org>;
 Wed,  8 Jul 2026 04:57:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E8D204007A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8D204007A
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8D204007A
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 04:57:23 +0000 (UTC)
X-CSE-ConnectionGUID: 8G+jvV5RQXOJYdf01zlb3A==
X-CSE-MsgGUID: r1gVuW/ITfe4dp0EASEJzg==
Received: from unknown (HELO opfedv3rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 08 Jul 2026 06:57:21 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 06:57:20 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43;
 Wed, 8 Jul 2026 06:57:19 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 08 Jul 2026 06:57:18 +0200
X-CSE-ConnectionGUID: +YqEnLmITk6CEjkg93aUyA==
X-CSE-MsgGUID: ilqNr6YeT5SuP+LdWQ8FKQ==
X-IronPort-AV: E=Sophos;i="6.25,153,1779141600"; d="scan'208";a="444347915"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Wed, 8 Jul 2026 06:57:18 +0200
Message-ID: <8e7b71af93abe216c7715fb7394428cc6bf06aa2.1783486638.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX508.corporate.adroot.infra.ftgroup
 (10.115.27.28) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1783486644; x=1815022644;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HKnZYNM/GT+jlppjQ7Nc9A/EUwu8vZzsRRF/+qdE3/4=;
 b=mdkpMmEpAJ7Oq57BYbmSedm15KlBARsSbbJnLUdyWzBwt/9tDWRLuyUL
 /QmPOpEkODwYzUqpkOf51icHrpiBpzcRUlliLqdtvbcs1XYt9wPxGvmLo
 JUPmianLC7Px6rJftbRZJXnhNC6WSUeRB5oId+XDt+JLsr6Us6wBrA74a
 CewPb1dohrHXgoU51mEsDxHN6E6v0GHi8dkTAsyhSu64F+aMJG6g2p8zP
 orGMxDiAZYvdYNrkjq/IFrNkbA2tAPtwugXKiOjPwFHnzwwiuXX1YIrdB
 la+49l/CARZg+lPQKtVTOGneSRY5NoB/QggYuoQS6sfY5VXtyf4bkS9I6
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=mdkpMmEp
Subject: [Buildroot] [PATCH] package/mosquitto: host variant also needs
 cmake >= 4.3
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
Cc: yann.morin@orange.com, Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Commit da9dcddff15a (package/mosquitto: requires cmake >= 4.3) added
a requirement against cmake 4.3 for the target variant, but forgot
to add the same requirement to the host variant.

Do so, for the same reasons as reported for the target variant in
da9dcddff15a.

Fixes: da9dcddff15af3e99cbc20297f4a3d25e89c66e1

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mosquitto/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mosquitto/Config.in.host b/package/mosquitto/Config.in.host
index 39e287ee89..7b94003fae 100644
--- a/package/mosquitto/Config.in.host
+++ b/package/mosquitto/Config.in.host
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_HOST_MOSQUITTO
 	bool "host mosquitto (mosquitto_passwd)"
+	select BR2_HOST_CMAKE_AT_LEAST_4_3
 	help
 	  Only installs mosquitto_passwd.
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
