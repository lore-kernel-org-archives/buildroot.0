Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94991C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:39:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F26D608FB
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F26D608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 262CA843B0;
	Wed,  4 Aug 2021 00:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yY_wzi-nqhAu; Wed,  4 Aug 2021 00:39:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 644AA843AF;
	Wed,  4 Aug 2021 00:39:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 509971BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26F5740F66
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id skN8uyQzIIlf for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82D4140F6D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DAA2583FBA; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 23:43:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ad042904f45201370b886ef5762ff75a93dc8395
X-Git-Newrev: e43c0509442c746bea305aa2b0a5f7ff5adfd142
X-Patchwork-Hint: ignore
Message-Id: <20210803211018.DAA2583FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/scanpypi: allow
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

commit: https://git.buildroot.net/buildroot/commit/?id=e43c0509442c746bea305aa2b0a5f7ff5adfd142
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
