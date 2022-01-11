Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92B7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BDB3408FA;
	Tue, 11 Jan 2022 20:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PK4LTAkX_siy; Tue, 11 Jan 2022 20:38:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DB44408EB;
	Tue, 11 Jan 2022 20:38:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A72801BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A081983E60
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yB32EP8RwJ5 for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:38:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2D3E83E5F
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:38:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0A4A681476; Tue, 11 Jan 2022 20:32:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 21:38:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d914839a4ff8c1dd4672b68dac445634cce230f
X-Git-Newrev: 965d19386dfa0659ed0b1668085df1918b020281
X-Patchwork-Hint: ignore
Message-Id: <20220111203235.0A4A681476@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglvnd: needs dynamic library
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

commit: https://git.buildroot.net/buildroot/commit/?id=965d19386dfa0659ed0b1668085df1918b020281
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libglvnd needs dynamic library since the addition of the package in
commit 0378e2e5d9ce9d5676975dfbff501360094fdc1a:

/libglvnd_pthread.a.p/glvnd_pthread.c.o -c ../src/util/glvnd_pthread.c
../src/util/glvnd_pthread.c:33:10: fatal error: dlfcn.h: No such file or directory
   33 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c5e92f0b355c91cdcebe0070499889473996f337

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libglvnd/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libglvnd/Config.in b/package/libglvnd/Config.in
index acf6247e94..2d99be8632 100644
--- a/package/libglvnd/Config.in
+++ b/package/libglvnd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBGLVND
 	bool "libglvnd"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	help
 	  The GL Vendor-Neutral Dispatch library
 
@@ -42,3 +43,6 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "libglvnd" if BR2_PACKAGE_LIBGLVND_DISPATCH_GLES
 
 endif
+
+comment "libglvnd needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
