Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C592C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 19:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16CA1829AF;
	Wed, 27 Jul 2022 19:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16CA1829AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ic2EUuxVzB50; Wed, 27 Jul 2022 19:30:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C09F823C6;
	Wed, 27 Jul 2022 19:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C09F823C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12C871BF3C6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF8B48297F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:30:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF8B48297F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qadmR-96DRCf for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 19:30:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5772823C6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5772823C6
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 19:30:13 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b26so25855386wrc.2
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 12:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dr+eKNNDY+WgQEj9zmec15T7+Z6JXyGpIWZc15nRJUo=;
 b=cX3N+iRX2BQfhwLEu7OmaVbRtKFky70m/VHejUAY7f/Gw4b0D9nN1qB3a6glmtdErX
 7oFF7MXlfh92nFyonqTKn1R4u54LsVIGfuJYjvfmisS+GvsC8J1xzbzBBXDbMrlm0DQq
 0pCFxIf0CSbI1JcyTNm4FEVkFO6UNvjshsXUz0JUIQSu/JtRbyI32cWclBR7LSGM6TRo
 Q8lCSJzZHgzUsNMuKa5hBh/LZf6to6afYL2KcJi3W1s99FoqqE0GqFPztl30o5MU+BzA
 F9ldvVbuC1gXTwQLUdxFL/YjfuNW7ttjLc6zb8SZsLeMeB1fxWUXVf4mJXXzI+Qxd0MQ
 XI5A==
X-Gm-Message-State: AJIora/P4BFLMfTtcVTxIfOfMUsad7vLYiB8iOc0t++xB2gOIeGNBvtb
 aJhRQNxss7a64e76hHpf5uGzX9n6GY1Tvg==
X-Google-Smtp-Source: AGRyM1vP/Gs+4GTmV39hnr+J9PRquJ48cQAeAu0UjeAWe741mV+rd62qioDkaKz+rH5OFMiz/Fq7hg==
X-Received: by 2002:adf:e9cf:0:b0:21e:a5d2:4f9a with SMTP id
 l15-20020adfe9cf000000b0021ea5d24f9amr6478036wrn.414.1658950211732; 
 Wed, 27 Jul 2022 12:30:11 -0700 (PDT)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adfea10000000b0021eed2414c9sm605554wrm.40.2022.07.27.12.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 12:30:11 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 21:29:47 +0200
Message-Id: <20220727192948.18653-3-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
References: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dr+eKNNDY+WgQEj9zmec15T7+Z6JXyGpIWZc15nRJUo=;
 b=bv2VLDdbsVtBRaBonqGpkgCOpWLyzNwNr7x6CdC6z7eQG87Cf640wUeLKW6e0MDtTl
 I+w/epu1y9kYBp11ym9L/ndR3k2pSykLtCA8DW0qJuJ88Kkrd0YEF5arALwfh2LjypRx
 RB9WpfSmX1LyGA8PJonJxjvTNUWKvek3srXyVDVa75L+mNYueKP1PoepfFU+tojgX8Zk
 4Y6UPrvc9LA12qUsCYoEmKjo2oH73MArPCMdrSNyRblF1ACQtXyy0qgX5o9oqz8iH1aj
 fmguzb8+rqUmu+9nhqJ3oYZpL21CMIR3Sulz1XQtGw0og3L5ZTjVeXrJPXW0cc2k+zim
 V3cA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bv2VLDdb
Subject: [Buildroot] [PATCH v5 3/4] package/python-pythran: new host-only
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, jmfriedt@femto-st.fr,
 gwen@trabucayre.com
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
