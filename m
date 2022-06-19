Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB64C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 12:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB20760B34;
	Sun, 19 Jun 2022 12:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB20760B34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LU58C42mExLv; Sun, 19 Jun 2022 12:47:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0912960E2E;
	Sun, 19 Jun 2022 12:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0912960E2E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 98ED51BF2E4
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E7E3408A6
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E7E3408A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PefSP4LIxann for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 12:47:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1ED1405A8
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 12:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1ED1405A8
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B14DD87167; Sun, 19 Jun 2022 12:34:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 14:41:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e56904624cfaf148e0f45837cd9d565ef60c260
X-Git-Newrev: ccea032c75a5a7ddbdc5b7b14957b2b4683b94fc
X-Patchwork-Hint: ignore
Message-Id: <20220619123451.B14DD87167@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avahi: fix GNUism in
 S05avahi-setup.sh
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
Content-Type: multipart/mixed; boundary="===============6521085763717490396=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6521085763717490396==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ccea032c75a5a7ddbdc5b7b14957b2b4683b94fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This script uses "chown user.group" instead of the POSIX "chown
user:group".  The first syntax is a deprecated GNU extension.
Since coreutils 9.1, chown started issuing a warning when this syntax is
used¹.

The result is that if both avahi and coreutils are enabled, this message
appears during boot:

chown: warning: '.' should be ':': 'avahi.avahi'

[1] https://git.savannah.gnu.org/cgit/gnulib.git/commit/lib/userspec.c?id=23cca8268d21f5d58ed0209002d5673d0518c426

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/S05avahi-setup.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avahi/S05avahi-setup.sh b/package/avahi/S05avahi-setup.sh
index 90ccbceacc..2f53a192e4 100644
--- a/package/avahi/S05avahi-setup.sh
+++ b/package/avahi/S05avahi-setup.sh
@@ -5,7 +5,7 @@ case "$1" in
 	if [ ! -d /tmp/avahi-autoipd ]; then
 	    rm -rf /tmp/avahi-autoipd
 	    mkdir /tmp/avahi-autoipd
-	    chown avahi.avahi /tmp/avahi-autoipd
+	    chown avahi:avahi /tmp/avahi-autoipd
 	fi
 	;;
     stop) ;;

--===============6521085763717490396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6521085763717490396==--
