Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45950C44501
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 07:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D37B180DE4;
	Wed, 15 Jul 2026 07:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0qcYPAmpb4BB; Wed, 15 Jul 2026 07:02:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDD3980DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784098974;
	bh=g/kCASLFWdO4wtJsJEaflyf4FHm98lwUnqEC+/X8dig=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Et2CwnjRzwGCEGHrEI+1Qev+nJbeNQiPn1YtnOVV3ifogsLO+fb4yTYEUMTAxrlm3
	 7jlO3eAk66xiLVR//d1eaNgXh/wKH7FGcuRq6MCczL4kIkhGRzIvuAFl+pJXilaUmk
	 bR7KSS/dAWngiS/q/CeNWCRFS4buzbl6n9fACW2HjgtjeILeADBA+tFOb+7NwZWcl8
	 FwwXUT3g/YDF3hpBHB4DORJLg5TzAqctL3BaLKrXtHXqEdbU4ztu+3gzDzK6uYeoZN
	 6hYwGYHedKqcYj5gn/kGXnIsv94UjJESZbWNOXuXNA1srPrtncvUt9XoYHTSRlmQw3
	 hjR/TyTNixy4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDD3980DE5;
	Wed, 15 Jul 2026 07:02:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE68A203
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 07:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D063F4069B
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 07:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gepbg5oU7olB for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 07:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51F6240696
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51F6240696
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51F6240696
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 07:02:51 +0000 (UTC)
X-CSE-ConnectionGUID: iuAj/yAdSOanRppGQHWAwg==
X-CSE-MsgGUID: qb8sXAK5TmyFyIksABAEUg==
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 15 Jul 2026 09:02:48 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 09:02:48 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43;
 Wed, 15 Jul 2026 09:02:47 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 15 Jul 2026 09:02:46 +0200
X-CSE-ConnectionGUID: l8IAy+cuQH+za1NF2kWpdA==
X-CSE-MsgGUID: sVQTBC0dQgCQveedRAhpwQ==
X-IronPort-AV: E=Sophos;i="6.25,165,1779141600"; d="scan'208";a="446520002"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Wed, 15 Jul 2026 09:02:46 +0200
Message-ID: <3c34b47f04166271550dfe7ec813323c7f69a2bc.1784098966.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX606.corporate.adroot.infra.ftgroup
 (10.115.27.30) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1784098972; x=1815634972;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t5sAhaYaRMO1OLaTAIptPXt4SiVUYfMgryV3qGOzIY4=;
 b=LVEGyq28w3qk7nDau/WCZ5ffmyAIPrj3CD4a9N8ccNIJXZhEFLXZ53qr
 nsiaK7nL8zDLzF3+pkojEajvhIcjEZSG8EdMoYLn+qCvVLcnqabWOtPxX
 M76xfn9oZNzlC3a/jksqVdxZC3o9fXdFG1N5pHaAS3HfU6fm/Yoc5IE0z
 T5RdweDdV927y6S7olBX6NWcTUY2pJeYnE3rSsB4NRRkcnNOq0HI6TgSF
 U615rB3Ei10CDB/4fXoOKcZFdAiuZ6juGyeE6OErjy8cwmJk8kt35YtWD
 iQ4ntVKtfqFCHsahxdrNbk4YuWk0Anmc6HHMrretkOUfACwh780mZvpfv
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=LVEGyq28
Subject: [Buildroot] [PATCH] package/.skopeo: bump version to 1.23.0
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

The go-mod has changed with upstream commit 870378ba1685 (Move skopeo to
go.podman.io), so adapt appropriately.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index 20ceebeb8a..abd68d13f7 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b6e1f208c1048f7a80613e8154774e6a3fdc891aeb45325c8ed905be4dee48d8  skopeo-1.22.2-go2.tar.gz
+sha256  de96bfc2bb523c852af675ffdadd934484812ce190aa8620e1d5fd6c51442e25  skopeo-1.23.0-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index fe9becaaa6..c2fe201c7c 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.22.2
+SKOPEO_VERSION = 1.23.0
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
@@ -29,9 +29,11 @@ HOST_SKOPEO_DEPENDENCIES = \
 	host-pkgconf
 
 SKOPEO_GO_ENV = PKG_CONFIG_PATH=$(HOST_DIR)/lib/pkgconfig
+SKOPEO_GOMOD = go.podman.io/skopeo
 SKOPEO_BUILD_TARGETS = cmd/skopeo
 
 HOST_SKOPEO_GO_ENV = PKG_CONFIG_PATH=$(HOST_DIR)/lib/pkgconfig
+HOST_SKOPEO_GOMOD = go.podman.io/skopeo
 HOST_SKOPEO_BUILD_TARGETS = cmd/skopeo
 
 $(eval $(golang-package))
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
