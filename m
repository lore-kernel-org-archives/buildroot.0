Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43F7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 20:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88FC2843B3;
	Tue, 29 Mar 2022 20:31:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sqKtfetlpFBi; Tue, 29 Mar 2022 20:31:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88400843A9;
	Tue, 29 Mar 2022 20:31:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 337111BF9BA
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2472340BCA
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NMrsFcd3PRW7 for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 20:29:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80AC740165
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 20:29:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3BD3885F89; Tue, 29 Mar 2022 20:20:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 21:46:51 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8909b3739761dce8f67f9f0afdd79757d7839de0
X-Git-Newrev: 0bd54a26cb32187432f56504cd358fb09186c303
X-Patchwork-Hint: ignore
Message-Id: <20220329202022.3BD3885F89@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] fakeroot: Fix segfault on
 ppc64le
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bd54a26cb32187432f56504cd358fb09186c303
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

When generating a filesystem image on a power10 build machine running
Ubuntu, we see a segfault when fakeroot is running chmod.

This has been reported and fixed upstream in Debian in version 1.26-1.2:

 https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=995393#53

Add the same patch to resolve the segfault.

Signed-off-by: Joel Stanley <joel@jms.id.au>
[Arnout: add patch signoff and give proper name (check-package)]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a38c6827dba0a5ccee5504167344ea6bba44e9d9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../fakeroot/0001-fix-prototype-generation.patch   | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/fakeroot/0001-fix-prototype-generation.patch b/package/fakeroot/0001-fix-prototype-generation.patch
new file mode 100644
index 0000000000..960bad2129
--- /dev/null
+++ b/package/fakeroot/0001-fix-prototype-generation.patch
@@ -0,0 +1,61 @@
+Subject: Fix prototype generation for openat
+Author: Christoph Biedl <debian.axhn@manchmal.in-ulm.de>
+Date: 2021-12-30
+Bug-Debian: https://bugs.debian.org/995393
+Forwarded: Yes (implicitely)
+
+    As jrtc27 pointed out in IRC, ppc64el is more strict than other
+    architectures when it comes to va_arg handling:
+
+        it's that ppc64le uses the elfv2 abi, and for variadic calls you
+        must reserve space for a parameter save area
+
+    So enhance wrapawk to create a proper prototype and argument
+    handling although it's specific to the openat call. Also add the
+    missing documentation for the sixth column to wrapfunc.inp.
+
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+
+--- a/wrapawk
++++ b/wrapawk
+@@ -37,7 +37,25 @@
+   argtype=$3;
+   argname=$4;
+   MACRO=$5;
+-  if(MACRO){
++  openat_extra=$6;
++  if(openat_extra){
++    print "  {(void(*))&next_" name ", \"" name "\"},"  > structfile;
++    print "extern " ret " (*next_" name ")" openat_extra ";" > headerfile;
++    print ret " (*next_" name ")" openat_extra "=tmp_" name ";"> deffile;
++
++    print ret " tmp_" name,  openat_extra "{"           > tmpffile;
++    print "  mode_t mode = 0;"                          > tmpffile;
++    print "  if (flags & O_CREAT) {"                    > tmpffile;
++    print "    va_list args;"                           > tmpffile;
++    print "    va_start(args, flags);"                  > tmpffile;
++    print "    mode = va_arg(args, int);"               > tmpffile;
++    print "    va_end(args);"                           > tmpffile;
++    print "  }"                                         > tmpffile;
++    print "  load_library_symbols();"                   > tmpffile;
++    print "  return  next_" name,  argname ";"          > tmpffile;
++    print "}"                                           > tmpffile;
++    print ""                                            > tmpffile;
++  } else if(MACRO){
+     print "  {(void(*))&NEXT_" MACRO "_NOARG, " name "_QUOTE},"  > structfile;
+     print "extern " ret " (*NEXT_" MACRO "_NOARG)" argtype ";" > headerfile;
+     print ret " (*NEXT_" MACRO "_NOARG)" argtype "=TMP_" MACRO ";"> deffile;
+--- a/wrapfunc.inp
++++ b/wrapfunc.inp
+@@ -9,8 +9,10 @@
+ /**/									  */
+ /* each line of this file lists 4 fields, seperated by a ";".		  */
+ /* The first field is the name of the wrapped function, then it's return  */
+-/* value. After that come the function arguments with types, and the last */
++/* value. After that come the function arguments with types, and the fifth */
+ /* field contains the function arguments without types.                   */
++/* A sixth field is a special needed when wrapping the openat syscall.    */
++/* Otherwise it's like the third (function arguments with types).         */
+ /**/
+ 
+ /* __*xstat are used on glibc systems instead of just *xstat. */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
