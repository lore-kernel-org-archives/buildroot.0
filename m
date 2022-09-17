Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2618BC6FA86
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 08:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE87B401D8;
	Sat, 17 Sep 2022 08:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE87B401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4bV-Bt8z_Un; Sat, 17 Sep 2022 08:15:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA7FA40472;
	Sat, 17 Sep 2022 08:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA7FA40472
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 107661BF82F
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6ECE400C8
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 08:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6ECE400C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vb_Q8Fg9-jDs for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 08:13:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD7C24018F
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 08:13:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD7C24018F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B3D7C83FB2; Sat, 17 Sep 2022 08:13:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 08:45:46 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 06a62ca64ed203c3630f02733636e3c49d28342c
X-Git-Newrev: 131db884ce6f0baeea612d5e9c1a0ba2a64c68c7
X-Patchwork-Hint: ignore
Message-Id: <20220917081344.B3D7C83FB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] utils/scanpypi: restore
 modules search path in case of error
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

commit: https://git.buildroot.net/buildroot/commit/?id=131db884ce6f0baeea612d5e9c1a0ba2a64c68c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

We extend the modules search path to be able to load the package
metadata. Currently, it is only restored when loading those
succeeded, not when it failed.

Restore it to its previous state also in case of error, to avoid
leaking the path further.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 69400611b2940c2b5cd8bb587b359562eeb95abb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 17d8a0017a..724e59f759 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -296,23 +296,25 @@ class BuildrootPackage():
         current_dir = os.getcwd()
         os.chdir(self.tmp_extract)
         sys.path.insert(0, self.tmp_extract)
-        s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
-        imp.load_module('__main__', s_file, s_path, s_desc)
-        if self.metadata_name in self.setup_args:
-            pass
-        elif self.metadata_name.replace('_', '-') in self.setup_args:
-            self.metadata_name = self.metadata_name.replace('_', '-')
-        elif self.metadata_name.replace('-', '_') in self.setup_args:
-            self.metadata_name = self.metadata_name.replace('-', '_')
         try:
-            self.setup_metadata = self.setup_args[self.metadata_name]
-        except KeyError:
-            # This means setup was not called
-            print('ERROR: Could not determine package metadata for {pkg}.\n'
-                  .format(pkg=self.real_name))
-            raise
-        os.chdir(current_dir)
-        sys.path.remove(self.tmp_extract)
+            s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
+            imp.load_module('__main__', s_file, s_path, s_desc)
+            if self.metadata_name in self.setup_args:
+                pass
+            elif self.metadata_name.replace('_', '-') in self.setup_args:
+                self.metadata_name = self.metadata_name.replace('_', '-')
+            elif self.metadata_name.replace('-', '_') in self.setup_args:
+                self.metadata_name = self.metadata_name.replace('-', '_')
+            try:
+                self.setup_metadata = self.setup_args[self.metadata_name]
+            except KeyError:
+                # This means setup was not called
+                print('ERROR: Could not determine package metadata for {pkg}.\n'
+                      .format(pkg=self.real_name))
+                raise
+        finally:
+            os.chdir(current_dir)
+            sys.path.remove(self.tmp_extract)
 
     def get_requirements(self, pkg_folder):
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
