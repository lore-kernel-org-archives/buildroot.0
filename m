Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC8EC369A8
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 10:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64D8C41E5D;
	Fri, 11 Apr 2025 10:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYhFtqDB11ui; Fri, 11 Apr 2025 10:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6537F41E1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6537F41E1C;
	Fri, 11 Apr 2025 10:45:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 212E1138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03648401DD
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GG8ee7bwgu3W for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 10:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F3C2400DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F3C2400DA
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E9EC843A6; Fri, 11 Apr 2025 10:44:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Apr 2025 12:42:46 +0200
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 0800072403b7ad198e6f346e98592986b50ae7d5
X-Git-Newrev: e2d0b5b9bfbef8a76ccb718d094f710db1ce613d
X-Patchwork-Hint: ignore
Message-Id: <20250411104451.2E9EC843A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] support/download/svn: use
 'svn info' whith LC_ALL=C
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5366667524321673168=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5366667524321673168==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e2d0b5b9bfbef8a76ccb718d094f710db1ce613d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Use the 'C' locale when retrieving the date of the last change using
'svn info' since the svn download helper script expect
"Last Changed Date" string.

If another locale is used, the 'date' is empty so the generated
archive (by mk_tar_gz) will not match the expected hash since
the file timestamp is not set properly.

If LANG=fr_FR.UTF-8 is defined in the host system, svn print some
"French encrypted" text:

  eval svn --non-interactive --config-option servers:global:http-timeout=10 info ''\''https://svn.code.sf.net/p/xmlrpc-c/code/advanced@r3176'\'''
  ...
  Date de la dernière modification: 2023-09-02 19:13:35 +0200 (sam. 02 sept. 2023)

diffoscope confirm that the file timestamp is not set correctly
in the generated archive:

$ diffoscope NOK/libxmlrpc-r3176-svn5.tar.gz OK/libxmlrpc-r3176-svn5.tar.gz

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8d3b1781f639c174de3b09e292179f6f81da61f1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/download/svn | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/svn b/support/download/svn
index 1decb2310b..d7c7a686de 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -79,7 +79,7 @@ done
 # In case there is a redirection (e.g. http -> https), just keep the
 # last line (svn outputs everything on stdout)
 # shellcheck disable=SC2086 # creds may be empty
-date="$( _plain_svn info ${creds} "'${uri}@${rev}'" \
+date="$( LC_ALL=C _plain_svn info ${creds} "'${uri}@${rev}'" \
         |sed -r -e '/^Last Changed Date: /!d; s///'
        )"
 

--===============5366667524321673168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5366667524321673168==--
