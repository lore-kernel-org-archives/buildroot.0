Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17493CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 06:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9023813DA;
	Sun, 22 Sep 2024 06:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQQlu_ixhTvm; Sun, 22 Sep 2024 06:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7828813EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7828813EC;
	Sun, 22 Sep 2024 06:50:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4026F1BF86C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C1F2606B1
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uyu3r0Eh8QUn for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 06:50:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3924B605E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3924B605E9
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3924B605E9
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 06:50:08 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-82ade877fbeso199743939f.0
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 23:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726987808; x=1727592608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1vnu4mF1WtaGSwJexSEQyc3OBEpCpqjfm4LjF0fomK0=;
 b=mou0BKXiMoANUFNv8rQpE/i6zaMH/L0dNrfevr8NIfW+nugv5ht7AvQFDg1Kiw19QW
 x7ykRSMudRcwgvuU5kMgvgMyUEGRM4KrmiyQPVbIYDLgmv88DQ+vUD545qpxwqIziKYT
 d79nsQDLcW0zhBuotPJkbkf2qjbPFUf3u69q66LRGauz42+jHeQ2KanyXTaDimRBMNiU
 sxrWlT3GkHLwxE78eAa+89XpdKDF9zEX75BfC8POkOH5aRA9iXqEOuz2iEvRo6kPB/EO
 UW7LEhX3wuaDnRGiaOKuIjLlOtIOa81d4unUlsy6YQUQYdxGL5l51hFYwua2uBtdYphB
 6hjg==
X-Gm-Message-State: AOJu0YwxToX3lrvp0CHRgdECYodE+VQMVrpaAbvs93KP+eHxvEXZy70b
 IKOXyO3EkEueYFenAylAmPa53jY7me6kS+Jf+RKpNqMsjICiir1DwG3Nzw==
X-Google-Smtp-Source: AGHT+IFS8VkNz9WIjqMDthKadbcvdek69tvY82qXKWCwDiquI8e9REshwZQbLHJkPR9jt72DlbSJYQ==
X-Received: by 2002:a05:6602:15cc:b0:82b:49d4:2ad0 with SMTP id
 ca18e2360f4ac-83209d311efmr594298139f.9.1726987807703; 
 Sat, 21 Sep 2024 23:50:07 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d49269955sm487977639f.8.2024.09.21.23.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 23:50:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 00:50:05 -0600
Message-Id: <20240922065005.980506-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726987808; x=1727592608; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1vnu4mF1WtaGSwJexSEQyc3OBEpCpqjfm4LjF0fomK0=;
 b=G1P1QtKhRg6l4wOx8aemv4/86r9p0VM+Krwv4zrVwcoNC8wpjURO/oaPqLdV7k/1pl
 oJYPB++WNU5HX6peCISOmhmJOn/WZhqiMOZOf48fX2rQpIegsLyoVyZwrl5rYX7MIoAA
 q1v0s3FikhL3GtEzSH1qiChNioCW+ujspPbTSM+CeQeVL530UJgh65cG5Du453qlM7Zj
 QKVMR6vhVucE+JUnFLNnJ+e95MwmKWWwt+QBH8p0SNu3ZoMrKaGtKgWjkG1uRNgxbw7V
 6EdVf4GYvwVO4Hnj/ycspwonR/5jkFAf11kH95Wzzsd/jlfSIef8RB9QvR13fxz35pU/
 Bv/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=G1P1QtKh
Subject: [Buildroot] [PATCH 1/1] package/python-wtforms: bump to version
 3.1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to hatch build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wtforms/python-wtforms.hash |  4 ++--
 package/python-wtforms/python-wtforms.mk   | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-wtforms/python-wtforms.hash b/package/python-wtforms/python-wtforms.hash
index 12b980de02..3a1d932d3d 100644
--- a/package/python-wtforms/python-wtforms.hash
+++ b/package/python-wtforms/python-wtforms.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/wtforms/json
-md5  509a985769df13938c8307b55a614773  WTForms-3.0.1.tar.gz
-sha256  6b351bbb12dd58af57ffef05bc78425d08d1914e0fd68ee14143b7ade023c5bc  WTForms-3.0.1.tar.gz
+md5  722bf234789979ed2ff06e8e9323fa0f  wtforms-3.1.2.tar.gz
+sha256  f8d76180d7239c94c6322f7990ae1216dae3659b7aa1cee94b6318bdffb474b9  wtforms-3.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  cf40d60ff34f6b2b68a53d220f8b66567b5ac8dd1119b37b62fd15e9518fe59b  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 65b5748b6b..58cd463095 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_WTFORMS_VERSION = 3.0.1
-PYTHON_WTFORMS_SOURCE = WTForms-$(PYTHON_WTFORMS_VERSION).tar.gz
-PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/9a/7d/d4aa68f5bfcb91dd61a7faf0e862512ae7b3d531c41f24c217910aec0559
-PYTHON_WTFORMS_SETUP_TYPE = setuptools
+PYTHON_WTFORMS_VERSION = 3.1.2
+PYTHON_WTFORMS_SOURCE = wtforms-$(PYTHON_WTFORMS_VERSION).tar.gz
+PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/6a/c7/96d10183c3470f1836846f7b9527d6cb0b6c2226ebca40f36fa29f23de60
+PYTHON_WTFORMS_SETUP_TYPE = pep517
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
-PYTHON_WTFORMS_DEPENDENCIES = host-python-babel
+PYTHON_WTFORMS_DEPENDENCIES = host-python-babel host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
