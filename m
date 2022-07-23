Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D18C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 029AB422CF;
	Sat, 23 Jul 2022 14:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 029AB422CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tRQ-FreYi0bT; Sat, 23 Jul 2022 14:35:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DBFE416FD;
	Sat, 23 Jul 2022 14:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DBFE416FD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D6121BF955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB71B400AC
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB71B400AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qt1hwwlMpI9E for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:33:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2D2140164
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2D2140164
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E5B84844CB; Sat, 23 Jul 2022 14:19:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 16:32:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc000bd1a64ab03c79725b12a261b3e89469f732
X-Git-Newrev: 47f359a615ae4772ea9d03a5134785aec230c317
X-Patchwork-Hint: ignore
Message-Id: <20220723141949.E5B84844CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/get-developers: implement a -v
 action for DEVELOPERS file validation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47f359a615ae4772ea9d03a5134785aec230c317
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit "45aabcddc5 utils/get-developers: really make it callable from
elsewhere than the toplevel directory" had a unforeseen side-effect:
the fact that check-developers with no arguments used to validate the
syntax of the DEVELOPERS no longer works. Indeed, the
parse_developers() call was moved *after* the check that verifies if
at least one action is passed. Due to this, the check-DEVELOPERS
verification in Gitlab CI, which invokes get-developers without
argument to validate the DEVELOPERS file... no longer does anything
useful.

In order to fix this, we introduce an explicit action in
get-developers to request the validation of the DEVELOPERS file. The
implementation is trivial, as the validation is already done by
calling parse_developers(), but at least now we have an action that
does "nothing", except execute until the validation is done.

This is also much more explicit than "invoke get-developers without
arguments to just do validation".

The initial investigation of the issue was done by Ricardo Martincoski
<ricardo.martincoski@gmail.com> and reported at
https://patchwork.ozlabs.org/project/buildroot/patch/20220528014832.289907-1-ricardo.martincoski@gmail.com/,
but we have chosen to introduce a separate -v option rather than
making the validation part of the existing -c action, which serves a
different purpose.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/developers.txt |  5 +++--
 utils/get-developers       | 10 ++++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/docs/manual/developers.txt b/docs/manual/developers.txt
index 7058d57b20..29846b5650 100644
--- a/docs/manual/developers.txt
+++ b/docs/manual/developers.txt
@@ -45,5 +45,6 @@ the +DEVELOPERS+ file for various tasks:
   list the ones that are not handled by any developer. The purpose of
   this option is to help completing the +DEVELOPERS+ file.
 
-- When using without any arguments, it validates the integrity of the
-  DEVELOPERS file and will note WARNINGS for items that don't match.
+- When using the +-v+ command line option, it validates the integrity
+  of the DEVELOPERS file and will note WARNINGS for items that don't
+  match.
diff --git a/utils/get-developers b/utils/get-developers
index 22accaf181..158867ce3f 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -19,6 +19,8 @@ def parse_args():
                         const=True, help='list files not handled by any developer')
     parser.add_argument('-e', dest='email', action='store_const',
                         const=True, help='only list affected developer email addresses')
+    parser.add_argument('-v', dest='validate', action='store_const',
+                        const=True, help='validate syntax of DEVELOPERS file')
     return parser.parse_args()
 
 
@@ -35,6 +37,8 @@ def __main__():
         action += 1
     if args.check:
         action += 1
+    if args.validate:
+        action += 1
     if len(args.patches) != 0:
         action += 1
     if action > 1:
@@ -48,6 +52,12 @@ def __main__():
     if devs is None:
         sys.exit(1)
 
+    # Validation is done by parse_developers() above and we error out
+    # if the validation didn't work, so if we reach here, it means
+    # validation passed, so we can simply bail out in success.
+    if args.validate:
+        return
+
     # Handle the check action
     if args.check:
         files = getdeveloperlib.check_developers(devs)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
