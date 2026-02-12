Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBF4EEA845
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 19:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9C8C40AF9;
	Thu, 12 Feb 2026 19:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFUOvLR6obLo; Thu, 12 Feb 2026 19:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0731840B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770923085;
	bh=gRZoLo2KaapNuwpDm+ZHiRS9CPbWQthIzPb+9fa2eHM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=MGpg+YRchgMW6raLqlaHbqRTWByTBLuh1iBFV7HcFwJ3jjQlhZarXMaXJoYDmCtf7
	 ApUYaihEDzpHpOde4tShkPwLVTdK99yHUzzgzy66znc2GYtMqzut/zilRg6auql4Mz
	 /GeIRIpeyMGxiwBLq7UMM8l3Pu1qcqXi+c+CbrXUF3+wtjZgT6LPPQw2ZGi7NBVewn
	 t/iJLZuEtvPK6uUXwXJs3Cf3gkjUmECKB4UqNoiwk6oaq3B/6521CLxqfx6N/fCdbT
	 lZMFXcurQj8JwPWTc9AC8unRmgB6kWyYx9vRXjvdwGcmYW1kpEEFZJgv+zgYzDwycX
	 9o3ZzsGdRLL/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0731840B02;
	Thu, 12 Feb 2026 19:04:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C68AB1CA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6D9A40027
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opqYzgpASsI8 for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 19:04:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.94;
 helo=sender4-pp-o94.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D76B40022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D76B40022
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com
 [136.143.188.94])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D76B40022
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:04:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770923064; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ImZSLhgxfMKz+YXzn5+nLOua/mZRasOTBZOkGuDfL2+nIIoZwDRFvo/pr+Dj9SKO9g9e2e6/rJD5dnoeskrhvg9PJxT16Gq6j1BrWdIEmNuVzfC96Ld1k+KKHCQpgRTW4QKiOr09+ZzRpUGLYfHwrm7gWk/jEOVLoL+UehiZrog=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770923064;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=TQhpjJst8cNaU1iKBvJ5kd80yevuS05J6ch1QFENiLA=; 
 b=BMPs8y3Oat9AebZuBnx32svSCdAGfqbBTXczvhBAYjwAJ5e9q5TnMlh9xm1xt0ZDVv4zkY55b9d++OQbxvFdXqnCY8QfaTEdP7XGmgb7HCqH9P5J5JxNI+oyEdCCJ+Nqceq7HwE52txrrbfwjf1gRkIKEORPv/zm/42q9uTj6B8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 1770923057492818.4529744351956;
 Thu, 12 Feb 2026 11:04:17 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 03:03:44 +0800
Message-Id: <20260212190349.537465-2-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212190349.537465-1-kingxukai@zohomail.com>
References: <20260212190349.537465-1-kingxukai@zohomail.com>
MIME-Version: 1.0
Feedback-ID: rr080112275106bc9a031796c59e3af5f400002ea0464b638b5b0bea7bce5588df39008a51f127ef9e0e785f:zu080112274bb4fc6fd358bef17edc98360000f35e55989dc367cb4246c212ae9b802c1f31ca0fcebfad111f:rf0801122d8b385a6b7f977504fbdb7e29000041efc108a30655825b213a89a34949d18a3a2ca9dd9dc754f5824ac9370d59:ZohoMail
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1770923064; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
 bh=TQhpjJst8cNaU1iKBvJ5kd80yevuS05J6ch1QFENiLA=;
 b=TSsxsQt+ExZ8vikGPaOcLbKaxwxvoua9EWEhgDW4tFk2/oaRaeBMECCM/lkWC/7o
 btE2h5w6uWjXwLJngTfOs0tSIPo0kDrscHhd9nG0kCwotiJoNlnbD78mlJ+Nb6YXbVG
 UjAs8qzZX2FCxrlJhUr27Xf0nvrBPr9aeiusGp/Q=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=TSsxsQt+
Subject: [Buildroot] [RESEND: v1 1/6] package/python-cloudpickle: new package
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
