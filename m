Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B559C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 18:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F84F40176;
	Sat,  4 Nov 2023 18:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F84F40176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xR1XzR8a7c_t; Sat,  4 Nov 2023 18:23:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34B914021C;
	Sat,  4 Nov 2023 18:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34B914021C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72E491BF2A3
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CA3B60BD5
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CA3B60BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LtwdN4Zk5XfM for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 18:23:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9325560BCD
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 18:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9325560BCD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80701866D5; Sat,  4 Nov 2023 18:23:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 19:21:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d58f2677e5a46fc1d73b30ffa276a2a1bae777be
X-Git-Newrev: 2c5a82a29ceb382d53ccb08ffd34a92c142cadbb
X-Patchwork-Hint: ignore
Message-Id: <20231104182317.80701866D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: select linux-pam if
 refpolicy upstream is selected
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c5a82a29ceb382d53ccb08ffd34a92c142cadbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linux-pam is required to login via OpenSSH if the upstream refpolicy for
SELinux is enaabled, as linux-pam handles changing user contexts. If a
user wants to make their own policy and use a refpolicy via git, we of course
should let them do so. As such, only select linux-pam if the upstream version
of refpolicy is selected.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
