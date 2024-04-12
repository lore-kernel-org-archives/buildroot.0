Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD24BC4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 05:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50D994186B;
	Fri, 12 Apr 2024 05:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PCZ41gr8e9MK; Fri, 12 Apr 2024 05:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2136418BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2136418BE;
	Fri, 12 Apr 2024 05:44:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BCE151BF23C
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 05:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A85A7418BE
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 05:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9-LNomabqS9 for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 05:44:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2BBC24186B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BBC24186B
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BBC24186B
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 05:44:44 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56c404da0ebso714995a12.0
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 22:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712900681; x=1713505481;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t0Ymn+gncy4Z56spvpnHgEeLyBxcnCVNm5qwOHo3ado=;
 b=cHv4o+xuAmxYYNYTe2O7EXn4/fJt9T10GiR4Guig4t0actyTr1ghtDakvb/h3BKlB2
 c1qMo4QyGGlLq4KUpzETCCaUC+VgYggR5VMsRapd59xUaL/qwFkVz6ldLnBwFWVC56Ku
 9YoC2pnVMm4p7H25U8qMJb3/SxDNobD1g4FplQSwh1Rec/0knPossSKpcb+++miGhNUN
 s94SZ33zXgT4BpCUK4mDpXE4892G6ZMQB16ztc1lKTjSmL4o0W7kNpgL0ZPkJKnkFwn3
 BihmNDCi8ookLbAhHwDkwLQhMWDMeQQ0ZBTbjmISkiupEPCkZPKrvTRofGEZabgEiCAO
 8B9A==
X-Gm-Message-State: AOJu0YwWJd0xtDRUn/zV2Cmjs3rYjm9crrYAHow1aAvDWR6sallBrpK9
 KUeWA1VWD1r0yQyfGwSX1D8GCwm1ZNaXayTHFbUIvyOZgcbe2acH74Sawg==
X-Google-Smtp-Source: AGHT+IGLyJZSkDGmEcFIL4OTauzz3O0sTJ+fxiXNd6AFA/zmu1rDoFUJuTqxry65I1JHaKwZaWPYYw==
X-Received: by 2002:a17:906:f218:b0:a4d:fcc9:905c with SMTP id
 gt24-20020a170906f21800b00a4dfcc9905cmr1176800ejb.20.1712900681293; 
 Thu, 11 Apr 2024 22:44:41 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 du2-20020a17090772c200b00a52299d8eecsm982539ejc.135.2024.04.11.22.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 22:44:40 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 07:44:22 +0200
Message-Id: <20240412054421.1346030-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712900681; x=1713505481; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t0Ymn+gncy4Z56spvpnHgEeLyBxcnCVNm5qwOHo3ado=;
 b=TK1HqUZC9BC1tr+S0uT/rkhU5dbCFhXWLAkfeFKlaGw9IiOOMyW2vm+fAD7ZD7T5fg
 5iz7Nx+m07VeffatxBA6xKcOBhNP5XZE1AzY3YVbrnnlhgGgs0CK3oCSJddGzUqZe0LG
 1S3mygUmqjcBWB69J39baN+AtMVvVGNdRTSoCMo+aumkGmSE/jw8GH6ErK6ruDpiyyb1
 7nZIB5sJhf/Yq8dHcUzPW51UF6azsAfVcVFVX5kKYnlWI8/YdnNfyJ5PiTQ0iVtrlBwM
 BdiUvZSkhuVJf3u5D19OW442u/UClE2dJ0x1y+79+FH5DwbXe3YWALpQa8Xiz4tDT917
 efZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TK1HqUZC
Subject: [Buildroot] [PATCH] package/python-pathspec: enable target variant
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also a runtime testcase is added.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/Config.in                             |  1 +
 package/python-pathspec/Config.in             |  6 ++++
 package/python-pathspec/python-pathspec.mk    |  1 +
 .../tests/package/sample_python_pathspec.py   | 35 +++++++++++++++++++
 .../tests/package/test_python_pathspec.py     | 11 ++++++
 5 files changed, 54 insertions(+)
 create mode 100644 package/python-pathspec/Config.in
 create mode 100644 support/testing/tests/package/sample_python_pathspec.py
 create mode 100644 support/testing/tests/package/test_python_pathspec.py

diff --git a/package/Config.in b/package/Config.in
index 0d31faf354..d9bbf64c95 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1223,6 +1223,7 @@ menu "External python modules"
 	source "package/python-parso/Config.in"
 	source "package/python-passlib/Config.in"
 	source "package/python-pathpy/Config.in"
+	source "package/python-pathspec/Config.in"
 	source "package/python-pathtools/Config.in"
 	source "package/python-pathvalidate/Config.in"
 	source "package/python-periphery/Config.in"
diff --git a/package/python-pathspec/Config.in b/package/python-pathspec/Config.in
new file mode 100644
index 0000000000..4ecf76d456
--- /dev/null
+++ b/package/python-pathspec/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PATHSPEC
+	bool "python-pathspec"
+	help
+	  pathspec is a utility library for pattern matching of file paths.
+
+	  https://github.com/cpburnz/python-pathspec
diff --git a/package/python-pathspec/python-pathspec.mk b/package/python-pathspec/python-pathspec.mk
index c4cb34b4c3..b46dbef7ea 100644
--- a/package/python-pathspec/python-pathspec.mk
+++ b/package/python-pathspec/python-pathspec.mk
@@ -11,4 +11,5 @@ PYTHON_PATHSPEC_LICENSE = MPL-2.0
 PYTHON_PATHSPEC_LICENSE_FILES = LICENSE
 PYTHON_PATHSPEC_SETUP_TYPE = flit
 
+$(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/support/testing/tests/package/sample_python_pathspec.py b/support/testing/tests/package/sample_python_pathspec.py
new file mode 100644
index 0000000000..6205126e21
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pathspec.py
@@ -0,0 +1,35 @@
+# example from https://pypi.org/project/pathspec/
+
+import pathspec
+# The gitignore-style patterns for files to select, but we're including
+# instead of ignoring.
+spec_text = """
+
+# This is a comment because the line begins with a hash: "#"
+
+# Include several project directories (and all descendants) relative to
+# the current directory. To reference a directory you must end with a
+# slash: "/"
+/project-a/
+/project-b/
+/project-c/
+
+# Patterns can be negated by prefixing with exclamation mark: "!"
+
+# Ignore temporary files beginning or ending with "~" and ending with
+# ".swp".
+!~*
+!*~
+!*.swp
+
+# These are python projects so ignore compiled python files from
+# testing.
+!*.pyc
+
+# Ignore the build directories but only directly under the project
+# directories.
+!/*/build/
+
+"""
+
+spec = pathspec.PathSpec.from_lines('gitwildmatch', spec_text.splitlines())
diff --git a/support/testing/tests/package/test_python_pathspec.py b/support/testing/tests/package/test_python_pathspec.py
new file mode 100644
index 0000000000..4e4a992bb3
--- /dev/null
+++ b/support/testing/tests/package/test_python_pathspec.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPathSpec(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PATHSPEC=y
+        """
+    sample_scripts = ["tests/package/sample_python_pathspec.py"]
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
