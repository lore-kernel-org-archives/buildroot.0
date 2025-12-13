Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B87D5AE41
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C721140CB4;
	Sat, 13 Dec 2025 14:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jV9B9Gz3lfCe; Sat, 13 Dec 2025 14:06:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF00740AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765634793;
	bh=ypL0Aw/D5KY/acKx1qqZyAD7oNq7FhaMmFwT5IqMVE0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=j61Vxvv1EmFX3hJ6tuH5etuSuk1ch+09CPCM0/Q48i0hXFvh3hoYhN1zSf5wQKr0J
	 42LKP81RzUZGWAn/0ZGzbLeuvwFOpo+r3M5kA2PZEkvOb2agqjvoSI8B7BGaAqU6jG
	 7CWjIj1ja01r8QSjnmP+zeYGjqJj5I9XB7Tm6Z5o2oaiOXqxAjdQAwbn5luxF4+MlO
	 tjOBDJ+cZyGPlQH3HZFfp7huHI/yWWo8012zWGh9tF0RMVN5Qg05U8bRCag8p0dK7u
	 OzuxAcNWTrwRegB7VxTadtECGZPY1Ei9VR+TD7+qo43nv7ylobI4T8Q/BXbFnwQ0Xm
	 BEs+XsWNcZgPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF00740AAB;
	Sat, 13 Dec 2025 14:06:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE3072C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4E8D40279
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wce52lwvMhkg for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:06:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A5C1540018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5C1540018
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5C1540018
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:06:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B955DA4C4068;
 Sat, 13 Dec 2025 15:05:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQFO-000000004dt-3pc8;
 Sat, 13 Dec 2025 14:05:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:05:17 +0100
Message-ID: <20251213140522.1322763-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213140522.1322763-1-bernd@kuhls.net>
References: <20251213140522.1322763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765634728;
 bh=IJ/b2sU1Thh7FvC721qJAEu/6zRU3buZ/axoeXT8mWg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bXYgqzHtkMnovO9r567D41qiqJfTLRKxdDhysOIL5IqZMzQMThFEMshsLJLy06nBx
 Kh3pqVOJCOtmTXBA+U8ehkDyD0uK7MxU3CMem8EBbuHI2KTjhzWQGbcCqb1mFEcpTv
 8oDOnDkCp8vnW+RCJkIZe5bIUQnjKS95NKXENnozKlUQdIPX50o8WGZxJs+Xn2t1g1
 +V2843eoZHmknUW5FfPZ3/1ZncLEI7HI6DFwcNvJeEksX9thy+iY/ApOgx3dwoS5+e
 6iHEC+d8I2bzz5pn4wse0FZdBggE+zvmMyBW6/ANGkeWxeJddi9lkudUmbLE+jfMKF
 gE6XytCxh6n4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=bXYgqzHt
Subject: [Buildroot] [PATCH 09/14] package/python-matplotlib: bump version
 to 3.10.8
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/matplotlib/matplotlib/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-matplotlib/python-matplotlib.hash | 4 ++--
 package/python-matplotlib/python-matplotlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-matplotlib/python-matplotlib.hash b/package/python-matplotlib/python-matplotlib.hash
index c862860b06..f6b8c444bf 100644
--- a/package/python-matplotlib/python-matplotlib.hash
+++ b/package/python-matplotlib/python-matplotlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/matplotlib/json
-md5  9c9a5c3ced2bba7b5b2f8dab68ae4b06  matplotlib-3.10.0.tar.gz
-sha256  b886d02a581b96704c9d1ffe55709e49b4d2d52709ccebc4be42db856e511278  matplotlib-3.10.0.tar.gz
+md5  bb3330a3bdcce6cf2e57b13795f3a005  matplotlib-3.10.8.tar.gz
+sha256  2299372c19d56bcd35cf05a2738308758d32b9eaed2371898d8f5bd33f084aa3  matplotlib-3.10.8.tar.gz
 # Locally computed sha256 checksums
 sha256  5a1a81ea301728c8bba2933da832c0cd62229daf20893a024ab3d53244468dbc  LICENSE/LICENSE
diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
index 49fbd76bdb..6dcf8d0fa1 100644
--- a/package/python-matplotlib/python-matplotlib.mk
+++ b/package/python-matplotlib/python-matplotlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATPLOTLIB_VERSION = 3.10.0
+PYTHON_MATPLOTLIB_VERSION = 3.10.8
 PYTHON_MATPLOTLIB_SOURCE = matplotlib-$(PYTHON_MATPLOTLIB_VERSION).tar.gz
-PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/68/dd/fa2e1a45fce2d09f4aea3cee169760e672c8262325aa5796c49d543dc7e6
+PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/8a/76/d3c6e3a13fe484ebe7718d14e269c9569c4eb0020a968a327acb3b9a8fe6
 PYTHON_MATPLOTLIB_LICENSE = Python-2.0
 PYTHON_MATPLOTLIB_LICENSE_FILES = LICENSE/LICENSE
 PYTHON_MATPLOTLIB_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
