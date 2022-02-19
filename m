Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A348AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 17:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4090240342;
	Sat, 19 Feb 2022 17:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BKc9NZHRiu7L; Sat, 19 Feb 2022 17:03:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 150B44020B;
	Sat, 19 Feb 2022 17:03:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D09361BF588
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 17:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD01082419
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 17:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EArxE_I4tKpB for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 17:03:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA3B881BC6
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 17:03:07 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m27so7896077wrb.4
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 09:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dr+eKNNDY+WgQEj9zmec15T7+Z6JXyGpIWZc15nRJUo=;
 b=DVAFPFv9BrrWWKgKjqs9F9EucrmjI3n9J8gbJtFAIKoDIfCy/JL+zb2xWdCob0mYx4
 Urf/APFRbZIqHzprQa1ewIY9yCaZlKtKeY/gwsxHKUITtVvvg1Xy5g29V4LiFvYpXvcG
 50Ic+f2ZdaqI6/s2NMor6hq89sTLOQjXs2SxUWqI5JrI6KbZSdO50AViUkgk3HaGBRLP
 h1yQYqCVKn580qNUN+ramXEKZhYA1vjt+/xdax/eKos3zJg7M9NEu3BHdUdXq30MurTs
 94N5vj4npHiaFtjYRNQeBJHpyJgoHDFMy0sx4D3F4zoI0XibjfIxBp6JaxWEfZU91KSA
 qxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dr+eKNNDY+WgQEj9zmec15T7+Z6JXyGpIWZc15nRJUo=;
 b=Vnr1a2QcS29DvZntpgEneEuDogkZRYIqWXXOrwx4b2VzpPGUitGx9qeyGeQY/yJlYu
 PVCGeRQ22h3GoTnoY/myr9VdZv20Bs5ERgXDtKo4LlhL1/igKd5ARTL9UJ5ACaDVkGrK
 dQCC+0WBmaVI33AtNC6Y8gvic0iWsi1u7/9/U/V+PFOZoN2yFCU5Tz1fMndT/0dfti1S
 H8huzm1ElNLjxfat1SwXD+4PfYwtjk3OYulJnbpORL7ey9wFP0BaYonhnafFz5uaxuEr
 rWZbXImK5Qs4D+3Q0Pcd+l+cEtvpiIomdDquX69YjhOhQ6hQsmcvJp03w/8GvAWlFY9I
 6F+Q==
X-Gm-Message-State: AOAM530B7DCvrQCzHyUB/vQsDHVtEggTHqQ7QmezFVzDzu7n41xrFjbR
 vchkyoG0lGGMU/pr89XH51tMO+9KFZXErA==
X-Google-Smtp-Source: ABdhPJwUSQo5s0eBTtu6VmFT/5ETsAhPnXuboDJDZOL5ClY+GMG1oidVWQmRhoB/AmW99w1PyW42Iw==
X-Received: by 2002:adf:e542:0:b0:1e5:b863:e151 with SMTP id
 z2-20020adfe542000000b001e5b863e151mr9798388wrm.226.1645290185637; 
 Sat, 19 Feb 2022 09:03:05 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id a1sm28034291wri.36.2022.02.19.09.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 09:03:05 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sat, 19 Feb 2022 18:02:09 +0100
Message-Id: <20220219170210.11691-3-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220219170210.11691-1-guillaume.bressaix@gmail.com>
References: <20220219170210.11691-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/4] package/python-pythran: new host-only
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
Cc: "Guillaume W . Bres" <guillaume.bressaix@gmail.com>
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
