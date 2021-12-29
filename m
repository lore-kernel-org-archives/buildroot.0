Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AFFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 08:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B54BC60B88;
	Wed, 29 Dec 2021 08:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CEpBk4WoUtHB; Wed, 29 Dec 2021 08:43:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 137D960B64;
	Wed, 29 Dec 2021 08:43:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 170941BF293
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 08:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06DD54023E
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 08:42:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XK6C1x41Js0j for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 08:42:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3468A40236
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 08:42:35 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id g5so16011637ilj.12
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 00:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U40BPliAvOK9O2CdGvm2Cr1slu+tNPMzL+N+P0KGzhw=;
 b=ThUQxY+t0n0KnLDxEC+lQ43PtbzEPSMbL+SONGJ2PkEDAhtEcTiRuM1hcbnvFqh7BR
 blq7pMlvDncx2gTHJBc/xvQRtIl0WF+dNvHGsPvKITRkEujY/JlttgwEZZIi5fcEIaBf
 Pio+nlTZ5zjvRoq+ROC5sYFAYF67nzY6zeZqjkx95/Hvl+HuMM7RZiIc1JevOP0v7O1o
 jiKQtRqn2wS8CasodpIdi2Cw0ugRcdOJeK6SZmSSsF2w/SHMIQ4uigou7ubQYYkvFJzp
 D1be4knaTmdQ69XHN5ZC4aIkwxGsDtIqSkhnDOA2aVI6mL8dOYUBlJbU5RHkgXQN1JMo
 zjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U40BPliAvOK9O2CdGvm2Cr1slu+tNPMzL+N+P0KGzhw=;
 b=DxVBhp/LKOP4z66ka+p6k4465lMVpnhR8019iui/FPby8K/aOQIwL0Ahyc2pnaOxNI
 2Iw4ju1pygVeJazmrHrSmR2Q/FSrXtkDO6VdtLqB1em0rS65wCK9xu+qdabkXxN0p1lL
 3rui/qftaq+Ob2K/b7cisrGLwIK5gu+8KXhFHC8Qz6JwUfLHhCodWjeNjvj3CwZS9Mfk
 rt6HuWE749yQaenmf4MhvF6ZFJnKwPK9PP2O74n9jZgdLreHzGtkohkPyVC6yOFDjfiF
 h/UEfZMoyNapO9O14iLWbnkypHUj6KUG76CRo/e0/QEsSb+XxY0Gze8s9dV55F0lFgyY
 ynyA==
X-Gm-Message-State: AOAM530MEr5Ah37Qa4XSqE0evcrwds1dQMsOg9RqpIYGBOu0RK3OaJEQ
 dFjJqtq8uPJV6IzQsYKPVobNQuhdcmfCJQ==
X-Google-Smtp-Source: ABdhPJzi435AtLyylnqYgTBlXC5d2SWQ1h80734VFWJhd5ganQw+5fK/PTWZxFdezEVoBOzev3M6Hw==
X-Received: by 2002:a05:6e02:1c87:: with SMTP id
 w7mr11120239ill.205.1640767354071; 
 Wed, 29 Dec 2021 00:42:34 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id p15sm12166788ilo.83.2021.12.29.00.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 00:42:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 01:42:22 -0700
Message-Id: <20211229084223.521362-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211229084223.521362-1-james.hilliard1@gmail.com>
References: <20211229084223.521362-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 5/6] package/python-pypa-build: new package
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

Due to a namespace clash with python-build we need to use a different
package name.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-pypa-build/python-pypa-build.hash  |  5 +++++
 .../python-pypa-build/python-pypa-build.mk    | 19 +++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 package/python-pypa-build/python-pypa-build.hash
 create mode 100644 package/python-pypa-build/python-pypa-build.mk

diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
new file mode 100644
index 0000000000..c7daedc6b3
--- /dev/null
+++ b/package/python-pypa-build/python-pypa-build.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/build/json
+md5  ec3dbe55359ee735b45766b30dfad877  build-0.7.0.tar.gz
+sha256  1aaadcd69338252ade4f7ec1265e1a19184bf916d84c9b7df095f423948cb89f  build-0.7.0.tar.gz
+# Locally computed sha256 checksums
+sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
new file mode 100644
index 0000000000..6babade672
--- /dev/null
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-pypa-build
+#
+################################################################################
+
+PYTHON_PYPA_BUILD_VERSION = 0.7.0
+PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
+PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/f0/62/c73b775216bb1f34962beaf005f38460c6161177fef6e068a7a0c30a1597
+PYTHON_PYPA_BUILD_LICENSE = MIT
+PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
+PYTHON_PYPA_BUILD_SETUP_TYPE = setuptools
+HOST_PYTHON_PYPA_BUILD_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_PYPA_BUILD_DEPENDENCIES = \
+	host-python-packaging \
+	host-python-pep517 \
+	host-python-tomli
+
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
