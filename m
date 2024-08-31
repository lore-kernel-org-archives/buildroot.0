Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE767CD13DE
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 17:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCA848414B;
	Sat, 31 Aug 2024 17:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flqq5tV0NfhY; Sat, 31 Aug 2024 17:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F3C0840FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F3C0840FA;
	Sat, 31 Aug 2024 17:13:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BECD71BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2F154072F
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ttJihgByYgmv for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 17:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85BFF41982
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85BFF41982
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 17:12:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72D99867D5; Sat, 31 Aug 2024 17:12:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 18:58:16 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 6f7d3f3b803820f6f909c32f18bfc64f90072904
X-Git-Newrev: b88bcdc9aa4284bf615076c9de45b9bd576bb517
X-Patchwork-Hint: ignore
Message-Id: <20240831171228.72D99867D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/dvb-apps: fix
 build with gcc >= 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=b88bcdc9aa4284bf615076c9de45b9bd576bb517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Workaround for glibc 2.31 added by commit
bbe170dbcf4ddb63e76299214e2c18b16e5cf016 back in 2020 is incorrect as it
writes new_time (a pointer on time_t) into timespec.tv_sec (i.e. time_t).
This mistake raises the following build failure with gcc >= 14:

dvbdate.c: In function 'set_time':
dvbdate.c:313:18: error: assignment to '__time_t' {aka 'long int'} from 'time_t *' {aka 'long int *'} makes integer from pointer without a cast [-Wint-conversion]
  313 |         s.tv_sec = new_time;
      |                  ^

It shall be noted that gentoo also spotted this mistake:
https://gitweb.gentoo.org/repo/gentoo.git/commit/media-tv/linuxtv-dvb-apps/files?id=81e99f1c753d1cb564be29b22dcd8927830c4b9a

Fixes: bbe170dbcf4ddb63e76299214e2c18b16e5cf016
 - http://autobuild.buildroot.org/results/e99b9ebf602d307fbc32f2a367e95177f53a68f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fcfc399b1dfca3601a0d5734ad1ceaaf91f9f50f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dvb-apps/0006-fix-glibc-2.31.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/dvb-apps/0006-fix-glibc-2.31.patch b/package/dvb-apps/0006-fix-glibc-2.31.patch
index 079a24f149..51c03d3e2e 100644
--- a/package/dvb-apps/0006-fix-glibc-2.31.patch
+++ b/package/dvb-apps/0006-fix-glibc-2.31.patch
@@ -4,6 +4,8 @@ as stime func doesn't exists anymore in newer versions of glibc >= 2.31 due
 to obseletion, a replacment with clock_settime is inorder to fix the issue.
 
 Signed-off-by: Dagg Stompler <daggs@gmx.com>
+[Fabrice: fix for gcc >= 14]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 --- a/util/dvbdate/dvbdate.c
 +++ b/util/dvbdate/dvbdate.c
@@ -13,7 +15,7 @@ Signed-off-by: Dagg Stompler <daggs@gmx.com>
  {
 -	if (stime(new_time)) {
 +	struct timespec s = {0};
-+	s.tv_sec = new_time;
++	s.tv_sec = *new_time;
 +
 +	if (clock_settime(CLOCK_REALTIME, &s)) {
  		perror("Unable to set time");
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
