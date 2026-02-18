Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B246E9A02C
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 15:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C18381113;
	Wed, 18 Feb 2026 15:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRQw4kNg5vSI; Wed, 18 Feb 2026 15:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C531580F62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771427163;
	bh=SKBW1EJIYaXoSLgyUVPB0N82Fn5sVl5+S3iNWSZrfCo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=pK7Hmzfr6F2NHWt2UeYQY4Yl0o0oRKUAnjmG5u0vGyxYnm45oKsRE4i9AD+ImKAs/
	 pV5qONAsrKJtxp28v4f9u60+GUub+5vChP8ompLdDkWKmb9yN/+qzyb8oipzT3ZITe
	 c9cSsIM0AI7WE1jdTD/ozna8dq7+zmPWZyezaT3eGB7mL6xi5xb9Zdelq7El3iQojP
	 1DR5BE/vUcLfPVmXUIRpndrpeU6UTtsLZLoYFbfkNOWyIoxKnMzkJ4RHaQtxaiweJS
	 hDL1aOY4dtGjmN3YS4g3Kpgnpj9sRaDqVxuP68zCRbMpHYbMxZ5t4uKDaZqNI34Xn0
	 UlOTKlR/ve9Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C531580F62;
	Wed, 18 Feb 2026 15:06:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5513A1CE
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 15:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4298B407C6
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 15:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kTuZmNDOhKjC for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 15:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.52;
 helo=mout-b-203.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 67CD9407AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67CD9407AF
Received: from mout-b-203.mailbox.org (mout-b-203.mailbox.org [195.10.208.52])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67CD9407AF
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 15:05:59 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-203.mailbox.org (Postfix) with ESMTPS id 4fGKZp12C0z9wWZ;
 Wed, 18 Feb 2026 16:05:54 +0100 (CET)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 16:04:50 +0100
Message-ID: <20260218150453.3743924-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4fGKZp12C0z9wWZ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1771427154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rzcxgnKqoercpUPiHJxVsIEzlXcdW50CrOEzoj12l9Y=;
 b=AExNDrmuKOjKlAuS8m6H66qhciklvGAly1dyM/lULR3ous6NEVKwCvgb223dBqMV0RTrbZ
 pQkLCmbwmMWuN3CuB+mj6UPs5NGaR+e6H8o6/F1BZiL7Hbbeq0+XjSSJlnL2Co5O9JX+cP
 /r4oNmUKAuHamOBa5WwuzVi1aX3iG2I2qVWZVH7PGabWPmRqCgXCVD4U9DD7iTTY9Q+pW1
 9Z0h7eUMK2778GpQ0jA9Eq3U3IXmtIkirJC6lJFImndaNPIVXw/e5I/XQaNy6GdFjMdFwh
 hzVGGekceH923Q98cYsXcqSrjMjvZpdy355AWO4uqL2FRePPPd3Ys8o00ry7/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=AExNDrmu
X-Mailman-Original-Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of manuel.diener@oss.othermo.de designates
 2001:67c:2050:b231:465::202 as permitted sender)
 smtp.mailfrom=manuel.diener@oss.othermo.de
Subject: [Buildroot] [PATCH 1/2] package/python-starlette.mk: bump to
 version 0.52.1
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
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes here: https://starlette.dev/release-notes/
This also includes the versions 0.51.0 and 0.52.0

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 9b84774c86..72c56012f7 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  f3479ed026aeaffb43af371d3b7db527  starlette-0.50.0.tar.gz
-sha256  a2a17b22203254bcbc2e1f926d2d55f3f9497f769416b3190768befe598fa3ca  starlette-0.50.0.tar.gz
+md5  3fafce592e3b272a54e2fe7727397fc1  starlette-0.52.1.tar.gz
+sha256  834edd1b0a23167694292e94f597773bc3f89f362be6effee198165a35d62933  starlette-0.52.1.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index af8a49e0fd..9831fbcf13 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.50.0
+PYTHON_STARLETTE_VERSION = 0.52.1
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/ba/b8/73a0e6a6e079a9d9cfa64113d771e421640b6f679a52eeb9b32f72d871a1
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/c4/68/79977123bb7be889ad680d79a40f339082c1978b5cfcf62c2d8d196873ac
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
