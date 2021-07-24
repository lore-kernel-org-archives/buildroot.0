Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8DFC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:38:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4E5A60E92
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4E5A60E92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB098606E8;
	Sat, 24 Jul 2021 21:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E4qNi2XsmU1C; Sat, 24 Jul 2021 21:38:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33F46606BE;
	Sat, 24 Jul 2021 21:38:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52EAD1BF2AA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F72E606BE
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:38:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tAp2MN-kNc7p for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:38:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A79D3605F7
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 21:38:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 906728767A; Sat, 24 Jul 2021 21:03:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 23:36:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6418d31bbd7ea062790ed6e79eac644957063bcc
X-Git-Newrev: 90dd1d6178b01f6da3e59e43d0c7efdf984a72d8
X-Patchwork-Hint: ignore
Message-Id: <20210724210333.906728767A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/audit: replace deprecated
 matchpathcon calls from init script
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4797164243878371486=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============4797164243878371486==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=90dd1d6178b01f6da3e59e43d0c7efdf984a72d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch replace matchpathcon calls in the auditd init script by
calls to selabel_lookup. Indeed, matchpathcon is now deprecated, and
this causes warning during the boot process.

Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/audit/S02auditd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/S02auditd b/package/audit/S02auditd
index 2ecf0f1df9..0eef881cee 100644
--- a/package/audit/S02auditd
+++ b/package/audit/S02auditd
@@ -18,9 +18,9 @@ start(){
 
 	# Create dir to store log files in if one doesn't exist. Create
 	# the directory with SELinux permissions if possible
-	command -v matchpathcon >/dev/null 2>&1
+	command -v selabel_lookup >/dev/null 2>&1
 	if [ $? = 0 ]; then
-		mkdir -p /var/log/audit -Z `matchpathcon -n /var/log/audit`
+		mkdir -p /var/log/audit -Z `selabel_lookup -b file -k /var/log/audit`
 	else
 		mkdir -p /var/log/audit
 	fi

--===============4797164243878371486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============4797164243878371486==--
