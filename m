Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421C2C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 20:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C30AD83155;
	Sun,  3 Apr 2022 20:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8d0Vpc9uJYv; Sun,  3 Apr 2022 20:12:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFA5783139;
	Sun,  3 Apr 2022 20:12:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B76A1BF31F
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D06060761
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPNaBScJJ9YY for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 20:12:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97873600B6
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 20:12:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 23688860D1; Sun,  3 Apr 2022 20:02:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Apr 2022 22:12:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 342631bed10f987351a83c9378c94447584a1515
X-Git-Newrev: f6b6e0b68bd2d84a245981583c492c009678c7b0
X-Patchwork-Hint: ignore
Message-Id: <20220403200249.23688860D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fetchmail: fix build with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6b6e0b68bd2d84a245981583c492c009678c7b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl raised since bump to
version 6.4.29 in commit ba6fd52195f2e3d0b04baae40cfe084226824d31 and
https://gitlab.com/fetchmail/fetchmail/-/commit/340d00bf9910ed55163be26435f70baf65a64f9d:

configure: error: fetchmail cannot legally be linked against LibreSSL for lack of GPL2 clause 2b exception. See COPYING.

Fixes:
 - http://autobuild.buildroot.org/results/95ca66091efa0dafb7c4e8e8c7da1f929ef32d76

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fetchmail/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fetchmail/Config.in b/package/fetchmail/Config.in
index a4bf5a7c20..1017df34b2 100644
--- a/package/fetchmail/Config.in
+++ b/package/fetchmail/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_FETCHMAIL
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_CA_CERTIFICATES
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  Fetchmail - the mail-retrieval daemon
 	  Client daemon to move mail from POP and IMAP to your local
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
