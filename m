Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A83C678D5
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 21:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BED056112C;
	Tue,  7 Mar 2023 21:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BED056112C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3cX328QjinS; Tue,  7 Mar 2023 21:19:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBA9C6110E;
	Tue,  7 Mar 2023 21:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBA9C6110E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0D331BF33B
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88A3541746
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88A3541746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F5in_lv2RWa7 for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 21:19:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BDAF41744
 for <buildroot@buildroot.org>; Tue,  7 Mar 2023 21:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BDAF41744
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6663686A17; Tue,  7 Mar 2023 21:19:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Mar 2023 22:13:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d97fe11e59122c65df6216a7767f0b004fbd0dec
X-Git-Newrev: 83e06196ab2193b73b4d7c1decc12bdd654a91e1
X-Patchwork-Hint: ignore
Message-Id: <20230307211929.6663686A17@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-autotools: force cross
 compiling
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

commit: https://git.buildroot.net/buildroot/commit/?id=83e06196ab2193b73b4d7c1decc12bdd654a91e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default autotools enters cross-compiling mode if --build and --host
differ [0]. Depending on the host architecture and how toolchain
providers set the triplet it might be the same. This triggers autotools to
compile and run a program on the host. If it is executable
cross-compiling isn't entered.
As pointed out by the autoconf mailing list [1] one can force cross
compiling.

[0]: https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.71/html_node/Hosts-and-Cross_002dCompilation.html
[1]: https://lists.gnu.org/archive/html/bug-autoconf/2023-03/msg00001.html

Fixes:
 - http://autobuild.buildroot.net/results/6d4/6d4bc520c12313508d0fadee11d5b88c35a3cba9/

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-autotools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 717ff81593..aac80369e0 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -195,6 +195,7 @@ define $(2)_CONFIGURE_CMDS
 		--disable-documentation \
 		--with-xmlto=no \
 		--with-fop=no \
+		cross_compiling=yes \
 		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
 		--enable-ipv6 \
 		$$(NLS_OPTS) \
@@ -229,6 +230,7 @@ define $(2)_CONFIGURE_CMDS
 		--with-xmlto=no \
 		--with-fop=no \
 		--disable-nls \
+		cross_compiling=no \
 		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
 		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
 	)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
