Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D082AC52D7D
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 10:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BF31402FD;
	Sat, 17 Aug 2024 10:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aq4AEiao264j; Sat, 17 Aug 2024 10:33:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 358DC403BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 358DC403BD;
	Sat, 17 Aug 2024 10:33:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE6941BF57C
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 10:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A81664013F
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 10:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtZaQVhmqU2j for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 10:33:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79DD7400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79DD7400F9
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79DD7400F9
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 10:33:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 3B6F3E0003;
 Sat, 17 Aug 2024 10:33:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 Aug 2024 12:33:44 +0200
Message-ID: <20240817103345.769361-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723890827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jiTBW8pZiDdvKB7pr8ms234FP2ioM7Ns7ysWq6nb/04=;
 b=E93Iuc76hj8Kf5KyN5Lmpkj6989bsUuXP3QqK17butNtXHF6lLqUD/2rcR4VoQkmF1csdW
 jsjqwsXPkKTTVdN67zfgJqUrt3v+t0UrYNBtsf5nd3rQWUYuXSQ3Y7840ya13PuqPB5xgv
 wZEbZmYjrcaPrxF5mVJ0I2dgH5qSI3VmOS5ogoQ9u0HrsXVu1J3EdFTkxYUMjHRdsa5tZ1
 RTDcYK7H94pUQ+9BNcoWduNvAihVZ6QxUFomUcVXN38ulmrg8uprIP2+tqfC8Zuu9c7ew5
 FJBJPt4Lq7aHAb2qsta30QO2NFFtamHsU6EFU7bXHWYKR7qnEsWKr60iKotR/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E93Iuc76
Subject: [Buildroot] [PATCH] package/python-unittest-xml-reporting: add
 patch to fix LICENSE file installation
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The LICENSE file gets installed directly to the root of $(TARGET_DIR),
which clashes with other packages:

FileExistsError: File already exists: /home/autobuild/autobuild/instance-3/output-1/target/LICENSE

This commit fixes this issue for the python-unittest-xml-reporting
package. Other fixes will be needed for the other patches.

The issue in python-unittest-xml-reporting was introduced in upstream
commit c43427611390fba83ca13fbb5311bd8fece5048f, which first appeared
in v3.1.0. We switched from a pre-3.1.0 version to 3.2.0 in Buildroot
in commit 69ba1562d5bef8d58b430fd7d67d0f3e77acfefc, which was merged
in 2023.02.

Fixes:

  http://autobuild.buildroot.net/results/2c91243b440087bbc7d051d65f553f59d05dd207/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ta_files-installs-LICENSE-to-incorre.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch

diff --git a/package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch b/package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch
new file mode 100644
index 0000000000..4bc005f448
--- /dev/null
+++ b/package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch
@@ -0,0 +1,40 @@
+From 662cd67695c31126d72035a818b0f5f1da5a31ca Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 17 Aug 2024 12:24:28 +0200
+Subject: [PATCH] setup.py: drop data_files, installs LICENSE to incorrect
+ place
+
+As reported in issue
+https://github.com/xmlrunner/unittest-xml-reporting/issues/284, the
+data_files statement in the setup() calls installs the LICENSE file in
+the wrong place: in /usr/LICENSE, or even /LICENSE depending on the
+configuration.
+
+So let's drop this, and let setuptools install the LICENSE file
+automatically: since setuptools v56, the license_files attribute is
+automatically assigned to a default value, which includes "LICENSE",
+so there is in fact nothing to do to the get the LICENSE file
+installed at the correct location. See
+https://setuptools.pypa.io/en/latest/history.html#v56-0-0.
+
+Upstream: https://github.com/xmlrunner/unittest-xml-reporting/pull/287
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ setup.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index c524ed4..afa5925 100755
+--- a/setup.py
++++ b/setup.py
+@@ -27,7 +27,6 @@ setup(
+     description = 'unittest-based test runner with Ant/JUnit like XML reporting.',
+     long_description = long_description,
+     long_description_content_type = 'text/markdown',
+-    data_files = [('', ['LICENSE'])],
+     install_requires = ['lxml'],
+     license = 'BSD',
+     platforms = ['Any'],
+-- 
+2.46.0
+
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
