Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36A2CD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 21:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C49140781;
	Mon,  1 Apr 2024 21:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEd3KBem4tRH; Mon,  1 Apr 2024 21:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F8840772
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F8840772;
	Mon,  1 Apr 2024 21:24:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 570EE1BF338
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 21:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50D28605DF
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 21:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tz0TvHO0kkoe for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 21:23:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A098605DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A098605DB
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A098605DB
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 21:23:59 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7cc0e0dba0fso164551839f.3
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 14:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712006638; x=1712611438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g4h15FADBskDdvmhmeeMsD6FszDqs6/1x0pfygBPG1c=;
 b=TfRB1tSYhx6ek8lUjJCpgV2GO8YozGKTLSz5OyMdArAwLEMJYQWPYxuC275Ea0MCoT
 MeLs4YDKfPc1uZP2eXq5VTbxQ0VI6fgtC4fYycbpbgXJNMVWbaXLqSI0LaXQbW53YOSH
 9URnOkQcl8WYCjgzif3jbyNa7P7Ytnq/cMrJC+Pgdi2XFTsUlwjTBlwez2+ND1ja9Kk5
 +WVAgpM2LyxcA0WfBrUC9sASKYth4BoE2z+5a8kIQkPHixt8O6nm/btJyh1ZigdolU+/
 U2zTnhPj9UXzXft8erTiRa5RaVhbRVE9D5OAgE2pDoh3DaSX1cqmBkVULfIyyQ4maGdD
 UDLA==
X-Gm-Message-State: AOJu0YyO7d1xa9Qghkx2XC9Vq/58K9R6ICac5FI/rLcw2wYpiPIwYQEd
 1FDLScia1zwpHWdP2dmwReRqxKFctBrenMvmdtgwSX8MyoQiVvnIjpP+KU4ourKZQg==
X-Google-Smtp-Source: AGHT+IGMiQX34M8HS/gJQYcPCvRceCrA3KtqWY5Kf/ds/8Pwb1KScl+P6wOl/aPcDv/kGjYpAEVM8g==
X-Received: by 2002:a5e:cb0b:0:b0:7d0:da7f:9071 with SMTP id
 p11-20020a5ecb0b000000b007d0da7f9071mr1174737iom.8.1712006637759; 
 Mon, 01 Apr 2024 14:23:57 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 d23-20020a02a497000000b0047708160be9sm2813844jam.147.2024.04.01.14.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 14:23:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 15:23:43 -0600
Message-Id: <20240401212344.1345395-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240401212344.1345395-1-james.hilliard1@gmail.com>
References: <20240401212344.1345395-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712006638; x=1712611438; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g4h15FADBskDdvmhmeeMsD6FszDqs6/1x0pfygBPG1c=;
 b=Zsf+XTbcnK18n9226tTRJ8RKJ7JTLRaAAfkov0dt4p8fbeNZm71HwVGLw1Q19uCKix
 H0ptWZumpTmBCKrU3FjWtXFIwfMJAihLNgamGKTtzq//5oRw6PXsL1/4XPOsoXBFhIJa
 UIilBZWHjOJsa5vzSC8rz6sLurpBzBhx4Zygqnfb31FoonOl6+ID6Ej6tJkmS1uvlle0
 omfm5dKZNkdP5DmNpTtnkPtQd1fimQW9SNFWlYSQmyMwb5HwyT4DSJbAjFzHrQoGc/rN
 +i074fVTGia1AREfp+OwxsJ8NxBpVKZz+8sHas0BaB04VAaW59yO1br0vGXw9ofyupVk
 UBiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Zsf+XTbc
Subject: [Buildroot] [PATCH v4 4/5] package/python-tomlkit: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                          |  1 +
 package/python-tomlkit/Config.in           |  6 ++++++
 package/python-tomlkit/python-tomlkit.hash |  5 +++++
 package/python-tomlkit/python-tomlkit.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-tomlkit/Config.in
 create mode 100644 package/python-tomlkit/python-tomlkit.hash
 create mode 100644 package/python-tomlkit/python-tomlkit.mk

diff --git a/package/Config.in b/package/Config.in
index 09a81f2b6d..13165c1219 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1381,6 +1381,7 @@ menu "External python modules"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
 	source "package/python-tomli/Config.in"
+	source "package/python-tomlkit/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-tortoise-orm/Config.in"
 	source "package/python-tqdm/Config.in"
diff --git a/package/python-tomlkit/Config.in b/package/python-tomlkit/Config.in
new file mode 100644
index 0000000000..6d9afdd8d1
--- /dev/null
+++ b/package/python-tomlkit/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TOMLKIT
+	bool "python-tomlkit"
+	help
+	  Style preserving TOML library.
+
+	  https://github.com/sdispater/tomlkit
diff --git a/package/python-tomlkit/python-tomlkit.hash b/package/python-tomlkit/python-tomlkit.hash
new file mode 100644
index 0000000000..8c6d3c2377
--- /dev/null
+++ b/package/python-tomlkit/python-tomlkit.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tomlkit/json
+md5  e182df9625d617692a9ae035266634fe  tomlkit-0.12.4.tar.gz
+sha256  7ca1cfc12232806517a8515047ba66a19369e71edf2439d0f5824f91032b6cc3  tomlkit-0.12.4.tar.gz
+# Locally computed sha256 checksums
+sha256  f2f9b460ba719da6626add264d3782f275a4ff7aab677beda08b330911e23adb  LICENSE
diff --git a/package/python-tomlkit/python-tomlkit.mk b/package/python-tomlkit/python-tomlkit.mk
new file mode 100644
index 0000000000..ad82719ee2
--- /dev/null
+++ b/package/python-tomlkit/python-tomlkit.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-tomlkit
+#
+################################################################################
+
+PYTHON_TOMLKIT_VERSION = 0.12.4
+PYTHON_TOMLKIT_SOURCE = tomlkit-$(PYTHON_TOMLKIT_VERSION).tar.gz
+PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/7d/49/4c0764898ee67618996148bdba4534a422c5e698b4dbf4001f7c6f930797
+PYTHON_TOMLKIT_SETUP_TYPE = pep517
+PYTHON_TOMLKIT_LICENSE = MIT
+PYTHON_TOMLKIT_LICENSE_FILES = LICENSE
+PYTHON_TOMLKIT_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
