Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A48D9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 08:27:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE14D60FDA
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 08:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE14D60FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0651403AE;
	Mon, 18 Oct 2021 08:27:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G8U8vukpIPCd; Mon, 18 Oct 2021 08:27:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDC61402BB;
	Mon, 18 Oct 2021 08:27:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 489821BF2F6
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 08:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37BEE608C7
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 08:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JmPXqy1_uZO2 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 08:27:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A9D1608C5
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 08:27:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5D86286563; Mon, 18 Oct 2021 08:24:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 10:18:53 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 2af1d61f97d59c815a71e2611253c38c0803c026
X-Git-Newrev: 641fde809132f90030ad3d2fb55e65775c802f36
X-Patchwork-Hint: ignore
Message-Id: <20211018082434.5D86286563@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/audit: Fix type
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
Content-Type: multipart/mixed; boundary="===============4725991419850425125=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4725991419850425125==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=641fde809132f90030ad3d2fb55e65775c802f36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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

--===============4725991419850425125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4725991419850425125==--
