Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBD5C77B61
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 17:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6834614A4;
	Tue, 25 Apr 2023 17:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6834614A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9MQk1rNMtfC6; Tue, 25 Apr 2023 17:17:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C0776148D;
	Tue, 25 Apr 2023 17:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C0776148D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E9CA1BF82D
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7592841787
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7592841787
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6uUchAwsPujo for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 17:15:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B00E40CAA
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B00E40CAA
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 17:15:12 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-63d2ba63dddso4877048b3a.2
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 10:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682442911; x=1685034911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cW1X73+omNZ5Y6Nyo1hoGkrrJStnxk83/oim+ZVAhnY=;
 b=DCmg45Z5FCqRkTY86HiCfz6utkoxhCD0yj6zaI/OmH0YDG/o6lafLcMvbuMfmVPV1X
 DzSGaU3FQW5IY13wT4AV3cF7uWdVwcGl/h8UCIXys1akLj7Yybft+F5mM84mShY6zZJo
 v9olh8g4Mg6qMYVG07a6D+rRq/bi5eN37esYKXWEngIzu8+6m3aA0iJ54ioLptc2GcfL
 eXJv83bAFTnj+SG7JN0/9TDjAOlr5R+JE9S0tCtEl1lTzwVxl84xE+Jnxy5lZXzOtdoU
 /PBKbelZwjrhgWMCTP0ZB40oBOVIQNpFEtviaB2CSsiTQKCrEMeDtVheBtDSnh5x9COj
 5PMw==
X-Gm-Message-State: AAQBX9cTzE9D9Oz8ZwLBy6FE+q1rMO+w+7o+3itToCfCkp+pUO0+nGEL
 rjHAn5rjbXoEB9UokXp5uepsYmqVe12v9w==
X-Google-Smtp-Source: AKy350a4uWwJc2W80Zaf81zBnGZ1t40wKG8MmjYTr6dzO4JWkhofUeY1AFxkUoS9VXSbc4s7ZMkwxg==
X-Received: by 2002:a05:6a00:8d2:b0:63b:5f78:d6db with SMTP id
 s18-20020a056a0008d200b0063b5f78d6dbmr24237660pfu.21.1682442910990; 
 Tue, 25 Apr 2023 10:15:10 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::51c9])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a056a00218b00b0063b8ada8777sm9582454pfi.112.2023.04.25.10.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 10:15:10 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Apr 2023 10:14:52 -0700
Message-Id: <20230425171454.48802-12-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425171454.48802-1-aduskett@gmail.com>
References: <20230425171454.48802-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682442911; x=1685034911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cW1X73+omNZ5Y6Nyo1hoGkrrJStnxk83/oim+ZVAhnY=;
 b=B2C5iI5ibpK5dOOgYpev8lMpkJ2TM3hgbg5CpdzhQCFiBEtNppL0w5W6UVQ0ZB5bwZ
 PGF26ZJvj+obfXt9vOa3SmePuj92eP5j6hb4677FyMhCGxd5OQdpRLtDbRkYkCjFDjP2
 P6EROhvMvwGo44vLy4Uqm7A0ahaBm+rEnI4a4fb5rJE8XlIiFzQHSsKdbjY6T3k1SgaQ
 rAM44s1w8cjlV/6cinzthgTmYx41jjqBdYaGaWyS35Spb4tlCsiH+Wq2oesjCR+TCA8c
 YVJQod65sN2xdx5JTlX+kYs4HQdGNql5vaPtPYFsCm4FtYa4L8SQkIXySmpEMOY8Izaq
 IvwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=B2C5iI5i
Subject: [Buildroot] [PATCH v2 11/13] package/selinux-python: bump to
 version 3.5
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also:
  - Change the license file to LICENSE. The hash remains the same.

  - Add 0001-fix-ausearch-path.patch as audit 3.1 installs ausearch to
    /usr/sbin not /sbin

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../0001-fix-ausearch-path.patch              | 37 +++++++++++++++++++
 package/selinux-python/selinux-python.hash    |  4 +-
 package/selinux-python/selinux-python.mk      |  4 +-
 3 files changed, 41 insertions(+), 4 deletions(-)
 create mode 100644 package/selinux-python/0001-fix-ausearch-path.patch

diff --git a/package/selinux-python/0001-fix-ausearch-path.patch b/package/selinux-python/0001-fix-ausearch-path.patch
new file mode 100644
index 0000000000..c5f0a990ed
--- /dev/null
+++ b/package/selinux-python/0001-fix-ausearch-path.patch
@@ -0,0 +1,37 @@
+From 7a2456f18a49fa70de1f9ace12512bb00437b6ba Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 24 Apr 2023 12:25:19 -0700
+Subject: [PATCH 1/1] fix ausearch path
+
+ausearch is installed in /usr/sbin not /sbin
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ sepolgen/src/sepolgen/audit.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sepolgen/src/sepolgen/audit.py b/sepolgen/src/sepolgen/audit.py
+index 4adb851..5afe85d 100644
+--- a/sepolgen/src/sepolgen/audit.py
++++ b/sepolgen/src/sepolgen/audit.py
+@@ -41,7 +41,7 @@ def get_audit_boot_msgs():
+     s = time.localtime(time.time() - off)
+     bootdate = time.strftime("%x", s)
+     boottime = time.strftime("%X", s)
+-    output = subprocess.Popen(["/sbin/ausearch", "-m", "AVC,USER_AVC,MAC_POLICY_LOAD,DAEMON_START,SELINUX_ERR", "-ts", bootdate, boottime],
++    output = subprocess.Popen(["/usr/sbin/ausearch", "-m", "AVC,USER_AVC,MAC_POLICY_LOAD,DAEMON_START,SELINUX_ERR", "-ts", bootdate, boottime],
+                               stdout=subprocess.PIPE).communicate()[0]
+     if util.PY3:
+         output = util.decode_input(output)
+@@ -56,7 +56,7 @@ def get_audit_msgs():
+        string contain all of the audit messages returned by ausearch.
+     """
+     import subprocess
+-    output = subprocess.Popen(["/sbin/ausearch", "-m", "AVC,USER_AVC,MAC_POLICY_LOAD,DAEMON_START,SELINUX_ERR"],
++    output = subprocess.Popen(["/usr/sbin/ausearch", "-m", "AVC,USER_AVC,MAC_POLICY_LOAD,DAEMON_START,SELINUX_ERR"],
+                               stdout=subprocess.PIPE).communicate()[0]
+     if util.PY3:
+         output = util.decode_input(output)
+-- 
+2.40.0
+
diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index 6ada3fee36..3592540703 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  8ad91061300387996ccb474962fb93dde263d924aa8f740618be16b22e2444ec  selinux-python-3.3.tar.gz
+sha256  8245bb4dae59333461f19ca0c79a829081f07972fa5e3ad4c2b2b917dd71d96b  selinux-python-3.5.tar.gz
 
 # Hash for license file
-sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 0cec602f3d..7505474aa4 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 3.3
+SELINUX_PYTHON_VERSION = 3.5
 SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SELINUX_PYTHON_VERSION)
 SELINUX_PYTHON_LICENSE = GPL-2.0
-SELINUX_PYTHON_LICENSE_FILES = COPYING
+SELINUX_PYTHON_LICENSE_FILES = LICENSE
 SELINUX_PYTHON_DEPENDENCIES = python3
 
 SELINUX_PYTHON_MAKE_OPTS += \
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
