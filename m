Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03910C47DB3
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 16:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89F2A42204;
	Thu, 18 Jan 2024 16:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89F2A42204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2HV7Zort44ou; Thu, 18 Jan 2024 16:16:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B16AC42461;
	Thu, 18 Jan 2024 16:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B16AC42461
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F85F1BF348
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 16:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3479D4051A
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 16:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3479D4051A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1wKEmWzvXAqf for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 16:16:09 +0000 (UTC)
X-Greylist: delayed 435 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 18 Jan 2024 16:16:09 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3287F404B6
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3287F404B6
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 16:16:09 +0000 (UTC)
Received: from unknown (HELO opfedv3rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 17:08:50 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Jan 2024 17:08:52 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 17:08:50 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 18 Jan 2024 17:08:50 +0100
X-IronPort-AV: E=Sophos;i="6.05,203,1701126000"; d="scan'208";a="94042633"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 18 Jan 2024 17:08:50 +0100
Message-ID: <e050e870b2afb35643036a87df540add584c95b4.1705594130.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.52]
X-ClientProxiedBy: OPE16NORMBX407.corporate.adroot.infra.ftgroup
 (10.115.27.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1705594568; x=1737130568;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2BCbay57JXfjDn9Aka2smevH7TAFxKcyn+g8TQo1Inc=;
 b=SZzECj4pyhLJpznM/OkZE+8my8u8/wlNdZvKa56sAWArUgWIYXX0mhfO
 ikgTHIuzvBumKCbAeSuHT76KQlyhVMIXiFfY4EXTVbElDW0z15/OUnChe
 opL6KpzVQv4JPh9hYufdiGLfS9JacM6h/CKQ94ZTBfKiNP6z6sKIqMb10
 0W/oaV5XJC+1LONW0YG+JBZJU6FOv4lTNsRsV1iQecnYmOWwck3I/ZVBi
 neaIn90EKz8vVrko/Xl80AP3ON1C2peEFepvzDHlLAQFWNDZXF15W35xJ
 ix8Ob+seMCNXJN3vYi6X8GPM82rba5PGwTB11hz69iHknvgHjVf8THmCx
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=SZzECj4p
Subject: [Buildroot] [PATCH] docs/manual: extend makedev syntax section
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
Cc: yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

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

  - format the types fags, so they are rendered in monospace;

  - extend the 'mode' description, as it can be set to -1 for 'f', 'd',
    or 'r', so that only the uid and gid are set. This is most useful
    for 'r', where setting the same mode recursively for all the
    sub-directories and files alike does not really make sense; indeed
    in this case, the modes are usually set correctly when the package
    (or rootfs overlay) installs the files, and only the uid and gid are
    interesting to set;

  - extend and update the examples to show-case the -1 mode use-case.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
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
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
