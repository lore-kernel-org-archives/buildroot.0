Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C01BD2A520
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB2DD4083E;
	Thu,  4 Dec 2025 20:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGymCKXB2rZm; Thu,  4 Dec 2025 20:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB65940857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764878542;
	bh=QYfeiRK/eeAMDExJgG/tLx5JoBlslfxbOMf6uq72NFM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ekZtfCaqBvnTsDJlNX7dfVqIb70h3P3kw3YD8Bohf+b4k673aamH4JKjhvr7BQ+LC
	 G9jAUaGtdCPsSKfy/iJ+zdSOrLmj1O6cG9PkVuYzZnA/mrdFkKb9jmFsYPQuJiHApg
	 3tcpApeJZLSL0VyHMJNgdciITE5L9nRhdNe5E3m0eziY/yIrZSTBOmiRCI21OJrykC
	 d25CVY9kcMtECYgOqKbDQ6nzUI/BpnO/N74ItMEqV4zpOzurQRFcj8Xd1kF5KeTnPg
	 g3U0hHzxhFNiPVUucKbZqZdBip5h/I3E7tG2AxU1DPU50U0NkBMMVu/OX2Y0b8sV2V
	 cyv4TtgmyOU4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB65940857;
	Thu,  4 Dec 2025 20:02:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFD801A9
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95D4861B29
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHg5fLqsCGer for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:02:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4DE3D61B16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DE3D61B16
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DE3D61B16
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:02:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54F90A4C78A9;
 Thu,  4 Dec 2025 21:02:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59484)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRFWp-000000003JX-2SVk;
 Thu, 04 Dec 2025 20:02:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu,  4 Dec 2025 21:02:15 +0100
Message-ID: <20251204200215.2861920-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764878536;
 bh=AWSpdCgimvIV0/uz75f6fR7TATwU/bJ3niGfLTsCjvM=;
 h=From:To:Cc:Subject:Date:From;
 b=gd+vc2w2L/9UKAg4NWNw5Ji84HlOjE0QUfXeCT8i6c4dqLjBtivet5mV66Jt5EHHD
 y0sHEqA23hZrBZvK3e99mlg2rsuS7XQ5BAswIZISrViiBTtU/bvUcNfG0LWB4aja2p
 bPUSNB0Hli1pVepXH5xBCLF9xH1FSGeGmOnD4HyVM1ok8ZBfdpEhNNj2mTxdDhDvl/
 3VcOfDx9r5CEG9qFUJvTt8Kn+zjdKsAMm4WBqRreT7H7mqu1WO/a3ghgLQ6GF6E3X+
 ieOpmcsBj3ifCBCeCu4TkMQtEUx4IfNZan49ECYn64I3xh7gMaKzWFLZulKyf1+G+D
 EMDxyQMgLmblA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=gd+vc2w2
Subject: [Buildroot] [PATCH/next 1/1] package/llama-cpp: bump version to
 b7271
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

Release notes: https://github.com/ggml-org/llama.cpp/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llama-cpp/llama-cpp.hash | 2 +-
 package/llama-cpp/llama-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llama-cpp/llama-cpp.hash b/package/llama-cpp/llama-cpp.hash
index 81ddf4508f..765025f180 100644
--- a/package/llama-cpp/llama-cpp.hash
+++ b/package/llama-cpp/llama-cpp.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c108fadd61d34da6ff2cfdf085821ff03a45acde2245d9eeeba9358482b305c3  b6865.tar.gz
+sha256  b2c4c89b6282c4ddc7c9c00c79af77d84811b6092aa47838a194e8a2981fa104  b7271.tar.gz
 # License
 sha256  e562a2ddfaf8280537795ac5ecd34e3012b6582a147ef69ba6a6a5c08c84757d  LICENSE
diff --git a/package/llama-cpp/llama-cpp.mk b/package/llama-cpp/llama-cpp.mk
index 7554d80a1e..5112022656 100644
--- a/package/llama-cpp/llama-cpp.mk
+++ b/package/llama-cpp/llama-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLAMA_CPP_VERSION = b6865
+LLAMA_CPP_VERSION = b7271
 LLAMA_CPP_SOURCE = $(LLAMA_CPP_VERSION).tar.gz
 LLAMA_CPP_SITE = https://github.com/ggml-org/llama.cpp/archive/refs/tags
 LLAMA_CPP_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
