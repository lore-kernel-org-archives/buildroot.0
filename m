Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A710C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EA96419D5;
	Fri, 12 Jul 2024 14:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRAx4SbI2z4M; Fri, 12 Jul 2024 14:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1A7F419D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1A7F419D8;
	Fri, 12 Jul 2024 14:13:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 057EF1BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DF77845F5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mW7EHwqjWTTj for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 550BE845FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 550BE845FA
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:13:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41814814FA; Fri, 12 Jul 2024 14:13:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 16:08:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e36efd7ac994ed430bc2430ee0c03d44f0cbbff
X-Git-Newrev: 47976f67fb34fe727543380ea6aa13617cf18aa1
X-Patchwork-Hint: ignore
Message-Id: <20240712141303.41814814FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fail2ban: fix sshd filter with
 OpenSSH 9.8
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47976f67fb34fe727543380ea6aa13617cf18aa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The filter needs to consider the new sshd-session binary, patches
already merged upstream.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...hd-filter-for-openssh-9.8-new-daemon-name.patch | 24 ++++++++++++++++++++++
 ...r.d-sshd.conf-ungroup-unneeded-for-daemon.patch | 24 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch b/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
new file mode 100644
index 0000000000..9841d09240
--- /dev/null
+++ b/package/fail2ban/0002-adjust-sshd-filter-for-openssh-9.8-new-daemon-name.patch
@@ -0,0 +1,24 @@
+From 2fed408c05ac5206b490368d94599869bd6a056d Mon Sep 17 00:00:00 2001
+From: Fabian Dellwing <fabian.dellwing@mbconnectline.de>
+Date: Tue, 2 Jul 2024 07:54:15 +0200
+Subject: [PATCH] Adjust sshd filter for OpenSSH 9.8 new daemon name
+
+Upstream: https://github.com/fail2ban/fail2ban/commit/2fed408c05ac5206b490368d94599869bd6a056d
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ config/filter.d/sshd.conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/filter.d/sshd.conf b/config/filter.d/sshd.conf
+index 1c8a02deb5..a1fd749aed 100644
+--- a/config/filter.d/sshd.conf
++++ b/config/filter.d/sshd.conf
+@@ -16,7 +16,7 @@ before = common.conf
+
+ [DEFAULT]
+
+-_daemon = sshd
++_daemon = (?:sshd(?:-session)?)
+
+ # optional prefix (logged from several ssh versions) like "error: ", "error: PAM: " or "fatal: "
+ __pref = (?:(?:error|fatal): (?:PAM: )?)?
diff --git a/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch b/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch
new file mode 100644
index 0000000000..521d899640
--- /dev/null
+++ b/package/fail2ban/0003-filter.d-sshd.conf-ungroup-unneeded-for-daemon.patch
@@ -0,0 +1,24 @@
+From 50ff131a0fd8f54fdeb14b48353f842ee8ae8c1a Mon Sep 17 00:00:00 2001
+From: "Sergey G. Brester" <serg.brester@sebres.de>
+Date: Wed, 3 Jul 2024 19:35:28 +0200
+Subject: [PATCH] filter.d/sshd.conf: ungroup (unneeded for _daemon)
+
+Upstream: https://github.com/fail2ban/fail2ban/commit/50ff131a0fd8f54fdeb14b48353f842ee8ae8c1a
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ config/filter.d/sshd.conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/filter.d/sshd.conf b/config/filter.d/sshd.conf
+index a1fd749aed..3a84b1ba52 100644
+--- a/config/filter.d/sshd.conf
++++ b/config/filter.d/sshd.conf
+@@ -16,7 +16,7 @@ before = common.conf
+
+ [DEFAULT]
+
+-_daemon = (?:sshd(?:-session)?)
++_daemon = sshd(?:-session)?
+
+ # optional prefix (logged from several ssh versions) like "error: ", "error: PAM: " or "fatal: "
+ __pref = (?:(?:error|fatal): (?:PAM: )?)?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
