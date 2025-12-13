Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E2DD59F76
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE8EF40591;
	Sat, 13 Dec 2025 14:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tC7UsHXDW6WX; Sat, 13 Dec 2025 14:06:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F30C04032D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765634769;
	bh=E8a+aCXc9Uk5dhuyLRXW2QxDllE03vng5cPKiDKskbE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=q7E24MtoYfcHJjsps/XXSO/at47x/yswU2EQHXamgV7skG88Asc88is2rp8kmbbpH
	 5V1Qp7h0RezvTc1FFG1YouIG4se0uM8mZibTyXOGzhsQMyRrDN6iBAbEqyh3iue0t0
	 K42AU9HQgnEnAOQ9YFN7R+FAsrq00PzZ4gA1Yx+f3wWcrADaYe8nnOMpXWE777KvU8
	 BqDffL8jaXb0hepD8Tuw2VU1k0bzRbMXrAJXJ5UloX/XvMsbEgnnZQLhYpit8aEABs
	 tXdHdq6BNlCJuiAil0ihyp/+Jj9SDUI8xS9e6LJ5vYSjfk1aBd3/C3LRDyQws/ZY+q
	 O+92C73TJgfwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F30C04032D;
	Sat, 13 Dec 2025 14:06:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 84B5C2C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B6D860862
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGqPa8ZeQ6Ug for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:06:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5012F60859
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5012F60859
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5012F60859
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:06:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 584A2A4C4060;
 Sat, 13 Dec 2025 15:05:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQFO-000000004dt-3HME;
 Sat, 13 Dec 2025 14:05:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:05:15 +0100
Message-ID: <20251213140522.1322763-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213140522.1322763-1-bernd@kuhls.net>
References: <20251213140522.1322763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765634728;
 bh=/2P1yAqRBonTFIque7uA5WP70tsyO+IsAFszAe372aM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=J5bxu2ZDOzY2N8abWrW73HJnwwFZ+mhzbPKGEinGYIdV8nQLoyqNKKVBcVxe5gt2v
 KAb9FmHkg+A/rKQPg9mQ5s34R3vDe9VSz7Q13NN+URMsuJa7z0aR7MvjgKtPlxmjjb
 skEmmXmDp/iC5+kTm2ibLUoqubt4taaImQ0WoJ8ctamxROX4uojXa0fPPhd3pZ/NhR
 zRRv1E2U6p7G3SGEn7qSzS+FumU+m0GbToh24J3hAqS2/q80n8ySHVkYGWvGQzh6Yj
 +Fvqfn1cWu215JXzCWWLKmE5Moz4oNWJtqUumjroye7a1crf/FXuSI2Fw7sU1LWR0e
 UH5uu1WE7YD3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=J5bxu2ZD
Subject: [Buildroot] [PATCH 07/14] package/python-marshmallow: bump version
 to 4.1.1
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/marshmallow-code/marshmallow/blob/4.1.1/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-marshmallow/python-marshmallow.hash | 4 ++--
 package/python-marshmallow/python-marshmallow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow/python-marshmallow.hash b/package/python-marshmallow/python-marshmallow.hash
index 0f5db0e2ef..0df05df3ea 100644
--- a/package/python-marshmallow/python-marshmallow.hash
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow/json
-md5  3a8decf54fd2a6a10352b9de70b70136  marshmallow-3.26.0.tar.gz
-sha256  eb36762a1cc76d7abf831e18a3a1b26d3d481bbc74581b8e532a3d3a8115e1cb  marshmallow-3.26.0.tar.gz
+md5  952ff36b25ca99d60f7e0d79bb90188a  marshmallow-4.1.1.tar.gz
+sha256  550aa14b619072f0a8d8184911b3f1021c5c32587fb27318ddf81ce0d0029c9d  marshmallow-4.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
 sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index 6e84ca039e..2a5a8f6f90 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_VERSION = 3.26.0
+PYTHON_MARSHMALLOW_VERSION = 4.1.1
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/ed/3a/b392ca6582ce5c2e515a8ca365f89b6e631d864a80ecdc72e0bc1bf3aec6
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/4f/81/edb105b3296712a282680bc1ae02b8c1bb45d8f1edad3ff9fab1d41e9507
 PYTHON_MARSHMALLOW_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE docs/license.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
