Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8CCCAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 00:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBD8781189;
	Fri,  3 Oct 2025 00:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7xdDo622J22; Fri,  3 Oct 2025 00:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD9EB80BD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD9EB80BD0;
	Fri,  3 Oct 2025 00:01:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04791CD
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 00:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9D2A60C03
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 00:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84_JxVZJEHlu for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 00:01:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=daniel.crowe@maxmine.com.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B505760BFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B505760BFC
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B505760BFC
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 00:01:06 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-77f67ba775aso2358227b3a.3
 for <buildroot@buildroot.org>; Thu, 02 Oct 2025 17:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759449665; x=1760054465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B5eGnh1EmSOKCqQx2BrlarD/aUCEou1Nn3q4zO6IzrQ=;
 b=cgttkd+JKOTkpAtMRVjr9TIuPSn19PBzixj5phgywJfLsdAYQKF8mSmSnnFQBv2StG
 CjIBw+I02NiBW+1BpsLwosmzAdVNYCGJjLTc7E9IO18WTam3DNU3ojT2ac8jLAepdd0U
 k5WYdmx/CKFOM/iZqFWJgxs14lGTGe0m+Sc9tiuHieCZv4NEQHiEJXyXKHX/rd+/nyiA
 qvq+QlhJtGCdAWxU/mM7Y2tkQ5DLbaRarVx+q9vUKQsXM3RE6PFKoVQ9ONwVvPPhL8Vg
 0R3WU+rFM/AcC47WnRKP6YkGGrarg+7NaZxtA6BtETLIi8YNEvewuW9Yl1mSbvgJnR/t
 v58Q==
X-Gm-Message-State: AOJu0YzrxozK6c+tUKjaL43brQNPrf8cXTuuIYPZBxp7A0RZ7Vw+NX9z
 nWL49NtZ1CiDuTAoMhDyCYkzeeV+cNPQlwnRUR24MdN+sty+dBmcl206fB61m1K1r+3a7+/xuGg
 LWZ8aR0A=
X-Gm-Gg: ASbGnct0JtJhPNGKkTKtAZ+I8e36QD06LEmLj/w0lIMYSylYe7IljPV5JnAp3sy9ilw
 u1weB3KJdNSWXya6W0Mx3/JULvQa65E37CMS+j8x6iq6jsKDNSaRODBDi7S99/1UuzU41IfA/du
 Ostth4U6/bZkLLKz3AB+IaJVhU35Kp0keR2hEW364kJ2FZRNA4f7uWsxAA8pjy1TvQMfqmymGXe
 NVkWpKHBW1iK4fxb0UPi7qrwAinxPOyjBU4Zph7fJahYlCOUQllSlbH/13zKuBRYwLJcReu7ggM
 EFWi9WF8VqC/wQAdp8qifqITOEdMyWeF2Gz+WbmkYnS8VzeCpQlKa9lG+RsveqUe/YpwMZwZCfG
 RHJPq5JV/+Iz1xNWGglkXhLZXz+bCBJ+v44SBRGns4CuEpPfyIZY3i/jrsczBBlKykH74wdFJ6y
 CeVn6IbLJfpXB+YYAZ4nM=
X-Google-Smtp-Source: AGHT+IHqby9QLkqFY83C9DYZ8YNTKSo0oZ3QGShwO3igyEYEDjEuDSe3QRY/BYIttRa4FSy3fqnNsQ==
X-Received: by 2002:a05:6a20:7287:b0:2c8:416:6470 with SMTP id
 adf61e73a8af0-32b61e5c8b9mr1526159637.24.1759449665374; 
 Thu, 02 Oct 2025 17:01:05 -0700 (PDT)
Received: from res-0346.adl.internal.resolution.systems ([103.211.209.15])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6099f73537sm2881357a12.43.2025.10.02.17.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 17:01:04 -0700 (PDT)
From: Daniel Crowe <daniel.crowe@maxmine.com.au>
To: buildroot@buildroot.org
Date: Fri,  3 Oct 2025 09:30:24 +0930
Message-ID: <20251003000024.3384384-1-daniel.crowe@maxmine.com.au>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maxmine-com-au.20230601.gappssmtp.com; s=20230601; t=1759449665; x=1760054465;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B5eGnh1EmSOKCqQx2BrlarD/aUCEou1Nn3q4zO6IzrQ=;
 b=Q8DRuonbfcv6oCuq3LmZdGp2QB/Yo5bzzSveL8y6flfCo+DEB68d9d2jlbC+N5IIQo
 XThbX4msSwUM6ibF/9mBx4U/jFtm0sxMDX++koTsHieeZAuzB+ugJLK/G+6hsSDhf7/h
 gDRGhq/NzqO/1S6+mnu6CCrOStHyKEOoalXHdfgpyaoLnBehVXzTVlIyTmN+D45eNTEu
 JYxdRM7qZanFouSSK4diMV6FdMkvNF+Wm0+4r7yyOZvxn2hG0aciMXEqiegr0G+z4Z2h
 0i9abrL6BPV/XtTrXjSXEi7CO0pQOcKl8Hus5h56GJUNJqPw6yHo/VZFnEuhjlJMDhnQ
 GjAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maxmine.com.au
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=maxmine-com-au.20230601.gappssmtp.com
 header.i=@maxmine-com-au.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Q8DRuonb
Subject: [Buildroot] [PATCH 1/1] package/python-flask-restx: bump version to
 1.3.2
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
 Daniel Crowe <daniel.crowe@maxmine.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
---
 package/python-flask-restx/Config.in               | 3 +--
 package/python-flask-restx/python-flask-restx.hash | 4 ++--
 package/python-flask-restx/python-flask-restx.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-flask-restx/Config.in b/package/python-flask-restx/Config.in
index ec5b3283bd..c98dd74d5b 100644
--- a/package/python-flask-restx/Config.in
+++ b/package/python-flask-restx/Config.in
@@ -1,10 +1,9 @@
 config BR2_PACKAGE_PYTHON_FLASK_RESTX
 	bool "python-flask-restx"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jsonschema
 	select BR2_PACKAGE_PYTHON_ANISO8601 # runtime
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
-	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	select BR2_PACKAGE_PYTHON_REFERENCING # runtime
 	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
 	help
 	  Fully featured framework for fast, easy and documented API
diff --git a/package/python-flask-restx/python-flask-restx.hash b/package/python-flask-restx/python-flask-restx.hash
index f90601cdc1..5bbe0dfa93 100644
--- a/package/python-flask-restx/python-flask-restx.hash
+++ b/package/python-flask-restx/python-flask-restx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-restx/json
-md5  262984a0c902db0b6f4afb86a69ea40e  flask-restx-1.3.0.tar.gz
-sha256  4f3d3fa7b6191fcc715b18c201a12cd875176f92ba4acc61626ccfd571ee1728  flask-restx-1.3.0.tar.gz
+md5  3fe0cd948ae1a0ebcbca569daf069586  flask-restx-1.3.2.tar.gz
+sha256  0ae13d77e7d7e4dce513970cfa9db45364aef210e99022de26d2b73eb4dbced5  flask-restx-1.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d736fc20d979831ab5c380973d01542de97857d975b60a4cf03efbd9e4e38997  LICENSE
diff --git a/package/python-flask-restx/python-flask-restx.mk b/package/python-flask-restx/python-flask-restx.mk
index 23596f23d4..f8e8ef133a 100644
--- a/package/python-flask-restx/python-flask-restx.mk
+++ b/package/python-flask-restx/python-flask-restx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_RESTX_VERSION = 1.3.0
+PYTHON_FLASK_RESTX_VERSION = 1.3.2
 PYTHON_FLASK_RESTX_SOURCE = flask-restx-$(PYTHON_FLASK_RESTX_VERSION).tar.gz
-PYTHON_FLASK_RESTX_SITE = https://files.pythonhosted.org/packages/45/4c/2e7d84e2b406b47cf3bf730f521efe474977b404ee170d8ea68dc37e6733
+PYTHON_FLASK_RESTX_SITE = https://files.pythonhosted.org/packages/43/89/9b9ca58cbb8e9ec46f4a510ba93878e0c88d518bf03c350e3b1b7ad85cbe
 PYTHON_FLASK_RESTX_SETUP_TYPE = setuptools
 PYTHON_FLASK_RESTX_LICENSE = BSD-3-Clause
 PYTHON_FLASK_RESTX_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
