Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F739C25B4E
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 09:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCDCF40BCB;
	Tue, 24 Jan 2023 09:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCDCF40BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aNm-0W4hoFQz; Tue, 24 Jan 2023 09:23:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B5C640289;
	Tue, 24 Jan 2023 09:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B5C640289
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 893F01BF2B0
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 09:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 619F6401D2
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 09:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 619F6401D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nOu4Z8Cv-N6N for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 09:22:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C49F40BCB
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C49F40BCB
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 09:22:44 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id m15so7182622ilq.2
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 01:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0SspQugj4Bm7C6sWS8CsB68Q00Y6SdY7IpsJlRivU3w=;
 b=XWCxS1vC8YZb1vdZj6Ttmveflh11EOp1L9HmVt+blc6aPYucq1NpqQBL9z3pHVOaeA
 sFRUF8CQ4lJp7kJAhyBlupSS2dnikT/XVJ+uAlt7bSS+vbS23Yl6AvkK/kyQm17QgYh+
 YXoWwtSxbK2x0eddSJAox5ziec79LjMXiMvE44YLwK/E+gDxFLWY/ZZnbLZ74V1cjtd/
 SUWH+WPI2b9xn7MYG82M1br64PIEB4zx/1iogFYn2OUQAK37RwcpGV+Qhg1aXZvirVUm
 ccjMWcHNDuEkLDwEUAr2BDHRb5YlCiAwCfObOXCLuCFEznCXtafTRWvoAj2ZRHAhWepO
 j1bw==
X-Gm-Message-State: AFqh2ko8b1o+KZshvAjO+wgKWcHC/gvqWnEcfChIvuKBFKqwq5HEQMUr
 WMP1fKlJA//E5JOA2ugOvYH//btPk5K2bw==
X-Google-Smtp-Source: AMrXdXsJHNX1YaqQI2NiOTXyyYAQSrQjqeeCGPXm+hsb3Mn004WF+BvU0iJiYbON/ZkIb+t2EGlWpA==
X-Received: by 2002:a92:3204:0:b0:30c:22e:9af2 with SMTP id
 z4-20020a923204000000b0030c022e9af2mr19245992ile.13.1674552163297; 
 Tue, 24 Jan 2023 01:22:43 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 v26-20020a02b91a000000b003a7d5061e1bsm524923jan.111.2023.01.24.01.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:22:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Jan 2023 02:22:29 -0700
Message-Id: <20230124092235.806969-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124092235.806969-1-james.hilliard1@gmail.com>
References: <20230124092235.806969-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0SspQugj4Bm7C6sWS8CsB68Q00Y6SdY7IpsJlRivU3w=;
 b=RJ8QGMl2TUQTobnB75caWsyGmR3Am9O/jagWm6bOSNzQSK0ODOb5TbikZbcxq43HCZ
 9AiB1Y4qRg+LBL9l7bUmBt0ySDavbkdqBgXLMPlvuXhFPLtLHJ5E+hm75Jao/ge6cSGU
 2qPMmthVc1AqR3H2Fq+6Y+j5I8blCt4N6+d4ayKLZSZMabEvxXzK74EI+MV6vxue1BlV
 RgQkAjRYniR1N/a4i0TNQvYIwYMcOuL0w8bQ7hUFN82UoA+1nqMuvAxaBCI4nPE81qo2
 OLhC5NKSkOF8RqIW6ZlVFXmYC0i9Y60SfodIzhiBVz94q955blTz5iz5pVSeZ42gNUNU
 7Jlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RJ8QGMl2
Subject: [Buildroot] [PATCH v3 2/8] package/cpuinfo: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Hager <stefan.hager@ginzinger.com>

This package is required by tensorflow-lite.

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - move to libraries->hardware handling
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/cpuinfo/Config.in    |  9 +++++++++
 package/cpuinfo/cpuinfo.hash |  4 ++++
 package/cpuinfo/cpuinfo.mk   | 17 +++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/cpuinfo/Config.in
 create mode 100644 package/cpuinfo/cpuinfo.hash
 create mode 100644 package/cpuinfo/cpuinfo.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e8e0dffcd3..3fd5ea32bc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2701,6 +2701,9 @@ F:	package/libvpx/
 F:	package/mesa3d-demos/
 F:	package/ti-gfx/
 
+N:	Stefan Hager <stefan.hager@ginzinger.com>
+F:	package/cpuinfo/
+
 N:	Stefan Ott <stefan@ott.net>
 F:	package/unbound/
 
diff --git a/package/Config.in b/package/Config.in
index 995dae2c57..5537699c86 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1637,6 +1637,7 @@ menu "Hardware handling"
 	source "package/bcm2835/Config.in"
 	source "package/c-periphery/Config.in"
 	source "package/ccid/Config.in"
+	source "package/cpuinfo/Config.in"
 	source "package/dtc/Config.in"
 	source "package/gnu-efi/Config.in"
 	source "package/hackrf/Config.in"
diff --git a/package/cpuinfo/Config.in b/package/cpuinfo/Config.in
new file mode 100644
index 0000000000..137f657d69
--- /dev/null
+++ b/package/cpuinfo/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_CPUINFO
+	bool "cpuinfo"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  CPU INFOrmation library, cpuinfo is a library to detect
+	  essential for performance optimization information about
+	  host CPU.
+
+	  https://github.com/pytorch/cpuinfo
diff --git a/package/cpuinfo/cpuinfo.hash b/package/cpuinfo/cpuinfo.hash
new file mode 100644
index 0000000000..c3f70fa90f
--- /dev/null
+++ b/package/cpuinfo/cpuinfo.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  0936848904943381b2c01321101614776e43d583840ee0f3ceeea1e3fb7405f7  cpuinfo-de2fa78ebb431db98489e78603e4f77c1f6c5c57.tar.gz
+# License files, locally calculated
+sha256  8e7e60636c3aa0cb03571a1a841ce5697f9551ff92b3c426c2561613d15ade70  LICENSE
diff --git a/package/cpuinfo/cpuinfo.mk b/package/cpuinfo/cpuinfo.mk
new file mode 100644
index 0000000000..ab6a0269ec
--- /dev/null
+++ b/package/cpuinfo/cpuinfo.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# cpuinfo
+#
+################################################################################
+
+CPUINFO_VERSION = de2fa78ebb431db98489e78603e4f77c1f6c5c57
+CPUINFO_SITE = $(call github,pytorch,cpuinfo,$(CPUINFO_VERSION))
+CPUINFO_LICENSE = BSD-2-Clause
+CPUINFO_LICENSE_FILES = LICENSE
+CPUINFO_INSTALL_STAGING = YES
+CPUINFO_CONF_OPTS = \
+	-DCPUINFO_BUILD_UNIT_TESTS=OFF \
+	-DCPUINFO_BUILD_MOCK_TESTS=OFF \
+	-DCPUINFO_BUILD_BENCHMARKS=OFF
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
