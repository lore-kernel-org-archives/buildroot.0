Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09E0C77B61
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 20:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EA474151C;
	Mon, 24 Apr 2023 20:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EA474151C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bxjr8VJde4CN; Mon, 24 Apr 2023 20:27:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1474E4174C;
	Mon, 24 Apr 2023 20:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1474E4174C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F3471BF476
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48B1E81F50
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48B1E81F50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K7Nk0coM3J6a for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 20:25:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AE5081F34
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AE5081F34
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 20:25:30 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-63b4e5fdb1eso6076689b3a.1
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 13:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682367929; x=1684959929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sTBMnumoIQE8Kh2OthXSHCB4d+0uxMgRxCPwUh7pdLk=;
 b=atnGPkOgBYVthKxLB+AHh7piuPxSsI1Dw+UF8PvHrVWm4fTxR9tBztLVKmsEjhLqQ7
 t4fISzxJnQ3UT0LLzJii1hpKQwM/5rrB3A1PA0LICxJIcY1UpY3i8jcaacgV3WU4mgJs
 eGv7xWBaQ0zMxgVr2148NN3zrymym2oKi+DGBKuw8RqfOEqij3urg4re2ELwhcobQYyt
 8QxR5wAo+W/mkR/WE9qOfQHwR4OIQqT/w4S+zTOTxLVMEOOB6NQBxqLQwJVQfO7u/MTA
 ioj6HXk2eLklMoeG8KncD88/Fk63d95qGNJCaL6ZEiJgMMwV1fhRGsANgKRhyW4AwzZr
 bOMQ==
X-Gm-Message-State: AAQBX9djEt3kSxyOLo0WdHzJG8xWcyj2GbQMHWzo3hlo9Wwe5E7eyGPK
 GQbMjZYV5Vfak8GaL/0QyCVfnkiljazYnA==
X-Google-Smtp-Source: AKy350aTnJp2LjRhtbXPYG3VT7yWvgoevGX4p6ZzBnu45xeWMTpY/mDAEe6k4wNKF1k1MRqHtaKxWQ==
X-Received: by 2002:a05:6a20:3950:b0:d5:73ad:87c2 with SMTP id
 r16-20020a056a20395000b000d573ad87c2mr19697236pzg.56.1682367929239; 
 Mon, 24 Apr 2023 13:25:29 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::e18])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a656806000000b0051b71e8f633sm6819592pgt.92.2023.04.24.13.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 13:25:28 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 13:25:12 -0700
Message-Id: <20230424202514.1546092-12-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424202514.1546092-1-aduskett@gmail.com>
References: <20230424202514.1546092-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682367929; x=1684959929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sTBMnumoIQE8Kh2OthXSHCB4d+0uxMgRxCPwUh7pdLk=;
 b=loo1rGGqmgPsaLatxRDuNCEc++K/r8fHK7K7uIZLFJDHX5U+ZFG5zVAed+FByBaERs
 4X0kQ+hNVIwt0Cvn8sZjDpzlW4UzeP3HuNTY+8xcUhZrznb3/S9wJnJ9yUgjuNOf6sgP
 X1JUrYeDia+NaOxaeB3zhBSsIIOQTWJk7m0S0yxV9NddQK8oX2GlDbU7SHrKPITNTWoD
 mEzgOKPujQMrIHY1UYD8rJVSqzmc/H4wbevu/BJGde9Z1fmVdCw+j8aaPwgCexMggBAo
 2Ft1efDehLSiJ1S2XeDnn5yOU9yvalscJQUfGzvsGbNd1qn1d5pUYLogqxuEPVHCSjpo
 WD4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=loo1rGGq
Subject: [Buildroot] [PATCH 11/13] package/selinux-python: bump to version
 3.5
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
