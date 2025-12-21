Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7205EE67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 428EF80AA3;
	Sun, 21 Dec 2025 22:31:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gju56MwMej9N; Sun, 21 Dec 2025 22:31:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D49D80A57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356268;
	bh=At3iXyQMRPcT4iSvKUU3RGPW/kLax+Qtq6DEIxDLM9Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=C/173Tq6qU4zFMSmJSAnucNOA/lqMQ9xbbYCW2pHsv8SyLkMSptFIRkWymLu6rkGJ
	 jCmVhdAyR9I5AxV6T8N8Tp/wWLADEnKgEC5jAgKcPijwG/ijerxCeuB/BkMgwAAiU0
	 CnZ3XCcQZx4XvdyRjTpH+CrVMgIzl+OHCBmpe2F9f8YiMCf4dnyHakmP3cjtTTLPSc
	 HApRaq2LR750zJ+kA7RRio9F8MA+TjiGG8l1f+TRfY+izYyRk1Vq/spKjcffjN5yuk
	 eSpIrCOjlLL4S1+xA5IPQ4S1jgGHXEEMWaQ6sT8pQVJDcFdryry31R7vNnAl2yGsdF
	 SPrhGuAJK14Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D49D80A57;
	Sun, 21 Dec 2025 22:31:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFC7D195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A69E0402AF
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 34dAdKNqKoIJ for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:31:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9CC5B402A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CC5B402A4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CC5B402A4
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:31:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51618A4C4E18;
 Sun, 21 Dec 2025 23:30:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46252)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXRw8-000000004xC-4512;
 Sun, 21 Dec 2025 22:30:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:29:57 +0100
Message-ID: <20251221223000.184312-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223000.184312-1-bernd@kuhls.net>
References: <20251221223000.184312-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356202;
 bh=IOckfNjqKnhe1djvNQ93iJrusAXQLW9z3MwmdM0fwNI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nZrmSEeT3YPan/rBd5COLbjf8iUNjFo3Dan8loXM1k5v6lAuPTV8WNLWkZVDecDhe
 NyQLW0Zdiem6Srwndju8/PhZ85IInPO/sC9tkgwmFlDXQjlxXvEpVbFt2zzk2KyuhC
 m2wy/lmenOSdQQYNKgrNdi0lOSTgzYyol7zVzoOav+0E+ZBdMyHSDaSji75f6px3ya
 ejI9LOJCt0EJAJxBiopBlEw8qCmw9zlSJUixtPV2lLG+LB1IL9WlrBCfxzlDG0y6Sy
 BM3TU8UuoZyITI9Ol7qTkZRoTgyXWnWaowKg75fMuCuO6q1G/IXpB7vik3vpDgIoy2
 9ErhOn23/yTkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=nZrmSEeT
Subject: [Buildroot] [PATCH 4/7] package/python-proto-plus: bump version to
 1.27.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/googleapis/proto-plus-python/blob/v1.27.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-proto-plus/python-proto-plus.hash | 4 ++--
 package/python-proto-plus/python-proto-plus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-proto-plus/python-proto-plus.hash b/package/python-proto-plus/python-proto-plus.hash
index b55ac8bca0..d5d4270293 100644
--- a/package/python-proto-plus/python-proto-plus.hash
+++ b/package/python-proto-plus/python-proto-plus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/proto-plus/json
-md5  631b92558563874de67630333450e08f  proto_plus-1.26.1.tar.gz
-sha256  21a515a4c4c0088a773899e23c7bbade3d18f9c66c73edd4c7ee3816bc96a012  proto_plus-1.26.1.tar.gz
+md5  008448fc31ca36c2a9185a070126e16d  proto_plus-1.27.0.tar.gz
+sha256  873af56dd0d7e91836aee871e5799e1c6f1bda86ac9a983e0bb9f0c266a568c4  proto_plus-1.27.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-proto-plus/python-proto-plus.mk b/package/python-proto-plus/python-proto-plus.mk
index b024e9952f..3d02dd321f 100644
--- a/package/python-proto-plus/python-proto-plus.mk
+++ b/package/python-proto-plus/python-proto-plus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROTO_PLUS_VERSION = 1.26.1
+PYTHON_PROTO_PLUS_VERSION = 1.27.0
 PYTHON_PROTO_PLUS_SOURCE = proto_plus-$(PYTHON_PROTO_PLUS_VERSION).tar.gz
-PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/f4/ac/87285f15f7cce6d4a008f33f1757fb5a13611ea8914eb58c3d0d26243468
+PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/01/89/9cbe2f4bba860e149108b683bc2efec21f14d5f7ed6e25562ad86acbc373
 PYTHON_PROTO_PLUS_SETUP_TYPE = setuptools
 PYTHON_PROTO_PLUS_LICENSE = Apache-2.0
 PYTHON_PROTO_PLUS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
