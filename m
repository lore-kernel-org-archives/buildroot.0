Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C6FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:20:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5DE960EE2
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5DE960EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E219404CB;
	Mon, 11 Oct 2021 21:20:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0HjElzSXeyou; Mon, 11 Oct 2021 21:20:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E86FD404CE;
	Mon, 11 Oct 2021 21:20:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FC861BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F26980ED4
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yjtdtw_gPLUT for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:20:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 958DD80ED0
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:20:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 51F2195441; Mon, 11 Oct 2021 21:18:03 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 23:03:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c63b00f3922592c285e404165a7ff04c7f316d0f
X-Git-Newrev: e47832c8609ef88b949c5a93ed1810cece7342d1
X-Patchwork-Hint: ignore
Message-Id: <20211011211803.51F2195441@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/audit: Fix type output on log
 folder creation
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
Content-Type: multipart/mixed; boundary="===============6365768617084431481=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6365768617084431481==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e47832c8609ef88b949c5a93ed1810cece7342d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============6365768617084431481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6365768617084431481==--
