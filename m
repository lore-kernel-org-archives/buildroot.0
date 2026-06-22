Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C34CDB46B
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 08:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15FED4F08F;
	Mon, 22 Jun 2026 08:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkjuNZXlJhOD; Mon, 22 Jun 2026 08:23:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 047554F071
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782116631;
	bh=8JAS/ZXdCl1AQH8MlvjcHR3Y+IWydo+ctNdJtg0fyjk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=jgIh0b2FpRMW/8mdaPySHAqn347JmgQ+n3rxB601lmSXGRCLj/zuYjNlVb/hTEvBT
	 +7jC1WKfQBF/nb6tzZr2NdRwzs1fHgj8BAXdydwU17JPbok1JzPsLFbood7L0eB4Hm
	 4fx0101JixhFgSf+B0uTSNvgPMH3DAU+z7b2H3W8MAA5wwaYHAmAnm/H9GZ+6r2TyL
	 Dd0SFl22SUUKvcIvJSWQObO+E3NKeKchgJUqDfS7jur1d0V0KfZWnDewSV202r63Al
	 Cs5qUnfWwB+zKqDIT+GQ+hBgcKQHhCM8xIOVuwM0ypOM0S2ycQKFlCvVALZUX23qj/
	 P5OYnSlbvf8fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 047554F071;
	Mon, 22 Jun 2026 08:23:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 600EFF4
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 08:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5148C86471
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 08:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jl8EB24MJf7l for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 08:23:49 +0000 (UTC)
X-Greylist: delayed 349 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 22 Jun 2026 08:23:46 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3544D86452
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3544D86452
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.61;
 helo=mout-b-201.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
Received: from mout-b-201.mailbox.org (mout-b-201.mailbox.org [195.10.208.61])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3544D86452
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 08:23:46 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-201.mailbox.org (Postfix) with ESMTPS id 4gkLfm6L16zDqNm;
 Mon, 22 Jun 2026 10:17:52 +0200 (CEST)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Mon, 22 Jun 2026 10:17:24 +0200
Message-ID: <20260622081725.1187971-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4gkLfm6L16zDqNm
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1782116273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZUDxu190LBfObgeG8Knho8s4/2IjGf1T/bemRrtVzXs=;
 b=RtZtUtrP8Tv2oTIZJypKQcM+xjKJVUDXkdv6/glWgxc941evRLJ6vOeqRplI6b4r+a6YAR
 kP1a4q0yUPOsZ3IPkDq+VfXpn+5SRm4LmODpPE2ujhDAe6GiNoZ7EG4WHJe/ygRArVoKlm
 dFYaK3uWsVk2I6eqSltf7g0FurPmOCDLkzXoZwQc3mpYvzrsTKeglJegCDNyYdAUkzvcIK
 zogxXEsENj+4no7tBcXAhzwZ5HOZ6vF/62s/aBByOMvYPmiRliuG0s9/MPggiCVYBGhAA+
 N1XNu1YDHTRV8nBCZNwiS2GW2SNPBCYcRzUYs8QH8Iw0WLynhwABY0mD3nlYzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=RtZtUtrP
X-Mailman-Original-Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of manuel.diener@oss.othermo.de designates
 2001:67c:2050:b231:465::202 as permitted sender)
 smtp.mailfrom=manuel.diener@oss.othermo.de
Subject: [Buildroot] [PATCH] package/python-gpiod: bump to version 2.5.0
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
 Manuel Diener <manuel.diener@oss.othermo.de>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes here: https://github.com/brgl/libgpiod/blob/master/bindings/python/CHANGELOG.md

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/python-gpiod/python-gpiod.hash | 4 ++--
 package/python-gpiod/python-gpiod.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gpiod/python-gpiod.hash b/package/python-gpiod/python-gpiod.hash
index d3277c5a20..a94bbaffaf 100644
--- a/package/python-gpiod/python-gpiod.hash
+++ b/package/python-gpiod/python-gpiod.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gpiod/json
-md5  c9c2fb67d78204896d85a7945314356f  gpiod-2.4.2.tar.gz
-sha256  602aae17ff365bb8e2a30ce65c6bbf2d8e7a7e64bf016e82e4fd4c730ef69ab7  gpiod-2.4.2.tar.gz
+md5  b9df2fa69d4d7a77b0d5c70ff157a6c9  gpiod-2.5.0.tar.gz
+sha256  53ae5a1f14d6388c155b591ca0fc0cfa73b44d4f6d8d117e8a9e68f5902d187a  gpiod-2.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  LICENSE
diff --git a/package/python-gpiod/python-gpiod.mk b/package/python-gpiod/python-gpiod.mk
index 6881f0df43..592107111d 100644
--- a/package/python-gpiod/python-gpiod.mk
+++ b/package/python-gpiod/python-gpiod.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GPIOD_VERSION = 2.4.2
+PYTHON_GPIOD_VERSION = 2.5.0
 PYTHON_GPIOD_SOURCE = gpiod-$(PYTHON_GPIOD_VERSION).tar.gz
-PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/13/ca/b3bd043091b4462d6c5561f86581f553df102d8990c37938ddbff2823016
+PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/fc/c2/c7bc26965855f39ae3e1b09b404a1fdc3b172dac371012c316f5b9b6a314
 PYTHON_GPIOD_SETUP_TYPE = setuptools
 PYTHON_GPIOD_LICENSE = LGPL-2.1+
 PYTHON_GPIOD_LICENSE_FILES = LICENSE
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
