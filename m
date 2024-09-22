Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060ADCF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 03:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADC9B605FD;
	Sun, 22 Sep 2024 03:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dHyPBqynS0gw; Sun, 22 Sep 2024 03:53:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B08260605
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B08260605;
	Sun, 22 Sep 2024 03:53:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FAD81BF292
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E6AD402D0
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3q5Xa95mo-YB for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 03:52:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E90E9400CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E90E9400CF
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E90E9400CF
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 03:52:57 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-82aad6c83ecso125749239f.3
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 20:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726977176; x=1727581976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PkJjEl5rcr4O/lxwt7rA3tB1i/UNui8ZOrlx5NnODvM=;
 b=ZVfdpKnARhojI9tToZnwDO+HS8Ca6OkQWuSkPNjzkd4sogPVarfgMW4rLa9QaBOHmi
 aZvP25iYYqwWUT73On/wY6aORqSqW0LFseiINsyWE9IzED7uXVO/5QmfHSXKR/+6fB2i
 7WbMVf1wRiBtXFb/0YCg9qPk9iJsvVYLjMjZ1OI/CAd7S3NnsBT7ULrh+7OJGkbQoR+4
 Fx5IXpsvOtQWUJcyzfOsoaGH4SJ2kpt1n0DXsUw8vBCJFSThFz5FQ4rVVw/gF4peErvy
 MI2/p5mlB68wFXngSJGFeJP7YW71QaN+kGYhuG+m70/QRuOwEj7kti6lzl0kJl+ltuap
 LiEQ==
X-Gm-Message-State: AOJu0YyztNjskf3JdAZ5dOPr7Y55m81+036g560ok8LeXqNP4xW/dMCY
 FiZVNIqk4weg74iyAlaUf/V+kahxP7o88yXploBbLuTFjm6yApHdnmhZPg==
X-Google-Smtp-Source: AGHT+IHekUJfwwT9KWzxJvg+UiZNSA2zUYHKTVkTSCkBPbNg4nvg5V9CuED4V+l/Z4EM5c8IsHgJZA==
X-Received: by 2002:a05:6602:13cc:b0:82a:a7c6:dae1 with SMTP id
 ca18e2360f4ac-8320b34e71cmr571028439f.13.1726977176592; 
 Sat, 21 Sep 2024 20:52:56 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec3d027sm4469425173.80.2024.09.21.20.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 20:52:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 21:52:54 -0600
Message-Id: <20240922035254.855480-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726977176; x=1727581976; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PkJjEl5rcr4O/lxwt7rA3tB1i/UNui8ZOrlx5NnODvM=;
 b=JqJgiJ22Dd5We+yMXzrTMEAZOw5vcj8ly3081gnMcf6mwGwo7kEpqbeZqlrgT/S5Q5
 t92mBy0ZWNFUIxORRk5EKbeoW/FsciEmaPbhYpyxXRFUtHpL5zzNJPG9b0c1VrX7EHGT
 6NfVTnYzsH/eDO58lse//gJDbd7j0cVVe8SPxJ2cinJBTDcFTLTnUeg0Xbbs+EUZaTfH
 gLodvtdHw/3ld6YAK/BEH1vt5vwHFFXyvMLuGJWGCHGhk+JRZKYfWc07hrmrL1O1K4br
 sjuHU6eEE3vdmhaFnvZr37UfezL1p9f62loeLKNxdduLtfspvgu3vg12o5IukohJ5ie6
 qCoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JqJgiJ22
Subject: [Buildroot] [PATCH 1/1] package/python-tornado: bump to version
 6.4.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...n-open-redirect-in-StaticFileHandler.patch | 42 -------------------
 package/python-tornado/python-tornado.hash    |  4 +-
 package/python-tornado/python-tornado.mk      |  4 +-
 3 files changed, 4 insertions(+), 46 deletions(-)
 delete mode 100644 package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch

diff --git a/package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch b/package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch
deleted file mode 100644
index 357c6f2f12..0000000000
--- a/package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From ac79778c91bd9a4a92111f7e06d4b12674571113 Mon Sep 17 00:00:00 2001
-From: Ben Darnell <ben@bendarnell.com>
-Date: Sat, 13 May 2023 20:58:52 -0400
-Subject: [PATCH] web: Fix an open redirect in StaticFileHandler
-
-Under some configurations the default_filename redirect could be exploited
-to redirect to an attacker-controlled site. This change refuses to redirect
-to URLs that could be misinterpreted.
-
-A test case for the specific vulnerable configuration will follow after the
-patch has been available.
-
-Upstream: https://github.com/tornadoweb/tornado/commit/32ad07c54e607839273b4e1819c347f5c8976b2f
-[Thomas: backported to fix CVE-2023-28370]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- tornado/web.py | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/tornado/web.py b/tornado/web.py
-index cd6a81b4..05b571eb 100644
---- a/tornado/web.py
-+++ b/tornado/web.py
-@@ -2806,6 +2806,15 @@ class StaticFileHandler(RequestHandler):
-             # but there is some prefix to the path that was already
-             # trimmed by the routing
-             if not self.request.path.endswith("/"):
-+                if self.request.path.startswith("//"):
-+                    # A redirect with two initial slashes is a "protocol-relative" URL.
-+                    # This means the next path segment is treated as a hostname instead
-+                    # of a part of the path, making this effectively an open redirect.
-+                    # Reject paths starting with two slashes to prevent this.
-+                    # This is only reachable under certain configurations.
-+                    raise HTTPError(
-+                        403, "cannot redirect path with two initial slashes"
-+                    )
-                 self.redirect(self.request.path + "/", permanent=True)
-                 return None
-             absolute_path = os.path.join(absolute_path, self.default_filename)
--- 
-2.41.0
-
diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index f30a6bb136..f8ac0ceaf3 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5  32fbad606b439c3e1bf4e79d4e872741  tornado-6.2.tar.gz
-sha256  9b630419bde84ec666bfd7ea0a4cb2a8a651c2d5cccdbdd1972a0c859dfc3c13  tornado-6.2.tar.gz
+md5  07ebd88a2a7acee1b819738f3f4ca7ef  tornado-6.4.1.tar.gz
+sha256  92d3ab53183d8c50f8204a51e6f91d18a15d5ef261e84d452800d4ff6fc504e9  tornado-6.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index f4a4c97d2a..84310f7613 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.2
+PYTHON_TORNADO_VERSION = 6.4.1
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/f3/9e/225a41452f2d9418d89be5e32cf824c84fe1e639d350d6e8d49db5b7f73a
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/ee/66/398ac7167f1c7835406888a386f6d0d26ee5dbf197d8a571300be57662d3
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
