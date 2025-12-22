Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACBCE674A9
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 12:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD23781E5B;
	Mon, 22 Dec 2025 12:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dP-LKE1aTjHF; Mon, 22 Dec 2025 12:52:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FFD581E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766407932;
	bh=je7nJmfC3mlVJhE3hkxX+jYdquJeaEGvtE2Frcxb6dU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=s4nMbvJbj0OyI9gVNGbmRPi70FSIxrFlwq7c0PMs709XM/Q6Szf9UXsfxMaP88kYv
	 ZlOvRclhROjhTzI4Gmf5iD8w1YeP/eUe2gBuNMyIyQaClM9md6LZ12B+h9R40iJUAo
	 Vp/+6sHHqGMdZyUIiS7KEXj+A0yfd5CfAGH8db+4as1wGFF+yP8P2w4WkbuLin8rrp
	 U0Nonys+ixqaPK+wA2gp9nvbdnY+ruG9CFyUZ1G9lW9zGz5pVtyescwi+DatGRMALi
	 hinZWRHJuSq95g+wGDNMT+fQY4V6WFwlvCakEhYr53VZgvBXXok4FDzDe0STOTFlxd
	 dslkm+N8B6+8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FFD581E74;
	Mon, 22 Dec 2025 12:52:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 467D4BC
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 12:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BF5181E5B
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 12:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZL2ff9ycZyJ for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 12:52:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19DC281E55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19DC281E55
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19DC281E55
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 12:52:09 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 4F8D52C80CD5;
 Mon, 22 Dec 2025 13:52:06 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 22 Dec 2025 13:52:08 +0100
Message-ID: <20251222125208.83961-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1766407926; bh=bplVqcFYbo5g5X2+qRVKiI40mudCmAvV235VHMRjVVA=;
 h=From:To:Cc:Subject:Date;
 b=E8TKLI3zIdVSm69UR0vj1CN3UauVfk817NIWXDu6iw5dMFLFHoC9jNAzBd77QYhve
 ESpPltZndycCv9NxHoXBd2E8IaGqRstLnzcQsXnFdQOGWZZc30Tzf2m6LkggSn1iej
 0WnaqAwbekbLdxDjz6+DuX6Pp1goMAN49IA2Hp70euKJ8mmqySxyNjrV2WaXBu/ak2
 5c7Wvz5omXsz7azMdFe5P/vLgfWQ3tHXn1HhCRa0f+bb5HhJUcVNSRUL69+xrT7EGc
 FfShhysCBKQ+uY7xRYjFXciJ4oBtW07RpaLOPTHDjguOV8F1yBn7Mpc0jqf3mjGYG6
 Qud9GCkUNqWXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=E8TKLI3z
Subject: [Buildroot] [PATCH] package/python-apscheduler: bump to 3.11.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
https://github.com/agronholm/apscheduler/releases/tag/3.11.2

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-apscheduler/python-apscheduler.hash | 4 ++--
 package/python-apscheduler/python-apscheduler.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apscheduler/python-apscheduler.hash b/package/python-apscheduler/python-apscheduler.hash
index 55026aec7b..c29064c590 100644
--- a/package/python-apscheduler/python-apscheduler.hash
+++ b/package/python-apscheduler/python-apscheduler.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apscheduler/json
-md5  ff8d1731e31d88e2e1fd0794099c920f  apscheduler-3.11.1.tar.gz
-sha256  0db77af6400c84d1747fe98a04b8b58f0080c77d11d338c4f507a9752880f221  apscheduler-3.11.1.tar.gz
+md5  22f9437792d120a17dc4154b5ebd1594  apscheduler-3.11.2.tar.gz
+sha256  2a9966b052ec805f020c8c4c3ae6e6a06e24b1bf19f2e11d91d8cca0473eef41  apscheduler-3.11.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE.txt
diff --git a/package/python-apscheduler/python-apscheduler.mk b/package/python-apscheduler/python-apscheduler.mk
index b03022149f..0b66bb83c2 100644
--- a/package/python-apscheduler/python-apscheduler.mk
+++ b/package/python-apscheduler/python-apscheduler.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APSCHEDULER_VERSION = 3.11.1
+PYTHON_APSCHEDULER_VERSION = 3.11.2
 PYTHON_APSCHEDULER_SOURCE = apscheduler-$(PYTHON_APSCHEDULER_VERSION).tar.gz
-PYTHON_APSCHEDULER_SITE = https://files.pythonhosted.org/packages/d0/81/192db4f8471de5bc1f0d098783decffb1e6e69c4f8b4bc6711094691950b
+PYTHON_APSCHEDULER_SITE = https://files.pythonhosted.org/packages/07/12/3e4389e5920b4c1763390c6d371162f3784f86f85cd6d6c1bfe68eef14e2
 PYTHON_APSCHEDULER_SETUP_TYPE = setuptools
 PYTHON_APSCHEDULER_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_APSCHEDULER_LICENSE = MIT
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
