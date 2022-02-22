Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EDDC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 12:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAA9940160;
	Tue, 22 Feb 2022 12:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LftPpvw2r1u2; Tue, 22 Feb 2022 12:49:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C72240155;
	Tue, 22 Feb 2022 12:49:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5601BF97F
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 12:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47D86812C6
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 12:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ot4WUBSMNHhh for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 12:49:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48D828134E
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 12:49:10 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 j9-20020a05600c190900b0037bff8a24ebso1729227wmq.4
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 04:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dr+eKNNDY+WgQEj9zmec15T7+Z6JXyGpIWZc15nRJUo=;
 b=ano+FC3ech5m5qLMH9K7m40wmt5p/Zxv58ZylFCm9hsBehKVMcO/uN43tEHfZYWEhq
 6k8pAnUD6QINamIJEoK4lR4NqDO7qPMd2De+11/zzvtH09NFHxPwEwabgrv5vjTF5vUE
 mh5ktXCJGoJDcoMjp52gW0QxP616cD9gk3cgLveLKRWcPP0V+zr1Zfv0ZBVHMeEebbNu
 PgswHGkY/oNs44y7g+ZDiAlG3Og5/z7DXUcBYLo13bpQ5prowgPpHHlB3EHDagUgcM99
 coAATPRJ2RoS1uTGuhLoFZwhQ3LVhRsZili1SQ1ZirgupShBGHluJzMQc83fR8bPc9x6
 odTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dr+eKNNDY+WgQEj9zmec15T7+Z6JXyGpIWZc15nRJUo=;
 b=AEvzNTLhBJDbfWuEYYH/1X1YLYNtGL6mp8PqhBycb3Wd9UO6ZET1czXhT4I57aOevk
 opKV/AHxARyEIdg6yI/3a13IyN8qXDse7/6QG9IQJ0R5bF+v+31ffsxoU0zAGrQIA3lm
 UVnmrq+XII+oqUcWC0AoKILKk3KHpP64Vt9uvLfcCC0Qn3HSo/i2QleSmCl6BYaz2qHc
 vnHdQOIFHZsv+ED4wE/dLsP9mi3fjjzAOnuOJ4wqJHZtIrEq/wuUNTJhgI1BYOj9GP+o
 IuTX7CZbX8Jji8XuXi7YPurcgyICdAbye/DT3TduhMdYxWB0h5hSzdGDXCSVeoxCfE0h
 5byw==
X-Gm-Message-State: AOAM530hbo8NCTPii95Bz5+YgUXJpOfYAy43wUthQTUB9Mwq9nD2fXId
 N7X87dd9XABfGeuerr3AlfM55H40lug=
X-Google-Smtp-Source: ABdhPJwIwj+xRvNeCP0o9jjyl5dp8B3F0Q5ryxJo5xuuD2uxEkFaCtZjaM6QeO1fOxFHZ9sBW9Tu9g==
X-Received: by 2002:a05:600c:4f46:b0:37c:8fba:4054 with SMTP id
 m6-20020a05600c4f4600b0037c8fba4054mr3186278wmq.101.1645534148342; 
 Tue, 22 Feb 2022 04:49:08 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id bg31sm1428840wmb.1.2022.02.22.04.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 04:49:08 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue, 22 Feb 2022 13:48:49 +0100
Message-Id: <20220222124850.6050-3-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220222124850.6050-1-guillaume.bressaix@gmail.com>
References: <20220222124850.6050-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/4] package/python-pythran: new host-only
 package
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
Cc: gwen@trabucayre.com, "Guillaume W . Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Generated with scanpypi and converted to host.

It is a dependency of python-scipy.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-pythran/python-pythran.hash |  6 ++++++
 package/python-pythran/python-pythran.mk   | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 package/python-pythran/python-pythran.hash
 create mode 100644 package/python-pythran/python-pythran.mk

diff --git a/package/python-pythran/python-pythran.hash b/package/python-pythran/python-pythran.hash
new file mode 100644
index 0000000000..a24bb4dc4c
--- /dev/null
+++ b/package/python-pythran/python-pythran.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/pythran/json
+md5  e09e90484771937ab499380858bdb18d  pythran-0.11.0.tar.gz
+sha256  0b2cba712e09f7630879dff69f268460bfe34a6d6000451b47d598558a92a875  pythran-0.11.0.tar.gz
+# Locally computed sha256 checksums
+sha256  0be9f14c66a9a3cb66d5263a6495437862ce0c9cdf60d4a6c36d1e51b1244c6e  LICENSE
+sha256  e1c0ed0a99e4462016d79d835f1f479b78c4d4a07fe66598e97f449503ffd178  docs/LICENSE.rst
diff --git a/package/python-pythran/python-pythran.mk b/package/python-pythran/python-pythran.mk
new file mode 100644
index 0000000000..8234513af3
--- /dev/null
+++ b/package/python-pythran/python-pythran.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-pythran
+#
+################################################################################
+
+PYTHON_PYTHRAN_VERSION = 0.11.0
+PYTHON_PYTHRAN_SOURCE = pythran-$(PYTHON_PYTHRAN_VERSION).tar.gz
+PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/88/9f/161f08131abf7f23920cee29b691de27f10fd97ac09fb2f3532b3a7f9b96
+PYTHON_PYTHRAN_SETUP_TYPE = setuptools
+PYTHON_PYTHRAN_LICENSE = BSD-3-Clause
+PYTHON_PYTHRAN_LICENSE_FILES = LICENSE docs/LICENSE.rst
+HOST_PYTHON_PYTHRAN_DEPENDENCIES = \
+	host-python-beniget \
+	host-python-gast \
+	host-python-numpy \
+	host-python-ply
+
+$(eval $(host-python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
