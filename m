Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35C5C71153
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 22:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7658C40426;
	Sat,  2 Sep 2023 22:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7658C40426
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwNjhJTedQa6; Sat,  2 Sep 2023 22:31:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A99E840576;
	Sat,  2 Sep 2023 22:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A99E840576
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4C211BF3F2
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 22:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE17581F8F
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 22:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE17581F8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IonO_LaMRzrd for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 22:31:33 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EB5B81F8D
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 22:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EB5B81F8D
Received: by mail.gandi.net (Postfix) with ESMTPA id 2DD59FF803;
 Sat,  2 Sep 2023 22:31:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun,  3 Sep 2023 00:31:28 +0200
Message-ID: <20230902223128.3580256-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693693890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=22OxQ16TK8VRIGHGDXOmNqSLlafaRo70sZ9kZX/iEm0=;
 b=meOYzr0OeDwN2XejKvkvRzMtuUxgvLkUMQrHsg3WrG0qjTXM328s0isXQhmAD87FVwXhLF
 +X3en650DMAuCmnf1cVAxQucq5iX48Nub97pXrGSVg9pP3m+CRHiFM0ES8A81VXhdod9Vp
 SmJ9Xeqyo3n65KYE6NBZae9e4xS0GYWpezAdyoklQ1b3hf8HNKdEJ5Fi0+nzlIObiEr1mi
 02olHuWKLT2E7jJmv/vF5GqRGuXFnlxdnp2/neq7mBR0v1bSHdJcvB+fpWAgja7nwlVj+W
 Qe086wff6IH6RRFsaKt93CHktlXAutLZ2MxoAEMpch3MmpMaPDeMlTjAeY9E+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=meOYzr0O
Subject: [Buildroot] [PATCH] package/python-tornado: backport fix for
 CVE-2023-28370
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...n-open-redirect-in-StaticFileHandler.patch | 42 +++++++++++++++++++
 package/python-tornado/python-tornado.mk      |  2 +
 2 files changed, 44 insertions(+)
 create mode 100644 package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch

diff --git a/package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch b/package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch
new file mode 100644
index 0000000000..357c6f2f12
--- /dev/null
+++ b/package/python-tornado/0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch
@@ -0,0 +1,42 @@
+From ac79778c91bd9a4a92111f7e06d4b12674571113 Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Sat, 13 May 2023 20:58:52 -0400
+Subject: [PATCH] web: Fix an open redirect in StaticFileHandler
+
+Under some configurations the default_filename redirect could be exploited
+to redirect to an attacker-controlled site. This change refuses to redirect
+to URLs that could be misinterpreted.
+
+A test case for the specific vulnerable configuration will follow after the
+patch has been available.
+
+Upstream: https://github.com/tornadoweb/tornado/commit/32ad07c54e607839273b4e1819c347f5c8976b2f
+[Thomas: backported to fix CVE-2023-28370]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ tornado/web.py | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/tornado/web.py b/tornado/web.py
+index cd6a81b4..05b571eb 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -2806,6 +2806,15 @@ class StaticFileHandler(RequestHandler):
+             # but there is some prefix to the path that was already
+             # trimmed by the routing
+             if not self.request.path.endswith("/"):
++                if self.request.path.startswith("//"):
++                    # A redirect with two initial slashes is a "protocol-relative" URL.
++                    # This means the next path segment is treated as a hostname instead
++                    # of a part of the path, making this effectively an open redirect.
++                    # Reject paths starting with two slashes to prevent this.
++                    # This is only reachable under certain configurations.
++                    raise HTTPError(
++                        403, "cannot redirect path with two initial slashes"
++                    )
+                 self.redirect(self.request.path + "/", permanent=True)
+                 return None
+             absolute_path = os.path.join(absolute_path, self.default_filename)
+-- 
+2.41.0
+
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 2af86ecb18..f4a4c97d2a 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -12,5 +12,7 @@ PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
 PYTHON_TORNADO_CPE_ID_PRODUCT = tornado
 PYTHON_TORNADO_SETUP_TYPE = setuptools
+# 0001-web-Fix-an-open-redirect-in-StaticFileHandler.patch
+PYTHON_TORNADO_IGNORE_CVES += CVE-2023-28370
 
 $(eval $(python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
