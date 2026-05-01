Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59708CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25CD86F5F3;
	Fri,  1 May 2026 12:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwfXk2fHcgsA; Fri,  1 May 2026 12:32:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED5FD61AC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638743;
	bh=wF777N7yy/Q0LtG9UanTkXQ2AAprRZ+4C6z08jItxz4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZXD7W93dALUBaLf8o74NxFYfW/caGdUY8zp2lLyHr6OsE4cYKKC41rhw51CqcNYwF
	 SrdoQNrC1s4Onft/zyCso/XZi0pmsmO+PvNiTrZSqTe26P4fJ6wh7iIYws4IAAjo77
	 EdFqhHkhKb5qSaI45pdSq142fJAW8HSy/zXogZpkUmLBZ304GllFTXk1JH/A2qK8ng
	 oRdXeEKE41WqM03GBw2Cebg+SXbaHpiuwMriBToh/f5Nzh+vz3xUpJJqk9sVqOpKiF
	 tLyu+enkhKBDeJ0WMoKZafBDCkbHC9DY+SbBuxX4LYtHFIWosu84uwnvQcGcKAZIcU
	 EwB1JB1WYVhDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED5FD61AC7;
	Fri,  1 May 2026 12:32:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A679293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27FDB41DDD
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J17zCh_8-ter for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:32:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1878541DD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1878541DD8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1878541DD8
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:32:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C041EA4C2E87;
 Fri,  1 May 2026 14:31:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1K-000000008NC-3FYE;
 Fri, 01 May 2026 12:31:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:09 +0200
Message-ID: <20260501123100.1918951-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638662;
 bh=F76TYEvO/1z95u3IXe7NZSLeGEB9xq0sogz4Ut0BGzc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Sz3zfrh+WRG5AGsFHFb1FO0tRnud5VJOx5DM7yfqVLgrJ3hdOoC1OHQKpIINOejKt
 XrPvDTcmDH026CmdGzd3R4vDOqoSp8RWTMqmGnGPUhpDWr8mC9tatUtn9ErUx8F5O7
 /wcqTZVYI/U7Cv+Vs3NBkp5d+HSFxoWN4fOVCb/edTaGDJG/dwvNLc7aVrZ2zhizsp
 hCnmFy3mIa0BewOcyVl47LDGbJNy/V1vh5DCYthZsKDaux9HtAMnTbhwyeqG62aB4K
 ElCChJsFnDG3KZAdTjgxEpOeRJAHM203oeszQtKTWFPIYmjeAIcGytMEXRDb/v1cGd
 epB4LvbJumyBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Sz3zfrh+
Subject: [Buildroot] [PATCH 24/75] package/python-installer: bump version to
 1.0.0
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
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pypa/installer/releases/tag/1.0.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-installer/python-installer.hash | 4 ++--
 package/python-installer/python-installer.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-installer/python-installer.hash b/package/python-installer/python-installer.hash
index 577b23a7ab..dbea06738d 100644
--- a/package/python-installer/python-installer.hash
+++ b/package/python-installer/python-installer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/installer/json
-md5  d961d1105c9270049528b1167ed021bc  installer-0.7.0.tar.gz
-sha256  a26d3e3116289bb08216e0d0f7d925fcef0b0194eedfa0c944bcaaa106c4b631  installer-0.7.0.tar.gz
+md5  fdf6be7db2ab6fdfbfacfdb208abc33a  installer-1.0.0.tar.gz
+sha256  c6d691331621cf3fec4822f5c6f83cab3705f79b316225dc454127411677c71f  installer-1.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  37b8b9f2569892fa54406383d431169dbb2115980d78b7efba6eeae5664c484f  LICENSE
diff --git a/package/python-installer/python-installer.mk b/package/python-installer/python-installer.mk
index 094a918090..22b79ec464 100644
--- a/package/python-installer/python-installer.mk
+++ b/package/python-installer/python-installer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INSTALLER_VERSION = 0.7.0
+PYTHON_INSTALLER_VERSION = 1.0.0
 PYTHON_INSTALLER_SOURCE = installer-$(PYTHON_INSTALLER_VERSION).tar.gz
-PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/05/18/ceeb4e3ab3aa54495775775b38ae42b10a92f42ce42dfa44da684289b8c8
+PYTHON_INSTALLER_SITE = https://files.pythonhosted.org/packages/5f/ef/230b70e66db6ab01d5cbb93329688ed1f06b2b0618a74925e36384ff0fba
 PYTHON_INSTALLER_LICENSE = MIT
 PYTHON_INSTALLER_LICENSE_FILES = LICENSE
 PYTHON_INSTALLER_SETUP_TYPE = flit-bootstrap
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
