Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F94DD5B864
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52B694043B;
	Mon, 15 Dec 2025 19:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_pibpN3in29; Mon, 15 Dec 2025 19:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B026408A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826214;
	bh=BaNHpguP2NTXrMwjyFV2ZxNbmSCLQe6loIZLxV70DAY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dNQ5HhHhSQqdP7XmIrFrtUxno1yb39n6Or90MRTgGl3uh5/p1r74H2NPBQwdwXSRi
	 BmwMxBD1bpikItNlxdB49GULyVTX+qfZ2Xzu0DeLIb1vdw3fMor5OkdLgyYXGiHZnd
	 EZEc8vSk5h5RrXWcpnj5x87wtKtQj49EI1PR2bxTJf9d0Y70I69cFosAerjU/v77y7
	 7D+VwhI+d/ngjXiQ+U816nmLV3e+O+hiIM2RsKU2mlNkWTssRuw4fDGuhs7AaQSbWP
	 VJPgqt8vqvK5qZ0BAMUgYtPyWlyyOXUq1MIAvkgaG+KL7OwbBtvhxg2KufJZmptRSY
	 rp8swjds1qPmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B026408A5;
	Mon, 15 Dec 2025 19:16:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DF9C255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 848FD80B15
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVEzoCzseTGo for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:16:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 72A128084D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72A128084D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72A128084D
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:16:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5B84BA4C4307;
 Mon, 15 Dec 2025 20:14:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1R-000000005ED-0hsL;
 Mon, 15 Dec 2025 19:14:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:01 +0100
Message-ID: <20251215191416.421755-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826068;
 bh=K+N65jZTD/AkJ6X2gHwx+h2bAL3QSDjL0+raFskgIiI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZlEGOJCazkeZJvyiDKyeXXa9xccyKo/lWorxknbMuO93MaRqpKp9M3PekuZjMhAKl
 jTNWzq3mqbfQdpV3n6+zAtb21qi8djtONgYeqAjfsQ09Y3Vrh8bbQUlp3MZnRqbfDQ
 nctJ6FxTX84eiWpD+siC16HOopo1YtqpmFGRoVT/LhJL61nuNrXvdQAq1NCM7NlW0l
 UArNJ3kiRKSch7hBZWz62UXj69vglJEirONeEAB8RmZCX/PhjH3IPHs+YPWALyXbv/
 3wM006R8Bja/NO/LYYxiTVTqXoYivm1VW8UfA+5dQDfEL6Ax0u7HKtKIT28TPIiyph
 k5Qru0pYqShDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZlEGOJCa
Subject: [Buildroot] [PATCH 12/27] package/python-pynacl: bump version to
 1.6.1
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

https://github.com/pyca/pynacl/blob/1.6.1/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pynacl/python-pynacl.hash | 4 ++--
 package/python-pynacl/python-pynacl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pynacl/python-pynacl.hash b/package/python-pynacl/python-pynacl.hash
index f78299953b..de54fdeafb 100644
--- a/package/python-pynacl/python-pynacl.hash
+++ b/package/python-pynacl/python-pynacl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pynacl/json
-md5  297e50e469abf0b5ea18b3a158312ba5  pynacl-1.6.0.tar.gz
-sha256  cb36deafe6e2bce3b286e5d1f3e1c246e0ccdb8808ddb4550bb2792f2df298f2  pynacl-1.6.0.tar.gz
+md5  0225d0ec3dfe729ee2a52a52ffc81d09  pynacl-1.6.1.tar.gz
+sha256  8d361dac0309f2b6ad33b349a56cd163c98430d409fa503b10b70b3ad66eaa1d  pynacl-1.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  d3174ad63e721d4c9dccb8ad4320848992d314369bc46319720b5802c9153fe9  LICENSE
diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
index 10163afa7a..a3d7dd98d8 100644
--- a/package/python-pynacl/python-pynacl.mk
+++ b/package/python-pynacl/python-pynacl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYNACL_VERSION = 1.6.0
+PYTHON_PYNACL_VERSION = 1.6.1
 PYTHON_PYNACL_SOURCE = pynacl-$(PYTHON_PYNACL_VERSION).tar.gz
-PYTHON_PYNACL_SITE = https://files.pythonhosted.org/packages/06/c6/a3124dee667a423f2c637cfd262a54d67d8ccf3e160f3c50f622a85b7723
+PYTHON_PYNACL_SITE = https://files.pythonhosted.org/packages/b2/46/aeca065d227e2265125aea590c9c47fbf5786128c9400ee0eb7c88931f06
 PYTHON_PYNACL_LICENSE = Apache-2.0
 PYTHON_PYNACL_LICENSE_FILES = LICENSE
 PYTHON_PYNACL_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
