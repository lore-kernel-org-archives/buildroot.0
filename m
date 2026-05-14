Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BF1CD4F25
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 17:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18E9060E7C;
	Thu, 14 May 2026 17:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m92bHpJHUeYU; Thu, 14 May 2026 17:43:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D654560BB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778780619;
	bh=1nMtAoLFdolCnmP8Y+c+a/vPfutwSyZ3dvNv14CDC1U=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cAdJULtd5QCjD9mDUm9aj+DvtEO04kYno61sI6xKHFr+2sQ+e7FPkWJ4wfNH9kYAs
	 Ooi6KAL+AQYaMAe6auEjxT10fr4LQ7eRN7VOFUzvhqo2FPFS+05KGp4N/ipYv6U5rU
	 OGHgopglG8vJjpAIfFJL9hn6a37p2ylKm8s3nsSqdHu5nVwUEuSdW4dHbAXLz6IiT3
	 lzuK6bsQgz3xG4+mfHNnSpJMXI1xCqZyUGJuBJUK66UlljPjRolMAiCaohd8gnsTdq
	 DAiGulCAaoLTldMChLYVAvQOTjEUD9H7NpM67MyarMpgue3zH7WWIXpbGjcAcTJJZu
	 bZgccHrd1prqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D654560BB1;
	Thu, 14 May 2026 17:43:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EDCB737F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 17:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF7034079D
 for <buildroot@buildroot.org>; Thu, 14 May 2026 17:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRwug7w4uhtE for <buildroot@buildroot.org>;
 Thu, 14 May 2026 17:43:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com;
 envelope-from=rubacha.jack03@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD8F040799
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD8F040799
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD8F040799
 for <buildroot@buildroot.org>; Thu, 14 May 2026 17:43:37 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-8c921396e37so12156886d6.2
 for <buildroot@buildroot.org>; Thu, 14 May 2026 10:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778780616; x=1779385416;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lmbBKaSEisGrAD7cU7F1lKmxxm19dQ5PA/5hxBcdULA=;
 b=O/+WXMxTpI4ZlG1utd6uYO1JHuAVgf77wKLei6tjrXbqG7JC1pVh4AVbTk1tcDcPIW
 VGLzwzXU4nP3Hehmk5zHIGiFu06DtJ+0ZRI/AzkH+K1429DTs30J62JFAPz4tu4vecD3
 PiC6G2JGNc8jGczIzoxwO1XOHptlWHr6IPndqJ3Ue6AeU9nWBk/Hc9/9aCi4X+0l3tKc
 BeWigMj1gcQ32n02kyVgcI/x08nuSa/Oq2y2QCNYxRRE1vzluFg97z/CL4fJjUALE4d9
 QPNIMnnHGiF0Elnk8mnvSuBYi8xNc4aCibOpqVJ9KESsSRytIbBgAcd3c/lb+27q43ls
 DmkA==
X-Gm-Message-State: AOJu0YzqVMYEgY8wRKcurYGfFY9R0q6sffBCWke+z4TLXkjIa8BCz5DQ
 uE/mwCZ9FuS8f4t4GzMdy2cbgTiJ/Jyxp0yn47mYuuJVJpTPLzCv9biBJoyBd87+
X-Gm-Gg: Acq92OHv/WjYjZnxvzS7xmMSgWn3PT8RCvOLqurLL2gQ6gh3e7sB3u5WUw6kPs6cSJD
 DfKqXOTYEkbDkXCtGxMJd2Ogx/hWVok/erdW3zsllgKYUhWDYLGmPjOqSiIFL+NMEyLf2zZXLs5
 0S2xLBb+umpMIqKh6Kl8zVwoVLUoArdyK9x/8NCDO5S9KpbL8kw77vQlAMGTQegvL5jkOdtTf/1
 uplz3CR4zSNcceTWv4Rb+y/jZOT2dc+OTu4uhOoox4naxHlaQXMO17Py9FYeOHmlTJNkPGV5jg5
 9ZOJLvoM6jU1TMbfSs+z4S/z7lEN7oOUEtQKAnzH1XORSbjsrK6a5giU65xMbs1bB5stm2CKlwP
 Ibe0GmoLiDgIURl0lhA7V0MbOxItpGPyRd/DTCPqnn6MjN7DwQGEBwGJyAPQ961v6b37pAHM9wX
 zVMqAcLZNXRMfIotGki3pEj235977juB8Kqo/QxhouSqv+qYjWp8pxMw==
X-Received: by 2002:a05:6214:1ccf:b0:8c2:f848:4962 with SMTP id
 6a1803df08f44-8ca0f66a36cmr7856186d6.17.1778780616165; 
 Thu, 14 May 2026 10:43:36 -0700 (PDT)
Received: from jack-xps159570.neu.edu ([68.191.46.179])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8c90c37bc64sm28242316d6.48.2026.05.14.10.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 10:43:35 -0700 (PDT)
From: Jack Rubacha <rubacha.jack03@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jack Rubacha <rubacha.jack03@gmail.com>
Date: Thu, 14 May 2026 13:41:21 -0400
Message-ID: <20260514174120.17886-2-rubacha.jack03@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778780616; x=1779385416; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lmbBKaSEisGrAD7cU7F1lKmxxm19dQ5PA/5hxBcdULA=;
 b=VM+yWPw5jKkR4yijUm6YWUpS+kMGRooEQCyIEZ24+MM1tm/IzySUoCDp4bsFhTk0If
 5lu3WFkHrmhAttcEeVrHrENPUtlWVGWXk5z9MPlwiLPI92dGFfofg4vAGo0c7icrHlGZ
 kDiwaU4nwTEoVX7aJKQ6O4vppDevC9h4RSqu6iOKo594WD855aO/EHF0GPIm6NDfhe0M
 GQh8Z2BXSldZtUGk7F6X4RbSxmmbgYxLbj97mjoAduP1GVGCPfYBwOpbyvx36gXpHzXc
 wjdxT5ckDlwUahmZhCcQGZEZDJwdrw28d4+tatJLnsVfHvuSNtKaDZlraJtIK5u0oPQG
 NRwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=VM+yWPw5
Subject: [Buildroot] [PATCH v4] package/qt6/qt6grpc: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds the QT GRPC module (containing Qt Protobuf as well).

Signed-off-by: Jack Rubacha <rubacha.jack03@gmail.com>
---
Changes v3 -> v4:
 - Update .hash to Qt 6.9.1

Changes v2 -> v3:
 - Make license GPL-3.0-only
 - Add newline for readability
 - Alphabetize host dependencies

Changes v1 -> v2:
 - Remove 'selects BR2_PACKAGE_HOST_QT6BASE' as it is a make dependency
 - Changes help text to clearly state both modules
 - Adds a git repository link to the help text
 - Cleans up license files to show all necessary files, matches hashfile
 - Make multiline clauses alphabetically ordered
---
 package/qt6/Config.in            |  1 +
 package/qt6/qt6grpc/Config.in    |  7 ++++++
 package/qt6/qt6grpc/qt6grpc.hash | 10 ++++++++
 package/qt6/qt6grpc/qt6grpc.mk   | 43 ++++++++++++++++++++++++++++++++
 4 files changed, 61 insertions(+)
 create mode 100644 package/qt6/qt6grpc/Config.in
 create mode 100644 package/qt6/qt6grpc/qt6grpc.hash
 create mode 100644 package/qt6/qt6grpc/qt6grpc.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 10594691cf..9c297b321e 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -48,6 +48,7 @@ source "package/qt6/qt6charts/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6graphs/Config.in"
+source "package/qt6/qt6grpc/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
 source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6multimedia/Config.in"
diff --git a/package/qt6/qt6grpc/Config.in b/package/qt6/qt6grpc/Config.in
new file mode 100644
index 0000000000..3d82cfcb0c
--- /dev/null
+++ b/package/qt6/qt6grpc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_QT6GRPC
+	bool "qt6grpc"
+	help
+	  This package provides the Qt GRPC and Protobuf modules:
+
+	  https://doc.qt.io/qt-6/qtgrpc-index.html
+	  https://code.qt.io/cgit/qt/qtgrpc.git/
diff --git a/package/qt6/qt6grpc/qt6grpc.hash b/package/qt6/qt6grpc/qt6grpc.hash
new file mode 100644
index 0000000000..bbf30f2a2d
--- /dev/null
+++ b/package/qt6/qt6grpc/qt6grpc.hash
@@ -0,0 +1,10 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtgrpc-everywhere-src-6.9.1.tar.xz.sha256
+sha256  c34c869e203289b0fd695a1e5391840bc51b919a8b55e1ed1ff36b4cb923a750  qtgrpc-everywhere-src-6.9.1.tar.xz
+
+# Hashes for license files:
+sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSE.Apache-2.0.txt
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSES/LicenseRef-protobuf.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6grpc/qt6grpc.mk b/package/qt6/qt6grpc/qt6grpc.mk
new file mode 100644
index 0000000000..8b1c511fef
--- /dev/null
+++ b/package/qt6/qt6grpc/qt6grpc.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# qt6grpc
+#
+################################################################################
+
+QT6GRPC_VERSION = $(QT6_VERSION)
+QT6GRPC_SITE = $(QT6_SITE)
+QT6GRPC_SOURCE = qtgrpc-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6GRPC_VERSION).tar.xz
+QT6GRPC_INSTALL_STAGING = YES
+QT6GRPC_SUPPORTS_IN_SOURCE_BUILD = NO
+QT6GRPC_CMAKE_BACKEND = ninja
+QT6GRPC_LICENSE = GPL-3.0-only
+
+QT6GRPC_LICENSE_FILES = \
+	LICENSE.Apache-2.0.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LicenseRef-protobuf.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6GRPC_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DQT_HOST_PATH=$(HOST_DIR)
+
+QT6GRPC_DEPENDENCIES = \
+	host-pkgconf \
+	host-qt6grpc \
+	qt6base
+
+ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
+QT6GRPC_DEPENDENCIES += qt6declarative
+endif
+
+HOST_QT6GRPC_DEPENDENCIES = \
+	host-protobuf \
+	host-qt6base
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
