Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943EDC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 19:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E18B40391;
	Wed, 27 Jul 2022 19:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E18B40391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CbzsjoDE1asS; Wed, 27 Jul 2022 19:30:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B95E40122;
	Wed, 27 Jul 2022 19:30:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B95E40122
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DEBA1BF3C6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 587BD60E65
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 587BD60E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OGEgtYTZrnCf for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 19:30:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BF2B60D9C
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BF2B60D9C
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 19:30:12 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q18so15411035wrx.8
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 12:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eEE9ZGFLtntVvkas/gQw/A9JkyH+cwgBAvrs+bjumUc=;
 b=W3G/UQiXZjNHQ1kXT1lnOr/0Yr+y3SusXEyLnYyaM5tc+YeoL8+9CivjvLz+qD80iT
 /xU40UxAWoL782U/UNDdIECgNV67XCPQPl1sZ5sQTSpIX8ZcFwijdhq85o/lYqjulyir
 6nq3CiEPBTIMtlnKf7TPoEpS7tzQXLFVHIfEOii1I51LfZoUIgvUl2pC+hwcwCSr+Tj2
 DFpZylCYD9p2tPz8Qg8JpIw2xYNMiUktA6KFiAfweOjmHfelG/FAY0fS/hM9IKYkzbPd
 vgbMMTm/x+qzLlogUg+ytEZxZc1DZz767PhNv5AHsn3qCbeh4GZc/Fjq2ySN+LPSevUy
 g0fQ==
X-Gm-Message-State: AJIora+0NHATUDTvjcEv5J9FfXlcbHbKi3/CHtbkPOwwQdktzV9mv02D
 MyqRqbs65rv0GMNvByp0MyJbg2iVow5XkQ==
X-Google-Smtp-Source: AGRyM1vYGshovniwHhPnBlDrxhjsYXKfcDlSDuTv81p+evJ0m7rZYfZmvvIG3GhcG3a0FEJuEIA6Rw==
X-Received: by 2002:a5d:6d0c:0:b0:21e:5391:7a64 with SMTP id
 e12-20020a5d6d0c000000b0021e53917a64mr15655173wrq.498.1658950210176; 
 Wed, 27 Jul 2022 12:30:10 -0700 (PDT)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adfea10000000b0021eed2414c9sm605554wrm.40.2022.07.27.12.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 12:30:09 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 21:29:46 +0200
Message-Id: <20220727192948.18653-2-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
References: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eEE9ZGFLtntVvkas/gQw/A9JkyH+cwgBAvrs+bjumUc=;
 b=UBkq68YjhXB/jaekTBvwEKnebMY/dg2Sr9RBrHyuUtUJKnGcVGeImJG/eQlJIWaGo7
 eMU11e8Y295Xm1yD6XY65bcCJ6P5yj06KtnBQxdUpFcsvGJnn/LrXqW7sddNYfEEsKbP
 Ixd9iPCA87vO8T4bVenncOYnKod+IdaR0z9Gbv4UL9/dciBViH1p/Js8+Vf0vo1cAydW
 vVclHcmtInP5OcwVVZuor0lc3wusx47qhTQUY7RZ9uBMvuSLqEsBmWZaZd3so3F1yFir
 9/X4k2DDpvrXerQlm8eU+V5UDrYdPq8CqpeVgwhYVR0fKNbTHsCULM/awZiDz2L34QH+
 tsRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UBkq68Yj
Subject: [Buildroot] [PATCH v5 2/4] package/python-beniget: new host-only
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

It is a dependency of python-pythran.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-beniget/python-beniget.hash |  5 +++++
 package/python-beniget/python-beniget.mk   | 15 +++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/python-beniget/python-beniget.hash
 create mode 100644 package/python-beniget/python-beniget.mk

diff --git a/package/python-beniget/python-beniget.hash b/package/python-beniget/python-beniget.hash
new file mode 100644
index 0000000000..cd4fa7b873
--- /dev/null
+++ b/package/python-beniget/python-beniget.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/beniget/json
+md5  a2bbe7f17f10f9c127d8ef00692ddc55  beniget-0.4.1.tar.gz
+sha256  75554b3b8ad0553ce2f607627dad3d95c60c441189875b98e097528f8e23ac0c  beniget-0.4.1.tar.gz
+# Locally computed sha256 checksums
+sha256  64ad3e304e9d2d8731c26ac3e652335a6016e38be2f71fe30350be51c6d500b0  LICENSE
diff --git a/package/python-beniget/python-beniget.mk b/package/python-beniget/python-beniget.mk
new file mode 100644
index 0000000000..9970546b14
--- /dev/null
+++ b/package/python-beniget/python-beniget.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-beniget
+#
+################################################################################
+
+PYTHON_BENIGET_VERSION = 0.4.1
+PYTHON_BENIGET_SOURCE = beniget-$(PYTHON_BENIGET_VERSION).tar.gz
+PYTHON_BENIGET_SITE = https://files.pythonhosted.org/packages/14/e7/50cbac38f77eca8efd39516be6651fdb9f3c4c0fab8cf2cf05f612578737
+PYTHON_BENIGET_SETUP_TYPE = setuptools
+PYTHON_BENIGET_LICENSE = BSD-3-Clause
+PYTHON_BENIGET_LICENSE_FILES = LICENSE
+HOST_PYTHON_BENIGET_DEPENDENCIES = host-python-gast
+
+$(eval $(host-python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
