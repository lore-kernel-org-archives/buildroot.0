Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDA3C36002
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 13:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1583F847D2;
	Fri, 21 Mar 2025 13:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6N1aOzluTaRS; Fri, 21 Mar 2025 13:32:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 351DD847CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 351DD847CF;
	Fri, 21 Mar 2025 13:32:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C98FB1A4
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 13:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB062847CE
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 13:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l574SPLbCbjD for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 13:32:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B066847D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B066847D2
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B066847D2
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 13:32:18 +0000 (UTC)
X-CSE-ConnectionGUID: TpRDi8DASQ6VC5zlrc9Hkg==
X-CSE-MsgGUID: NU50t4+wTeGBbsde6x0z0w==
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 14:32:16 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Mar 2025 14:32:16 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 21 Mar 2025 14:32:15 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 21 Mar 2025 14:32:14 +0100
X-CSE-ConnectionGUID: kF2JUo7XR423+hzCG0cLAA==
X-CSE-MsgGUID: 26XmwZrRQrmkLnUAZ8XycQ==
X-IronPort-AV: E=Sophos;i="6.14,264,1736809200"; d="scan'208";a="266226507"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Christian Stewart <christian@aperture.us>
Date: Fri, 21 Mar 2025 14:32:10 +0100
Message-ID: <79e931a36e02632a3fc7d9b40bad7d15f6135c31.1742563913.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1742563913.git.yann.morin@orange.com>
References: <cover.1742563913.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX101.corporate.adroot.infra.ftgroup (10.115.26.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1742563938; x=1774099938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ksJVSJLv520aJwJ6+dxLX2OEmDFP2lNDlVFszMN84HE=;
 b=HyDKsRpvkIGgl6qaYvEWKDlHbE3oglELBVEhUVyQwiWzQOWtl0fnJFWU
 y4rudAl0ygCD2ln+cKEf3y2FM6o40qYZcNwJxCUqf+4UmbcQRjC9rno2M
 19l6GLpf4i/ls8Nn1X7ufyL45rpPC0JZPE6GVgO064mcrFA+PllkxT8JT
 4Z3QfcyeSPYc+mo1U+7HJNRAVWRqcQTBcPJeRkRJtPemNYWU/6XdcUuWE
 rTxY0u9JBTKHa4MUOEt6WLvZs4DWEACvZA7iIkRoOP8CSZ8K4E7GOtH01
 9ZA006n5X1I+SSqhgjdyIQ72wUdySy1bwLf9Cg9Q9T1JkyKk/bf+kXgT3
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=HyDKsRpv
Subject: [Buildroot] [PATCH 3/4] package/docker-credential-gcr: new package
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

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
---
 package/Config.in                                |  1 +
 package/docker-credential-gcr/Config.in          | 10 ++++++++++
 .../docker-credential-gcr.hash                   |  2 ++
 .../docker-credential-gcr.mk                     | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/docker-credential-gcr/Config.in
 create mode 100644 package/docker-credential-gcr/docker-credential-gcr.hash
 create mode 100644 package/docker-credential-gcr/docker-credential-gcr.mk

diff --git a/package/Config.in b/package/Config.in
index 5bc443c1ed..345ce6ff1d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2831,6 +2831,7 @@ menu "System tools"
 	source "package/docker-cli/Config.in"
 	source "package/docker-cli-buildx/Config.in"
 	source "package/docker-compose/Config.in"
+	source "package/docker-credential-gcr/Config.in"
 	source "package/docker-engine/Config.in"
 	source "package/earlyoom/Config.in"
 	source "package/efibootmgr/Config.in"
diff --git a/package/docker-credential-gcr/Config.in b/package/docker-credential-gcr/Config.in
new file mode 100644
index 0000000000..4d399949d0
--- /dev/null
+++ b/package/docker-credential-gcr/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_DOCKER_CREDENTIAL_GCR
+	bool "docker-credential-gcr"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  docker-credential-gcr is Google Container Registry's standalone,
+	  gcloud SDK-independent Docker credential helper. It allows for
+	  v18.03+ Docker clients to easily make authenticated requests to
+	  GCR's repositories (gcr.io, eu.gcr.io, etc.).
+
+	  https://github.com/GoogleCloudPlatform/docker-credential-gcr/
diff --git a/package/docker-credential-gcr/docker-credential-gcr.hash b/package/docker-credential-gcr/docker-credential-gcr.hash
new file mode 100644
index 0000000000..2796b5746c
--- /dev/null
+++ b/package/docker-credential-gcr/docker-credential-gcr.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  126fdbf7351d2c7aaee6c525d9660738519eae53eeef77920b105fd4d1bc5dbd  docker-credential-gcr-v2.1.26-git4-go2.tar.gz
diff --git a/package/docker-credential-gcr/docker-credential-gcr.mk b/package/docker-credential-gcr/docker-credential-gcr.mk
new file mode 100644
index 0000000000..658e9baf33
--- /dev/null
+++ b/package/docker-credential-gcr/docker-credential-gcr.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# docker-credential-gcr
+#
+################################################################################
+
+DOCKER_CREDENTIAL_GCR_VERSION = v2.1.26
+DOCKER_CREDENTIAL_GCR_SITE = https://github.com/GoogleCloudPlatform/docker-credential-gcr
+DOCKER_CREDENTIAL_GCR_SITE_METHOD = git
+
+DOCKER_CREDENTIAL_GCR_LICENSE = Apache-2.0
+DOCKER_CREDENTIAL_GCR_LICENSE_FILES = LICENSE
+
+DOCKER_CREDENTIAL_GCR_GOMOD = github.com/GoogleCloudPlatform/docker-credential-gcr/v2
+
+$(eval $(golang-package))
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
