Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8F7C3600C
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 23:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8EEF40C3C;
	Mon, 31 Mar 2025 23:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0z73ImyYW9N; Mon, 31 Mar 2025 23:38:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D041540C7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D041540C7E;
	Mon, 31 Mar 2025 23:38:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7913121
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 23:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B987D60617
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 23:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtZKrGG3Mfdu for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 23:38:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=daniel.crowe@maxmine.com.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED58A6060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED58A6060A
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED58A6060A
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 23:38:14 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-225df540edcso110262975ad.0
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 16:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743464293; x=1744069093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=233wV3FRRbPs5O9ftODmIZeOAYwWjnUXfDOP09dSaUs=;
 b=MKMRWMzcvZC2ihkJE4ni2SwD4kbMbuyMII6Hr4UCJ+fH7lN0oZwNJzwXU3e+boGL/f
 EQCGc4OY51Djj1ePm9M6bvcSU+X6HD87/3/Q9BxMpDve/uTeCMEMec8svGW0lXRzF3so
 UDZVvmfkrTjvAFn6jNojdWOdnXh7EwCuqabyewQzpODIIfIxOsXakoKcqgL6E4ITSzmm
 ql9Pm3hioJg6jG/6znAur62FLgdnI+VT2qSOhKJnY4COwMb7h3o1ovzvdMPTgV9k5rSn
 pnLW/ZJiG5G8V4QNORChA50xzsEcFCiqFmbla7edjE1v4+H4bQ9Ra81pCjmOdKndJKcL
 GGmQ==
X-Gm-Message-State: AOJu0YwgXoRulQjXwrYlE/b7yDi27XkdHG0Ny6LRMI+9EVmo8DdkTiXD
 Fhr/3ebnQHqMXJLn/F/jzROMV0P1Cjpiu96p/kl9/5LMJdpADp8A1KcRxlE8dnngZR48X25fCf6
 LzNQ=
X-Gm-Gg: ASbGncvR2l4Jo4T+csjIdzZlkCH386odA+xYBgirEyOpZK1ecdvNlCbSkL3rWzzGEOY
 PZkQYS3sV424EdjMfcYJ6QkrSHW0RBI0Ungu1cHSKGeASvq5BPjzZV8h6ycsYI3F0qGsA3/D/6l
 rpfZ9i7tu1ljlmXraFK1Wqjhrt0ZWqzwdb2JYgh/CD1VQ+nRpm6mQMbtV+sNNrh8ZXwdYwwju5e
 gU9Uo7EACPXp6jsP4uQagrG9MzQrb2NV3i12tIAFo7v6UQejswm0cyEnn+LDz3DGVuK/Ai7OXJb
 3iAtBhk8O3LJlCymdj0XXjMy9mQuWIMZKNzbtjfZE8SZYDML1G0461lIKBgN17HMeAem5c6Nb+7
 s4DLDAt3eSkeEIUnQTA==
X-Google-Smtp-Source: AGHT+IFsWtwLdfMwZPjJnYxcE7Ktr2ko9rUFQL28meKW4rtj/jYT7N+6Ko8wj/tnUJdslV3lZJ8kew==
X-Received: by 2002:a05:6a00:1950:b0:736:9f2e:1357 with SMTP id
 d2e1a72fcca58-7397f4c7da9mr18932152b3a.12.1743464293487; 
 Mon, 31 Mar 2025 16:38:13 -0700 (PDT)
Received: from res-0346.adl.internal.resolution.systems ([103.211.209.15])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73971091cadsm7577025b3a.126.2025.03.31.16.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 16:38:13 -0700 (PDT)
From: Daniel Crowe <daniel.crowe@maxmine.com.au>
To: buildroot@buildroot.org
Date: Tue,  1 Apr 2025 10:07:24 +1030
Message-ID: <20250331233726.3730509-3-daniel.crowe@maxmine.com.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
References: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maxmine-com-au.20230601.gappssmtp.com; s=20230601; t=1743464293; x=1744069093;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=233wV3FRRbPs5O9ftODmIZeOAYwWjnUXfDOP09dSaUs=;
 b=wtG1HgX3Qxj/d5M/KZPzVza+AFfDxrnEcsB5dJHPLtaegH8X8GhJMfdfhb4Vqw76a+
 eMHKImE2lzpjq83P72kcUulHI13VH+aup1UVXeHSxh4yR5FMFYsOYRgWQpXhEK+a/uUL
 9aJtxV22r6pytcuLm23V90PL/kOhNxQjNhEMUsGQOIunvdoIRCEf7Hvc0bwHj1Oj6vkF
 pvMh4QV1TVmnIu1IxbGy4kzr1JU4xYY9uR3sVxLcaPmCup+OvmA7wgGy5cyRhBbt9NNI
 lRJDmhGa6n3h7C5jjviBdR1isrg2OKzXxgrarUwA1RL9/R41ulkUqgfMtKpuF2dQJkH0
 iytA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maxmine.com.au
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=maxmine-com-au.20230601.gappssmtp.com
 header.i=@maxmine-com-au.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=wtG1HgX3
Subject: [Buildroot] [PATCH 3/5] package/python-aniso8601: add version 10.0.0
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
 Daniel Crowe <daniel.crowe@maxmine.com.au>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A library for parsing ISO 8601 strings
https://bitbucket.org/nielsenb/aniso8601/src/master/

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
---
 package/Config.in                              |  1 +
 package/python-aniso8601/Config.in             |  6 ++++++
 package/python-aniso8601/python-aniso8601.hash |  5 +++++
 package/python-aniso8601/python-aniso8601.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-aniso8601/Config.in
 create mode 100644 package/python-aniso8601/python-aniso8601.hash
 create mode 100644 package/python-aniso8601/python-aniso8601.mk

diff --git a/package/Config.in b/package/Config.in
index fa8a347464..f15f5c76d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -994,6 +994,7 @@ menu "External python modules"
 	source "package/python-aiozipkin/Config.in"
 	source "package/python-alembic/Config.in"
 	source "package/python-alsaaudio/Config.in"
+	source "package/python-aniso8601/Config.in"
 	source "package/python-annotated-types/Config.in"
 	source "package/python-ansicolors/Config.in"
 	source "package/python-anyio/Config.in"
diff --git a/package/python-aniso8601/Config.in b/package/python-aniso8601/Config.in
new file mode 100644
index 0000000000..cea76eeff5
--- /dev/null
+++ b/package/python-aniso8601/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ANISO8601
+	bool "python-aniso8601"
+	help
+	  A library for parsing ISO 8601 strings.
+
+	  https://bitbucket.org/nielsenb/aniso8601
diff --git a/package/python-aniso8601/python-aniso8601.hash b/package/python-aniso8601/python-aniso8601.hash
new file mode 100644
index 0000000000..c0e8f95f3b
--- /dev/null
+++ b/package/python-aniso8601/python-aniso8601.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aniso8601/json
+md5  29acca96d02d182b7ff09f02047b84a8  aniso8601-10.0.0.tar.gz
+sha256  ff1d0fc2346688c62c0151547136ac30e322896ed8af316ef7602c47da9426cf  aniso8601-10.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  c3cca0b9a74fd29668bd99b5dcf0274d53be904de6778916dc852708f407b0f0  LICENSE
diff --git a/package/python-aniso8601/python-aniso8601.mk b/package/python-aniso8601/python-aniso8601.mk
new file mode 100644
index 0000000000..1bb6628953
--- /dev/null
+++ b/package/python-aniso8601/python-aniso8601.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aniso8601
+#
+################################################################################
+
+PYTHON_ANISO8601_VERSION = 10.0.0
+PYTHON_ANISO8601_SOURCE = aniso8601-$(PYTHON_ANISO8601_VERSION).tar.gz
+PYTHON_ANISO8601_SITE = https://files.pythonhosted.org/packages/f3/3f/dc8a28fa6dc72c13d8c158b01f8975f240e9e72c336cc1ae00f424e2d7ce
+PYTHON_ANISO8601_SETUP_TYPE = setuptools
+PYTHON_ANISO8601_LICENSE = BSD-3-Clause
+PYTHON_ANISO8601_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
