Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362D6FF886F
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 17:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09C836074A;
	Tue, 28 Apr 2026 17:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubqryr0m5je5; Tue, 28 Apr 2026 17:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3756660B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777396797;
	bh=BDZieG8nn05Ij0WreG3/Y+3hn7K6UPnv0WH1CFMze0Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=f7q/XW+971ZVF1TTgol6ibJSLw34BoxTioqlEC7/Qb+cl8VwWmd8yON2xw+c0C58v
	 eduzHW2b9jAa14ReVbYy5SSHuLGVdPfj9hM726vhs5W5iKMstAimROzSZG+/51HGzv
	 +ZYdhH7cUK0fWMJQPsNQvUgy7qU6PjRmlxKtEGxlB482165E/1nwEuL83rH+QalY06
	 mO4PSryOQB6XWNqC2zqMCC2giTOCJ3BaoaQMKtQLjWFNjgtgOIjJiufo5jhM1dVgoY
	 bpmC8t+TNAkH3Mx1u7cEUO8VFFKzp9hWi9Nrqvc78/MDvTp94/Pplzg3QrQDPULhIZ
	 B2VeJbfmoZQnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3756660B7B;
	Tue, 28 Apr 2026 17:19:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64805231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 563786074A
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GiF3yexbIVZP for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 17:19:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=frcomdev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3BE6060B7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BE6060B7B
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BE6060B7B
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 17:19:55 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id
 af79cd13be357-8c70b5594f4so5865485a.1
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 10:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777396794; x=1778001594;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QNXmAnYWlYTFgH59WZKeFVjKFb0LSaDY+Lqx7w243xM=;
 b=qOyIukyE+e1XUrqwXstIBY5+v4joZ5WAONzJHX7KvOKnhvsg7DiB3onJ8p+/+a1Tm8
 UXUdyeC4/I0WuV4ARx8yFCca5xpUQvjGBocLOGnCcCIzdEWxod4AqVS4tF3Xj2BipcsN
 JF7yVLvcDtpLKpII/5u3vcoR/LiTGtCsKWa3rWdgka+mp93hxwSxiRPl4NXE+noFKVSy
 gc2BYRtDsa5O0NpkhaHoESbsk+h5YK1/W+jMpR17qUGU+RhNqwfUYvpRMqdXvIzjQiFQ
 NT3hLQfD6hgtmRogMhXpMxSepBhe5b1zwZqfJteJle0vMCECOEKbuJ/fZt1TFji6RQ68
 keTQ==
X-Gm-Message-State: AOJu0YwuJeQ3OT1J2KKFh1QNFkQfufYVw3vXAWScbL2MoJ8qZ2xk99b6
 Lbv/j7VppulAiRaOL54O/IxSGe3uMN6/vtDKNadkNesEd3Wvt80P1fV2FfAfVu6emIM6FOOH
X-Gm-Gg: AeBDieuRaUfX/WqiEPKlyQ8D/t73CaHGtbA0Gv64sYxArVqelhlKJrewO98DCGxDdKJ
 5I7bqN3ZWbjp7O3nCNkWmkmE2E6btYynTHXHIYNCsRlta6ebHqs1vfyJr1yFIeuwh+ShpH6mbxg
 HTox3IqbpMw5ZqfLWnig4tXnlSzvHFPiKdq8xLYkurLZpqBxqdRKwMKk3/qjVL3wKvMZ4Q3km0t
 3DHN2kpuErhOvq4/vjDozWj4OfabVy5UXeEAOlhro+27MNpXLErNwAhdUV3+PCuDzjWYnc9Kd25
 9EauxBfUrevGxTzICWY/M9kkHRAnNnXx3fkWEAUYo87ItC5Ai4BHpWSNzVjiNLl3vOKkshrNd2f
 5G4Ty9LC1PdNB9vo2jq9QLtZuOPaXVFEDeczw3vZ1KHP7wC+EK8sMx7mR6k9nNoWU8k33whUF8F
 m10Y/WOqef00hPtPprQm4Vgt3XH386uEGjj11HCtr2tbQ6qlcCW+gPEDpzGNkvNNMdO3mJcEd/G
 iWXtV/Dpt3B+Yi/XSPZ
X-Received: by 2002:a05:620a:f04:b0:8cd:94f9:1bc5 with SMTP id
 af79cd13be357-8f7d568ced0mr451709985a.12.1777396793859; 
 Tue, 28 Apr 2026 10:19:53 -0700 (PDT)
Received: from precialexwin
 (bras-base-mtrlpq0313w-grc-01-76-65-67-233.dsl.bell.ca. [76.65.67.233])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8f7c50b7537sm242811385a.18.2026.04.28.10.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 10:19:53 -0700 (PDT)
From: Alexandre Ondet <frcomdev@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 13:19:29 -0400
Message-ID: <20260428171929.2646-1-frcomdev@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777396794; x=1778001594; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QNXmAnYWlYTFgH59WZKeFVjKFb0LSaDY+Lqx7w243xM=;
 b=tE0AJjQYoiAnlWwyOFXN93Qi21DG8+kaLXpMZF9w8D1KpZ1p0Hn9mNRkui3GxxrFlx
 GsT0aNjUwLdmjoIjd9Gq5FDaBYk9i+NmgfNviJko3sqrVJfU5vi7I2+XMkB2WpuE2D5M
 DV/mwgMOxEaGbogVwyAvcHFVybZ6MVX9lFxWEabe7NynrIrpXZk/EuwCDb73OgKNP9Gu
 xRXcgZZX2fg+e7xnS0LRwJCNElWvBI4/O/mFdKzW67R5Y2uxBqEs/ZqpbAtYzJBetvOB
 c4qwV1aBqZNEChU/x9e3fsdzCFF7mQd1S8XDbTfBaJenFPVda5D+N78O9bqIbFekrFMH
 BVAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=tE0AJjQY
Subject: [Buildroot] [PATCH 05/13] package/python-jose: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Alexandre Ondet <frcomdev@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexandre Ondet <frcomdev@gmail.com>
---
 package/Config.in                    |  1 +
 package/python-jose/Config.in        |  7 +++++++
 package/python-jose/python-jose.hash |  3 +++
 package/python-jose/python-jose.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-jose/Config.in
 create mode 100644 package/python-jose/python-jose.hash
 create mode 100644 package/python-jose/python-jose.mk

diff --git a/package/Config.in b/package/Config.in
index 1409370bfa..754bdee9f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1198,6 +1198,7 @@ menu "External python modules"
 	source "package/python-jeepney/Config.in"
 	source "package/python-jinja2/Config.in"
 	source "package/python-jmespath/Config.in"
+	source "package/python-jose/Config.in"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-jsonmodels/Config.in"
 	source "package/python-jsonschema/Config.in"
diff --git a/package/python-jose/Config.in b/package/python-jose/Config.in
new file mode 100644
index 0000000000..d17e80bce3
--- /dev/null
+++ b/package/python-jose/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_JOSE
+	bool "python-jose"
+	help
+	  Python library python-jose (version >= 3.3.0)
+	  Required for JOSE (JSON Object Signing and Encryption) support.
+
+	  https://pypi.org/project/python-jose/
\ No newline at end of file
diff --git a/package/python-jose/python-jose.hash b/package/python-jose/python-jose.hash
new file mode 100644
index 0000000000..b3d9a38062
--- /dev/null
+++ b/package/python-jose/python-jose.hash
@@ -0,0 +1,3 @@
+# From https://pypi.org/pypi/python-jose/3.5.0/json
+sha256  fb4eaa44dbeb1c26dcc69e4bd7ec54a1cb8dd64d3b4d81ef08d90ff453f2b01b  python_jose-3.5.0.tar.gz
+sha256  a5e618eee6d496f77ad8ae70fea6edf148159558e2d228787d9076c900a2f926  LICENSE
\ No newline at end of file
diff --git a/package/python-jose/python-jose.mk b/package/python-jose/python-jose.mk
new file mode 100644
index 0000000000..2ec7715b68
--- /dev/null
+++ b/package/python-jose/python-jose.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-jose
+#
+################################################################################
+
+PYTHON_JOSE_VERSION = 3.5.0
+PYTHON_JOSE_SOURCE = python_jose-$(PYTHON_JOSE_VERSION).tar.gz
+PYTHON_JOSE_SITE = https://files.pythonhosted.org/packages/source/p/python-jose
+PYTHON_JOSE_SETUP_TYPE = setuptools
+PYTHON_JOSE_LICENSE = MIT
+PYTHON_JOSE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
\ No newline at end of file
-- 
2.53.0.windows.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
