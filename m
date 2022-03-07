Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0570C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 19:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87D2160EDD;
	Mon,  7 Mar 2022 19:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XrGpYqbih4mq; Mon,  7 Mar 2022 19:29:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5E3260E74;
	Mon,  7 Mar 2022 19:29:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DBDD1BF990
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E18A41714
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CYWqht2FgUi9 for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 19:29:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9659E4170F
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 19:29:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0474281D75; Mon,  7 Mar 2022 19:21:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 20:10:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 402d85ef4e3d5161869d5da918ec679a9571c417
X-Git-Newrev: 301b7c3c8120e6bd05872777b6c292ebc8230a27
X-Patchwork-Hint: ignore
Message-Id: <20220307192114.0474281D75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtorrent: fix build with
 libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=301b7c3c8120e6bd05872777b6c292ebc8230a27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure on rtorrent raised on uclibc and musl
since the addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/lib/libtorrent.so: undefined reference to `backtrace_symbols'

Fixes:
 - http://autobuild.buildroot.org/results/6cb4ba56fc0a3a8bd02b246ab9bc82edaa552ad9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtorrent/libtorrent.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
index c8310cab65..b966a72788 100644
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -14,6 +14,11 @@ LIBTORRENT_INSTALL_STAGING = YES
 LIBTORRENT_LICENSE = GPL-2.0
 LIBTORRENT_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+LIBTORRENT_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lexecinfo"
+LIBTORRENT_DEPENDENCIES += libexecinfo
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBTORRENT_CONF_OPTS += --enable-openssl
 LIBTORRENT_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
