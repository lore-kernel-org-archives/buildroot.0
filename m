Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93694CD1284
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 05:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0C6E40184;
	Tue,  2 Apr 2024 05:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9voJC6zSujGQ; Tue,  2 Apr 2024 05:08:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA75140597
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA75140597;
	Tue,  2 Apr 2024 05:08:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27D021BF362
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 05:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 145D940341
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 05:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8vCc6uP7T73 for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 05:08:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4EB0B40121
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EB0B40121
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EB0B40121
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 05:08:31 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7d074bd708bso232230639f.2
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 22:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712034510; x=1712639310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4FvZfbAfOBxWGdCUHwNf9HyUlwoHgw8xGt0TBr2FeW8=;
 b=Agh5XhjpC60ah0PWZSl218cdQxINPnbh2aC/OY7Dm9FedPlVgMhqy8OGvbutJZCTIh
 ysveve8IJMsZ/ExIRa2OOVO+sF8tcOAKNF5CKHYYrO5ZB3m52eid6m/aiR8PhTXkWSHU
 Xbotgi3jCWJQynLrscJmFoFDGUvav+1fxSHv+8PfoZmZ1gC1VRYBiJ6J4DdZ1QqYWiy8
 VrtkPny0aKN0m+3JYVAAV2cbBklfR6ivggKYzEuYj6N68T+uANfW1B7EMlQ6VF5JwdUM
 zATSoHHRWSlh8P3P6rEogS5G0eDCZQqYRctQF6fatPj+lRvRCb2nEOcWabcHhoFkprUI
 7Ixw==
X-Gm-Message-State: AOJu0YyfylEMfG2d+f2161fAcT2rPGeUyovWUwRl3l/rH6x0xMxHfebf
 5wDcZs55I/VPKpD3pLA3r37ReNztUy1dJRFr6K7qbfiGWvOidqmZcS06gBOr4NkHtg==
X-Google-Smtp-Source: AGHT+IHTCg3H8jb0XIN8ch6TXm2eyA4I5vwxV56e4UBCZ8PGChwipDMaq1DjdkhcGJeGQrXD0c9eNQ==
X-Received: by 2002:a5d:914d:0:b0:7cf:51d:4f4c with SMTP id
 y13-20020a5d914d000000b007cf051d4f4cmr12735900ioq.2.1712034509866; 
 Mon, 01 Apr 2024 22:08:29 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 i10-20020a0566022c8a00b007d0d2cab857sm665080iow.17.2024.04.01.22.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 22:08:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 23:08:26 -0600
Message-Id: <20240402050826.119180-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240402050826.119180-1-james.hilliard1@gmail.com>
References: <20240402050826.119180-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712034510; x=1712639310; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4FvZfbAfOBxWGdCUHwNf9HyUlwoHgw8xGt0TBr2FeW8=;
 b=Eq0LoaXTaNUr/dOd76tSh5WDdwHH+o/6Rhp4F0DEwcoMrP2HNpVEgq/zDLxJQZ2qOk
 GDG/xHPu1knPRi5pd+kLUQDPKf/lkMg9VrZHBYRIgUc71uDO18kXRG5pQ+0L1bSc4RlY
 Wl781perTbp2m0aAiH+fnoWTaF75IEEqVpNMtHb0evMeJT75shSYNCYP1H0xLr/856pn
 QdiQD2A3I99pKSQOxImpXYcfaLAGQkItiIAqLbIfvyKXTcF0lewy/IRx6AtF1e2umDpe
 lDrJ95fbspc/MBFcW4O3Q8HutmUM56qXsFH0rnzX8QisAti3TtqZwpfexLmqPW+RdY4E
 jfpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Eq0LoaXT
Subject: [Buildroot] [PATCH v4 2/2] package/python-betterproto: new package
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
Changes v3 -> v4:
 - use poetry instead of setuptools
Changes v2 -> v3:
 - add missing python-datetime runtime dependency
---
 package/Config.in                                 |  1 +
 package/python-betterproto/Config.in              |  8 ++++++++
 .../python-betterproto/python-betterproto.hash    |  5 +++++
 package/python-betterproto/python-betterproto.mk  | 15 +++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-betterproto/Config.in
 create mode 100644 package/python-betterproto/python-betterproto.hash
 create mode 100644 package/python-betterproto/python-betterproto.mk

diff --git a/package/Config.in b/package/Config.in
index 1c8f6db14d..8a165c1aa9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1007,6 +1007,7 @@ menu "External python modules"
 	source "package/python-backcall/Config.in"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
+	source "package/python-betterproto/Config.in"
 	source "package/python-bidict/Config.in"
 	source "package/python-bitarray/Config.in"
 	source "package/python-bitstring/Config.in"
diff --git a/package/python-betterproto/Config.in b/package/python-betterproto/Config.in
new file mode 100644
index 0000000000..8548fd43ba
--- /dev/null
+++ b/package/python-betterproto/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_BETTERPROTO
+	bool "python-betterproto"
+	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_GRPCLIB # runtime
+	help
+	  A better Protobuf / gRPC generator & library.
+
+	  http://github.com/danielgtaylor/python-betterproto
diff --git a/package/python-betterproto/python-betterproto.hash b/package/python-betterproto/python-betterproto.hash
new file mode 100644
index 0000000000..8d23d2ae56
--- /dev/null
+++ b/package/python-betterproto/python-betterproto.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/betterproto/json
+md5  bd4192c2997959100097479c34ff87e6  betterproto-2.0.0b6.tar.gz
+sha256  720ae92697000f6fcf049c69267d957f0871654c8b0d7458906607685daee784  betterproto-2.0.0b6.tar.gz
+# Locally computed sha256 checksums
+sha256  a5b8df75467e4b57a308a94cce5fdae84808a83ee6cd5af7e175c6b9784a753f  LICENSE.md
diff --git a/package/python-betterproto/python-betterproto.mk b/package/python-betterproto/python-betterproto.mk
new file mode 100644
index 0000000000..37f72f8166
--- /dev/null
+++ b/package/python-betterproto/python-betterproto.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-betterproto
+#
+################################################################################
+
+PYTHON_BETTERPROTO_VERSION = 2.0.0b6
+PYTHON_BETTERPROTO_SOURCE = betterproto-$(PYTHON_BETTERPROTO_VERSION).tar.gz
+PYTHON_BETTERPROTO_SITE = https://files.pythonhosted.org/packages/45/43/4c44efd75f2ef48a16b458c2fe2cff7aa74bab8fcadf2653bb5110a87f97
+PYTHON_BETTERPROTO_SETUP_TYPE = pep517
+PYTHON_BETTERPROTO_LICENSE = MIT
+PYTHON_BETTERPROTO_LICENSE_FILES = LICENSE.md
+PYTHON_BETTERPROTO_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
