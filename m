Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8033C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E7EC4103D;
	Mon, 25 Jul 2022 22:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E7EC4103D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HvhftohuNoZj; Mon, 25 Jul 2022 22:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62E6741030;
	Mon, 25 Jul 2022 22:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62E6741030
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 80A391BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8262D81CC3
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8262D81CC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0I991SBn9tc8 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:29:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87A0E832C6
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87A0E832C6
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 407BC85E6D; Mon, 25 Jul 2022 22:15:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 00:27:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94a657fe4cdd0303b374ba01ba43d2d2b8d6eb8b
X-Git-Newrev: 23a71b7d538b6ff7ae7622a712792a28fde9ddd3
X-Patchwork-Hint: ignore
Message-Id: <20220725221521.407BC85E6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opensc: requires RIPEMD160 in
 openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=23a71b7d538b6ff7ae7622a712792a28fde9ddd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable RIPEMD160 in openssl to avoid the following build failure raised
since the addition of the package in commit
8aaa7ecbce1d10cbcd880c3da5e429988f96176a:

/nvmedata/autobuild/instance-17/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: pkcs11_tool-pkcs11-tool.o: in function `sign_verify_openssl.constprop.0':
pkcs11-tool.c:(.text+0x6b00): undefined reference to `EVP_ripemd160'

Fixes:
 - http://autobuild.buildroot.org/results/6dc5baa2cfb037431b9ede9f2e0c5705957ee3bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/opensc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opensc/Config.in b/package/opensc/Config.in
index fe3dd0836e..6a0329fb39 100644
--- a/package/opensc/Config.in
+++ b/package/opensc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_OPENSC
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_PCSC_LITE
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  OpenSC provides a set of libraries and utilities to work
 	  with smart cards.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
