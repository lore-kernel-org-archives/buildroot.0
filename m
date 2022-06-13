Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE422C43334
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 20:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A10B2409C8;
	Mon, 13 Jun 2022 20:24:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rc2Ls3Fle17E; Mon, 13 Jun 2022 20:24:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B49734048F;
	Mon, 13 Jun 2022 20:24:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 910C51BF37C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E39A41638
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FP-u4nwGbLae for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 20:24:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CE96408BA
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 20:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6515986F77; Mon, 13 Jun 2022 20:12:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 21:55:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dcf695206ed3fb61d2828b6e40c91aa7c4c52fe3
X-Git-Newrev: bd396de5ecd0c26be64e3c8fcd6edc9afe8dec1b
X-Patchwork-Hint: ignore
Message-Id: <20220613201202.6515986F77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmediaart: link with -latomic if
 needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd396de5ecd0c26be64e3c8fcd6edc9afe8dec1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with BR2_PACKAGE_LIBMEDIAART_BACKEND_QT
raised since bump to version 1.9.5 in commit
3db4d486d689b4a9d59c8f7637211893b0a1cb1b:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: libmediaart/libmediaart-2.0.so.0.905.0.p/extractqt.cpp.o: in function `std::__atomic_base<int>::operator--()':
/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/sparc-buildroot-linux-uclibc/include/c++/10.3.0/bits/atomic_base.h:334: undefined reference to `__atomic_fetch_sub_4'

Fixes:
 - http://autobuild.buildroot.org/results/39aa4ecd37de774e06f67a6e1c4495dc1f0917b4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libmediaart/libmediaart.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index 77665fd95b..de92cde849 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -24,6 +24,9 @@ else ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_QT),y)
 LIBMEDIAART_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 LIBMEDIAART_DEPENDENCIES += qt5base
 LIBMEDIAART_CONF_OPTS += -Dimage_library=qt5
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBMEDIAART_LDFLAGS += -latomic
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
