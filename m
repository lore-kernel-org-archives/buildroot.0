Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38F1C3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 06:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6763F60EC2;
	Fri, 19 Jul 2024 06:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eIyEtRerH_Gz; Fri, 19 Jul 2024 06:32:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25D4560EBE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25D4560EBE;
	Fri, 19 Jul 2024 06:32:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFA0C1BF362
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 06:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9D9240413
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 06:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZel-WPawo07 for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 06:32:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 604D240A53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 604D240A53
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 604D240A53
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 06:32:43 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-8076ef91d8eso60000339f.1
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 23:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721370762; x=1721975562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MpL+tPT7W/8xmU+uNmGLbs1t9jD/Ny/rX+DGoL1zgpI=;
 b=d5ARjSN9m91yh3rS8i7E8DSRzFspcu0bd2U+aNW6H6FzSPjLNoXvH4RVYNb9o6ACzH
 zvp3rz1MAm4IdavWmCer6p/tcJrJhG4uU4ycQo5E0c/m6cT78fjZQvqdjobwSMXUf2EV
 6xCye6XoRI0qHRDTCJr+iCEdL/Yo3gejvKJ5LRRBSGR4z33V6VN4jGbFFDlZmPuTz5xD
 bNEi12xscmaoku3g24pqhRloEJI3yxPSOAZGoDF0bZpBwL6KoP2oEzLvZMDO7BgrnE5p
 oedupNtB+nhjEH6fYtRs2XapenL56dLGZIOwPXFwaoEIwXkIN4VUhRb15121hmT97FqV
 IDHw==
X-Gm-Message-State: AOJu0YzgvOyEpaAsKHv4dGY3N4Nxajx854CQKVHmCbAo3bHi+qDnmiur
 4HHgOhpbpputHvr5fnSNqBx/gwufqHLGQqwxOYHy9sb8yNHRqWu5+2xoYQ==
X-Google-Smtp-Source: AGHT+IFy7yZbp38V1TJx6aOR/y0tpejs4cnF9BTym9oG/1Jn7vYIVzrZI/SPOptiv2U8O0vRhCpjqQ==
X-Received: by 2002:a05:6602:158f:b0:803:cc64:e0d6 with SMTP id
 ca18e2360f4ac-817100401f1mr968171139f.1.1721370761893; 
 Thu, 18 Jul 2024 23:32:41 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-819ac79ab26sm29587239f.22.2024.07.18.23.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 23:32:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 00:32:33 -0600
Message-Id: <20240719063235.3823015-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719063235.3823015-1-james.hilliard1@gmail.com>
References: <20240719063235.3823015-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721370762; x=1721975562; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MpL+tPT7W/8xmU+uNmGLbs1t9jD/Ny/rX+DGoL1zgpI=;
 b=Rp5Pro2T+ZjdPZUXcfEJHiLJnsXkXylHHZNeaeugIymALeeCzsJHF6rmeXO5CEp7WI
 QzbKwk/Z66qhnpb0qA/QMZQ4QS+QFC66oWSU7fgGcDRbHg0PwZeazfw+jIEy0baWhd94
 iQmSf+7KlArUkQl9yFm44x0Sw8XpJiff/6Y1hwxx0TW9y4mlIk391WYoUfUC4edsqsoX
 ZPxiOMhm/hL0v5T2aPrjwDDItvAemvmx9vPQH/nD/asoXTODr960jIf+LKOa9+mK+X7J
 mY2Bisdp3Po6eWoicjwUBBx2hIxDJ2xAdDETg/Sdnymy9gWZS3uswdVdl73Bh0RHztHm
 M2zw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Rp5Pro2T
Subject: [Buildroot] [PATCH v4 4/6] package/python-uswid: new host package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v3 -> v4:
  - add host python3 xz dependency
---
 package/Config.in.host                 |  1 +
 package/python-uswid/Config.in.host    |  8 ++++++++
 package/python-uswid/python-uswid.hash |  5 +++++
 package/python-uswid/python-uswid.mk   | 18 ++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/python-uswid/Config.in.host
 create mode 100644 package/python-uswid/python-uswid.hash
 create mode 100644 package/python-uswid/python-uswid.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 4340e6e8c9..e4fbee4f2a 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -89,6 +89,7 @@ menu "Host utilities"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-pyyaml/Config.in.host"
 	source "package/python-six/Config.in.host"
+	source "package/python-uswid/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
 	source "package/qemu/Config.in.host"
diff --git a/package/python-uswid/Config.in.host b/package/python-uswid/Config.in.host
new file mode 100644
index 0000000000..6605d51915
--- /dev/null
+++ b/package/python-uswid/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_PYTHON_USWID
+	bool "host python-uswid"
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_XZ
+	help
+	  A tiny tool for embedding CoSWID tags in EFI binaries.
+
+	  https://github.com/hughsie/python-uswid
diff --git a/package/python-uswid/python-uswid.hash b/package/python-uswid/python-uswid.hash
new file mode 100644
index 0000000000..b6bf09c713
--- /dev/null
+++ b/package/python-uswid/python-uswid.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/uswid/json
+md5  e43ff6d49ddcda0c95338d3271694b91  uswid-0.5.0.tar.gz
+sha256  bdcd7ee5afac1da60ee688c357aa12f5f8d74bc28012446b10e2b4a9cf52fc6d  uswid-0.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256  98bc07f3fb70d05b01ff740e8191b9f29c080159f01588991fbd872c611236f9  LICENSE
diff --git a/package/python-uswid/python-uswid.mk b/package/python-uswid/python-uswid.mk
new file mode 100644
index 0000000000..2092a06f52
--- /dev/null
+++ b/package/python-uswid/python-uswid.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-uswid
+#
+################################################################################
+
+PYTHON_USWID_VERSION = 0.5.0
+PYTHON_USWID_SOURCE = uswid-$(PYTHON_USWID_VERSION).tar.gz
+PYTHON_USWID_SITE = https://files.pythonhosted.org/packages/dc/bf/05291df12037befeacda2083c798e98691043978e07ca4a00b4eb94aeb61
+PYTHON_USWID_SETUP_TYPE = setuptools
+PYTHON_USWID_LICENSE = BSD-2-Clause-Patent
+PYTHON_USWID_LICENSE_FILES = LICENSE
+HOST_PYTHON_USWID_DEPENDENCIES = \
+	host-python-cbor2 \
+	host-python-lxml \
+	host-python-pefile
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
