Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E88BC36010
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 23:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E401819F5;
	Mon, 31 Mar 2025 23:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0brqJKIuN6Tn; Mon, 31 Mar 2025 23:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 278AF8139F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 278AF8139F;
	Mon, 31 Mar 2025 23:38:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D39F8121
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 23:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C35896060A
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 23:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frLv1PoDcnNV for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 23:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=daniel.crowe@maxmine.com.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 061F260617
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 061F260617
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 061F260617
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 23:38:11 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-225477548e1so88672015ad.0
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 16:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743464291; x=1744069091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FjYHyhNCYDYHnxbz+XK0vstesqiB+uGve+efNWdW5tE=;
 b=NFMTDrMl12LWtp64eiIpAop3YPiPaBKtxjDw9UiLO/oKGC8wr7lWP6XJGJlkwgb9oJ
 0t50NxqaiqP29Fdh5JA7uRTwmzYlcOAAXJFA0w9QUxPACK0yzfyPGlC+iPc3rttlwt8v
 sgIxmV2Ng6t1NYGbqXYhn5XxRHhcJINdD1/kq5S625C8TUPHOxxHkkHrCjS3NL7d4pYI
 RDLa1OtCSgqfmxlt7lwiOgar7xNy4s6jKYhpl2CyjTFyc5pZZT5WWIH8BG0Sp4Xfa2rl
 KJu4kNBQc4gzjSORRFWDTugjPW3s/XSF7AaX2wKgfaoYoRNQv9zg8AhYZUBkV8esGw7G
 ibDQ==
X-Gm-Message-State: AOJu0Yzwc9akQELKdGz9nrWlFC0073YX5zQRP6gBqwf64h3qO6bcng29
 Im915iine5qgGunW9gAS9H7ssYXn0hOGWiRZ1g+0Pb6jzqdfFw4AOS615kXUaIfGM5NhAgYFgtQ
 EHVc=
X-Gm-Gg: ASbGncvpZxN9vdGjtGIeSKigC93AREkH3brJdRBL1UqfGAOV48NqUgLuMDeD5S9kNMS
 dG10nC3YC61VN7OIdq0Us/Pd2Ou6Wukt5XiYR9W2lI/C98aRxgIxlnpi+55ylRglvn8LvK0jmdv
 pWjc2+FdgoPKI8HtRajAb/rLmnQUA3OCjFV8tm2T/yR6Q+raZ7hfRVuVupK5NfJ9cZBD6cML21J
 YaDPTvyQU4cxiUak/IyzSl7gULM4/V4A3i7ujI9v8dZH2iPaB1YEhETS67mIMN/pJjTj+pVYoyZ
 ZJzqZ3EuS5b/hCpdU70NwKx/KlF1+68zxPeXESBYS1JOBQxfe7V40wQxhlgqjMGOY/ZLvIy6z2v
 KLzkszkNhOA/iju0ISg==
X-Google-Smtp-Source: AGHT+IG/xW7M/Nb7DyMSTxuEs6Y3f9cdfrMzOUJj7PlatrU7SmpEXOtNCrXBIcklV8KKAJSDr9r+Qw==
X-Received: by 2002:a05:6a00:4606:b0:732:5611:cbb5 with SMTP id
 d2e1a72fcca58-7398037e23fmr15132353b3a.11.1743464290588; 
 Mon, 31 Mar 2025 16:38:10 -0700 (PDT)
Received: from res-0346.adl.internal.resolution.systems ([103.211.209.15])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73971091cadsm7577025b3a.126.2025.03.31.16.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 16:38:10 -0700 (PDT)
From: Daniel Crowe <daniel.crowe@maxmine.com.au>
To: buildroot@buildroot.org
Date: Tue,  1 Apr 2025 10:07:23 +1030
Message-ID: <20250331233726.3730509-2-daniel.crowe@maxmine.com.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
References: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maxmine-com-au.20230601.gappssmtp.com; s=20230601; t=1743464291; x=1744069091;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FjYHyhNCYDYHnxbz+XK0vstesqiB+uGve+efNWdW5tE=;
 b=D3qhKr/8lT7NV4knUq2TbWtA8WeZ6LOfXCyPKcVCLjAiJywIMoNajCUTZjlp1UzZ0Q
 Q0DGvvOABLm+PcsJF/blqF/pu+2KCUgCyz1fqTd9aTh+YhUkLenhZXT9AFJxmnDM4XcD
 ywqbQEPdiTnyH8Ze4A/lbi8cCyygjxKOTE1QTwrV5LH+1/wpmh1BVRxO4nr/c+SfSF1J
 X2lxB6BWOYkRsA1C8c+Z4HI5/FvkKgsa5nbACVyDFccfS0sKfpo/pAN7xlBVBneK8/XR
 BFfB2y6WDiBc2p73ArE7Cb2n12bKSJJu7D1QS46/WRZBPTATL7CnKahcAoqRLcB3L0eq
 pQIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maxmine.com.au
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=maxmine-com-au.20230601.gappssmtp.com
 header.i=@maxmine-com-au.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=D3qhKr/8
Subject: [Buildroot] [PATCH 2/5] package/flask-caching: add version 2.3.1
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

Provides caching for python Flask applications
https://flask-caching.readthedocs.io/en/latest/

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
---
 package/Config.in                                  |  1 +
 package/python-flask-caching/Config.in             |  8 ++++++++
 .../python-flask-caching/python-flask-caching.hash |  6 ++++++
 .../python-flask-caching/python-flask-caching.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-flask-caching/Config.in
 create mode 100644 package/python-flask-caching/python-flask-caching.hash
 create mode 100644 package/python-flask-caching/python-flask-caching.mk

diff --git a/package/Config.in b/package/Config.in
index 71d8580638..fa8a347464 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1115,6 +1115,7 @@ menu "External python modules"
 	source "package/python-fire/Config.in"
 	source "package/python-flask/Config.in"
 	source "package/python-flask-babel/Config.in"
+	source "package/python-flask-caching/Config.in"
 	source "package/python-flask-cors/Config.in"
 	source "package/python-flask-expects-json/Config.in"
 	source "package/python-flask-jsonrpc/Config.in"
diff --git a/package/python-flask-caching/Config.in b/package/python-flask-caching/Config.in
new file mode 100644
index 0000000000..ad8c617f7a
--- /dev/null
+++ b/package/python-flask-caching/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_FLASK_CACHING
+	bool "python-flask-caching"
+	select BR2_PACKAGE_PYTHON_CACHELIB # runtime
+	select BR2_PACKAGE_PYTHON_FLASK # runtime
+	help
+	  Adds caching support to Flask applications.
+
+	  https://github.com/pallets-eco/flask-caching
diff --git a/package/python-flask-caching/python-flask-caching.hash b/package/python-flask-caching/python-flask-caching.hash
new file mode 100644
index 0000000000..ee3f669934
--- /dev/null
+++ b/package/python-flask-caching/python-flask-caching.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/flask-caching/json
+md5  026d06167ba7353ac65c861950ad5696  flask_caching-2.3.1.tar.gz
+sha256  65d7fd1b4eebf810f844de7de6258254b3248296ee429bdcb3f741bcbf7b98c9  flask_caching-2.3.1.tar.gz
+# Locally computed sha256 checksums
+sha256  1f3c445faa26eb32d90291228510e2d8594bd1fe15463f5d70c87d44f38872fd  LICENSE
+sha256  7729328f7b1ce664dbf630f077581cdfe97379b58b49e9a4f20c63912a5e5c09  docs/license.rst
diff --git a/package/python-flask-caching/python-flask-caching.mk b/package/python-flask-caching/python-flask-caching.mk
new file mode 100644
index 0000000000..db305d3dde
--- /dev/null
+++ b/package/python-flask-caching/python-flask-caching.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-flask-caching
+#
+################################################################################
+
+PYTHON_FLASK_CACHING_VERSION = 2.3.1
+PYTHON_FLASK_CACHING_SOURCE = flask_caching-$(PYTHON_FLASK_CACHING_VERSION).tar.gz
+PYTHON_FLASK_CACHING_SITE = https://files.pythonhosted.org/packages/e2/80/74846c8af58ed60972d64f23a6cd0c3ac0175677d7555dff9f51bf82c294
+PYTHON_FLASK_CACHING_SETUP_TYPE = setuptools
+PYTHON_FLASK_CACHING_LICENSE = BSD-3-Clause
+PYTHON_FLASK_CACHING_LICENSE_FILES = LICENSE docs/license.rst
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
