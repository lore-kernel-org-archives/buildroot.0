Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBFCC531DF
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 19:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA39D81094;
	Sat, 17 Aug 2024 19:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpnWuioCgx2P; Sat, 17 Aug 2024 19:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6873810AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6873810AD;
	Sat, 17 Aug 2024 19:37:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B31A1BF4D7
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 19:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49AB8605EF
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 19:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSVkrdLGRu3N for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 19:37:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA54B605EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA54B605EE
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA54B605EE
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 19:37:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 7C0BE40004;
 Sat, 17 Aug 2024 19:37:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 Aug 2024 21:37:32 +0200
Message-ID: <20240817193733.858704-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723923454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VpXjfelRlKP1Ul2Khy9G5tUBjUPFUFW6nbJBPT1Xebc=;
 b=AmQojqQsT70u2Vopcwg21reBd+CInpa9deCb86dE9PUxuXMnG0Ur0jCg8/fIMDGm7yJTt2
 Mb+8ybau9hMi2Y3DElFbtVZ1MuXquiy1SMsfb2TqN6gBpnsriJtS4C9rotKzJRzZ+8Una8
 zYUTde6daNOMiIjq7XTJmpqSajtiimR5lZa7+zIZUADTY0O2q4we0P+fCQduhG8XAfNXBK
 G7jq3AXJ+Ul+WVI4YDiyg1tVwtU7mWZfq/LU5qMmU2Jea+gDljocCSIZ4oJzHI2YDwGQ6H
 j1DzqxTptVxQ3r58CncKR5K3sqY9wwMTBssltZMDYxZn/WJfujK+nXGjRRSWXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AmQojqQs
Subject: [Buildroot] [PATCH] package/python-huepy: add patch to fix LICENSE
 file installation
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The python-huepy has an incorrect data_files statement in its
setup.py, causing the LICENSE file to be installed directly as
$(TARGET_DIR)/LICENSE. This was detected because several packages were
doing this, and the second package doing
it (python-unittest-xml-reporting, fixed separately) was erroring out
when trying to overwrite this already existing file.

This commit fixes the case of python-huepy by adding a patch that has
been submitted upstream.

There are no autobuilder failures related to python-huepy, but this
was detected while fixing
http://autobuild.buildroot.net/results/2c91243b440087bbc7d051d65f553f59d05dd207/
for python-unittest-xml-reporting.

This bug has been in huepy since at least 2018, so this patch can be
backported to previous Buildroot versions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ta_files-installs-LICENSE-to-incorre.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/python-huepy/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch

diff --git a/package/python-huepy/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch b/package/python-huepy/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch
new file mode 100644
index 0000000000..3c50a44377
--- /dev/null
+++ b/package/python-huepy/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch
@@ -0,0 +1,38 @@
+From ee3010004a005bc852e6b9318807f373bd89e901 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 17 Aug 2024 14:10:16 +0200
+Subject: [PATCH] setup.py: drop data_files, installs LICENSE to incorrect
+ place
+
+The data_files statement in the setup() calls installs the LICENSE
+file in the wrong place: in /usr/LICENSE, or even /LICENSE depending
+on the configuration.
+
+So let's drop this, and let setuptools install the LICENSE file
+automatically: since setuptools v56, the license_files attribute is
+automatically assigned to a default value, which includes "LICENSE",
+so there is in fact nothing to do to the get the LICENSE file
+installed at the correct location. See
+https://setuptools.pypa.io/en/latest/history.html#v56-0-0.
+
+Upstream: https://github.com/s0md3v/huepy/pull/42
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ setup.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 8b5a726..bd41f1c 100644
+--- a/setup.py
++++ b/setup.py
+@@ -30,7 +30,6 @@ setup(
+     keywords='hue, color, terminal color, colorama',
+     packages=find_packages(),
+     py_modules=['huepy'],
+-    data_files=[('', ['LICENSE'])],
+     include_package_data=True,
+     classifiers=[
+         'License :: OSI Approved :: GNU General Public License v3 (GPLv3)',
+-- 
+2.46.0
+
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
