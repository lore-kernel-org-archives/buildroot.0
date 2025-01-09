Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B370DE77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 20:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66D8A607AB;
	Thu,  9 Jan 2025 20:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZg33yZ8tWWO; Thu,  9 Jan 2025 20:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 802B960ABB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 802B960ABB;
	Thu,  9 Jan 2025 20:11:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16194940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC3E08112E
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paYkvV1xcTfq for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 20:11:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC1238113B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC1238113B
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC1238113B
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:11:02 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3ad272538e8so8376365ab.1
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 12:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736453461; x=1737058261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KptimdWrkDxYFRs104KwXLQF8Re3dwhgcQ18fym5zZU=;
 b=sdaCTFVWA8FO7CHCtfTs00zp7cHWuQGl4Ib/LJNHKKoDsRuaTxR0G5vojypq7tXbGY
 C3690RCR2IgeL10vep4a07ateHCcwUTpHWg5iY3UOBwxUMxqwi09jSq9p71pq4hmlirL
 QD+PTk0NpbL9mlU8y79t2h2GALfUWFsb05ajJVQ75v4LVBxZGvYAfPw2CT9k7IbxGpK+
 LETdQqadlK6rRprvbbKTycbJT6V5uEZ8f7/quXTBOz5n6VkdVE1fTvyWJMLVAmM7bxbo
 mV73WR2Yi6GK5/dZ6e3s74zYfIcFizmDIruF6aCBpTRPhGAY5zdSIPxKHrs+z1nj6h9D
 hA/Q==
X-Gm-Message-State: AOJu0Yzdu/e+TGWX7QDEAAJT4tDeychZub0d/rm1AfVO/jt/+giY3yU6
 iUFJnb78WRJZib6gW6aSmxoAVwc7yceT8Xj3VkhhKL+bKY0ygaq/3D/scOXfhGI=
X-Gm-Gg: ASbGncvOJn9+Cln668co+17DusIQFen7X4Gu+uJdmCLEovIYqegUygiU3ucBI/kguom
 IJEfrCNVU4WyaumL8HwVeeJBFYgPDR2vzIcrEYWMo4pGAj7Lj1NgrhsYznsDISHzKuhrWuMOakc
 ofIub8T0Fd3/p0xapZT1X7WZw/X+nS4dym3+rRiqRVzQGZ227i7/hw4hbG3AstOLpFs9I+JuaLd
 SsTj5N1Q5+VHVPYj/cwn+yzFk/WeJDe05TRBHRrQ8ihnhqdRflUiS4nEALpr1O0vmq+aoyq7kC0
 JUMIPoN3+5GaYZmuq9GYlOtAGImjWiE=
X-Google-Smtp-Source: AGHT+IHm0ZT2iC3Y0D0nn0mdhK8IaGR9FrdnKrU6Hl23EiSb22RaWgxweDhZZGmlb8MLCzUDlWm6Vg==
X-Received: by 2002:a05:6e02:32c4:b0:3ce:3657:7407 with SMTP id
 e9e14a558f8ab-3ce4760b53fmr35767015ab.11.1736453461604; 
 Thu, 09 Jan 2025 12:11:01 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b717838sm479399173.102.2025.01.09.12.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 12:11:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 13:10:53 -0700
Message-Id: <20250109201054.2382903-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109201054.2382903-1-james.hilliard1@gmail.com>
References: <20250109201054.2382903-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736453461; x=1737058261; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KptimdWrkDxYFRs104KwXLQF8Re3dwhgcQ18fym5zZU=;
 b=VFMe8yuG/5Yc3/9iUcjT7faQ5n5+66PzR+bC/WQLWe19LvygFIT71UM/7JkIwHv4em
 1do//adwb2ZagO1yFXmp6XmPF1LbvJyqCYnIfLAwUVBOAyYv2UsT9C7/pP96P5Agyp5V
 gWj+aQxAnIB5sxARqeUXX83YxXVtOHGWdcSplDq5MEFPUMXHSsp1xU+xbBmVLpvI9JLf
 o/LhRu3Ebc1YmvCeW2GIakY5ZLh5Epjfv5u9I+8Ok0QaMhUWXVqGhrwHn7yox3ioLx93
 Myq7QGLCH0yxu59p8dSx9Z7yZWXIgK0AWOezn4RdMuykwCz3US0AVsuGZbKZcZGKZ68+
 eQzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VFMe8yuG
Subject: [Buildroot] [PATCH 4/5] package/python-mypy: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                    |  1 +
 package/python-mypy/Config.in        |  8 ++++++++
 package/python-mypy/python-mypy.hash |  5 +++++
 package/python-mypy/python-mypy.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/python-mypy/Config.in
 create mode 100644 package/python-mypy/python-mypy.hash
 create mode 100644 package/python-mypy/python-mypy.mk

diff --git a/package/Config.in b/package/Config.in
index 400183516e..b14056052b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1235,6 +1235,7 @@ menu "External python modules"
 	source "package/python-mwclient/Config.in"
 	source "package/python-mwscrape/Config.in"
 	source "package/python-mwscrape2slob/Config.in"
+	source "package/python-mypy/Config.in"
 	source "package/python-mypy-extensions/Config.in"
 	source "package/python-nested-dict/Config.in"
 	source "package/python-netaddr/Config.in"
diff --git a/package/python-mypy/Config.in b/package/python-mypy/Config.in
new file mode 100644
index 0000000000..38ea7dc30f
--- /dev/null
+++ b/package/python-mypy/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_MYPY
+	bool "python-mypy"
+	select BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  Optional static typing for Python.
+
+	  https://www.mypy-lang.org/
diff --git a/package/python-mypy/python-mypy.hash b/package/python-mypy/python-mypy.hash
new file mode 100644
index 0000000000..21b2c9aba0
--- /dev/null
+++ b/package/python-mypy/python-mypy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/mypy/json
+md5  8297bf7865feffd704735f0fdb5a4150  mypy-1.14.1.tar.gz
+sha256  7ec88144fe9b510e8475ec2f5f251992690fcf89ccb4500b214b4226abcd32d6  mypy-1.14.1.tar.gz
+# Locally computed sha256 checksums
+sha256  de341f6e031d021aab9eb27bdf713cc6fb844dee832ef3bcd4688bff5517220b  LICENSE
diff --git a/package/python-mypy/python-mypy.mk b/package/python-mypy/python-mypy.mk
new file mode 100644
index 0000000000..26614b2948
--- /dev/null
+++ b/package/python-mypy/python-mypy.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# python-mypy
+#
+################################################################################
+
+PYTHON_MYPY_VERSION = 1.14.1
+PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
+PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/b9/eb/2c92d8ea1e684440f54fa49ac5d9a5f19967b7b472a281f419e69a8d228e
+PYTHON_MYPY_SETUP_TYPE = setuptools
+PYTHON_MYPY_LICENSE = Apache-2.0, Python-2.0.1
+PYTHON_MYPY_LICENSE_FILES = LICENSE
+PYTHON_MYPY_DEPENDENCIES = \
+	host-python-mypy-extensions \
+	host-python-types-psutil \
+	host-python-types-setuptools \
+	host-python-typing-extensions
+HOST_PYTHON_MYPY_DEPENDENCIES = \
+	host-python-mypy-extensions \
+	host-python-types-psutil \
+	host-python-types-setuptools \
+	host-python-typing-extensions
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
