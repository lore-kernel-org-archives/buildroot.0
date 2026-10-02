Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5099CA5FE4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 20:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B38981342;
	Fri,  2 Oct 2026 20:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8yWOT3LETlG; Fri,  2 Oct 2026 20:55:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2927B81372
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790974529;
	b=LDMu5rBjjtwDouxGJK5uz7r3cWo3lrWq2ezVwVC9sEytbE/cObB40kozCHLOFnnlTP/N
	 dRC9bKIQxzkDC/93UckXQxNwvXNjgH+x5mX0ddxg/EAqhEyuWzUFsvwM5fxQRmVVelXHl
	 nYKCe+ohP09Je2jArSVa3vPl/x4V+vu99h9neJEwAQjNh0XGnFOC0K44Je+oYP8lSvJcF
	 ieJjOa6gT8CIi/ehLkoKFv/oU5/RGtbHtjfJBCK4+JBX6GtJo0oPjJ8aAVKMH616IOo1P
	 EVIGwLxhhC7MUvX5iGrtwzMCkMyZFjr1R1+wDc8P3otLl5zqd7yVI2dcEMlKb8tD+DA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790974529;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=/PtKZAEHJGe3dhQAI3LMCK26Zdtrm8G206sBUxO8RJQ=;
	b=tbX5Jm7XRZDV5hH54sqbMgJd4w/41ulUyB+ICf8vYzylOIDStRiwAHQBNgPKsZ+IwKcO
	 g3vbqKaotY3NazwzaG/lq//a52GVwNhNhpLiSwJCOqlpXhWhsCW0jXLyq+VkAjIhbnBG8
	 +t0UGU1/yqQXGGLIznDi0YPCqEE2RIxfeBSjego7a6vGVeB7uJ5usXtmVZ3BLIFq0W2B8
	 a05UUaUTLPiai/RuVR27yB5EmcW2FZaw5IQH0bZiLkPTLZOmsHXCrxF3DD3zFljGpJLaE
	 2T9UlnEu4VTMrZMfN9mRMNDD9WWi7h5Z1oOQ+BoaZS4T1O8jP9Bkdzbu6N8P/oPfQvA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790974529;
	bh=/PtKZAEHJGe3dhQAI3LMCK26Zdtrm8G206sBUxO8RJQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SJZ+JnGcnaceXlkt2zi/iVGWpOC9JCWN4FN8VMpaU7W2+5+/GVB75zlGDGGglSTMf
	 LYdVDEB+l2sn2RBOrP6AkCxUziQabd0pMw7GzdYV9tfPL55CE5WWEuHdU2qWyLRqQ0
	 901XVLnNHHywf3tdnG+u+HAlKEGustPL1QXq6OQQqQEr2hDXiAKHlc4vVSVGLM1zqI
	 HSzsSHYwc5IilK4Ud3mmDY+ioYIo7k+eu75EabUSHlCTrNNPFit2e04NjgEZHtHBMz
	 T2AvlKEFJNGCPxGH9v78KMciTl868pUpwehuJL+uLS9vSnHcgTNOKo4pgoNo5CYXG0
	 o+8Ag2s5mj5sA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2927B81372;
	Fri,  2 Oct 2026 20:55:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50AE034D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17C5C40E0E
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 09_SrZBuHjUo for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 20:55:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F037A40E01
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790974526;
 b=M/H0JyWe3Uc+gi8t/MCmArTiW+rp9yKcByXCnAfroX4i8D31wrlXZjjJJxPcOoT+7Wfz
 lEJPO7RKymZg2Vp5j37BJIlL1b9yBInV9JKON30BM7Hh3cW8ryINwwbQ3C2Lb1KQKM54+
 CTI2xNzmt6qLyGmC6ITIwuLtIH4+RpzpfPZ2cTR5s/f8oeau6FzONWlD/3RwkvzBQyifN
 zfFypcM9xiKM2uKTdX1gzAnczrpOmikSEwkB1nbMuKRDRhTfv47ybhK3/r19jiiFwlOsv
 8Rw9creuIKZ66g434kcck0tbVsXq69nD9JFXysXSr7IG+YQzrF5pYElkK8FjeAPooXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790974526;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=aMsZM5BN83RYNzPFpUb/esjbTayNvQ6/MSv0oOIFF18=;
 b=Oi745FdPzdblIoiGQoJPnyXeG4U8EyNx7A3ktncVhXFyKPJC9Ngiltd3b8r8pHgSorIi
 KLmcU+Ne1puC7dpd6hiCKSqg/czvOr8+EEbMyp56wjUtq6AYv5uvFN8mxgnV1xNXnv2Qu
 bOaik4YXEN4EQzNWfskhQ2RRXQ0qdgppinuRqlV+2RtGzCXPpbTcYG5I0B+3dRuS2+T2o
 222vUmrz+StCxC6rYllNxhhLhq6Ng15CWIo7if0V7zsd+shULkJgXZhnbmytbeoCTeRYH
 qgtsxCEseZE3vmC2xwU68nTMO3OPtzbaAeYrJHK3OE+TdLyZwx/DbHHgRDipJhyO8zw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=AInOawAS; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=AInOawAS
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F037A40E01
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 20:55:25 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-6dd7070699eso156880eaf.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 13:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790974525; x=1791579325; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aMsZM5BN83RYNzPFpUb/esjbTayNvQ6/MSv0oOIFF18=;
 b=AInOawASSNOplXL2P8Zdrd8TxinLATRUFVR55dSiczn/rwoij4LdSRQFbhc6cVKASq
 1WnIiAjJ6TbgA7qHBI2qbfcMCkSR6kYbl1Qs66x2Y8UXrJ1gA3ejDCQNLaveXsUxM8D5
 F/TT9erx2QrIXtOpum3mIgMDxSwUlS3jvecqZEpR8NTwX/qyFagB6SogqFlmEDcXMTA3
 cwJdsaVJjQj0lM/VpuNXOzlXonD8F4ypxWKkvw35lTu94LOFpiaQvDN5xoUB4h5kBNNs
 TGRoPMsNpdNwAwoJ/0VQep9bp8XEiFZgQX+gjRa44ALmYhiy5mMEQCtSUgCtTfNGm8la
 0aYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790974525; x=1791579325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aMsZM5BN83RYNzPFpUb/esjbTayNvQ6/MSv0oOIFF18=;
 b=pv0GKX3EItNksZeE1auewS32Ns1bdzvYpnhP2lAi8f+OcB6yIY6w9o7oO7y9OvR5eD
 mjHdfQ14ohz6Z8E4DL7dDQqpX+ncm/Ub+5CjFdnFpmQIPvG0bsQPusyn4IeEOX1SiZ1A
 VqvLqJXn/MCuhImtm8uAS1EvdOcVHPLrjOpCzmsf+6vsntBsR6d/42ag6NHUDqvTwSQx
 AkL2y1+xUWqEES5mqd7tbnABeFLkaissUccO15hVLNpAGcHyRMDhJOhJtj2bWfd7OuaL
 NOLoQE2CODUz2M/MWKpq3Q5BAS2O9MHFuDJYBuhLDKO5GA+J0rpbNS1SbPqn5Zo+MwJ+
 CoLA==
X-Gm-Message-State: AFuF++kRxo2iyzA+DhQ7X2xajJ4o7poateian0cQuboNWb5jaUVxag01
 STVKpJ9aW45KLwkSVyPPgw2wJvQjbf4PwakAlUJFNkqvfGQrPjQALhGpTNsbRQ==
X-Gm-Gg: AYBFou0cyauwLBFHNamnihqPAX7LsbRl1JieF3TmfwMf/kQntoeInqcLqOu+rgqZGA1
 +XkX8N+xHvh1q2Fp/AiSnqv7wOLM58TL0w8AuJwgWBP++assrFlHdKHoLCGyLsejY+9vAKCPNrX
 GXOynFHr3VWQQY5O/q+MDRPpWaXHuYLMWe5o3TtZXweXqatQhwX4fM9/HaSzRwjudpB6a8G8AsI
 6BpFzFZCABbcXcvjxhC5KAFoWCI6d7ejz1drbwN7mvqQnM6YDmuCr1mhGNaAcEAst7dr/WtJuMa
 Zj6CcSkxHFMPaQqys/LcaHYG4wf8v9fjSxwLFeG82KL7tZn7Y7hP8qWO/bYa/atnFs7iVh8e9nj
 Aohn7dFt/FUgijwYyh2pfBgN2vh14uHhBM63+TKvqdnnvaSacDh7BDLZ+NEaln5vhdF/Q41Eafn
 bsNxdkkuWnzk7BeA78laDYshR30RplNKs/pVsokUtH1qnymM6/5dXyhe4a5X5Xw7hDM4QD8U22W
 6OF/viOp6P3yBimNqW3f44iYgCjVmgF+WXLsyUauRxUnD5xCJHe0arj89ZO/L4DbwRTLB/7iSsc
 zUo9b9zBxDGhk+uIe7PFS53fSp726qegxJnop9+5krmGXHo+daOMBbEwqEun5CdXsGvVh06P2ol
 nT5PHoe+CRiGsvKJD5dO5PLaZ2GA6N1+SK5EpJyPo9Q==
X-Received: by 2002:a05:6820:2006:b0:6cd:3ffc:e32b with SMTP id
 006d021491bc7-6e09eb5e490mr374236eaf.73.1790974524673; 
 Fri, 02 Oct 2026 13:55:24 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6df3a9b0f1bsm3197929eaf.7.2026.10.02.13.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:55:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 14:55:15 -0600
Message-ID: <20261002205517.4043570-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002205517.4043570-1-james.hilliard1@gmail.com>
References: <20261002205517.4043570-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/6] package/python-truststore: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                |  1 +
 package/python-truststore/Config.in              |  8 ++++++++
 package/python-truststore/python-truststore.hash |  5 +++++
 package/python-truststore/python-truststore.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-truststore/Config.in
 create mode 100644 package/python-truststore/python-truststore.hash
 create mode 100644 package/python-truststore/python-truststore.mk

diff --git a/package/Config.in b/package/Config.in
index dcca214383..0c9d66f462 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1483,6 +1483,7 @@ menu "External python modules"
 	source "package/python-treq/Config.in"
 	source "package/python-trio/Config.in"
 	source "package/python-trio-websocket/Config.in"
+	source "package/python-truststore/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
 	source "package/python-txdbus/Config.in"
diff --git a/package/python-truststore/Config.in b/package/python-truststore/Config.in
new file mode 100644
index 0000000000..48fa79eaef
--- /dev/null
+++ b/package/python-truststore/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_TRUSTSTORE
+	bool "python-truststore"
+	select BR2_PACKAGE_CA_CERTIFICATES # runtime
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
+	help
+	  Verify certificates using native system trust stores.
+
+	  https://github.com/sethmlarson/truststore
diff --git a/package/python-truststore/python-truststore.hash b/package/python-truststore/python-truststore.hash
new file mode 100644
index 0000000000..6c18984eeb
--- /dev/null
+++ b/package/python-truststore/python-truststore.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/truststore/json
+md5  d66211e2bd37f6852bd6009728170313  truststore-0.10.4.tar.gz
+sha256  9d91bd436463ad5e4ee4aba766628dd6cd7010cf3e2461756b3303710eebc301  truststore-0.10.4.tar.gz
+# Locally computed sha256 checksums
+sha256  33be7b7e8fa4fd19b1760e1a8ed8a668bdab852c91b692dd41424bcb725a9fca  LICENSE
diff --git a/package/python-truststore/python-truststore.mk b/package/python-truststore/python-truststore.mk
new file mode 100644
index 0000000000..5ac2a6b563
--- /dev/null
+++ b/package/python-truststore/python-truststore.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-truststore
+#
+################################################################################
+
+PYTHON_TRUSTSTORE_VERSION = 0.10.4
+PYTHON_TRUSTSTORE_SOURCE = truststore-$(PYTHON_TRUSTSTORE_VERSION).tar.gz
+PYTHON_TRUSTSTORE_SITE = https://files.pythonhosted.org/packages/53/a3/1585216310e344e8102c22482f6060c7a6ea0322b63e026372e6dcefcfd6
+PYTHON_TRUSTSTORE_SETUP_TYPE = flit
+PYTHON_TRUSTSTORE_LICENSE = MIT
+PYTHON_TRUSTSTORE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
