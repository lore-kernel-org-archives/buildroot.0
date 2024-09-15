Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4ABC35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 06:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7734C40640;
	Sun, 15 Sep 2024 06:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0p4N-McIfHi; Sun, 15 Sep 2024 06:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34A22406BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A22406BE;
	Sun, 15 Sep 2024 06:38:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B47D1BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 198C7406BE
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxWuTHnCjv14 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 06:38:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D628A40640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D628A40640
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D628A40640
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 06:38:51 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-82aa8c36eefso146654239f.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 23:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726382330; x=1726987130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cfxK96Un127WelH6HcG36wRXBGMipEWxfwl34Cbw/CA=;
 b=NRzzhhulj9dN0o3pmB6Tss0J8NtnkxonBOUCdda0m/2wxs5rYizN0kdIqOtZclyebu
 x2mSIdL0qEoccih9WzVvJIoaVGdqRd5hrYtvGlyBtyVHNSGTVJW9EY1OoW5oKji9A+zr
 j79+VgIBzeyse/KC9vVpt8XFjrLN+HRi4Ix5Ua2/RH+1gCLUPDOUo+QtJbnVRJsb6ymV
 H9D9hhthgIzpnM8+Sk1ytP5OItKVhECzMSGsgJ76UD+N+TVlLeubgnpuuZV+VdPblYR8
 0Y2HZeapAQsZmJxmSd3s9BFcXL0yESk2KdJyAn9TytrpjyZ0KXnOlXuLQbJaJ66IdlrF
 Nfgg==
X-Gm-Message-State: AOJu0YzzC7WIpHR9Z7n+WJ5PJ9300og6QQiUVFBWPbXp/flnZVuxJtsr
 GHx4JbZNdi61001j4qZ8B4GdBh4qF8wzYoCUmb2Vd3l3bCACI5+ouKoZMg==
X-Google-Smtp-Source: AGHT+IHheUMYylN7nnGGCNHWnhAYlDHo67cyPwjQ1jfgGrhlq38iNmdvh/phbVntZoWNmZfiB05Hzg==
X-Received: by 2002:a05:6602:2dc1:b0:82c:ea68:a991 with SMTP id
 ca18e2360f4ac-82d3784c9afmr728819139f.16.1726382330358; 
 Sat, 14 Sep 2024 23:38:50 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d49355ecesm80783939f.54.2024.09.14.23.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 23:38:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 00:38:47 -0600
Message-Id: <20240915063847.1523395-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726382330; x=1726987130; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cfxK96Un127WelH6HcG36wRXBGMipEWxfwl34Cbw/CA=;
 b=Yf6Q8t2EFhmYHcOMbyL0trZpW2RkLrEFG7bfTmE0ytBtjQHt0SUHKfxV59NVNI7P1r
 /LQCboFrBpk/efsQyKOX6KoP+OUHE57kG9yqFJQAn6tfi1BGoCuGLQpnE5Pw4dXl2Nvk
 AtOlBfG3xva0svObsz3dDcsl620OUzWJSh560/2/9OXFK4dwE8N37vfDk2iLcpqelOEq
 qidVHXg+1WCekVRnWT89Ex9Yjxs4MnTfU+gUGtI/Zg7EzlOw4cwdNxb/E8SYV0amF2VE
 TIhocp1ksOgXg8scYl6TNXOOHaP0hWw5lMKPZT2a4dZNBtTrr74xhGqj35Xw+zPmK1y1
 QfyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Yf6Q8t2E
Subject: [Buildroot] [PATCH 1/1] package/python-flask: bump to version 3.0.3
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
Cc: Lionel Flandrin <lionel@svkt.org>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to changing from rst to txt:
https://github.com/pallets/flask/commit/87d5f5b9a9697434e6d972b021201105eabb54e6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask/python-flask.hash | 8 ++++----
 package/python-flask/python-flask.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index 3b5afc48e7..415e2068b0 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask/json
-md5  4848c9d5305197822b5b00c8e9a6d9aa  flask-3.0.0.tar.gz
-sha256  cfadcdb638b609361d29ec22360d6070a77d7463dcb3ab08d2c2f2f168845f58  flask-3.0.0.tar.gz
+md5  4658b022a07f6d8df51ef24c717fe162  flask-3.0.3.tar.gz
+sha256  ceb27b0af3823ea2737928a4d99d125a06175b8512c445cbd9a9ce200ef76842  flask-3.0.3.tar.gz
 # Locally computed sha256 checksums
-sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
-sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
+sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.txt
+sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index 1372d915c1..a4a19efba0 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 3.0.0
+PYTHON_FLASK_VERSION = 3.0.3
 PYTHON_FLASK_SOURCE = flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/d8/09/c1a7354d3925a3c6c8cfdebf4245bae67d633ffda1ba415add06ffc839c5
+PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/41/e1/d104c83026f8d35dfd2c261df7d64738341067526406b40190bc063e829a
 PYTHON_FLASK_SETUP_TYPE = flit
 PYTHON_FLASK_LICENSE = BSD-3-Clause
-PYTHON_FLASK_LICENSE_FILES = LICENSE.rst docs/license.rst
+PYTHON_FLASK_LICENSE_FILES = LICENSE.txt docs/license.rst
 PYTHON_FLASK_CPE_ID_VENDOR = palletsprojects
 PYTHON_FLASK_CPE_ID_PRODUCT = flask
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
