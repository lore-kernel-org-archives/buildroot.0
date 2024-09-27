Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4EFCF648D
	for <buildroot@archiver.kernel.org>; Fri, 27 Sep 2024 23:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EAE140575;
	Fri, 27 Sep 2024 23:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7xPLxDEL_o_W; Fri, 27 Sep 2024 23:09:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3982540550
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3982540550;
	Fri, 27 Sep 2024 23:09:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D91621BF349
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 23:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6A3384B0E
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 23:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHAC4fBkmzqQ for <buildroot@lists.busybox.net>;
 Fri, 27 Sep 2024 23:08:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B726C84DEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B726C84DEC
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B726C84DEC
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 23:08:54 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a0cdd77dbeso10190955ab.2
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 16:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727478533; x=1728083333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ogTNMFeYIwMz32TJML3XcQkRE6RgUiAexnrVABxBH7A=;
 b=qWl5ulnux1nFR+keEbGueSUODkuCsBQ17csmIp01JKTDHDfJQrHVZ1V6OoRcF+vxuX
 dEIyj8y9br+r6Z+aC6JpzXc/ynHXoTuajhDhoFZW9wH5VP9HE7cKw+eYlH2pziaT6Syp
 M9Pb9hTFKc9xN6nwZsREGhMqmh6upJ2TUBHd0DJn1gxaI3cJznvTLnlCxFIdGrBJWTpM
 YfssJr2n8kwf1P7hzHSssaiz6lzik+HsMbb+OZyddGDKBhWG/YTkxFREO+2oWE9qumBI
 /ov+I1I1F5qs/j2kA/+OxU/oeimJuYznay0KyWTTZ+6VjJ7cc9zzmjFzYpPaQJJtvCXh
 eBpA==
X-Gm-Message-State: AOJu0Yw2HheiY3mBnpl5yyKfJdhfSa9C/yJJobPxJnw0MPsLj35lAuwX
 /caf1JkryuV86a/zRYgRvRewIC0p3HTOx3Gwt8YGdtcxv6Am1awum+EECD/R
X-Google-Smtp-Source: AGHT+IH/neb3QxQWFnuEP283LbWl8bqwQ8Ro1VssoaQLaqhZAvef7NLSh/4bUTV+PibEJnPC4zIpig==
X-Received: by 2002:a05:6e02:1c25:b0:3a0:8d2f:2914 with SMTP id
 e9e14a558f8ab-3a3451bf26bmr44320265ab.23.1727478533436; 
 Fri, 27 Sep 2024 16:08:53 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a344d60563sm8707755ab.5.2024.09.27.16.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 16:08:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Sep 2024 17:08:48 -0600
Message-Id: <20240927230848.1853667-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927230848.1853667-1-james.hilliard1@gmail.com>
References: <20240927230848.1853667-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727478533; x=1728083333; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ogTNMFeYIwMz32TJML3XcQkRE6RgUiAexnrVABxBH7A=;
 b=TTeRC6qKSlDYkE4mvKklxlURwuIbgtuh6MaCPL1AXebQxOqYYDb+DBSN7TeRVLVknu
 2AHelFeoUAP6s+KKA4oqf05FePjGv9SnsUy9qMCuIJjgz1gKHg4XtdT7gAzUOtwlf2Ja
 ZxnJ3vXbnO9blPs32L7e1j9hcHJcNtJ9mtwBZfb3Ky8oF0g5WQj8iak2ju4+fSZjCuyd
 1Q4bkLRc/klOlam0P4NX1W3Clp39Srp+fRYtRck5vWQy5jYiNa6A8kkf/3RSAtcdRarZ
 4h601aFqRnVieshllTMfChLQbfOwV50E6XUF0WcayuXjeaQvlHRpF0hxWIL/+jTRAZlC
 WOjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TTeRC6qK
Subject: [Buildroot] [PATCH 2/2] package/python-pydantic-settings: new
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                 |  1 +
 package/python-pydantic-settings/Config.in        |  9 +++++++++
 .../python-pydantic-settings.hash                 |  5 +++++
 .../python-pydantic-settings.mk                   | 15 +++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-pydantic-settings/Config.in
 create mode 100644 package/python-pydantic-settings/python-pydantic-settings.hash
 create mode 100644 package/python-pydantic-settings/python-pydantic-settings.mk

diff --git a/package/Config.in b/package/Config.in
index 77216dc70b..df5e5ec141 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1290,6 +1290,7 @@ menu "External python modules"
 	source "package/python-pydal/Config.in"
 	source "package/python-pydantic/Config.in"
 	source "package/python-pydantic-core/Config.in"
+	source "package/python-pydantic-settings/Config.in"
 	source "package/python-pydevmem/Config.in"
 	source "package/python-pydyf/Config.in"
 	source "package/python-pyelftools/Config.in"
diff --git a/package/python-pydantic-settings/Config.in b/package/python-pydantic-settings/Config.in
new file mode 100644
index 0000000000..0e8dbc29b5
--- /dev/null
+++ b/package/python-pydantic-settings/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYDANTIC_SETTINGS
+	bool "python-pydantic-settings"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_DOTENV # runtime
+	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
+	help
+	  Settings management using Pydantic.
+
+	  https://github.com/pydantic/pydantic-settings
diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
new file mode 100644
index 0000000000..1a45f34cea
--- /dev/null
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
+md5  38eecfeda26d332803c540fd86105509  pydantic_settings-2.5.2.tar.gz
+sha256  f90b139682bee4d2065273d5185d71d37ea46cfe57e1b5ae184fc6a0b2484ca0  pydantic_settings-2.5.2.tar.gz
+# Locally computed sha256 checksums
+sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
new file mode 100644
index 0000000000..36add45527
--- /dev/null
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pydantic-settings
+#
+################################################################################
+
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.5.2
+PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/68/27/0bed9dd26b93328b60a1402febc780e7be72b42847fa8b5c94b7d0aeb6d1
+PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = pep517
+PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
+PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
+PYTHON_PYDANTIC_SETTINGS_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
