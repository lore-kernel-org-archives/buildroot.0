Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7586C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 03:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 739CD821F9;
	Sun,  5 Nov 2023 03:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 739CD821F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uo4n4W_7XatR; Sun,  5 Nov 2023 03:18:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1D9D821D1;
	Sun,  5 Nov 2023 03:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1D9D821D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F42D1BF861
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 03:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0687A4042D
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 03:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0687A4042D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C9uEovqZU9xu for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 03:18:12 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F06B40105
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 03:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F06B40105
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7ac61c58d85so144330639f.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 20:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699154290; x=1699759090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T3ZIsivKv5C13VVVPEo4Lj4ieNn+96mOmFUPILP7VDs=;
 b=XWMRWSAttKdRw4CVi0czXbS899WoRnZ+ZjKcdqSaJiS9zwGVfITzDnOXZcSNLTQ5nO
 tAe2sTWSf2+Kual7cOk0It98n68xJxMGKBgBVgF4LNB443JsjlafhbYe5Fgk0VakbbRt
 OAM4fIEMUhWAsXaL+IWt5MQLvCnST7JP3qH3GfxR0+vYi2+OhKLsfdtbNmFQjNsKVJcr
 SFM8cQ8mWgnjX4lrZj/jG6ujTi5kzE2Z5EoX+nKMIeoOG0KmesMHTC8DWbl3n0fXKOMS
 KrjhxDu/egrNdEwJmqYsW0TQ9STsF/hf+dHZG3cd3AGymm/Wv5ZYcZKCpByqym3AnkRZ
 h59w==
X-Gm-Message-State: AOJu0YwM07uwujtM73OyAGp7wqCcx+tFlQys0gYPcuRnEgGdlF62iwet
 f/Sc6L3BiE0Yn2mhcGDJsMyY8j5Wb34=
X-Google-Smtp-Source: AGHT+IH3y0hQa2+NdBF2CpkQy3eMYMuD8Pxn4EvoGyXMCnrBXw5L2CPAYP8c+g5wrjtJY4/MiR9fJg==
X-Received: by 2002:a05:6602:158b:b0:780:c787:637b with SMTP id
 e11-20020a056602158b00b00780c787637bmr6631004iow.0.1699154290681; 
 Sat, 04 Nov 2023 20:18:10 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 y20-20020a5ec814000000b0079216d6f219sm1512187iol.14.2023.11.04.20.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 20:18:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 21:18:05 -0600
Message-Id: <20231105031806.2778810-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699154290; x=1699759090; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T3ZIsivKv5C13VVVPEo4Lj4ieNn+96mOmFUPILP7VDs=;
 b=YyTUN5PGiHr6Vgx0FkSipbKhRepN/Xt/eLI2yQz6NVuUAxENPeltpsBLnHJTGPScIw
 NHwtIeNLU0DP7Be7fi7B3oD6EVO0i/8IvvSpoCgl2H+2A4idDFDdYqo5HSY9Jy5KWDFk
 C6PAAh2gq0rTczEWVAfnCgxuzATPSaE3YTnC9Sn313YCwfCQgG2O+4TTawQPSgoTL9qS
 yyISC0q27uL37TN4B17mKZs56yrhDsNj/6n6KvX8U3qzXh2SS6oygo2qi2/+Dpohir6J
 u40KU07FnYTD6qd5ROkzJP72jjUOH9rUDavWij7LQ0HWSa45s9OBF6jtQiMG90uU07Rm
 Hjjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YyTUN5PG
Subject: [Buildroot] [PATCH 1/2] package/python-versioneer: new host package
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
 package/python-versioneer/python-versioneer.hash |  5 +++++
 package/python-versioneer/python-versioneer.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-versioneer/python-versioneer.hash
 create mode 100644 package/python-versioneer/python-versioneer.mk

diff --git a/package/python-versioneer/python-versioneer.hash b/package/python-versioneer/python-versioneer.hash
new file mode 100644
index 0000000000..44cbeb1593
--- /dev/null
+++ b/package/python-versioneer/python-versioneer.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/versioneer/json
+md5  1703d6ced3656553066fa71e42c5eee6  versioneer-0.29.tar.gz
+sha256  5ab283b9857211d61b53318b7c792cf68e798e765ee17c27ade9f6c924235731  versioneer-0.29.tar.gz
+# Locally computed sha256 checksums
+sha256  b5065838cbac452dfc855ba6e6e031481ad2c68406f70d21ead9321374653e6c  LICENSE
diff --git a/package/python-versioneer/python-versioneer.mk b/package/python-versioneer/python-versioneer.mk
new file mode 100644
index 0000000000..5dbf0dd1c2
--- /dev/null
+++ b/package/python-versioneer/python-versioneer.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-versioneer
+#
+################################################################################
+
+PYTHON_VERSIONEER_VERSION = 0.29
+PYTHON_VERSIONEER_SOURCE = versioneer-$(PYTHON_VERSIONEER_VERSION).tar.gz
+PYTHON_VERSIONEER_SITE = https://files.pythonhosted.org/packages/32/d7/854e45d2b03e1a8ee2aa6429dd396d002ce71e5d88b77551b2fb249cb382
+PYTHON_VERSIONEER_SETUP_TYPE = setuptools
+PYTHON_VERSIONEER_LICENSE = Unlicense
+PYTHON_VERSIONEER_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
