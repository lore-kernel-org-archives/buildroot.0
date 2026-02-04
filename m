Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1D6E9D3E3
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 14:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C30AF6067D;
	Wed,  4 Feb 2026 14:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obInF-tStO_O; Wed,  4 Feb 2026 14:23:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C09C0607DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770215036;
	bh=gRZoLo2KaapNuwpDm+ZHiRS9CPbWQthIzPb+9fa2eHM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=pgWlBj9kgXAE4A5bCIQu2YQZCw8lUkPg3X2kOJCdnm2SrK9RRzR+ux0oS0N28Y9Bs
	 zVpJC1KUiekAk7YiGEQwxOtKIkUr8Zy7oMmQE4JG8eAC2KyOnjcfu9C4DJmPipC1UO
	 ZkKj/LtLGNE5VMQH2v55rIUrrwsmqcjCiIjA9WAD/DTuPw8NAlwBlBsLZLajmQRDTa
	 HBEklTbugxC0PBJyETC8/+Sh1/fMCY7vHxWfd0gBGMVmui+10dZB12aQUCWQEl/h3b
	 22xrczAJLJOhjgGi5tEaG9AvEa544SndAsfsTEuiLRDbvwYj9HMJ1qJIObG5C3l/cf
	 BhD5j3q9GKz8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C09C0607DF;
	Wed,  4 Feb 2026 14:23:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A7ABF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47AA040B02
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVly1HDm6b4Q for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 14:23:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.92;
 helo=sender4-pp-o92.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2FB5940AE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FB5940AE5
Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com
 [136.143.188.92])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FB5940AE5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:23:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770215022; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fhO4WKsciN4zfJOzO+Acm1yWaHAdSyU3Y4v+A/mRfIck/a/YshlX2bEp2ed/xxOv0+EwynUIIqI11EoldOTdtDs9eLyYnavPCo9ttEJUchD9ue6NNppmGPtGPiE6bKPnDycAzVWP24gPGsu31J0imZ4bAcXBjjGX78+NbSPY5Ps=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770215022;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=TQhpjJst8cNaU1iKBvJ5kd80yevuS05J6ch1QFENiLA=; 
 b=BCe0y0uYOYbxn0GVD+q/XQoA/cpCNzMsVDgNYCc632QLTtZC8aEfIqeJ6sJMNyp41S/p5m1d/9zQFpL90wSa6UJJ9pKb0l9ZJXL9A4/1QAwmF//24+7GOtoB6up3zJJkqlpbHqW2V9iNUW77gL3K1rCrZk25soldaQZZY9sBGlE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 1770215019360614.1467056426926;
 Wed, 4 Feb 2026 06:23:39 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 22:23:04 +0800
Message-Id: <20260204142309.506287-2-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260204142309.506287-1-kingxukai@zohomail.com>
References: <20260204142309.506287-1-kingxukai@zohomail.com>
MIME-Version: 1.0
Feedback-ID: rr08011227008fdfb609dc03169de4d2140000da49b2cc657ea4d89e5019bcc76ec84fb55c58dcbf436f2f1b:zu08011227a66118bce30ec576a2cade7c0000cc943070bf11c4cea8ff2a38967a9db7b4d360a5c7f44ed6f6:rf0801122c61e075ef8410e3bcc27772100000b94839047940fd296760bf13cbcf00d29f861cc0c8730653839ec958177b:ZohoMail
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1770215022; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
 bh=TQhpjJst8cNaU1iKBvJ5kd80yevuS05J6ch1QFENiLA=;
 b=AbLFHYyTraXcsOh+Qrus9WtPPHsgxUiDIuOZ9o5epBXUMlzREPEFj9N/ankqvJ6M
 sorMrPaUHJkXibkJ2ZdfjNe22MvUNPUicwCA9MzwLgucHs89pToVESc+3fE3UrpxC7Q
 N6bJOoVP36CpoKrfQK3yeuLlxVD4+no/GEawcG4o=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=AbLFHYyT
Subject: [Buildroot] [v1 1/6] package/python-cloudpickle: new package
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
From: Xukai Wang via buildroot <buildroot@buildroot.org>
Reply-To: Xukai Wang <kingxukai@zohomail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Xukai Wang <kingxukai@zohomail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for the python-cloudpickle package, which provides
a Pickler class that extends the standard pickle.Pickler functionality.

This package is required as a dependency for gymnasium and other
machine learning or scientific computing libraries that require
advanced object serialization.

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 DEVELOPERS                                         |  3 +++
 package/Config.in                                  |  1 +
 package/python-cloudpickle/Config.in               |  7 +++++++
 package/python-cloudpickle/python-cloudpickle.hash |  5 +++++
 package/python-cloudpickle/python-cloudpickle.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-cloudpickle/Config.in
 create mode 100644 package/python-cloudpickle/python-cloudpickle.hash
 create mode 100644 package/python-cloudpickle/python-cloudpickle.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 13bf5244fe..f26f3230bc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3474,6 +3474,9 @@ F:	boot/ti-k3-r5-loader/
 F:	configs/ti_am62x_sk_defconfig
 F:	configs/ti_am64x_sk_defconfig
 
+N:	Xukai Wang <kingxukai@zohomail.com>
+F:	package/python-cloudpickle/
+
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/casync/
 F:	package/gloox/
diff --git a/package/Config.in b/package/Config.in
index 258ad1883d..57f573d34d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1051,6 +1051,7 @@ menu "External python modules"
 	source "package/python-cheroot/Config.in"
 	source "package/python-cherrypy/Config.in"
 	source "package/python-click/Config.in"
+	source "package/python-cloudpickle/Config.in"
 	source "package/python-colorama/Config.in"
 	source "package/python-colorlog/Config.in"
 	source "package/python-colorzero/Config.in"
diff --git a/package/python-cloudpickle/Config.in b/package/python-cloudpickle/Config.in
new file mode 100644
index 0000000000..a174f7a4f3
--- /dev/null
+++ b/package/python-cloudpickle/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_CLOUDPICKLE
+	bool "python-cloudpickle"
+	help
+	  Pickler class to extend the standard pickle.Pickler
+	  functionality.
+
+	  https://github.com/cloudpipe/cloudpickle
diff --git a/package/python-cloudpickle/python-cloudpickle.hash b/package/python-cloudpickle/python-cloudpickle.hash
new file mode 100644
index 0000000000..078002eb4a
--- /dev/null
+++ b/package/python-cloudpickle/python-cloudpickle.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/cloudpickle/json
+md5  75330dc4ce5fcd4dee785c62c96f9012  cloudpickle-3.1.2.tar.gz
+sha256  7fda9eb655c9c230dab534f1983763de5835249750e85fbcef43aaa30a9a2414  cloudpickle-3.1.2.tar.gz
+# Locally computed sha256 checksums
+sha256  3029ea34173e9fdc233ad315dc6b100bd1ea71f529b1c1af97664a272fdc55f5  LICENSE
diff --git a/package/python-cloudpickle/python-cloudpickle.mk b/package/python-cloudpickle/python-cloudpickle.mk
new file mode 100644
index 0000000000..9f74783667
--- /dev/null
+++ b/package/python-cloudpickle/python-cloudpickle.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cloudpickle
+#
+################################################################################
+
+PYTHON_CLOUDPICKLE_VERSION = 3.1.2
+PYTHON_CLOUDPICKLE_SOURCE = cloudpickle-$(PYTHON_CLOUDPICKLE_VERSION).tar.gz
+PYTHON_CLOUDPICKLE_SITE = https://files.pythonhosted.org/packages/27/fb/576f067976d320f5f0114a8d9fa1215425441bb35627b1993e5afd8111e5
+PYTHON_CLOUDPICKLE_SETUP_TYPE = flit
+PYTHON_CLOUDPICKLE_LICENSE = BSD-3-Clause
+PYTHON_CLOUDPICKLE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
