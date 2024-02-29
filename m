Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755ACC54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A071041920;
	Thu, 29 Feb 2024 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9E6CZ6A7SEJW; Thu, 29 Feb 2024 15:58:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06C6541989
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06C6541989;
	Thu, 29 Feb 2024 15:58:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 20C7E1BF25B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0FBD82083
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qHkiHZX0sfhd for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B47081EA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B47081EA9
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:50:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9124587DCE; Thu, 29 Feb 2024 15:50:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:46:38 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f2426d4094ddcc1acb7c95786f0441e9b8c7fd51
X-Git-Newrev: eada744ed0e993fc32e25823b102c684ede74464
X-Patchwork-Hint: ignore
Message-Id: <20240229155011.9124587DCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] docs/manual: extend
 makedev syntax section
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

commit: https://git.buildroot.net/buildroot/commit/?id=eada744ed0e993fc32e25823b102c684ede74464
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The section of the manual describing the makedev syntax is not
up-to-date with the current features, and does not properly describe
existing ones.

  - extend the list of types with the requirements on the existence of
    the target file or directory; for 'c', 'b', and 'p', the existence
    requirement is inherited from mknod(2):

    ERRORS
        ...
        ENOENT A directory component in pathname does not exist or is a
               dangling symbolic link.

    for the other types, the existence requirements are extracted from
    the source of makedev.c;

  - format the types flags, so they are rendered in monospace;

  - extend the 'mode' description, as it can be set to -1 for 'f', 'd',
    or 'r', so that only the uid and gid are set. This is most useful
    for 'r', where setting the same mode recursively for all the
    sub-directories and files alike does not really make sense; indeed
    in this case, the modes are usually set correctly when the package
    (or rootfs overlay) installs the files, and only the uid and gid are
    interesting to set;

  - extend and update the examples to show-case the -1 mode use-case.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 738fb6dfa48b19f39e4a8df38ac9dcc0b37e0aa4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/makedev-syntax.txt | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index d6efb31d42..e63c9233eb 100644
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -22,14 +22,19 @@ There are a few non-trivial blocks:
 
 - +name+ is the path to the file you want to create/modify
 - +type+ is the type of the file, being one of:
-  * f: a regular file
-  * d: a directory
-  * r: a directory recursively
-  * c: a character device file
-  * b: a block device file
-  * p: a named pipe
+  * `f`: a regular file, which must already exist
+  * `F`: a regular file, which is ignored and not created if missing
+  * `d`: a directory, which is created, as well as its parents, if missing
+  * `r`: a directory recursively, which must already exist
+  * `c`: a character device file, which parent directory must exist
+  * `b`: a block device file, which parent directory must exist
+  * `p`: a named pipe, which parent directory must exist
 - +mode+ are the usual permissions settings (only numerical values
-  are allowed)
+  are allowed);
+  for type `d`, the mode of existing parents is not changed, but the mode
+  of created parents is set;
+  for types `f`, `F`, and `r`, +mode+ can also be set to +-1+ to not
+  change the mode (and only change uid and gid)
 - +uid+ and +gid+ are the UID and GID to set on this file; can be
   either numerical values or actual names
 - +major+ and +minor+ are here for device files, set to +-+ for other
@@ -38,22 +43,22 @@ There are a few non-trivial blocks:
   of files, and can be reduced to a loop, beginning at +start+,
   incrementing its counter by +inc+ until it reaches +count+
 
-Let's say you want to change the permissions of a given file; using
-this syntax, you will need to write:
+Let's say you want to change the ownership and permissions of a given
+file; using this syntax, you will need to write:
 
 ----
 /usr/bin/foo f 755 0 0 - - - - -
 /usr/bin/bar f 755 root root - - - - -
 /data/buz f 644 buz-user buz-group - - - - -
+/data/baz f -1 baz-user baz-group - - - - -
 ----
 
-Alternatively, if you want to change owner/permission of a directory
-recursively, you can write (to set UID to foo, GID to bar and access
-rights to rwxr-x--- for the directory /usr/share/myapp and all files
-and directories below it):
+Alternatively, if you want to change owner of a directory recursively,
+you can write (to set UID to `foo` and GID to `bar` for the directory
+`/usr/share/myapp` and all files and directories below it):
 
 ----
-/usr/share/myapp r 750 foo bar - - - - -
+/usr/share/myapp r -1 foo bar - - - - -
 ----
 
 On the other hand, if you want to create the device file +/dev/hda+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
