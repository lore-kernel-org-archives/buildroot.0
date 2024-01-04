Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F76CC47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A6456F4B9;
	Thu,  4 Jan 2024 21:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A6456F4B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EN1rTzEPsvBn; Thu,  4 Jan 2024 21:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D0E161B2F;
	Thu,  4 Jan 2024 21:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D0E161B2F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B3AA1BF414
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0468861B2F
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0468861B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GWCLIWuQ0cd for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:29:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 057A261B3B
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 057A261B3B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D807A840C2; Thu,  4 Jan 2024 21:29:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 4 Jan 2024 22:27:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd9eaf192035281aea1972d817a36a4708105e62
X-Git-Newrev: f6cf18303119f5c481a135abaee67867b03d8d54
X-Patchwork-Hint: ignore
Message-Id: <20240104212940.D807A840C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fcft: disable uClibc support
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6cf18303119f5c481a135abaee67867b03d8d54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fcft needs ISO C threads, aka C11 threads, which are different from
POSIX threads, and are available in both glibc and musl, but not in
uClibc-ng.

Add a dependency on glibc or musl, and since both imply threads, drop
the dependency on threads.

Propagate the new dependency to the foot package, and adapt the comments
accordingly.

Fixes:
http://autobuild.buildroot.net/results/1b2dda32a90d7db8117eede09f46d44cffe60993
http://autobuild.buildroot.net/results/5f03bb5c0c107a2b908be974421ae0a032d4dd89
http://autobuild.buildroot.net/results/31a1f022414a8a1888cac4a5cd1761257d0f2196
http://autobuild.buildroot.net/results/4522781e0448b325b54e93bbfb20f8295ea7061d

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr;
  - drop the dependencies on threads, implied by glibc or musl
  - fix dependencies on comments
  - reword the commit log to refer to ICO C threads
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fcft/Config.in | 6 +++---
 package/foot/Config.in | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/fcft/Config.in b/package/fcft/Config.in
index b65515a3f1..5393b95db3 100644
--- a/package/fcft/Config.in
+++ b/package/fcft/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_FCFT
 	bool "fcft"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # C11 threads
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_PIXMAN
@@ -48,5 +48,5 @@ config BR2_PACKAGE_FCFT_SVG_SUPPORT
 
 endif # BR2_PACKAGE_FCFT
 
-comment "fcft needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "fcft needs a glibc or musl toolchain"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/foot/Config.in b/package/foot/Config.in
index 24b3f78821..b0ec2e3926 100644
--- a/package/foot/Config.in
+++ b/package/foot/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_FOOT
 	bool "foot"
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # fcft
 	depends on !BR2_STATIC_LIBS # wayland
-	depends on BR2_TOOLCHAIN_HAS_THREADS # fcft, wayland
 	select BR2_PACKAGE_FCFT
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
@@ -32,5 +32,6 @@ config BR2_PACKAGE_FOOT_THEMES
 
 endif # BR2_PACKAGE_FOOT
 
-comment "foot needs a toolchain w/ dynamic library, threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "foot needs a glibc or musl toolchain w/ dynamic library"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
+		BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
