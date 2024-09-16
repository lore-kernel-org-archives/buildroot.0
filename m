Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9D4C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E6360AC3;
	Mon, 16 Sep 2024 10:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQQXO1HdauSB; Mon, 16 Sep 2024 10:24:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E3C860AAC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E3C860AAC;
	Mon, 16 Sep 2024 10:24:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F28D71BF95A
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDF84403B4
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KgSIkhlLXEs for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE723403E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE723403E5
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:24:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A70D81364; Mon, 16 Sep 2024 10:24:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 12:22:07 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: daaa353029e88d3ffd16bbc81da002bbf10b346e
X-Git-Newrev: 3eb2c46bc4d943d4f3e118e405ed0d6999836f9b
X-Patchwork-Hint: ignore
Message-Id: <20240916102405.9A70D81364@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python-huepy: add
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3eb2c46bc4d943d4f3e118e405ed0d6999836f9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4e78b2c8b1109d8a456e426ccf03a02df5f2ee2c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...op-data_files-installs-LICENSE-to-incorre.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
