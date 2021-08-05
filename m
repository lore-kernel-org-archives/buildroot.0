Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC3DC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:16:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 739C661004
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 20:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 739C661004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C1754065B;
	Thu,  5 Aug 2021 20:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GS-OZ6r5IAqB; Thu,  5 Aug 2021 20:16:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85CFB4064B;
	Thu,  5 Aug 2021 20:16:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FDC51C1148
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F05B6065D
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 20:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBkMMPOBoQfY for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 20:15:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D10460600
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 20:15:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C3D058C556; Thu,  5 Aug 2021 20:15:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 22:06:59 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 827fafa7aaa230951296e18e65f06de21df963dd
X-Git-Newrev: caa26c05096602789f35f7608a7ed3662749b8fa
X-Patchwork-Hint: ignore
Message-Id: <20210805201545.C3D058C556@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] utils/scanpypi: allow
 installation of commands without 'main' method
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=caa26c05096602789f35f7608a7ed3662749b8fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

In case the setup.py file of a python package does not directly call the
'setup' method, utils/scanpypi was hoping there be a 'main' function which
would do the work, normally called via a construct like:

    if __name__ == '__main__':
        main()

However, this construct is nonstandard, and there are packages in PyPI which
call 'setup()' directly from the 'if' statement, without a main() method.

But scanpypi does not actually need to make such assumption: when loading
the module, it can decide the name to be '__main__', just as if setup.py
would be loaded interactively.

Additionally, remove some logic seemingly related to the previous trick of
calling 'main'. There should not be a problem in keeping already loaded
modules in sys.modules, as this is the purpose of sys.modules.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e43c0509442c746bea305aa2b0a5f7ff5adfd142)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index fac22d66e8..04c43f9311 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -299,7 +299,7 @@ class BuildrootPackage():
         os.chdir(self.tmp_extract)
         sys.path.insert(0,self.tmp_extract)
         s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
-        setup = imp.load_module('setup', s_file, s_path, s_desc)
+        setup = imp.load_module('__main__', s_file, s_path, s_desc)
         if self.metadata_name in self.setup_args:
             pass
         elif self.metadata_name.replace('_', '-') in self.setup_args:
@@ -309,19 +309,10 @@ class BuildrootPackage():
         try:
             self.setup_metadata = self.setup_args[self.metadata_name]
         except KeyError:
-            # This means setup was not called which most likely mean that it is
-            # called through the if __name__ == '__main__' directive.
-            # In this case, we can only pray that it is called through a
-            # function called main() in setup.py.
-            setup.main()  # Will raise AttributeError if not found
-            self.setup_metadata = self.setup_args[self.metadata_name]
-        # Here we must remove the module the hard way.
-        # We must do this because of a very specific case: if a package calls
-        # setup from the __main__ but does not come with a 'main()' function,
-        # for some reason setup.main() will successfully call the main
-        # function of a previous package...
-        sys.modules.pop('setup', None)
-        del setup
+            # This means setup was not called
+            print('ERROR: Could not determine package metadata for {pkg}.\n'
+                  .format(pkg=self.real_name))
+            raise
         os.chdir(current_dir)
         sys.path.remove(self.tmp_extract)
 
@@ -706,7 +697,7 @@ def main():
                 else:
                     raise
                 continue
-            except AttributeError as error:
+            except (AttributeError, KeyError) as error:
                 print('Error: Could not install package {pkg}: {error}'.format(
                     pkg=package.real_name, error=error))
                 continue
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
