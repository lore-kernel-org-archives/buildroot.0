Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B3DCCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F09F42874;
	Fri,  1 May 2026 12:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zy7O0da7gq_A; Fri,  1 May 2026 12:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F2DF4286B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639346;
	bh=ApzxfFhZWKInKADXvJeO3XtnhwWy+KELFe2xDuhxKmk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kDQgRIbzNk+HnzgQMDboZBlZ07v35BKglaGuXjfRsaRkXyRs9b8vm0TbJhhIpUVME
	 rUmjldp9AL94T+HOPgBxbbCyEdpFuETuvNqXOz/+dOx3RfCj2e1UIkcO+xyok4iu1K
	 lqMWXvdPekB0XiBcI7yR/OvSqEwKZfDIOdXUATITBQbqBFhrkqOWl7f9yTZYedZV+9
	 Lo64Bt/wfWcuMXtMRiBsoe1Qx9JbQ0zz97tScse2l7/As/4TIOQ/qI+lNJ1ZShSwgN
	 a7g9Tn3P20/7/4svKXGobGVYlhshnQAVXth90RPuvXaSooGVrpTYhHk7mMCp6r+jUS
	 2jbVnvpE++1Yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F2DF4286B;
	Fri,  1 May 2026 12:42:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CB02293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E2F4403DA
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ebm97hm129zi for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:42:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B4F0401CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B4F0401CA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B4F0401CA
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:42:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3EDDBA4C2F1A;
 Fri,  1 May 2026 14:31:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1L-000000008NC-09Tc;
 Fri, 01 May 2026 12:31:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:12 +0200
Message-ID: <20260501123100.1918951-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638669;
 bh=qcy2XZuMwQ6va1y0v+WJNM9q3RXKEFaXRyeDuXjNVZ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LX1ETrNLWLcEqJ4g7VcDoYNiKzSkB57LU9ylgIQEfX4dvMwilAwIvBT4dqeFsRG5y
 eH8Pp1Y49EQGNkNPInYIbSYNvPXeig8IucotqE5YIzxESfb8lIpfsrxQMRTc6OVZYE
 vfLNQHmR7ynyJdK5aDYmYRv89R9uq2MMtb+bjrmgataixgtqxMiT5/25877Ey2lo0A
 xvMD5V4hn2yw80eIRDvqjW6E4paDln1eJnFvGMGMSc9PRYMc8Wd5Q4yAg9ZuFlxwQ4
 T081KiM1uavyCKCuhLpBqVm0kVAipv5QU88RrLo5Tso4rdNbmjlbX4ibfF6FTs96je
 4g9IZS9Xl0XjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LX1ETrNL
Subject: [Buildroot] [PATCH 27/75] package/python-mako: bump version to
 1.3.12
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

https://github.com/sqlalchemy/mako/releases/tag/rel_1_3_11
https://github.com/sqlalchemy/mako/releases/tag/rel_1_3_12

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-mako/python-mako.hash | 4 ++--
 package/python-mako/python-mako.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index b6706aa1ad..a6aa68ee34 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mako/json
-md5  c9dfb2bf42827459dd505c60f2262a7c  mako-1.3.10.tar.gz
-sha256  99579a6f39583fa7e5630a28c3c1f440e4e97a414b80372649c0ce338da2ea28  mako-1.3.10.tar.gz
+md5  92390c7e8897e69da67a593a96e88c71  mako-1.3.12.tar.gz
+sha256  9f778e93289bd410bb35daadeb4fc66d95a746f0b75777b942088b7fd7af550a  mako-1.3.12.tar.gz
 # Locally computed sha256 checksums
 sha256  68d7064e53e3ffa8e9f420a9e604bd2e2059d9c330492fa6ebd4eb3d48111689  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 1dc59f002c..0f52fa2185 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAKO_VERSION = 1.3.10
+PYTHON_MAKO_VERSION = 1.3.12
 PYTHON_MAKO_SOURCE = mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/9e/38/bd5b78a920a64d708fe6bc8e0a2c075e1389d53bef8413725c63ba041535
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/00/62/791b31e69ae182791ec67f04850f2f062716bbd205483d63a215f3e062d3
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
