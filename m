Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDC5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 16:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8289402DC;
	Sat, 19 Feb 2022 16:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0wlZRCutx6x; Sat, 19 Feb 2022 16:54:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B43B34020B;
	Sat, 19 Feb 2022 16:54:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCABB1BF588
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 16:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C90D481CA3
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 16:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k6_GiXcOdt3W for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 16:54:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EE1281BD9
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 16:54:01 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id e3so19739313wra.0
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 08:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dr+eKNNDY+WgQEj9zmec15T7+Z6JXyGpIWZc15nRJUo=;
 b=LtUj2ZX5h1cnJhegyvjv85ADJUbLG6D/BMjd2hXUjGfPSsOx1PkT54VapuN3CkJEWQ
 DIlSuX7v7oyDO5HFejxFk7RbA2222HmCIUumsHRV1uaJr8k5JDxSmDJXxFfNrJKngOAW
 u97vyLW1IQcCOETHbYjwBlGCj09RCAcww01ej3DZdY15W90j3silVljzwqePEjWQrHuC
 8NUP5REF+p3xex7+gXbRALSQuv8MPdoqsLwcyuo5vaf8hFZo0xBXkt7I89kUg/wbHNNT
 fmVBWKIFhQN3xi1Jx3ohdCK9463p6xlRDpL1PSg8+1sqfX4SAjlR/cBJXhFP9/aRwEa0
 hiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dr+eKNNDY+WgQEj9zmec15T7+Z6JXyGpIWZc15nRJUo=;
 b=0kSVlb+CJanBiVo6vtPfu06EIF8tQKpvkffJiddbRtjoKft5xNEG+pFiW2h09JwDHO
 wS+gHeTFnBsjgkGQ+nZmO24HBlg2DbjSaUx+FTau9eiya0zj5pq1yDQBI0LB1shvRni0
 xTpCWJEt59M5e6X4r9aD6Z+3pS6XAvynOeinFvKBzVifQhsymS2OEfYM8Jg68WRL9GSy
 VsvhU30hRk5a8RlzI5tshPTvSRL8AW6GxQ39MGkn32VRYp9yYRnTIxKDJRlu9hoxOCcC
 ZZoWyeMqOkHXCfNQAuwErxBCCUB6VFLQRbkCiTYvIZyVVzdsj3AL7zRD1eFUbZ50QGgn
 cVpA==
X-Gm-Message-State: AOAM533bv/K0YoJhbR0nvoBpDjcSPWzTlXoK2hJlV/0gXzvt/zlSgSUi
 lqB5IIxZ09B2ud8gurdzpfqW2Y+WqQuipg==
X-Google-Smtp-Source: ABdhPJzGZ47LTt3xC5iVDZ+sj6uEU4Eg8n2QOhbT4n+kvSCuBRdwVBralUFQYw/3gfa0fJzw2RQTLw==
X-Received: by 2002:adf:c406:0:b0:1e4:a5ae:34a3 with SMTP id
 v6-20020adfc406000000b001e4a5ae34a3mr10289992wrf.407.1645289639581; 
 Sat, 19 Feb 2022 08:53:59 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id f18sm3206549wmg.21.2022.02.19.08.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 08:53:59 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sat, 19 Feb 2022 17:53:10 +0100
Message-Id: <20220219165311.9775-3-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220219165311.9775-1-guillaume.bressaix@gmail.com>
References: <20220219165311.9775-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/python-pythran: new host-only package
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
Cc: jeanmichel.friedt@femto-st.fr,
 "Guillaume W . Bres" <guillaume.bressaix@gmail.com>, gwen@trabucayre.com,
 thomas.petazzoni@bootlin.com, yann.morin.1998@free.fr
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
