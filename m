Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F429C77B6E
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 20:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ABBF60AE4;
	Sun,  9 Apr 2023 20:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ABBF60AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZGsxouUjncJE; Sun,  9 Apr 2023 20:59:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B2C760AAC;
	Sun,  9 Apr 2023 20:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B2C760AAC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62C051BF291
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 20:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4963F408BC
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 20:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4963F408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4j5KS3UWnHwF for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 20:59:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37454404A5
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 20:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37454404A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25D6C83C05; Sun,  9 Apr 2023 20:59:19 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Apr 2023 22:56:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47910ccc361934ab4b3fbcfe05530f38de07844f
X-Git-Newrev: 29a0dd4a3006c06d4b8d82821bd74b8b9f26715a
X-Patchwork-Hint: ignore
Message-Id: <20230409205919.25D6C83C05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib: warn about
 $(HOST_DIR)/usr
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

commit: https://git.buildroot.net/buildroot/commit/?id=29a0dd4a3006c06d4b8d82821bd74b8b9f26715a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's been ages (5 years at the next release) that we've not installed
host packages in $(HOST_DIR)/usr, but we still have a few packages that
reference it or install things in there. See [1]

Add a new check_function that warns when a file is added installing to
or referencing $(HOST_DIR)/usr .

[1] "d9ff62c4cd pacakge: drop remnants of $(HOST_DIR)/usr"

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Arnout: exclude skeleton.mk with disable comment instead of explicit
         code]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/skeleton/skeleton.mk         |  1 +
 utils/checkpackagelib/lib_mk.py      | 10 ++++++++++
 utils/checkpackagelib/test_lib_mk.py | 23 +++++++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 9d97f02f08..634c76e437 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -14,6 +14,7 @@ SKELETON_ADD_SKELETON_DEPENDENCY = NO
 # We create a compatibility symlink in case a post-build script still
 # uses $(HOST_DIR)/usr
 define HOST_SKELETON_INSTALL_CMDS
+# check-package DoNotInstallToHostdirUsr
 	$(Q)ln -snf . $(HOST_DIR)/usr
 	$(Q)mkdir -p $(HOST_DIR)/lib
 	$(Q)mkdir -p $(HOST_DIR)/include
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 8adf844e9a..d340882971 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -21,6 +21,16 @@ continue_conditional = ["elif", "else"]
 end_conditional = ["endif"]
 
 
+class DoNotInstallToHostdirUsr(_CheckFunction):
+    INSTALL_TO_HOSTDIR_USR = re.compile(r"^[^#].*\$\(HOST_DIR\)/usr")
+
+    def check_line(self, lineno, text):
+        if self.INSTALL_TO_HOSTDIR_USR.match(text.rstrip()):
+            return ["{}:{}: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/"
+                    .format(self.filename, lineno),
+                    text]
+
+
 class Ifdef(_CheckFunction):
     IFDEF = re.compile(r"^\s*(else\s+|)(ifdef|ifndef)\s")
 
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 80a1736b4e..2086237ebb 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -3,6 +3,29 @@ import checkpackagelib.test_util as util
 import checkpackagelib.lib_mk as m
 
 
+DoNotInstallToHostdirUsr = [
+    ('real case',
+     'libapparmor.mk',
+     'LIBAPPARMOR_CONF_OPTS += \\\n'
+     '\t--with-python \\\n'
+     '\tPYTHON=$(HOST_DIR)/usr/bin/python3 \\\n'
+     '\tPYTHON_CONFIG=$(STAGING_DIR)/usr/bin/python3-config \\\n'
+     '\tSWIG=$(SWIG)\n',
+     [['libapparmor.mk:3: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/',
+       '\tPYTHON=$(HOST_DIR)/usr/bin/python3 \\\n']]),
+    ('ignore comment',
+     'any',
+     '# following code do not install to $(HOST_DIR)/usr/\n',
+     []),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', DoNotInstallToHostdirUsr)
+def test_DoNotInstallToHostdirUsr(testname, filename, string, expected):
+    warnings = util.check_file(m.DoNotInstallToHostdirUsr, filename, string)
+    assert warnings == expected
+
+
 Ifdef = [
     ('ignore commented line',
      'any',
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
