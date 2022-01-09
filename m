Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F35C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 03:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEC1D405AA;
	Sun,  9 Jan 2022 03:56:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aT6hoewHTPWh; Sun,  9 Jan 2022 03:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B83D64058B;
	Sun,  9 Jan 2022 03:56:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76A601BF2F2
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 03:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64D1D8140D
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 03:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G0haVVpYnnw0 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 03:56:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97E3A81656
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 03:56:10 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id h23so12815570iol.11
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 19:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U40BPliAvOK9O2CdGvm2Cr1slu+tNPMzL+N+P0KGzhw=;
 b=kYKQL6ezwZ0dUw90mbboav+xzp1iPrl5+Xq90GKxBYyOkCJb1RLIu20ndl9fLq3ZGg
 rCQUIH8weshLQSdzrvm1dL/BuxsPZISzc/r4d2vXhgn69cCelpZGrABdF/LHOvE3cBbu
 ZD2KwRxhA5w4R0/69TrOJrLoufQiWvtIhwnHYV6E8er3zbRoz3dAWL/aWT93axylNp1V
 8BYrj5MMoTECzsXIDweTXHNsVJr+B/zvN+3NHb7p47uTzgJDmtsPVuBsdHkUVmQzgIwX
 nWRfVCt/NRW2GweoDRhCQOhkZnrrGQqus0NyHDW91QSrvy+qugAZyo3QYqV+nVtD6o6b
 iFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U40BPliAvOK9O2CdGvm2Cr1slu+tNPMzL+N+P0KGzhw=;
 b=Yg5KiaSDJgQ6mjGwa8Zp+3T199JeQcHug50KaHju3ydXslCfKfTAz1YZZRQOaKAqlu
 hx6ZtH3/9bykQtTXKwC+iJEoeaKykJTreErzWxOL8YheHIHhhwwoIfQ7av1jh59QG3Q2
 m7uKdY5tjQr5L68ObE42yc9sBNtf8TFoCMZoFUMrPAciWh6qtdROcAdWHax3VqTWhsu8
 I+Yvf4KU74yFh767NPC1zYNru4rdFvGyqpM+SSFvFwk64tBu4RGU/A8mnlMa0cY+Aj36
 HfQAhxnsJhak3KKcYW+X7x53B+Y6olUle/RM2J8ZQ80cso2gl27JB9+Ze62Bh7sQm0MM
 Jnhw==
X-Gm-Message-State: AOAM532kKdK3amYpR9EF/yq2NvfJPeXKpvzctM6r2SwSIHHj4596+8kf
 iA2naANBs6kLVjpB/SOhnyeOHIotQ3A=
X-Google-Smtp-Source: ABdhPJzjdc1Iq7OYJUgKsg79hg2waPIqxwEQn963lNKNnjzbw7U9ZY5o37mR/ZIK3umSR8K/bEZ5FQ==
X-Received: by 2002:a05:6638:238a:: with SMTP id
 q10mr34525096jat.294.1641700569487; 
 Sat, 08 Jan 2022 19:56:09 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id l11sm1839833ilq.74.2022.01.08.19.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 19:56:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 20:56:00 -0700
Message-Id: <20220109035601.2483360-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220109035601.2483360-1-james.hilliard1@gmail.com>
References: <20220109035601.2483360-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/3] package/python-pypa-build: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
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
