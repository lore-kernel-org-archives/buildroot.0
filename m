Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA8910706DF
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9D74416F4;
	Sat, 14 Mar 2026 14:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n77e7DkhwT2B; Sat, 14 Mar 2026 14:23:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1514416F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498236;
	bh=saK3yS2toPmBIszLJSZzn6hSxJtO3SShTrov325SsUU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gpXeXBaBW2lmweTHw7LXbdCqbuYyGIQzDgFdTYoaYieqZECZuTK+7ceyTwu2ZHE08
	 lCokZEJ3Anb4fbAre+4P0SRMLerkcjdFJNPitPRTA+H/q2Pnv1qBkL1riDsZCtDbbD
	 MuP6stIZ8uWoHCHshIuarg094a4FUpD9AO62FFuk09XmusKpd4h8Icw7Vy7pB8mugd
	 vbsERuzRJyr0DqmlSNrqb3BBUHd4K3Y16TqrklPaNNmSaZ4BZLzC0Fn8mQHdLiF7Zm
	 aKGpiVY1WixzFzcaXcHRBp65vRlmWglMf1mkjEH1fis148uQqr8uFCclkETZw+/tyJ
	 ybj5w5iCeIxZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1514416F8;
	Sat, 14 Mar 2026 14:23:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EB0B1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50C51400F9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qXKbU9vEbpr for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:23:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC6F440076
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC6F440076
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC6F440076
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:23:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A31CFA4C1AED;
 Sat, 14 Mar 2026 15:07:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdU-000000003UM-3RNJ;
 Sat, 14 Mar 2026 14:06:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:39 +0100
Message-ID: <20260314140633.2967249-43-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497225;
 bh=dAUEZY8c+Dbd1QQP9EggOX74/kx9AVkvcHN1sh1MybY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=m3eaTyioShNzVH2V7lvdnq8Z9GbT5dOfZ51jeY5jI9r/2rPpLD8Z3Ef87AHzvsktz
 yZKw8MmbFdyBMh5tWYAfVo4fpbJ2mCZ1wQRB7F9novmL24Ez3RGAjbpjSXJK67N5kB
 AUtRT5VhnH/lQS3joOg+AbvEFNJ6Ic/cjGAPATxut6dWexZjOB1+mSULIQwJsWKrZ5
 PCqZzXZ9tDbXAhQwgZGLVRG+0x5M2C3Oaljb4rpFbe3qBHGUeSaecgbZinwv+qKF79
 Mfh1kjSalMbjQBkuh6b/f8Og5ok33LTmdLw+6zg/RPRjGI259XY2nH6BkNWnRhdueS
 cyp89kiKTYEXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=m3eaTyio
Subject: [Buildroot] [PATCH 43/96] package/python-platformdirs: bump version
 to 4.9.4
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

https://github.com/tox-dev/platformdirs/blob/4.9.4/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index bbf94f6b6f..cc92e4a824 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  e1000e5728e36717b1832e77dc3590c9  platformdirs-4.5.1.tar.gz
-sha256  61d5cdcc6065745cdd94f0f878977f8de9437be93de97c1c12f853c9c0cdcbda  platformdirs-4.5.1.tar.gz
+md5  8168f7450c9606bfa4a28268f0f59a37  platformdirs-4.9.4.tar.gz
+sha256  1ec356301b7dc906d83f371c8f487070e99d3ccf9e501686456394622a01a934  platformdirs-4.9.4.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index e099c486c4..11e8acd078 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.5.1
+PYTHON_PLATFORMDIRS_VERSION = 4.9.4
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/cf/86/0248f086a84f01b37aaec0fa567b397df1a119f73c16f6c7a9aac73ea309
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/19/56/8d4c30c8a1d07013911a8fdbd8f89440ef9f08d07a1b50ab8ca8be5a20f9
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
