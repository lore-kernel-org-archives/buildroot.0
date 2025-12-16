Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FCED637B3
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 23:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A902660781;
	Tue, 16 Dec 2025 23:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRO7BjCgbROp; Tue, 16 Dec 2025 23:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A2CA6072A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765926912;
	bh=KMWOCT99Re3EgIjXrCoUtHCVFekL1KzrfksYD4GXX+I=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=fdpDIiJDCUn1k2vNg0wNvW/6EMohp+ZwgUfsxvTgUBCJxPLMJdKDKkJstuCcMop3Y
	 YS4Ch+uVr0UhxKg1qWW4ckbKrSNy0S9+T3MtMNatK9Zvn6qJTwa1jthoP0MXruzooE
	 YbjegvhlASSYwQKfOJfkDTtRZbK9G5yOjJP6PL2/lN/cJrVc+gcXNKlu3gBVDih6e2
	 7rWW8JkFYVd7uzecd+FyPCknu5J9CxULd0UrZbelOYe0Xb27FnsRC8+iq3a+59TkAr
	 PmIN2wgz25lbmo+sNvfCvxVUywPXCgm+tuQPrYt0IKeH76lUsoG0sazB+o15xWtd2Y
	 oPjDd7ZSdw0qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A2CA6072A;
	Tue, 16 Dec 2025 23:15:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C516E372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 23:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5E0582333
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 23:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iur8ncCSorcE for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 23:15:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2672182304
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2672182304
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2672182304
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 23:15:09 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6DB4319F57B;
 Wed, 17 Dec 2025 00:15:05 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Wed, 17 Dec 2025 00:14:43 +0100
Message-ID: <20251216231456.347739-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765926906;
 bh=V7KnnWkzWjm7MNmwEEsfpFsJ9jN9mwSPBHuC3btnOTc=;
 h=From:To:Cc:Subject:Date:From;
 b=IuBYaLs8ITwkY3LgxyCSWJ+47bW2KfL1dvIYY1l+XScTUIeB+Q3LQQiOT/IaPV4FT
 rJAV93JPfeHNtEhA+zhO2Um52IalwTcfMSKtjKYTgcuFIz2HgRcO0LHovO7EV69EH/
 7ULjGbW/Ri8imyHc84dJ1nZXOijO9qR4wXc9bjfukAerNXv0Q+CdGadHj3d7fbGQiu
 fw0cRxa/AF+8/Dk/KCfe7T0drLmXP1ncqJUdD96zQBtWMZ4S57gnNTfEhZRDTLaE1Y
 oC/OFnEOzHi2HaQ3Tn6llFhPbhqfdrMV4VKjmrPQKY2uvgeLvVkmunst0FJJb35b9V
 7NDR8d5b1reqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IuBYaLs8
Subject: [Buildroot] [PATCH 1/3] package/kvmtool: remove unneeded
 KVMTOOL_EXTRA_LDFLAGS
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit [1] "kvmtool: bump to f77d646ba0" removed the
definition of KVMTOOL_EXTRA_LDFLAGS but forgot to remove its usage
in KVMTOOL_MAKE_OPTS.

This commit removes it since it is no longer needed.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f20615b53e83d6263346cb038d59df8e8d6b2b74

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kvmtool/kvmtool.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index f5637e5384..58ca2d3642 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -22,7 +22,7 @@ KVMTOOL_CPE_ID_VALID = YES
 # Disable -Werror, otherwise musl is not happy
 KVMTOOL_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	LDFLAGS="$(TARGET_LDFLAGS) $(KVMTOOL_EXTRA_LDFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
 	WERROR=0
 
 define KVMTOOL_BUILD_CMDS
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
