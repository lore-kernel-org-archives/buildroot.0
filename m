Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E390CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0443F42659;
	Fri,  1 May 2026 12:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sX7Jxh6-bNra; Fri,  1 May 2026 12:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 455B74099C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639105;
	bh=7WGp1WYwX/NCLFb14T223x/C33+dvT2KmP6vnOGvzAk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=l/zDkckMJTiEQjPV91+SN33+d2ficaZT9m6WTDuUpXOV5jeCsrUSw0M0yNZIDaji1
	 kpEc5wsoyYtdHdARg3E6ucYeN303tKZ8/q4FP7UfXlvUrllbuhJLphJLpn73zG0Esj
	 csASEwdm4Js7TjQmevUN3dGoEzjwYnBWVQLvplCtJ9ycc3sT++7b0r/LnRPqO0VcX0
	 uDhNGzql12xJGwbPy4uHjGHWb4HLbgGiNnn5J/rxohXjUlBDReKT6gnJ/+4T7YYHTi
	 bO57s4twM/teAZlnduPZFXjaSdSwjGULEG1ZsMMRTCsJ61uIsYBRO5GzkTunELRzUd
	 5ez3ZikBMSliA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 455B74099C;
	Fri,  1 May 2026 12:38:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C926127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EC3B6F77B
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6kA0_P9moHV for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:38:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1DE086F76B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DE086F76B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DE086F76B
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:38:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1CB22A4C2EDF;
 Fri,  1 May 2026 14:31:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1P-000000008NC-0JVq;
 Fri, 01 May 2026 12:31:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:58 +0200
Message-ID: <20260501123100.1918951-73-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638667;
 bh=IkdDDfeJZhp8rWV5ELgnT5EhQF0/GLj2ngl6Dm7YmBw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XhW1Qm9j6brD25RYjnSIQUPSJvYwuvB9pjB8txbrXwXHlbvRcVnm4pLFvK+nh13bh
 9vcIVDU/N6z00GuXO96yTrRxTwmE7ZeA/v+zS0v+ZBcjM0NSvrqUiLGxJ/i0MtUPkI
 HVIHvbd9aXalgua8kwo9KSWx9bjxCffy5ePJ76iv+WADLdF9ij9Hw3Wx3OxKGC7Xf0
 8KwNvFVmeOl6/Cc4oGSCGcbxzzsng3f1uDbbavUDbRLe/Ruq1bCZKOvkYQ6BIZLAeu
 3BKcNHQa00jwpovBqgeluzA8mO/MmGw6H1e6C3w+ZNs9KjVhXw998ZuNsyLBeTD1UH
 mc7NQzth+imIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=XhW1Qm9j
Subject: [Buildroot] [PATCH 73/75] package/python-zope-interface: bump
 version to 8.4
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

https://github.com/zopefoundation/zope.interface/blob/8.4/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index e1e234a035..910373899c 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zope-interface/json
-md5  4da21b3cf474a9de4ed6776cb4821cef  zope_interface-8.2.tar.gz
-sha256  afb20c371a601d261b4f6edb53c3c418c249db1a9717b0baafc9a9bb39ba1224  zope_interface-8.2.tar.gz
+md5  e2886da91bf03fdebc437cfc8b029b60  zope_interface-8.4.tar.gz
+sha256  9dbee7925a23aa6349738892c911019d4095a96cff487b743482073ecbc174a8  zope_interface-8.4.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index bb3f82fc79..1f2535324a 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 8.2
+PYTHON_ZOPE_INTERFACE_VERSION = 8.4
 PYTHON_ZOPE_INTERFACE_SOURCE = zope_interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/86/a4/77daa5ba398996d16bb43fc721599d27d03eae68fe3c799de1963c72e228
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/9f/65/34a6e6e4dfa260c4c55ee02bb2fc53625e126ff0181485286cf0c9d453d6
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
