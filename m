Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA76AC47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64931400CF;
	Sun,  7 Jan 2024 16:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64931400CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IAE38xZrCX1o; Sun,  7 Jan 2024 16:25:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D5FD403E5;
	Sun,  7 Jan 2024 16:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D5FD403E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3ACBA1BF38B
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38074403C4
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38074403C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5e6nC2xtdTvM for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 257A440424
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 257A440424
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 076718459B; Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 12:17:51 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: fe8420c92a2e8028ced743dfa310c8f7dc16b96a
X-Git-Newrev: 81730dc4eaaf5ecaac98b95e043fa9c8a73504f3
X-Patchwork-Hint: ignore
Message-Id: <20240107162342.076718459B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/openssh: select
 linux-pam if refpolicy upstream is selected
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

commit: https://git.buildroot.net/buildroot/commit/?id=81730dc4eaaf5ecaac98b95e043fa9c8a73504f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

linux-pam is required to login via OpenSSH if the upstream refpolicy for
SELinux is enaabled, as linux-pam handles changing user contexts. If a
user wants to make their own policy and use a refpolicy via git, we of course
should let them do so. As such, only select linux-pam if the upstream version
of refpolicy is selected.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2c5a82a29ceb382d53ccb08ffd34a92c142cadbb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 08d3c7d391..a3038ba01f 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENSSH
 	bool "openssh"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LINUX_PAM if BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
