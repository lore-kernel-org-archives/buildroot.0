Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C03D2FED9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jan 2026 21:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29ED64077F;
	Tue, 27 Jan 2026 21:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqSIgAwvtV-A; Tue, 27 Jan 2026 21:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FA15408CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769549490;
	bh=7CSQ9c/LyTHYTz/G9c+qHmC0/s24lHuzN+tr/BxRt1k=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Oj8QkIGSoGCsmgLdI5fh7nYmmstEt4+WFfkq+LobeiVJsz2g99pAEw5/VeV/niSz/
	 6BK/mYb3qR3xwoyjf60g9ap/2SLkzOcXlrqi+obxrAG5sCyY+PVvMMsnCCNiw/Yygc
	 yv+U/l3bQ+X/UofvdH9r8D1eu9KJWZueDkWvZYG/246S4ZwGjcxun9Rt0vJ6dC7LLI
	 ORur26BuD3LhJV02AIIKr2ADX3Z3YxO8jn7cNoMa8fGjoGj3PGAuoZz8rKWUWUOXKP
	 pm71nc82wIOTjqjh0Ff9uml8D/VGrzwlcMqOKelDB51BYX+Sn0SvJYZXX+eK4Njjkj
	 sv9aFltZk7q4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FA15408CB;
	Tue, 27 Jan 2026 21:31:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91D56118
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 21:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B6848137A
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 21:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KS4Ypz9-g-KW for <buildroot@buildroot.org>;
 Tue, 27 Jan 2026 21:31:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 358DD81351
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 358DD81351
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 358DD81351
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 21:31:24 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id kqegvL1FaP2aDkqegvNGuE; Tue, 27 Jan 2026 22:31:23 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 27 Jan 2026 22:31:12 +0100
Message-ID: <20260127213112.1668038-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfB7RZn1xZmV3mUVSNn7SZkvy2wZTE8Fl6ZsZrV8vB6CYEsgqxfYeqqZZILUAqmv7OEJeshBvWsCfHwGejq1cE3x2j8c9y15tcDJEImYW7VABXHvMriDc
 l0iPru0HGE6sXB6Dd6rJuqo0jVRxYrjLZUo2Uq5T+ZZQn1Ukp0QfUp0s3z0qC9K7YjSDjam+3zoZbPcXCleta6n/l1gZ3xdvHQo76GvpCNJjewiGNpj3AYvc
 EcvihxY7DUoe2AKjg0c4+DdAABph5MFaFDbMbzsQvXY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1769549483; bh=pl64xKsv96NhJMv6ylFaq7FUS485ImEss4c3ti6lIek=;
 h=From:To:Subject:Date:MIME-Version;
 b=F29M/xz1PgZPqKApCAmM9tyrXQDO/KJCXHZnB6+zImToqRKW67HVtclcmaDae6iNJ
 gGzhoZ2KWU3xfaDcYQqFPCURFvnlLMqCmDjfOmBQ8ftf9rvToycIBjb/4QTnC2hB1u
 WZhoY3C365j8Vx5TdrVl07wjQ1My0TmM9uHQqnCvrUTjtqgUwO1cnm50G7zg4BGUjs
 xEowkSakaNHqCPhj+/exSSjUpQs+7cPiulm7O2cjfftyfYeDbcwQlXJydoSXjfx2bL
 g/BrvzB2lb1Qo/RrkPAxguiFk84l6TRcgUAk6RpkyxbqHpb8KMCtWa2EUndwb81J/D
 IM+/Cxjbgdl8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=F29M/xz1
Subject: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.4
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

For release note, see:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.4/docs/v2.8.4-ReleaseNotes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index bbc9171e77..49126a4a2f 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
-sha256  4a8a23b8b9d1a3250452e40acead4421a03e45a38954ad0595634f4266aa800f  cryptsetup-2.8.3.tar.xz
+sha256  443e46f8964c9acc780f455afbb8e23aa0e8ed7ec504cfc59e04f406fa1e8a83  cryptsetup-2.8.4.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
 sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index e8f2f1673a..6be05e6457 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.8
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).4
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
