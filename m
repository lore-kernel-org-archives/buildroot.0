Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4791BCD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 06:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1E266F53A;
	Sat, 30 May 2026 06:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlhwFoC1u-BI; Sat, 30 May 2026 06:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55BBB6F4F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780123899;
	bh=LRhzmmQeUccS666GDjfwGocSkLkGdYDbeESU9RckCGA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fD2HLwQZuxBEQ+6h2CvN+8RRX8WQEECH2aUXXfN4SSeuseyOBFltxNOy1nVc1lVrE
	 e4iEdUzMHhSh526UZwAvzb4JT3wJOjSUt/XCmOpJN1bKCxJyaL25rUFeTRzPT2EOFW
	 XT0Hjuy6GQ8xETVGLf2HkZI5o70EqJiKXOWKy3klt048hZhB+NAnQ2cg4j8E8j8F1W
	 wUQsiuahhSRTFvplP/zKDVpHsV+RUXa9QP2GcmVqUSTqtw8VrsIzOgyJ/ORxCx3MaF
	 FFlv/bG53DWHy7oFKPLdLQq1408/KX74+Zx9umL9/aYtUCvGnWDYfGyY+DPQJCTkxj
	 C8bBsUADZplJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55BBB6F4F2;
	Sat, 30 May 2026 06:51:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D81EBD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 06:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF6B44263D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 06:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aU3EucyWSkj9 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 06:51:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A6EE40346
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A6EE40346
 for <buildroot@buildroot.org>; Sat, 30 May 2026 06:51:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 246AE835D9; Sat, 30 May 2026 06:51:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 08:41:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7811063db22404cd020ec6ba558247a8cb6d0eb7
X-Git-Newrev: 64cb69f1559bc56761c17045fef9b55838a2cbca
X-Patchwork-Hint: ignore
Message-Id: <20260530065125.246AE835D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies/dependencies.sh:
 reject buggy uutils install
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/64cb69f1559bc56761c17045fef9b55838a2cbca
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

uutils install 0.8.0 as used in Ubuntu 26.04 has a bug in the install
applet, breaking a number of packages:

https://github.com/uutils/coreutils/pull/11505
https://bugs.launchpad.net/ubuntu/+source/rust-coreutils/+bug/2151454

The fix has been merged upstream but not yet released or packaged in Ubuntu,
so detect and reject the buggy version and explain how to change to the
coreutils version. Once fixed the version output will hopefully change.

For simplicity, only check for the exact 0.8.0 version string. Hopefully
when it is fixed in Ubuntu, they also update the version string. Note
that earlier versions of uutils have the same issue of course, but those
versions were never the default "install" on Ubuntu (or anywhere else).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 support/dependencies/dependencies.sh | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 9c2aeaf23f..8e97f0912d 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -190,6 +190,17 @@ if test "${missing_progs}" = "yes" ; then
 	exit 1
 fi
 
+INSTALL_VERSION="$(install --version | sed -n 's/^install \(.*\)/\1/p')"
+if [ "${INSTALL_VERSION}" = "(uutils coreutils) 0.8.0" ]; then
+	echo
+	echo "You have an uutils 'install' version installed which is affected by:"
+	echo "  https://github.com/uutils/coreutils/issues/12166"
+	echo
+	echo "Please change to coreutils install with:"
+	echo "update-alternatives --install /usr/bin/install install /usr/bin/gnuinstall 100"
+	exit 1
+fi
+
 PATCH_VERSION="$(patch -v 2>/dev/null | sed -n 's/^GNU patch \(.*\)/\1/p')"
 if [ -z "${PATCH_VERSION}" ] ; then
 	echo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
