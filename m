Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777C6C47074
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 09:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34C4D83A42;
	Sat,  6 Jan 2024 09:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34C4D83A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 726EDPBH-HTV; Sat,  6 Jan 2024 09:57:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9561083F71;
	Sat,  6 Jan 2024 09:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9561083F71
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8741BF360
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDF2142176
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDF2142176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLppQrXuI4Po for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14D8442179
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14D8442179
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0610E81D7B; Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Jan 2024 10:51:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81802e263a12e173e0e1028449d1e1e11b2e5974
X-Git-Newrev: f8332fa63d665d69f6f07524f1b320f589e1f23c
X-Patchwork-Hint: ignore
Message-Id: <20240106095524.0610E81D7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avahi: fix libavahi-client handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8332fa63d665d69f6f07524f1b320f589e1f23c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libavahi-client is built without daemon since bump to version 0.6.32 in
commit 61c056d40bc51f99f8be19b7e77894a5e6565fd6 and
https://github.com/avahi/avahi/commit/54086a11033194e629b6ad7039bcb4fb1628e052

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/avahi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index 2484d8ce5c..728bc4fdd1 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -38,7 +38,7 @@ config BR2_PACKAGE_AVAHI_DAEMON
 # more easily determine if it's available or not.
 config BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT
 	bool
-	default y if BR2_PACKAGE_AVAHI_DAEMON && BR2_PACKAGE_DBUS
+	default y if BR2_PACKAGE_DBUS
 
 config BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
 	bool "libdns_sd compatibility (Bonjour)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
