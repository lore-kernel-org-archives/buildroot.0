Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2F7E9A02C
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 13:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90E5B407A5;
	Wed, 18 Feb 2026 13:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QsFUKYZmnsGt; Wed, 18 Feb 2026 13:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B42B5407C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771422610;
	bh=LNsVQMWQVYdL356mXowjOtNgmX3lHVIBJH9t6UlL/EU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=gcodoU/uFUx0aSlVUEL4lAjiXG5PC1riD6CgJ/3Ot3kULN1oJvf5rqYUKF67G6OBh
	 oc6Zl9nhQZRnXx9f63xgcc2FLiCxUjNH4jR/eUxkN+Y8tHDe6nro/LEkgThzxu/nc1
	 QGLiRTVk9RvTmSRpVmcJ7XFGl5SKDhgUiW5PRd8ZbWZ1H41AcFZwLO/ZRB1qFMOFZE
	 niLHB1bKFsZ8w6ZKp0Jf0lhjFW6FaZpwJB2R+X764kVim8mI8Z7PD6/85BQDUX2/k4
	 BF/w8mYfw1ZiyrkSvempHpJlCCnbgjk+mzxjF4D+jTHjiUNOXQuEM66/aI45pWT+rP
	 ky0pBcnl74L3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B42B5407C5;
	Wed, 18 Feb 2026 13:50:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DC0635B
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 13:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F70680D1A
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 13:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9sRl1dSB_bO8 for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 13:50:09 +0000 (UTC)
X-Greylist: delayed 1246 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 18 Feb 2026 13:50:08 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0276880E8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0276880E8F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.10.208.47;
 helo=mout-b-107.mailbox.org; envelope-from=manuel.diener@oss.othermo.de;
 receiver=<UNKNOWN> 
Received: from mout-b-107.mailbox.org (mout-b-107.mailbox.org [195.10.208.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0276880E8F
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 13:50:08 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-107.mailbox.org (Postfix) with ESMTPS id 4fGHvJ1jczzDs2W;
 Wed, 18 Feb 2026 14:50:04 +0100 (CET)
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 14:48:53 +0100
Message-ID: <20260218134853.3119494-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4fGHvJ1jczzDs2W
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.othermo.de; s=MBO0001; t=1771422604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mBUnebKhkFxUeceoaYw7mS1WGWYl3jb7ulE+AFJGp5U=;
 b=gzhyeQgb6MNpG9VtqMjeJ3MOX60B1MZ/SjIZiK0hA01u9Cq3kN15fHiXkB3nG9zZpGDt3i
 AXxjvfxvar3+Sz7sufoemjA624fb+QANB0XP17MS5DcfXfSm3KMb/3mAQfVFFS2pzPU9WJ
 YSmIKyKsFO+3vw/4gabjoCe9YTlHdFko5d8qHRUh0gebNkSpjAGLH5DZrkEVSk3OV8dqST
 VgkS1G0hkkgYGt+kQ+TCCeR9Qx1xuUUu7vMqc36eDn5q09ZkJGpFmAzYJ2i+3+QsKb9vvb
 N+IP7cNr2eddVahHhnsNqhxYS7Npbis4n7SB3KG1i1yfARwweMzzt0Hf8i4fDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=gzhyeQgb
X-Mailman-Original-Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of manuel.diener@oss.othermo.de designates
 2001:67c:2050:b231:465::202 as permitted sender)
 smtp.mailfrom=manuel.diener@oss.othermo.de
Subject: [Buildroot] [PATCH] package/python-jsonschema: bump to version
 4.26.0
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

See the release notes here: https://github.com/python-jsonschema/jsonschema/blob/main/CHANGELOG.rst/\#v4260

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/python-jsonschema/python-jsonschema.hash | 4 ++--
 package/python-jsonschema/python-jsonschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jsonschema/python-jsonschema.hash b/package/python-jsonschema/python-jsonschema.hash
index d35f8c383c..30a65afdb3 100644
--- a/package/python-jsonschema/python-jsonschema.hash
+++ b/package/python-jsonschema/python-jsonschema.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jsonschema/json
-md5  e33f133a5b56b9f9756b38065849c86f  jsonschema-4.25.1.tar.gz
-sha256  e4a9655ce0da0c0b67a085847e00a3a51449e1157f4f75e9fb5aa545e122eb85  jsonschema-4.25.1.tar.gz
+md5  3c1deb667257ae19924dede13332d906  jsonschema-4.26.0.tar.gz
+sha256  0c26707e2efad8aa1bfc5b7ce170f3fccc2e4918ff85989ba9ffa9facb2be326  jsonschema-4.26.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4f92a015a13c4d1a040bef018aa13430b4f1bc73b41b16bb846c346766de7439  COPYING
 sha256  837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  json/LICENSE
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 1407a414e0..4f245f2431 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_VERSION = 4.25.1
+PYTHON_JSONSCHEMA_VERSION = 4.26.0
 PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/74/69/f7185de793a29082a9f3c7728268ffb31cb5095131a9c139a74078e27336
+PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/b3/fc/e067678238fa451312d4c62bf6e6cf5ec56375422aee02f9cb5f909b3047
 PYTHON_JSONSCHEMA_SETUP_TYPE = hatch
 PYTHON_JSONSCHEMA_LICENSE = MIT
 PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
