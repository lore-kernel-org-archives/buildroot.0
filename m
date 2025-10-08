Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525BCCAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 20:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBB1960FC9;
	Wed,  8 Oct 2025 20:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLs49pxgIAWc; Wed,  8 Oct 2025 20:27:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B28360FC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B28360FC0;
	Wed,  8 Oct 2025 20:27:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED399226
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 20:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D37B660FC0
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 20:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e127zERqH0_r for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 20:27:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32F5E60FBE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32F5E60FBE
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 20:27:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E55286B5C; Wed,  8 Oct 2025 20:27:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Oct 2025 22:16:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3fdce2464744ad1b8a85ee37b6ef830806d81157
X-Git-Newrev: baa05d88cfc9862e60b3f9284e8ff7eeeab54458
X-Patchwork-Hint: ignore
Message-Id: <20251008202753.2E55286B5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/audit/S02auditd: fix path for
 default rules
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=baa05d88cfc9862e60b3f9284e8ff7eeeab54458
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

/etc/audit/audit.rules is the path used by augenrules,
/etc/audit/rules.d/ should be used for snippets to be combined into
that file using augenrules.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/audit/S02auditd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/audit/S02auditd b/package/audit/S02auditd
index 97c43bc66f..a660ca921a 100644
--- a/package/audit/S02auditd
+++ b/package/audit/S02auditd
@@ -28,7 +28,7 @@ start(){
 	status=$?
 	if [ "${status}" -eq 0 ]; then
 		# Load the default rules
-		test -f /etc/audit/rules.d/audit.rules && /usr/sbin/auditctl -R /etc/audit/rules.d/audit.rules >/dev/null
+		test -f /etc/audit/audit.rules && /usr/sbin/auditctl -R /etc/audit/audit.rules >/dev/null
 		echo "OK"
 	else
 		echo "FAIL"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
