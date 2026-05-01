Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08714CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0DF76F76A;
	Fri,  1 May 2026 12:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBDcP-SKPjha; Fri,  1 May 2026 12:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04AA361B7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639021;
	bh=oUyhDu5Ka8syS5ZZ1Ea+I448d+/m/ecjRpfp5/G7Gfg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YHrZDEO5NeIy6afV+Yfazj5N/OrpUHF19rTJIi0psm1kcX0vZMxVHTXfSfa2oWGBv
	 MMRy++TawmoxEvF9amQ39kl1yjxxZw+yj0kUH4wLUWZZ3e/d6afEZFpSHha5ocz6mt
	 2IKmV2a01wF1L3cW+oJIuY0+eZ86XFBDgNFIV4XC8jMjNsAA/Z7B2wZmIaTtTtA3/T
	 LTcADUKt8vjBHpq61aoRnrb5OJmOVo9dXhLv/DqHpImMIYmtmyIQikvsO4Hf/zkvOK
	 kgLiDYjPLt0NVRspwkRvvKj7dbB4bQwXhA+LBqsFJUU4ZQZ2LPVkWd60yLeIIU+yvM
	 v+z2v8UAr2Rmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04AA361B7F;
	Fri,  1 May 2026 12:37:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 64487127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A1698517B
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YfIbGa6vEjk5 for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:36:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4243285175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4243285175
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4243285175
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:36:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4155CA4C2ED1;
 Fri,  1 May 2026 14:31:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1L-000000008NC-1dGS;
 Fri, 01 May 2026 12:31:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:16 +0200
Message-ID: <20260501123100.1918951-31-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638666;
 bh=dhzYwtiku/sb7On1ZQeP3fwGiuEMRShWDdfYZv+/uMs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HoiYiBiP+Srfw2xJr2uAtc22Q0E0aEkPm27Q3VK56bYvrptZ844MmvBqDhmpiSirQ
 0p5IvO/fgQFj11WT4Ehue6oLJm6La4YYNLBwGpfNzAmKNjBtNprn0iDXIVkGgV/+vi
 j5KbEm2BdFcBvEjoGGuNZcJXxhMOGbJkg1deDlCRHpCMZDHmsccztMI+5wz29jmlnz
 g5GXNxe5tkJVPmS3E6vCs0DxCpj3vYqHYXOn8tedPmdrDB619lYpeRFj1bOsoxRWQ3
 USH70VEf0P61m0DrhBm/BNZr4bsJys5E1I9ODNcKwpHsdetL+PmrWBp8dpaPpmWp4Q
 6JF/yqALIsx1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HoiYiBiP
Subject: [Buildroot] [PATCH 31/75] package/python-more-itertools: bump
 version to 11.0.2
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

https://github.com/more-itertools/more-itertools/blob/v11.0.2/docs/versions.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-more-itertools/python-more-itertools.hash | 4 ++--
 package/python-more-itertools/python-more-itertools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
index 113c243e8b..f19c07f278 100644
--- a/package/python-more-itertools/python-more-itertools.hash
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/more-itertools/json
-md5  05fc46d7baf167d89c82a383c9f0c2fa  more_itertools-10.8.0.tar.gz
-sha256  f638ddf8a1a0d134181275fb5d58b086ead7c6a72429ad725c67503f13ba30bd  more_itertools-10.8.0.tar.gz
+md5  cce8548e1d2882b00d83b4b436c7e47c  more_itertools-11.0.2.tar.gz
+sha256  392a9e1e362cbc106a2457d37cabf9b36e5e12efd4ebff1654630e76597df804  more_itertools-11.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index befbb80402..9fd9da10e4 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MORE_ITERTOOLS_VERSION = 10.8.0
+PYTHON_MORE_ITERTOOLS_VERSION = 11.0.2
 PYTHON_MORE_ITERTOOLS_SOURCE = more_itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/ea/5d/38b681d3fce7a266dd9ab73c66959406d565b3e85f21d5e66e1181d93721
+PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/a2/f7/139d22fef48ac78127d18e01d80cf1be40236ae489769d17f35c3d425293
 PYTHON_MORE_ITERTOOLS_SETUP_TYPE = flit
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
