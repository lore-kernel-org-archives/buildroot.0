Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEEDC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 585D5822BF;
	Mon, 20 Feb 2023 20:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 585D5822BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 37MfQBVsGucg; Mon, 20 Feb 2023 20:46:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BB24822B5;
	Mon, 20 Feb 2023 20:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BB24822B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40C601BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2792C4192D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2792C4192D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s_nyLrYcry_W for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:46:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15C39418A7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15C39418A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 000F386442; Mon, 20 Feb 2023 20:46:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 21:46:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 474196d6bb410c0a9f5e1c8bb7018594a29a57bb
X-Git-Newrev: d9c146f0a540536c0ad8df7b31a190c117ad1581
X-Patchwork-Hint: ignore
Message-Id: <20230220204653.000F386442@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/modem-manager: needs dynamic
 library
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9c146f0a540536c0ad8df7b31a190c117ad1581
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d769cfc13f6c2544f8bc5b6339d23763319a2383 was incomplete as
plugins/meson.build still unconditionally calls shared_module. So add a
dependency to dynamic library to avoid the following static build
failure raised since bump to version 1.20.2 in commit
b95334b71fbdde0f7621b58ed35fa98df9e0966d:

[238/417] Linking target plugins/libmm-shared-telit.so
FAILED: plugins/libmm-shared-telit.so

Building statically could be enabled back through builtin_plugins as
soon as
https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/commit/1c4da332ee6e0d948f85a63f74cb27e89075c011
lands in a stable release

Fixes:
 - http://autobuild.buildroot.org/results/deb2a752accb021392bb9dc3d06b2b1bf151535c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/modem-manager/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index 8489e6fc86..6990996a86 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_MODEM_MANAGER
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV
@@ -39,6 +40,7 @@ comment "QRTR support needs a toolchain w/ headers >= 4.15"
 
 endif
 
-comment "modemmanager needs a toolchain w/ wchar, threads"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+comment "modemmanager needs a toolchain w/ wchar, threads, dynamic library"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
