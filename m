Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E85C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 323C341E78;
	Tue,  6 Feb 2024 10:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 323C341E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tEpEp5jZHXg8; Tue,  6 Feb 2024 10:52:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72E8741E67;
	Tue,  6 Feb 2024 10:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72E8741E67
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF2BB1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93307405C4
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93307405C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mglh7zRpb43G for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:52:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4468F40176
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4468F40176
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28F4C86FAA; Tue,  6 Feb 2024 10:52:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 11:52:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73813c56c8bb3e781376f333125a13048be690b9
X-Git-Newrev: 738fb6dfa48b19f39e4a8df38ac9dcc0b37e0aa4
X-Patchwork-Hint: ignore
Message-Id: <20240206105232.28F4C86FAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: extend makedev syntax section
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

commit: https://git.buildroot.net/buildroot/commit/?id=738fb6dfa48b19f39e4a8df38ac9dcc0b37e0aa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 docs/manual/makedev-syntax.adoc | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/docs/manual/makedev-syntax.adoc b/docs/manual/makedev-syntax.adoc
index d6efb31d42..e63c9233eb 100644
--- a/docs/manual/makedev-syntax.adoc
+++ b/docs/manual/makedev-syntax.adoc
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
