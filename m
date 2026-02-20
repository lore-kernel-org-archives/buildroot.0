Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6B5C55ABC
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 11:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46AAB83E77;
	Fri, 20 Feb 2026 11:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGOZZnzhRHts; Fri, 20 Feb 2026 11:53:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B08E383E6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771588402;
	bh=QlpSmlHMRpt9kjtTIlBISKkWK44TJ2Gu3lksG3TIUdg=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AuZYTb39+TDbW68IJbiY+PDwX70AKBul+uQ24wbNvZIdNoRtcosu8yU7OLpwLRQqe
	 iGrFJFIgZyAqB0MHTKA4dVOoQHZtzg15bed9lbqJqLsui07Ed2iCzgyXrc9EEbp4Qq
	 bHqFQCQaNX0C1vgVPHMD3R7wk5q5sjKRwzDttM7bzEORqJrxqVOLLzpNISL+L5y50o
	 vl5uTQE3tnHue1dfsjujqtGco3dF7pY25WyekJ7ms27VlqvYPSDb0qbyh7VQc6l4x4
	 xLwT50dOB2VIDLO2dfirYjGrZ5aJE8f7KT8e3nbqPOivGtCov5ZmC3zuAmkn4WY45+
	 5tsBL7xi4EUYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B08E383E6D;
	Fri, 20 Feb 2026 11:53:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 35768206
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B6D760EBE
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pn3vxW5a8m5w for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 11:53:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E5F09605A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5F09605A4
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5F09605A4
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 11:53:19 +0000 (UTC)
X-CSE-ConnectionGUID: xtreiy2AQ1iE78stwcpsUQ==
X-CSE-MsgGUID: p3z5k7q9R7+493I95fSpdQ==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 20 Feb 2026 12:53:15 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 12:53:16 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Fri, 20 Feb 2026 12:53:14 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 20 Feb 2026 12:53:13 +0100
X-CSE-ConnectionGUID: 8NM59tNxQ4yBXpiSZ8NpAw==
X-CSE-MsgGUID: uKU7yaJYSAC/NS49U+U/Mw==
X-IronPort-AV: E=Sophos;i="6.21,301,1763420400"; d="scan'208";a="394526761"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>, Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 20 Feb 2026 12:53:06 +0100
Message-ID: <7fc04c52113b919018377a8f1aadc14697b9d517.1771588390.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1771588390.git.yann.morin@orange.com>
References: <cover.1771588390.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX607.corporate.adroot.infra.ftgroup
 (10.115.27.31) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771588400; x=1803124400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9VZ1muuUGUrqWYYKOREsIoNQHOFszdsP3wu0Hdbh9V8=;
 b=SfTs5Ty7rYust7XgIBNLyDEbmjrqvhAwmYFiJ1eDLKwKMLqXz4Rv+LTZ
 VzmAfELPPS7h12B11ZamvdGhEBJU5m44RbPyg5nPQZ7HVzx/1cHwjOad/
 1jJfbtTxBrnT3tmCFbAmmPKQuVTR5LoKOKeM4VzIdTsGkRm33tGg2DMdZ
 aotV39Csi6He2E5HkWIFGLNOv8ZPY/PyElEFcQO8CPzqTm+bm98m/I+U2
 G1FG8s7CXzSg8i0aC6IJNodk22FSWAqN5MuXUeRv6Y7EulpaTQ6b9E4jK
 kgFKGAUpmfQTJ0kjqNDbxLtM7TJPKhQISFgZMoXKp/g/LjqWU1IuTgI7w
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=SfTs5Ty7
Subject: [Buildroot] [PATCH 1/8] package/cjson: add host variant
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
Cc: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/cjson/cjson.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index cb4525d1a4..fb43994aed 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -31,4 +31,11 @@ else
 CJSON_CONF_OPTS += -DENABLE_CJSON_UTILS=OFF
 endif
 
+HOST_CJSON_CONF_OPTS = \
+	-DENABLE_CJSON_TEST=OFF \
+	-DENABLE_CUSTOM_COMPILER_FLAGS=OFF \
+	-DBUILD_SHARED_AND_STATIC_LIBS=OFF \
+	-DENABLE_CJSON_UTILS=OFF
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
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
