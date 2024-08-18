Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584D8C5320E
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 07:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C91A0401B1;
	Sun, 18 Aug 2024 07:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAivF6g3MkBg; Sun, 18 Aug 2024 07:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 398B04029B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 398B04029B;
	Sun, 18 Aug 2024 07:29:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B8261BF41A
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48C0A401B1
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRzzi5SAGh0y for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 07:29:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7E8D40129
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7E8D40129
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 07:29:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDF4385F96; Sun, 18 Aug 2024 07:29:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 09:24:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b62f2f7f12a381c2e8d4aeb9562b6dfc87728589
X-Git-Newrev: 4e78b2c8b1109d8a456e426ccf03a02df5f2ee2c
X-Patchwork-Hint: ignore
Message-Id: <20240818072942.DDF4385F96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-huepy: add patch to fix
 LICENSE file installation
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e78b2c8b1109d8a456e426ccf03a02df5f2ee2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
