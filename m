Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFF0E7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 07:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F53C4175B;
	Fri, 13 Dec 2024 07:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-jb5pjV5JK6; Fri, 13 Dec 2024 07:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1979941762
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1979941762;
	Fri, 13 Dec 2024 07:40:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 523F9ECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 07:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4079141762
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 07:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nh5EhWBtPDqM for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 07:40:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0FD94175B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0FD94175B
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0FD94175B
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 07:40:41 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso218523866b.1
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 23:40:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734075639; x=1734680439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e7q15Q1eHJrHK/mBDsZhBUd5A2fxhGVUfTsZe3H1964=;
 b=Z3RSgdtV1zbjFnPvZ82BPlp9PDUN2STwCLX/FUfsAIMzGN9QeRC9HXv9LudlwKs6Yp
 njOyF9y3a51aQhBqLsP0VY8wqfIg3FKQoTqqkqkfL+TnGJTivEIh9zuARnogf4JKCCMX
 DmEcEQRl2MbpBeQvrDHIPfp5BchiJc3T7rSokOUpBzD3LW8lSobuVy570SIelZtWXJ5S
 xilUtKfwFqWZTF1zyBYjXMc+fhdPGYBa5T84WMDt8YZFVEaUimgKk1qWrNOetpXOcKiI
 Zia+MPw2cHXGQrwONS9rOb7g0TF02Q1DtXR446rrEhnLE72rStnWGFlwrnxccIOt45aW
 TobQ==
X-Gm-Message-State: AOJu0YxDL658ajh900nY6RuizlVDPYI8+iLVMleg4oPSs6bmVddS8rIu
 55k4xdLF9lWMzhcmrbsN2p6AIwsG0rfANQCK22kCL3CkNCJtz0OV95Izng==
X-Gm-Gg: ASbGncsRM15bNljYgSjExHsdFi2K76kqxrCoRj0k8akFJZ09R0NWMLk289jU+g/fyxr
 pHV0x4RkEDDil4J+UjtuxUHCvrtS9P6n3Qik36QUzeNwuZvG0y5KS7EDvvqjjdvy/8jB3lGIBBP
 WNOv5qhFIxuEnm1wYfmkrxkMLm/nTBUhIsEltlbhsByMNlE88O8Uv2/ejwEma1VqlxnA/1uGkzT
 ozvYC7+aTuzApRWZlQN6KCy8NqytaSHd4JsJv6QetWz1LXqEEeTNsfbq2jkzfZF2yZhyWQWUJjB
 9SJ6T6OVrmmpifUlwn9ULwIIpFIdDHuxrLTA6w==
X-Google-Smtp-Source: AGHT+IE9kLGMyNbQjNiDdHgJa4tb9+zxZuZNpWq12lK/pWxtUJNJv81DzOzU0XnrGe5j6HDYq4MNyg==
X-Received: by 2002:a17:907:3da4:b0:aa6:96ad:f8ff with SMTP id
 a640c23a62f3a-aab77ee5aa4mr155473166b.52.1734075638466; 
 Thu, 12 Dec 2024 23:40:38 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6590f5457sm879362166b.195.2024.12.12.23.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 23:40:37 -0800 (PST)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Fri, 13 Dec 2024 08:40:30 +0100
Message-Id: <20241213074031.2674579-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213074031.2674579-1-yegorslists@googlemail.com>
References: <20241213074031.2674579-1-yegorslists@googlemail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1734075639; x=1734680439; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e7q15Q1eHJrHK/mBDsZhBUd5A2fxhGVUfTsZe3H1964=;
 b=jYnpWPOn42vbRxgJmPKSDfnDDBRyIy8s16TzPLJKUIy1ep1BBgnr1NzJxfa8QUSGlF
 6N5njjzdpr5iOT6L7Ldypv8KSUL0YyPPA7AF58epyYEqR1DMJvnmnnzyTGl82EsX7zFk
 8QpsxAG6u/Shr1KwGaYDXaWKpUqWKO2jzlC53huqByz+0457Apdyj0MvCFn+ZVvQixbi
 +4Me2x61lqjq1IJYah/oCdg1aRO+V9YM8MED7Bko7Hn/NVGUNRu1McbDsFH/7mzWguU5
 zv49K5ipVKyKDsG/FVPvX1PBAnoxXbAeZehcOSZdTtD5SAB/+fXtuTI9zynGAn5x1T4+
 1g3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jYnpWPOn
Subject: [Buildroot] [PATCH 2/3] package/python-changelog-chug: add new
 package
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

From: Yegor Yefremov <yegorslists@googlemail.com>

changelog-chug is a parser for project Change Log documents.

This package is required to build the new version of
the python-daemon module.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                               |  1 +
 package/python-changelog-chug/Config.in         |  6 ++++++
 .../python-changelog-chug.hash                  |  5 +++++
 .../python-changelog-chug.mk                    | 17 +++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-changelog-chug/Config.in
 create mode 100644 package/python-changelog-chug/python-changelog-chug.hash
 create mode 100644 package/python-changelog-chug/python-changelog-chug.mk

diff --git a/package/Config.in b/package/Config.in
index 7cfcdf2c58..5fa344c321 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1045,6 +1045,7 @@ menu "External python modules"
 	source "package/python-cchardet/Config.in"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
+	source "package/python-changelog-chug/Config.in"
 	source "package/python-channels/Config.in"
 	source "package/python-channels-redis/Config.in"
 	source "package/python-characteristic/Config.in"
diff --git a/package/python-changelog-chug/Config.in b/package/python-changelog-chug/Config.in
new file mode 100644
index 0000000000..5eb9beca55
--- /dev/null
+++ b/package/python-changelog-chug/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CHANGELOG_CHUG
+	bool "python-changelog-chug"
+	help
+	  changelog-chug is a parser for project Change Log documents.
+
+	  https://pypi.org/project/changelog-chug
diff --git a/package/python-changelog-chug/python-changelog-chug.hash b/package/python-changelog-chug/python-changelog-chug.hash
new file mode 100644
index 0000000000..848a74cf37
--- /dev/null
+++ b/package/python-changelog-chug/python-changelog-chug.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/changelog-chug/json
+md5  4ccd595cfa9e929bfa04b7e64de3663c  changelog_chug-0.0.3.tar.gz
+sha256  98ee1e8be75b6e9d512c35292c3c293a124541a4ec2014a6ec3cf33a3d265d2d  changelog_chug-0.0.3.tar.gz
+# Locally computed sha256 checksums
+sha256  aa0c846d25b7f2bf4ee44e607666bc318eea1ad5bf6f8cfdf50fc350d1085c1c  COPYING
diff --git a/package/python-changelog-chug/python-changelog-chug.mk b/package/python-changelog-chug/python-changelog-chug.mk
new file mode 100644
index 0000000000..ae5ed7287d
--- /dev/null
+++ b/package/python-changelog-chug/python-changelog-chug.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-changelog-chug
+#
+################################################################################
+
+PYTHON_CHANGELOG_CHUG_VERSION = 0.0.3
+PYTHON_CHANGELOG_CHUG_SOURCE = changelog_chug-$(PYTHON_CHANGELOG_CHUG_VERSION).tar.gz
+PYTHON_CHANGELOG_CHUG_SITE = https://files.pythonhosted.org/packages/fc/6d/f08e0f600f88c69923c692d486096ca7d2eae5d657516ec134fb45ed0ab0
+PYTHON_CHANGELOG_CHUG_SETUP_TYPE = setuptools
+PYTHON_CHANGELOG_CHUG_LICENSE = AGPL-3.0+
+PYTHON_CHANGELOG_CHUG_LICENSE_FILES = COPYING
+PYTHON_CHANGELOG_CHUG_DEPENDENCIES = host-python-semver host-python-docutils
+HOST_PYTHON_CHANGELOG_CHUG_DEPENDENCIES = host-python-semver host-python-docutils
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
