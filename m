Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91096C61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 03:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 245A640123;
	Sun, 29 Jan 2023 03:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 245A640123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V4vfIN5Ab7e9; Sun, 29 Jan 2023 03:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 243B74055F;
	Sun, 29 Jan 2023 03:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 243B74055F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9EC521BF255
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 03:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78BA140123
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 03:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78BA140123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y5XCeZTpFK-b for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 03:52:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D079400B8
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D079400B8
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 03:52:40 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id j4so462059iog.8
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 19:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0KUQhT15kC1aWQ+mZgG/JDPBm+M3E2WbNI5avteTpPg=;
 b=7pevBrLfGXEJELA81zuk+fTsKYfLvani4+0zqKAr8Yooh1PlVDbdsLxsFMcX0AHt3h
 Pa2EruRhdH76dqL+pVGJSSS9I0DEnZaxuqdGF37JArLvRUkOKJNtl4mf5CtSPbkPzP2g
 PoNLdK/5Uf7/i230gg8T2neAY989A6eHvuOPAabSWGDMKnhrQivYAKZ/WPDL1qr4oqq+
 1b8pladEvA/NmpbLpTqeE/hhJOTusMIxp8/oG8xyPwG3b+EwQNippZrDh7jyF7mKGTwN
 5xxREhFRGCdEFq/0nKutMBm83Ka+LHV63+gJcTwdM+7OffoqaNhIpT+6OVFgZmsoEpq6
 fIWg==
X-Gm-Message-State: AFqh2kr8pPBhST9/2nmQIJ9jkeAIA96LFECe/BkmnxM6RsNMqnhpq89l
 5KQ6/7JxqH38nZDUNUX/DfJmFhrJ+8p/hw==
X-Google-Smtp-Source: AMrXdXs5Xr3ndRJq3IXzLodeAPMhoBi6Qn4LIKX6fdyDQYEilFPGgGIb5BqROKb2ZJnIFmmJdUaYjA==
X-Received: by 2002:a5e:8403:0:b0:707:73ae:e727 with SMTP id
 h3-20020a5e8403000000b0070773aee727mr21010405ioj.3.1674964359390; 
 Sat, 28 Jan 2023 19:52:39 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 b21-20020a05660214d500b006f6623df63asm2874352iow.14.2023.01.28.19.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 19:52:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 20:52:30 -0700
Message-Id: <20230129035232.2480871-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230129035232.2480871-1-james.hilliard1@gmail.com>
References: <20230129035232.2480871-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0KUQhT15kC1aWQ+mZgG/JDPBm+M3E2WbNI5avteTpPg=;
 b=TogpCBklR+4+RRnEJBbFukWVuKSyXV5BkaJzfn8qiduvglZ4lFbxuANNPBdeVRFlbQ
 PHCfZ8+qsI7gmwWdXF8vGgcsCsMB0JQa+Hcuez949PuGy8F7rzLllpXHoQeuy9zDB8qS
 KGqIJeLLgkHdb3i1cDkDot0MP4zGANw9Sey4Bxrqyq5kUx7lqeV6RTutbfGoRQgzlRnK
 uXm3ebjOmZWySRI7GYCQiENBk4qXsv593ri1nQexTdAXv1oX6dH0Z7TLy8MBAi0KoqxU
 n/9B+iVehw4+wjIqthuoIN5MIno5DsRzQgmgh00NBwAFs1ky3k/hCG0j2cKzB/5rSWbz
 ga2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TogpCBkl
Subject: [Buildroot] [PATCH v2 5/7] package/python-wsproto: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-wsproto/Config.in           |  7 +++++++
 package/python-wsproto/python-wsproto.hash |  5 +++++
 package/python-wsproto/python-wsproto.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-wsproto/Config.in
 create mode 100644 package/python-wsproto/python-wsproto.hash
 create mode 100644 package/python-wsproto/python-wsproto.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9fdc66f60b..bb56753418 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1407,6 +1407,7 @@ F:	package/python-typeguard/
 F:	package/python-typing-inspect/
 F:	package/python-uhid/
 F:	package/python-weasyprint/
+F:	package/python-wsproto/
 F:	package/python-yarl/
 F:	package/python-zopfli/
 F:	package/rtl8192eu/
diff --git a/package/Config.in b/package/Config.in
index aa6bb7bce3..2cb785c128 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1340,6 +1340,7 @@ menu "External python modules"
 	source "package/python-wrapt/Config.in"
 	source "package/python-ws4py/Config.in"
 	source "package/python-wsaccel/Config.in"
+	source "package/python-wsproto/Config.in"
 	source "package/python-wtforms/Config.in"
 	source "package/python-xlib/Config.in"
 	source "package/python-xlrd/Config.in"
diff --git a/package/python-wsproto/Config.in b/package/python-wsproto/Config.in
new file mode 100644
index 0000000000..0610348b8d
--- /dev/null
+++ b/package/python-wsproto/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_WSPROTO
+	bool "python-wsproto"
+	select BR2_PACKAGE_PYTHON_H11 # runtime
+	help
+	  WebSockets state-machine based protocol implementation.
+
+	  https://github.com/python-hyper/wsproto/
diff --git a/package/python-wsproto/python-wsproto.hash b/package/python-wsproto/python-wsproto.hash
new file mode 100644
index 0000000000..4eb3195785
--- /dev/null
+++ b/package/python-wsproto/python-wsproto.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/wsproto/json
+md5  f64973434117e23d2079460ed64b05c3  wsproto-1.2.0.tar.gz
+sha256  ad565f26ecb92588a3e43bc3d96164de84cd9902482b130d0ddbaa9664a85065  wsproto-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  c0329a8dbf3437b095f7f5cf4257d6bb855e07120cae8786586073ff7a699959  LICENSE
diff --git a/package/python-wsproto/python-wsproto.mk b/package/python-wsproto/python-wsproto.mk
new file mode 100644
index 0000000000..629f4431b4
--- /dev/null
+++ b/package/python-wsproto/python-wsproto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-wsproto
+#
+################################################################################
+
+PYTHON_WSPROTO_VERSION = 1.2.0
+PYTHON_WSPROTO_SOURCE = wsproto-$(PYTHON_WSPROTO_VERSION).tar.gz
+PYTHON_WSPROTO_SITE = https://files.pythonhosted.org/packages/c9/4a/44d3c295350d776427904d73c189e10aeae66d7f555bb2feee16d1e4ba5a
+PYTHON_WSPROTO_SETUP_TYPE = setuptools
+PYTHON_WSPROTO_LICENSE = MIT
+PYTHON_WSPROTO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
