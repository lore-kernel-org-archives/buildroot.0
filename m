Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EA1C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2123060BF7;
	Sat, 23 Apr 2022 15:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QvaJlKtS9WJl; Sat, 23 Apr 2022 15:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2016060F21;
	Sat, 23 Apr 2022 15:15:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E65BE1BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDCD841A07
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQ1Wih_MYK-Z for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:12:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEECA41A1B
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:12:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A6C8783FD4; Sat, 23 Apr 2022 15:02:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 16:43:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8614ffc07993feca1a3094c1488a11913cb4e87
X-Git-Newrev: dac5873314581786630466741074c1e3af61b2b4
X-Patchwork-Hint: ignore
Message-Id: <20220423150245.A6C8783FD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: disable examples,
 tests and xmlwf
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

commit: https://git.buildroot.net/buildroot/commit/?id=dac5873314581786630466741074c1e3af61b2b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable examples and tests (enabled by default) through
--without-{examples,tests} which are available since version 2.2.7 and
https://github.com/libexpat/libexpat/commit/1fdfd8a1b490f8ac9e7e11896298e41cc210d87d

Also disable xmlwf (a binary that determines if an XML document is
well-formed) through --without-xmlwf which is available since version
2.2.4 and
https://github.com/libexpat/libexpat/commit/9d950527a07783c104aada685384edf3f8f23f8a

This will fix the following build failure on riscv64:

ERROR: reloc type R_RISCV_SET6 unsupported in this context

Fixes:
 - http://autobuild.buildroot.org/results/99890c9c7ebe3266dd533c81352a3cbcf4d3d738

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/expat/expat.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index b29b0e1d26..92a3bfda8e 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -15,8 +15,9 @@ EXPAT_LICENSE_FILES = COPYING
 EXPAT_CPE_ID_VENDOR = libexpat_project
 EXPAT_CPE_ID_PRODUCT = libexpat
 
-EXPAT_CONF_OPTS = --without-docbook
-HOST_EXPAT_CONF_OPTS = --without-docbook
+EXPAT_CONF_OPTS = \
+	--without-docbook --without-examples --without-tests --without-xmlwf
+HOST_EXPAT_CONF_OPTS = --without-docbook --without-examples --without-tests
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
