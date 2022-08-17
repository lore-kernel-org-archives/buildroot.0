Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD9BC25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 19:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ACCB4027F;
	Wed, 17 Aug 2022 19:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ACCB4027F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oV-Qam58lch6; Wed, 17 Aug 2022 19:22:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D17D4020B;
	Wed, 17 Aug 2022 19:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D17D4020B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB22C1BF47E
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 19:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2A8F83295
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 19:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2A8F83295
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Kv0MDqrei7L for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 19:22:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E23EA83281
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 19:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E23EA83281
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6DC9587996; Wed, 17 Aug 2022 19:07:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 21:21:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbfc9f9f67dc410d3b8a331f1b17e403884513f4
X-Git-Newrev: 69400611b2940c2b5cd8bb587b359562eeb95abb
X-Patchwork-Hint: ignore
Message-Id: <20220817190741.6DC9587996@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/scanpypi: restore modules search
 path in case of error
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

commit: https://git.buildroot.net/buildroot/commit/?id=69400611b2940c2b5cd8bb587b359562eeb95abb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We extend the modules search path to be able to load the package
metadata. Currently, it is only restored when loading those
succeeded, not when it failed.

Restore it to its previous state also in case of error, to avoid
leaking the path further.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/scanpypi | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index cc13701c0e..452b4a3fc3 100755
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
