Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600C9D5B864
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B3340A47;
	Mon, 15 Dec 2025 19:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuJ-Hki3j4YV; Mon, 15 Dec 2025 19:17:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6328840A7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826250;
	bh=SnInX7plS1nr3si9kMRDXjY7P/dEd/cMLe+MHm6v2HY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Dy6UxCUSdpfuD4b7AH90ezRst1XA4GdOPImG89Bw+hnOxF4cL0hzg5KxXALe41POu
	 8+aUCguDVWwkkH4aOb4XXrME8DXIoSqUjI+4J5UJFQmKqwsxBOgihbm1F5EyaQSbwS
	 bTbdZKNHB5JGouTQzGNCgz1GMFVjzg3Hf8l2qK/veI0p0y9eoTlQWvQcIXbCfMuYvs
	 JvJbJUvbS8cIncr0xNzzEWnmm31wQ9uZn3YcXkSn5I3Azdwsko2tpUfUzZ6LHrdPrL
	 KvTR0gk63XFpkOn10vdp6dpiUjrJO9ryxiLpqWQbCwHvtKrP3znz6i4r9reGiOhM1X
	 7jHz1fIvOSyDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6328840A7B;
	Mon, 15 Dec 2025 19:17:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF43E151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E17BE407FE
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BV6zgM4VnfER for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:17:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D25714046A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D25714046A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D25714046A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:17:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 16AC1A4C4351;
 Mon, 15 Dec 2025 20:14:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1R-000000005ED-1hz8;
 Mon, 15 Dec 2025 19:14:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:04 +0100
Message-ID: <20251215191416.421755-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826069;
 bh=N9+pN/q7pzCG+8M7wnvbaxmO0q4XWPtm1Jo07uk4EwQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Mqt1Pya2XN6D+FKm0btnLZoXTHJsSKHxc80nnNu3PJT0itItY7BdYNxd8kUQG3p52
 eqUltMnSH2uuYaFL1e7l/8nGlEbNVx7EF33+osZAoylao+vaYbcFgFJmxPvYgGbge6
 HEEzd8wgJCepvJofPqxdAeQdSqbOOVXcK1lEzxRVclDPU2a51D4M8mUYgjuoj+nSJc
 5ZP2EMYwSjU0P9lBxsiP/OoIHWkqMR6NhoFOIEUfeVPgqgzG3XuOcY9Kp9IiT67B9I
 q11XoCcMzLMUhyf1XU4j8XTdGp7oADb1uy1GnXWLk/8hfIh0H5S8OtsXtfzPbnjQUp
 hV3vgNhgIWpsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Mqt1Pya2
Subject: [Buildroot] [PATCH 15/27] package/python-pyroute2: bump version to
 0.9.5
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

https://github.com/svinota/pyroute2/blob/0.9.5/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyroute2/python-pyroute2.hash | 4 ++--
 package/python-pyroute2/python-pyroute2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index 87402b9dbb..e98f776b5f 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyroute2/json
-md5  225d6899da226df8899efcff2557204a  pyroute2-0.9.4.tar.gz
-sha256  3cbccbe1af0c2b2aeae81b327e0e91aa94c81ab19f851e74b26bef70202f3070  pyroute2-0.9.4.tar.gz
+md5  ed5b0e365ac698f0229e4801a635793e  pyroute2-0.9.5.tar.gz
+sha256  a198ccbe545b031b00b10da4b44df33d548db04af944be8107c05a215ba03872  pyroute2-0.9.5.tar.gz
 # Locally computed sha256 checksums
 sha256  4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache-2.0
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0-or-later
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index efe8d73f52..c068d0760b 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.9.4
+PYTHON_PYROUTE2_VERSION = 0.9.5
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/b0/5e/fc64e211cce0078555c6db98aaf14348aed527565f3c4876913a290a5b2c
+PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/1d/b2/1019ddc278549fb7e64a16d7775e0f7d981135f762b8706e583414d655e3
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache-2.0 LICENSE.GPL-2.0-or-later README.license.rst
 PYTHON_PYROUTE2_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
