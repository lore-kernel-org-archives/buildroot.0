Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A42FC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC69F61610;
	Mon, 19 May 2025 10:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46-wVwPY-Who; Mon, 19 May 2025 10:46:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB4996102F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB4996102F;
	Mon, 19 May 2025 10:46:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15993E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66B3041209
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rV3xSwfV9Js for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3956640E17
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3956640E17
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3686F84A21; Mon, 19 May 2025 10:39:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 3 Apr 2025 21:48:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 06803b1eb6f32a9ece4838853c5fe0effd7cb7b9
X-Git-Newrev: 8d3b1781f639c174de3b09e292179f6f81da61f1
X-Patchwork-Hint: ignore
Message-Id: <20250519103947.3686F84A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/download/svn: use 'svn
 info' whith LC_ALL=C
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5909965808727730568=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5909965808727730568==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8d3b1781f639c174de3b09e292179f6f81da61f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
---
 support/download/svn | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/svn b/support/download/svn
index ff33f1fa39..576fd48303 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -81,7 +81,7 @@ done
 # In case there is a redirection (e.g. http -> https), just keep the
 # last line (svn outputs everything on stdout)
 # shellcheck disable=SC2086 # creds may be empty
-date="$( _plain_svn info ${creds} "'${uri}@${rev}'" \
+date="$( LC_ALL=C _plain_svn info ${creds} "'${uri}@${rev}'" \
         |sed -r -e '/^Last Changed Date: /!d; s///'
        )"
 

--===============5909965808727730568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5909965808727730568==--
