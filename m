Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BC3E67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C5B960E20;
	Sat, 20 Dec 2025 21:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7VscuN8p7ho; Sat, 20 Dec 2025 21:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A645B60E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267013;
	bh=UpFt1zJOyE7bL41cA59d/MbtmMNUkkUY0Cbrqz58uX0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=g8gkcktrqKmJwBJ8VISHxkg1mDp+84fWZsAzvYNjl4yfsnCIsOz9q51hfR+l2Skcl
	 N/o+e54LfbdDi41Yzj12/hvhPwhzflnIRnrySPFtTwUXZx1qOWhcYer0Cbi9SZnaRx
	 3hvwJ1MjxZzptRjK9Nxb/3hVQvBg0i4EnVlzySfIJLOdi5FsUXqyDnOvdYUA2m6Imv
	 fWXbYwq0JsqKPGz+5ug4kCMCMeBum31QqbU+u+2I81HXs2RKa9lRR73WF7WpsAkQOC
	 AhJ8Rr7UVpGxu9JmTG+Pt65ynBKjofuWkAgkLo6GSO/mL+TGPS9PMozHLteLrLLHvQ
	 xfmiXg/0z66Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A645B60E12;
	Sat, 20 Dec 2025 21:43:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC8AD119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A325881AA7
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXbhz8f6TAET for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:43:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 917BC81EC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 917BC81EC4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 917BC81EC4
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:43:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A0328A4C4D52;
 Sat, 20 Dec 2025 22:42:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iF-000000002DO-0PHa;
 Sat, 20 Dec 2025 21:42:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:41:53 +0100
Message-ID: <20251220214206.1089100-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266929;
 bh=Sf2+p1zQ1TmeA2W/pYCNh1Mi307DH+c0PyxbIQEP0GU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RZOvf3/BeatHD2DsDLNSTNRDz7QVpUhP+dl2v3Zd1n0F9mL/laMuUPl+9dFuiCvX5
 z8WdFmF/fl62ca7HM4vK/QMsJHXsoeBUygKqRpVI+2XTLsE14SoUk0WvWLr9DWhNsG
 Jga3ppDtnCmN3Ou9fZFd/akLLd/fiHUSyRGWrZie0nQeFgBvgwVe6jhK1cxyeo5at5
 y0I2FClsEi+KglMpakzYJ1w42csxSc1z8RMf2b6Jj6OLY+xAYn1xfrWuMpchhFWYVp
 AG9uygvF7hzF1pCCdo05XX5fmMuqEfX97tcBueclA2npMo+fZxBTOvdl3T/QUwRb6G
 RQMlfmsLpFS2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=RZOvf3/B
Subject: [Buildroot] [PATCH 05/18] package/python-dtschema: bump version to
 2025.12
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/devicetree-org/dt-schema/releases/tag/v2025.12

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-dtschema/python-dtschema.hash | 4 ++--
 package/python-dtschema/python-dtschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
index 29463ff5da..db11c0d30f 100644
--- a/package/python-dtschema/python-dtschema.hash
+++ b/package/python-dtschema/python-dtschema.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dtschema/json
-md5  7d568f4e631d1f2f5ec32aea7851859c  dtschema-2025.8.tar.gz
-sha256  3c63b643fa76215b32cc6cbea9fd0dc7627dc71c67f3dca14fc04d70a7e1235e  dtschema-2025.8.tar.gz
+md5  e5cf3d2eeb13fb7a712fbe985624aedf  dtschema-2025.12.tar.gz
+sha256  327fdf5d5ec60934cc3eddab09e68be2310173a33e15eee24dffa89787706db7  dtschema-2025.12.tar.gz
 # Locally computed sha256 checksums
 sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
index 28b7ac3cdf..29e14d2e81 100644
--- a/package/python-dtschema/python-dtschema.mk
+++ b/package/python-dtschema/python-dtschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DTSCHEMA_VERSION = 2025.8
+PYTHON_DTSCHEMA_VERSION = 2025.12
 PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
-PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/96/0d/ae12436b8de0d06cf5aa07787679bcefd24ba0c7a556edd5cdaef4a38022
+PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/7e/30/1f099669ea2bb8fbac19dbb04694d77ef9973418731ae29ccbe1b5e55647
 PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
 PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
 PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
