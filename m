Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA419C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 08:27:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC6C60FDA
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 08:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9EC6C60FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61E9A4044C;
	Mon, 18 Oct 2021 08:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sE46kzQbJCK8; Mon, 18 Oct 2021 08:27:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C39CE4043A;
	Mon, 18 Oct 2021 08:27:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6B1E1BF2F6
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 08:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D448E402BB
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 08:27:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7PSnLavQVcQy for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 08:27:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9BDF40119
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 08:27:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 87485864D1; Mon, 18 Oct 2021 08:24:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 10:19:03 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 55c5b57b0293fbae90d1ab93e25573f5c90c1f6c
X-Git-Newrev: d538cef26a1f2f8980c9eb1c2c84a1c99e9e35b9
X-Patchwork-Hint: ignore
Message-Id: <20211018082426.87485864D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/audit: Fix type
 output on log folder creation
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
Content-Type: multipart/mixed; boundary="===============0895867276864440858=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0895867276864440858==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d538cef26a1f2f8980c9eb1c2c84a1c99e9e35b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Testing buildroot 2021.05 I observed that after first
boot I was having the following folders:

/context:
/system_u:object_r:auditd_log_t

The root of this problem turned to be a difference in the
output of $(selabel_lookup -b file -k /var/log/audit) called
by S02auditd that from this version on looks like:

$ selabel_lookup -b file -k /var/log/audit
Default context: system_u:object_r:auditd_log_t

This patch will cut it to retrieve the type piece only. Unfortunately,
audit has no options to create machine-readable output that is
guaranteed not to change, so that's the best we can do.

Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e47832c8609ef88b949c5a93ed1810cece7342d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/audit/S02auditd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/audit/S02auditd b/package/audit/S02auditd
index 0eef881cee..dd3dc22d6d 100644
--- a/package/audit/S02auditd
+++ b/package/audit/S02auditd
@@ -20,7 +20,7 @@ start(){
 	# the directory with SELinux permissions if possible
 	command -v selabel_lookup >/dev/null 2>&1
 	if [ $? = 0 ]; then
-		mkdir -p /var/log/audit -Z `selabel_lookup -b file -k /var/log/audit`
+		mkdir -p /var/log/audit -Z `selabel_lookup -b file -k /var/log/audit | cut -d ' ' -f 3`
 	else
 		mkdir -p /var/log/audit
 	fi

--===============0895867276864440858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0895867276864440858==--
