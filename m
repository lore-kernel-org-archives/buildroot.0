Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A810DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 15:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 590F58271D;
	Tue, 19 Jul 2022 15:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 590F58271D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XxMTp4UnWlci; Tue, 19 Jul 2022 15:14:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60F82813AE;
	Tue, 19 Jul 2022 15:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60F82813AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 291CD1BF951
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 943864090C
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 943864090C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fRAMs4132L8Q for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 15:12:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9436F40995
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 15:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9436F40995
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9430583D04; Tue, 19 Jul 2022 14:59:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 17:11:10 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 8428f5430bc682efa16b90756853b3429460cbc1
X-Git-Newrev: c18a3e1d56e3644c805c6b43ff6d191ca8167ac9
X-Patchwork-Hint: ignore
Message-Id: <20220719145920.9430583D04@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/avahi: fix GNUism
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
Content-Type: multipart/mixed; boundary="===============8972361434643425385=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8972361434643425385==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c18a3e1d56e3644c805c6b43ff6d191ca8167ac9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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

--===============8972361434643425385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8972361434643425385==--
