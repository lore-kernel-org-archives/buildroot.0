Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC76C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 15:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B93B4148B;
	Tue, 19 Jul 2022 15:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B93B4148B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O8KKwZ-W-CP0; Tue, 19 Jul 2022 15:35:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC1B7410B3;
	Tue, 19 Jul 2022 15:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC1B7410B3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8AD741BF9BA
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44BE440936
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44BE440936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QniSdRonJP6p for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 15:34:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22FC4409F9
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 15:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22FC4409F9
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2667183D5A; Tue, 19 Jul 2022 15:20:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 17:10:59 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9363299e19a9b2a257edc0715e9f5b66e7a114d6
X-Git-Newrev: 6ad9faf26a7b339d592329b022589dc56fb828f8
X-Patchwork-Hint: ignore
Message-Id: <20220719152050.2667183D5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/avahi: fix GNUism
 in S05avahi-setup.sh
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
Content-Type: multipart/mixed; boundary="===============4125593804292313403=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4125593804292313403==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6ad9faf26a7b339d592329b022589dc56fb828f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit ccea032c75a5a7ddbdc5b7b14957b2b4683b94fc)
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

--===============4125593804292313403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4125593804292313403==--
