Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E766C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 21:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C9D760681;
	Tue, 23 Jul 2024 21:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38XPUZCIMJcg; Tue, 23 Jul 2024 21:01:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B2D0606BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B2D0606BD;
	Tue, 23 Jul 2024 21:01:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3ABD31BF27E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3562E606BD
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyLgt-iZoYuc for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 21:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D0B960681
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D0B960681
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 21:01:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6473F87104; Tue, 23 Jul 2024 21:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 23:01:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7fbc163cf2eb83db289fdf4615c6d5d8ec5665fb
X-Git-Newrev: fcfc399b1dfca3601a0d5734ad1ceaaf91f9f50f
X-Patchwork-Hint: ignore
Message-Id: <20240723210125.6473F87104@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dvb-apps: fix build with gcc >= 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=fcfc399b1dfca3601a0d5734ad1ceaaf91f9f50f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
