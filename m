Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DF6C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 04:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1809400EF;
	Sun, 15 Sep 2024 04:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7Sg8NYrjdwQ; Sun, 15 Sep 2024 04:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 713EE40169
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 713EE40169;
	Sun, 15 Sep 2024 04:46:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 149A61BF383
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 109B0607E4
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPvGLtTkVUoh for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 04:46:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 006A460776
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 006A460776
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 006A460776
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 04:46:26 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-82ce1cd202cso190484939f.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726375585; x=1726980385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vEWD5+YTMSxU50PbemehbqK1mcg6WTlhYx72giYHxEY=;
 b=kFO1OWlKFWMQtkUJcU5lmx+FYffXolUFArcayWq32pIOOaejyTKdlWhrOQhQslNg+L
 7FJkGaCiSlYP1jQxGjrq328+oY4ykcFBq+GRzHRU3XKwHJvz1FHPrY32xOaZkxrQAzN6
 oeFR61KaarjDEyyOHpU+fq1XJldiAeQkE4JA8/11QpqO9PJI2TTR6Oz9vQ6URGqswxRA
 7yO6CMRqgZqYgt4+WXI4vHCngKJPWNneDuvv76XY3FmkZYqUa6VzQ7Sj+qpyKyPBX6Wz
 u8/ry+d6/uVrCnc9Wo3rk1ICMWxFA48QnyUjmdWWEc4ls0ZN0yxYCeHTjx5p/B9HtQTq
 sDKg==
X-Gm-Message-State: AOJu0YxD6Buo5YKjQZs+rWH1m5y5dlQbDE8V6t4Y8osR6TUKnB0S6fsV
 ++0pXcCA3GH9RcWyngfSAv36VeYAdwsvwEg6rM7RfJ5JwAu4ThcIpES4fQ==
X-Google-Smtp-Source: AGHT+IHAJNgrZTMOi8g27cengeS6JSAmwQurtQFBZO4HMcinLjs9Otb0iUgQbJJSjq9eAxzRTJsnZQ==
X-Received: by 2002:a05:6602:6013:b0:82a:4e38:b47c with SMTP id
 ca18e2360f4ac-82d1f8b4d50mr273163739f.1.1726375585186; 
 Sat, 14 Sep 2024 21:46:25 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d4928d5dasm74843739f.14.2024.09.14.21.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 21:46:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 22:46:23 -0600
Message-Id: <20240915044623.1401733-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726375585; x=1726980385; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vEWD5+YTMSxU50PbemehbqK1mcg6WTlhYx72giYHxEY=;
 b=QVv/Xj4fNNv+8EZHzMeYN0G3XRbCVVssVhyNECVwCT0Ubs/VDpSdfUqAs8otud/2gJ
 sm9rruWKRPuKkk6xLqpaQAES+5jWHy7P+OCFF/jkH47OYZ1SnJ1bhlPt7FGABiledT3k
 ZMRMXbrBvhTJnNfOaMkhwE83wbbVmyAxDagZxQ6d7FILwRVLrP6ged4uN7U0H9VHPWPV
 mykNw1Ikj07I4jIk84ean7lDxogeWcU6ISOK32JKy+rLvDKdxYHg+UrH6uPRiqLD3/6u
 RS/AXP0XobwXM0WMhEcWACIhJYIc4kw5pi27refJVZ4cYdO03+ZEOSSOj+x7DjRC3rQW
 Xebw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QVv/Xj4f
Subject: [Buildroot] [PATCH 1/1] package/python-dnspython: bump to versin
 2.6.1
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace poetry-core build backend with hatchling.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dnspython/python-dnspython.hash | 4 ++--
 package/python-dnspython/python-dnspython.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-dnspython/python-dnspython.hash b/package/python-dnspython/python-dnspython.hash
index 77ffb5dedc..acab710d5a 100644
--- a/package/python-dnspython/python-dnspython.hash
+++ b/package/python-dnspython/python-dnspython.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dnspython/json
-md5  fac4e1580e5e9dfee722cb97bc073722  dnspython-2.4.2.tar.gz
-sha256  8dcfae8c7460a2f84b4072e26f1c9f4101ca20c071649cb7c34e8b6a93d58984  dnspython-2.4.2.tar.gz
+md5  ad29d0392621fb107e0eac4beed79ce5  dnspython-2.6.1.tar.gz
+sha256  e8f0f9c23a7b7cb99ded64e6c3a6f3e701d78f50c55e002b839dea7225cff7cc  dnspython-2.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c3ea3ff5654b329c19d3bc5f7481af623c3dded4a6145585499f843ad3d741cd  LICENSE
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index f0df733143..01fad58c1d 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-PYTHON_DNSPYTHON_VERSION = 2.4.2
+PYTHON_DNSPYTHON_VERSION = 2.6.1
 PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).tar.gz
-PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/65/2d/372a20e52a87b2ba0160997575809806111a72e18aa92738daccceb8d2b9
+PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/37/7d/c871f55054e403fdfd6b8f65fd6d1c4e147ed100d3e9f9ba1fe695403939
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
 PYTHON_DNSPYTHON_SETUP_TYPE = pep517
-PYTHON_DNSPYTHON_DEPENDENCIES = host-python-poetry-core
-HOST_PYTHON_DNSPYTHON_DEPENDENCIES = host-python-poetry-core
+PYTHON_DNSPYTHON_DEPENDENCIES = host-python-hatchling
+HOST_PYTHON_DNSPYTHON_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
