Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC867C3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 12:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96C5540BC7;
	Tue, 16 Jul 2024 12:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJDzRNb-OsF2; Tue, 16 Jul 2024 12:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B0B240BA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B0B240BA7;
	Tue, 16 Jul 2024 12:43:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A48A1BF3E3
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1866F60889
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tM3mYxR8R5Ss for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 12:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B7C2607D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B7C2607D9
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:43:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 462B786BA1; Tue, 16 Jul 2024 12:43:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 14:41:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd5bd455de145f98d858bc30cf84d53aecd31207
X-Git-Newrev: a4a1e36e1a085ce589c112c0ce089bf129633808
X-Patchwork-Hint: ignore
Message-Id: <20240716124308.462B786BA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysklogd: new setting
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4a1e36e1a085ce589c112c0ce089bf129633808
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Expose --with-dns-delay=SEC configure option to fine tune retry interval
to match that of the system resolver.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysklogd/Config.in   | 12 +++++++++++-
 package/sysklogd/sysklogd.mk |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index 3315a6ddc9..c9b9fe8c35 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -15,8 +15,18 @@ config BR2_PACKAGE_SYSKLOGD
 
 if BR2_PACKAGE_SYSKLOGD
 
+config BR2_PACKAGE_SYSKLOGD_DNS_DELAY
+	int "Retry DNS delay (sec)"
+	default "60"
+	help
+	  Retry delay (seconds) for attempting to resolve DNS names of
+	  remote syslog servers.  This is the internal retry delay, not
+	  that of the resolver in your C library or DNS cache.
+
+	  Default: 60 seconds
+
 config BR2_PACKAGE_SYSKLOGD_REMOTE_DELAY
-	int "Retry delay (sec)"
+	int "Retry remote delay (sec)"
 	default "180"
 	help
 	  Retry delay (seconds) for sending to remote syslog servers.
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 7abb830119..59081f2734 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -16,6 +16,7 @@ SYSKLOGD_CPE_ID_VALID = YES
 SYSKLOGD_CONF_OPTS = \
 	--bindir=/usr/bin \
 	--sbindir=/sbin \
+	--with-dns-delay=$(BR2_PACKAGE_SYSKLOGD_DNS_DELAY) \
 	--with-suspend-time=$(BR2_PACKAGE_SYSKLOGD_REMOTE_DELAY)
 
 # Disable/Enable utilities
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
