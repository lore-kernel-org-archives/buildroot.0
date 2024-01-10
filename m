Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD60C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 09:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02110435FB;
	Wed, 10 Jan 2024 09:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02110435FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1zhEMR5nC_6I; Wed, 10 Jan 2024 09:39:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 324D543655;
	Wed, 10 Jan 2024 09:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 324D543655
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BBB51BF34C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0027E43629
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0027E43629
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1kthOdm1DfT8 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 09:38:56 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2DCD435DB
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2DCD435DB
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7baa8097064so187949639f.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 01:38:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704879535; x=1705484335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rfC56Xqnz/KUG7J4WtZBosoYaWs7TTWbImzggaLrFmo=;
 b=fMLqo/bvGVyP3gWHZubz9/2WlUyv4tbBxd6wKoiPvl3SZhoEPaTotKWY79oFCA44gw
 OYxlAEVvkBL6lqklip0eNP/qFA0swZVJ8BbbPxlHWz+eYKLgGCm3ihroiTqVXriHMtMt
 kaCqIcYLBfrx5OoliMxefZIQNKoRsSFWnH3DrZM3jp3qvtn49xMZCTqV25Rfw9Wi6P8x
 d9HOMBA7NI6Zp3AvlO7Y9AFkeMpHqJ7wHjO431tiquQCP2AVW6db+P2YpMu2LJzprkaJ
 9xA0fYytFllYkzQGzMSwKnytDiPAz3epKJKMaA2l00gAnLFKGc1V8QdrQ3aI0JCeA5sv
 XpwQ==
X-Gm-Message-State: AOJu0YxngCsZ+I+hGJsExZDZWX/07eA69dYIf503+UwFhERby1Wptnik
 ukLcP2XgTNEczriHDrUGeSD+Ao/5wIV/MQ==
X-Google-Smtp-Source: AGHT+IGFCG5tkRPM7DD0imRj86Zhx8tPJkA9Dc9+6CVbRb2pZfGXwNxehXarMe3RcMuVj2DhpqQ63Q==
X-Received: by 2002:a05:6e02:1c2d:b0:360:1231:eefb with SMTP id
 m13-20020a056e021c2d00b003601231eefbmr1027138ilh.51.1704879535446; 
 Wed, 10 Jan 2024 01:38:55 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cw9-20020a05663849c900b0046d950cf82bsm1185395jab.85.2024.01.10.01.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 01:38:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 02:38:47 -0700
Message-Id: <20240110093850.2302133-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110093850.2302133-1-james.hilliard1@gmail.com>
References: <20240110093850.2302133-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704879535; x=1705484335; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rfC56Xqnz/KUG7J4WtZBosoYaWs7TTWbImzggaLrFmo=;
 b=CtWm9V8Jyk+8gBSnZFLwo/WAlrL6Gc5Eoa7Oww59NXdTDW7TSIute6Getu9YCq57dY
 5YkU3AwtHXIiXsQZiiZe7d6u6LykRF10ovCFvQBBJI15okdKTtRstYlFR81Eu0DN47l4
 1SrZ2n9gM/Khy1G0zb6pldf2WIJ97ZhqIUFa7Jp7i5gS+uww3KTEA42GGIYQjw/x0mps
 LJjHBE6IsyPSclk+4wK0X1Wnt8JwvJgH+W9jj1i79/QJRCO6NnUjGz85l43/EnSleJMv
 egwZcszMJH7UwsMPhIoXWK7aAsf3ea0QTS3XnjQk4u2xBIkWTX4i0ers4T7dgGveHMl3
 y2tQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CtWm9V8J
Subject: [Buildroot] [PATCH 3/6] package/python-scikit-build: new package
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-scikit-build.hash                  |  5 +++++
 .../python-scikit-build.mk                    | 22 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 package/python-scikit-build/python-scikit-build.hash
 create mode 100644 package/python-scikit-build/python-scikit-build.mk

diff --git a/package/python-scikit-build/python-scikit-build.hash b/package/python-scikit-build/python-scikit-build.hash
new file mode 100644
index 0000000000..cbdf02bafc
--- /dev/null
+++ b/package/python-scikit-build/python-scikit-build.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/scikit-build/json
+md5  93a106577d5ebf3122f5383b97fb6abf  scikit_build-0.17.6.tar.gz
+sha256  b51a51a36b37c42650994b5047912f59b22e3210b23e321f287611f9ef6e5c9d  scikit_build-0.17.6.tar.gz
+# Locally computed sha256 checksums
+sha256  2a706f2cde09d2d589900dafc5393b926b570f18dcf4259765631d272f039761  LICENSE
diff --git a/package/python-scikit-build/python-scikit-build.mk b/package/python-scikit-build/python-scikit-build.mk
new file mode 100644
index 0000000000..36840fcaea
--- /dev/null
+++ b/package/python-scikit-build/python-scikit-build.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-scikit-build
+#
+################################################################################
+
+PYTHON_SCIKIT_BUILD_VERSION = 0.17.6
+PYTHON_SCIKIT_BUILD_SOURCE = scikit_build-$(PYTHON_SCIKIT_BUILD_VERSION).tar.gz
+PYTHON_SCIKIT_BUILD_SITE = https://files.pythonhosted.org/packages/85/05/dc8f28b19f3f06b8a157a47f01f395444f0bae234c4d44674453fa7eeae3
+PYTHON_SCIKIT_BUILD_SETUP_TYPE = pep517
+PYTHON_SCIKIT_BUILD_LICENSE = MIT
+PYTHON_SCIKIT_BUILD_LICENSE_FILES = LICENSE
+HOST_PYTHON_SCIKIT_BUILD_DEPENDENCIES = \
+	host-python-distro \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs \
+	host-python-packaging \
+	host-python-setuptools \
+	host-python-wheel
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
