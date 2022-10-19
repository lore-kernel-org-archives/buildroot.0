Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBA3C43217
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 21:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20D15402F6;
	Wed, 19 Oct 2022 21:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20D15402F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19Xs17k3on6j; Wed, 19 Oct 2022 21:54:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D00914016F;
	Wed, 19 Oct 2022 21:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D00914016F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFAB71BF41B
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A727941C10
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A727941C10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FacBWwFffXZP for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 21:53:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11419418FD
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11419418FD
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 21:53:54 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id a17so9935397ilq.1
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 14:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zqU9dUTIPOt9uO/L5Z3MtrJjON/GFNdWwdVv5aZehZA=;
 b=yqqULr2VkCbioZyxwOitDWcMuiY9zdQiD5eKUq2EH4fb9KlZ0+W1qhNqVE0Rq1tbvK
 AlgNll6RJhgt4XprQN/NI2zDvl2FplmV+Iaz7Z4dQCoWTRRSfpROpTVAUDXcFSE3G0Qd
 Zt3q/yd4a4oTpLPhP1HPFw3qTv+B1kA8HMDEW4qohpBFyBKQCblKTr2DVgvmDCBSS6d1
 kXcZm4gj2mw8eMCYPcGfFskcrcVPs5NHkYR5KZp628m34E4YUDo4kgauz9amcvtya12t
 Yxwb4ddm8U5TIFsIp/NVIX0vF1HisfZbmjo5vMfOD5xXKKpTp9vKzA7bLDuBVJtyWxZA
 LeRw==
X-Gm-Message-State: ACrzQf3nuf1Je/+dJSgr7KDN8Vl3fro0nCD37x1djTc9ub9u0RTDa7fV
 wd4HK/uPObP7DxX2rAopQa//WlUycpRkUg==
X-Google-Smtp-Source: AMsMyM7+vV0M7qLAEDumh3auYByWlMSf3kdmn+P/MHSS0/JRDz7eYpzyFqRnCBuFUUMA0vUpk8POfA==
X-Received: by 2002:a05:6e02:1c46:b0:2f8:e9cc:7ed3 with SMTP id
 d6-20020a056e021c4600b002f8e9cc7ed3mr7523660ilg.69.1666216433907; 
 Wed, 19 Oct 2022 14:53:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 v3-20020a056602058300b006bc69b0fa07sm2645358iox.12.2022.10.19.14.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 14:53:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 15:53:44 -0600
Message-Id: <20221019215348.3262192-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019215348.3262192-1-james.hilliard1@gmail.com>
References: <20221019215348.3262192-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zqU9dUTIPOt9uO/L5Z3MtrJjON/GFNdWwdVv5aZehZA=;
 b=Xpzs2cYh8O7TiibjNRbLIqEY388hRi4cLnT9NSjAWwLjEtZVEQGYFsarXwqTx8kdfv
 aYcXTGapG1HUQPOluA7QEP12y1qVDiCMBKXY0jfZBiBKmRgF0nD5slF1tlfofiZmznlV
 m4pvAYs2ZiYC12uHDlSbC3eFSWIkfngZXQcRojuMdrgaFUGk+fIrYA01pOuDubD3LgZX
 J+6GIPz9mgK2gPbyBPhSjQvYdYYzcG5rGFYpFEYudjRVmVMD9XiKglRdc8qv3UhpBnb4
 D9H7jT3OMO+577FyDZB2At76Fiydv0tPuf6UKm5mHqKWYzRrwZ9sHQmnAWztb2MGS5V6
 T5cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Xpzs2cYh
Subject: [Buildroot] [PATCH 3/7] package/python-pathspec: new packages
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                   |  1 +
 package/python-pathspec/python-pathspec.hash |  5 +++++
 package/python-pathspec/python-pathspec.mk   | 14 ++++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/python-pathspec/python-pathspec.hash
 create mode 100644 package/python-pathspec/python-pathspec.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5784c4bca2..48d2193db6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1389,6 +1389,7 @@ F:	package/python-logstash/
 F:	package/python-maturin/
 F:	package/python-multidict/
 F:	package/python-mypy-extensions/
+F:	package/python-pathspec/
 F:	package/python-pep517/
 F:	package/python-pycares/
 F:	package/python-pydyf/
diff --git a/package/python-pathspec/python-pathspec.hash b/package/python-pathspec/python-pathspec.hash
new file mode 100644
index 0000000000..91e4fb85b7
--- /dev/null
+++ b/package/python-pathspec/python-pathspec.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pathspec/json
+md5  6f4fde5e701d328a2846d206edb63aa9  pathspec-0.10.1.tar.gz
+sha256  7ace6161b621d31e7902eb6b5ae148d12cfd23f4a249b9ffb6b9fee12084323d  pathspec-0.10.1.tar.gz
+# Locally computed sha256 checksums
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/python-pathspec/python-pathspec.mk b/package/python-pathspec/python-pathspec.mk
new file mode 100644
index 0000000000..ccb794cce9
--- /dev/null
+++ b/package/python-pathspec/python-pathspec.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pathspec
+#
+################################################################################
+
+PYTHON_PATHSPEC_VERSION = 0.10.1
+PYTHON_PATHSPEC_SOURCE = pathspec-$(PYTHON_PATHSPEC_VERSION).tar.gz
+PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/24/9f/a9ae1e6efa11992dba2c4727d94602bd2f6ee5f0dedc29ee2d5d572c20f7
+PYTHON_PATHSPEC_LICENSE = MPL-2.0
+PYTHON_PATHSPEC_LICENSE_FILES = LICENSE
+PYTHON_PATHSPEC_SETUP_TYPE = setuptools
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
