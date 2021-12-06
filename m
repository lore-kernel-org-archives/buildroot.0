Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33D6C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 12:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DE9A80D0C;
	Mon,  6 Dec 2021 12:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1CGhzEsoRgW6; Mon,  6 Dec 2021 12:03:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CE5980CA9;
	Mon,  6 Dec 2021 12:03:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6EB91BF3C0
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 12:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D65D540426
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 12:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qzXrBPDQr1FU for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 12:03:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7819401F2
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 12:03:38 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id y16so12567358ioc.8
 for <buildroot@buildroot.org>; Mon, 06 Dec 2021 04:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lh68gcd+RDUO9phtg5TpHb1ug7eUR1EQTzMCdidyats=;
 b=Om6sCjkGg0n55jiKgkIZxLOSTZft/uPA0VFyHoBEAbDsJi6z5WqLIh59uQQhosZ2zU
 opulEouQY+Yw/zE8SMu/fsD29YNY6JrekzkrVoUkPwAE7W3T+NYalAaJf+1/1191jPJf
 I8OmfhckT0rg/QVF0lMBKggyYwg6W8xF2ypFbzqrBDD7hU3rFawN5TWrm6RSq+vOiGel
 1Zuzp6al5xUnG7D04+BIrnjtDLbdQpX6pM0gPa9IbIRlkM9Nv6Jo/y8bzNl1Tl7wSEc8
 31KwqqnrlvH+e7So8yL+QLWCVAfQdhSbcgRwijZ4Jr2Efi8WrQqWlHSY6PnKKDjTP0/V
 Nhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lh68gcd+RDUO9phtg5TpHb1ug7eUR1EQTzMCdidyats=;
 b=PqOImTqqDe7OfCNnYF/zCYGq1XyEbZ3NVLDo+0euiM4aO8YHnpE36jigTWv9qyRtJz
 rL9IM/B+pTWolsYMUxDp5Q3/Ouf/BmQbUziUf74H6+KCGJ6o9qk7o/YOaZbBZCi2VraO
 AoU6QA8AKYnbKUHtnxiyCdcGDYZ7e+yNbQthAs9HHqPevQMod2F5ttEMWfQtucb1rThZ
 GWZmLbQGxMjqLrcM7oaD2OF1PlAyGeo0r9j8gwjhBp2JOr4W8D0EhiSER+RZ+nHEq+br
 VfPcX+TLO+2ZZsl+n9SURnxrjC+Ks4pt7fPe9oUNWeToGFNQQD6yjTREYBsenpcH7jYK
 piww==
X-Gm-Message-State: AOAM533PIdr5WhkdQIDmeN/8QqBKgRdqN5Q6GTHyohcvJcKfpo19yUwd
 2rgmaX7iMd+/jBVQEhFNcFp1qbfMDy8=
X-Google-Smtp-Source: ABdhPJzUw8LXOX93ZAdTobvjfTMLLsHEanOIGWMC6MxAi3MFWbdcBNw4vSB6cZpjhaWcBxuXKiARnw==
X-Received: by 2002:a05:6638:250a:: with SMTP id
 v10mr42236232jat.119.1638792217891; 
 Mon, 06 Dec 2021 04:03:37 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id u4sm7153406ilv.66.2021.12.06.04.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 04:03:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Dec 2021 05:03:20 -0700
Message-Id: <20211206120325.3120351-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/6] package/python-tomli: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-tomli/Config.in         |  7 +++++++
 package/python-tomli/python-tomli.hash |  5 +++++
 package/python-tomli/python-tomli.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-tomli/Config.in
 create mode 100644 package/python-tomli/python-tomli.hash
 create mode 100644 package/python-tomli/python-tomli.mk

diff --git a/package/Config.in b/package/Config.in
index cb94e30be3..52ef33ab97 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1243,6 +1243,7 @@ menu "External python modules"
 	source "package/python-tinyrpc/Config.in"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
+	source "package/python-tomli/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-tqdm/Config.in"
 	source "package/python-traitlets/Config.in"
diff --git a/package/python-tomli/Config.in b/package/python-tomli/Config.in
new file mode 100644
index 0000000000..e1cecaaa36
--- /dev/null
+++ b/package/python-tomli/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TOMLI
+	bool "python-tomli"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  A lil' TOML parser.
+
+	  https://github.com/hukkin/tomli
diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
new file mode 100644
index 0000000000..1a274c8a40
--- /dev/null
+++ b/package/python-tomli/python-tomli.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tomli/json
+md5  2ecbc7a23b8c8dc2fe96f588f88463d9  tomli-1.2.0.tar.gz
+sha256  d60e681734099207a6add7a10326bc2ddd1fdc36c1b0f547d00ef73ac63739c2  tomli-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
new file mode 100644
index 0000000000..4e6b023ef7
--- /dev/null
+++ b/package/python-tomli/python-tomli.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-tomli
+#
+################################################################################
+
+PYTHON_TOMLI_VERSION = 1.2.0
+PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
+PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61aed187d5f5b168c18b1d2de3827976c3691e4da8be7375aa
+PYTHON_TOMLI_SETUP_TYPE = distutils
+PYTHON_TOMLI_LICENSE = MIT
+PYTHON_TOMLI_LICENSE_FILES = LICENSE
+HOST_PYTHON_TOMLI_NEEDS_HOST_PYTHON = python3
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
