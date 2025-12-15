Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78B5D5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD0D040A29;
	Mon, 15 Dec 2025 19:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CZyKmHNZKAs; Mon, 15 Dec 2025 19:15:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E161A40A3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826141;
	bh=gyR2IDR4j77wrzowRhZz+OLirwGhh4EwzpGnta0SGGo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fee1Bc9emSnGwF9G9VTqMEQ52wblCa3uNwwqmOSz/a5R5rSQGXtqSuleaA13RE5Mk
	 Wwduswcoj7g4aP1zgN/5C/OhgKzcKjcSPgBDpoAxL48x7TTOzKZddBCBwap/Y+qkdd
	 1+OW5KKF/dp4vwaPZAo3NCsA6CWRgdSOR9+nt2SvAoTALt6I5yt0a9TKDPpj3cl5EX
	 rP1JhkCP1GAobjOFQZsPfPSiOHx1RoZjl3iKFsaP8Kp5E3KvQmURsYL3DZscaa0PAJ
	 HQjJ4WPLuj2SsG3LmcNEWf6+Bd8sv9D02uS0jvacAf1xctpoIq1Lro8FJ/geN9bAu0
	 e3pucFdGEdD7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E161A40A3D;
	Mon, 15 Dec 2025 19:15:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0549255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6F9F807DE
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZYseTSHizS2 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:15:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C1DB3807D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1DB3807D0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1DB3807D0
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:15:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CC257A4C4281;
 Mon, 15 Dec 2025 20:14:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1Q-000000005ED-3aNT;
 Mon, 15 Dec 2025 19:14:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:13:57 +0100
Message-ID: <20251215191416.421755-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826066;
 bh=WZlNyPWO3F+yy0Vq50D1UifucMZUSpPHWMIWMUBP/rE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Nv1w2g0mRd2mLoD3zqD/CoQUs1oLCwst5yMgz+JPMRnBMVyXr9AkFpP8sjTSwp/lM
 aTjSR7IqmGlATz/nJnRXtNbn6K5gpD0uZpefQE+5hJLiK0KG5NkP2YYgyeO2l+yLLI
 pzZy3siULAj+G/sBSGwA2Rgt7ZFZeJGF/6rOYewfTUSHeX/JIL9iTF7k3/ecBRnVy+
 QmbC5U9jAkrofPAcgDnzGj5vDbxYFea6vRkLDdEvWK5W0CfOC+yTAZuOCyAhDG0A9q
 TK/bu8oa1XrqmtUa5IWok60HFpxId43G/43WEMJIXKDthOHp0gZpa9S05t8bIFCow0
 aw7V+j3x7ApcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Nv1w2g0m
Subject: [Buildroot] [PATCH 08/27] package/python-pydyf: bump version to
 0.12.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/CourtBouillon/pydyf/blob/v0.12.1/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pydyf/python-pydyf.hash | 4 ++--
 package/python-pydyf/python-pydyf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydyf/python-pydyf.hash b/package/python-pydyf/python-pydyf.hash
index f3eed45782..d2f3f4ed66 100644
--- a/package/python-pydyf/python-pydyf.hash
+++ b/package/python-pydyf/python-pydyf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydyf/json
-md5  271295d0295c0e5609bf142b851fa266  pydyf-0.11.0.tar.gz
-sha256  394dddf619cca9d0c55715e3c55ea121a9bf9cbc780cdc1201a2427917b86b64  pydyf-0.11.0.tar.gz
+md5  d840ef400aec3a6c8018eb76f361a251  pydyf-0.12.1.tar.gz
+sha256  fbd7e759541ac725c29c506612003de393249b94310ea78ae44cb1d04b220095  pydyf-0.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  75461e438973e1ba0f93a7de9e3fe5b2f49e1ab49251d392878a9cdae8ce7e47  LICENSE
diff --git a/package/python-pydyf/python-pydyf.mk b/package/python-pydyf/python-pydyf.mk
index 5566114f8e..8a22aebe22 100644
--- a/package/python-pydyf/python-pydyf.mk
+++ b/package/python-pydyf/python-pydyf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDYF_VERSION = 0.11.0
+PYTHON_PYDYF_VERSION = 0.12.1
 PYTHON_PYDYF_SOURCE = pydyf-$(PYTHON_PYDYF_VERSION).tar.gz
-PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/2e/c2/97fc6ce4ce0045080dc99446def812081b57750ed8aa67bfdfafa4561fe5
+PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/36/ee/fb410c5c854b6a081a49077912a9765aeffd8e07cbb0663cfda310b01fb4
 PYTHON_PYDYF_SETUP_TYPE = flit
 PYTHON_PYDYF_LICENSE = BSD-3-Clause
 PYTHON_PYDYF_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
