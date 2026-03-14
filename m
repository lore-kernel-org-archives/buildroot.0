Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB8C10706DE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 106574142F;
	Sat, 14 Mar 2026 14:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cj06t5xhQsoC; Sat, 14 Mar 2026 14:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 017EC41363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498186;
	bh=EbGk5EIdbJfMiUSKtwVtiA0yarZO+DALvWMkrR+pu+g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AJOTkS5rBLMZVvIVbAS19vwnMa2D+laBrJNCY6Vmx2SBSAPFCjv61nH/fH0Zskk3D
	 C0wXuLlHGjMWNW6YI/jx3rRuQ6S9XPDZ0E/pnPMedQRWGvURTrXroZX79ZfordK3Tt
	 oyUrhgzPdw5UBnj7ywl25Liu6kVHWGZIModf5oILzU3YLVSMmED7Q0w5TjZ5B05Vhz
	 YRLjocbVBJr4qcT1icsDPRRkdz1I9UN6QgSl6q91ZBgsgwLeck0Z8+kF2Q+kU0qlWI
	 5YC2X31HKS3Mdr7zclQvguhxv6mn1WBszqDI2LBApNLaxpyapNz+o2ad0/lxPmvrys
	 wRyaq8be1aFbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 017EC41363;
	Sat, 14 Mar 2026 14:23:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A93381B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F25E60757
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tc32G5W8RKyy for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:23:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EBC46073B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EBC46073B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EBC46073B
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:23:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0CD2CA4C1A98;
 Sat, 14 Mar 2026 15:07:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdU-000000003UM-1zXn;
 Sat, 14 Mar 2026 14:06:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:35 +0100
Message-ID: <20260314140633.2967249-39-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497225;
 bh=K3radR2xfXYsCtAAvOVDwSQZ2oLFF3YaUH/2eg5lHfw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=eGO1c5Zs0ZI36xIwgNgNhQs2nRh2gmqNjg9JaqIqELels8PRFw19twZLE99+9llu0
 +Vm1aSqQk1NQ8j8cEZ3wrdoLecSBhMbTjYvnNxwS/90mAzFiTpVElx2mhNE4N+pQHN
 F8XNTov8uAS/pqOlgBp6EsfxNDqppe9q//T12qCpHoG4Xu1cWI36GoQiS6aj2qHRxM
 AxbatMs0esdYcv7g65C6lkS9uD2hHGRi3oa5yno6gsOUK3CmAAWGKlLO7/KSeGkilA
 ML1K+wRcZG2U4q0QJs5KED22V+3Vpw2d9PhnRPHlpGP+5z/GVYwAq02obmy71q4Na0
 0in/c31yL731w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=eGO1c5Zs
Subject: [Buildroot] [PATCH 39/96] package/python-pathspec: bump version to
 1.0.4
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Ralf Dragon <hypnotoad@lindra.de>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>, Heiko Thiery <heiko.thiery@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Lionel Flandrin <lionel@svkt.org>, Fiona Klute <fiona.klute@gmx.de>,
 Colin Foster <colin.foster@in-advantage.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/cpburnz/python-pathspec/blob/v1.0.4/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pathspec/python-pathspec.hash | 4 ++--
 package/python-pathspec/python-pathspec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathspec/python-pathspec.hash b/package/python-pathspec/python-pathspec.hash
index 15283e3ac2..429fa05c3a 100644
--- a/package/python-pathspec/python-pathspec.hash
+++ b/package/python-pathspec/python-pathspec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathspec/json
-md5  2b26ad1981bfa23748e115f00085624c  pathspec-0.12.1.tar.gz
-sha256  a482d51503a1ab33b1c67a6c3813a26953dbdc71c31dacaef9a838c4e29f5712  pathspec-0.12.1.tar.gz
+md5  18d9e6adb72e544b56a88c3e53094b4e  pathspec-1.0.4.tar.gz
+sha256  0210e2ae8a21a9137c0d470578cb0e595af87edaa6ebf12ff176f14a02e0e645  pathspec-1.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/python-pathspec/python-pathspec.mk b/package/python-pathspec/python-pathspec.mk
index b46dbef7ea..9c5279e012 100644
--- a/package/python-pathspec/python-pathspec.mk
+++ b/package/python-pathspec/python-pathspec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHSPEC_VERSION = 0.12.1
+PYTHON_PATHSPEC_VERSION = 1.0.4
 PYTHON_PATHSPEC_SOURCE = pathspec-$(PYTHON_PATHSPEC_VERSION).tar.gz
-PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/ca/bc/f35b8446f4531a7cb215605d100cd88b7ac6f44ab3fc94870c120ab3adbf
+PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/fa/36/e27608899f9b8d4dff0617b2d9ab17ca5608956ca44461ac14ac48b44015
 PYTHON_PATHSPEC_LICENSE = MPL-2.0
 PYTHON_PATHSPEC_LICENSE_FILES = LICENSE
 PYTHON_PATHSPEC_SETUP_TYPE = flit
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
