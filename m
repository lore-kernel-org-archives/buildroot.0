Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9F5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 13:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5807460D68;
	Sun, 12 Dec 2021 13:46:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1YF0Ap53VX_o; Sun, 12 Dec 2021 13:46:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF26F60757;
	Sun, 12 Dec 2021 13:46:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3F1A1BF36C
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 13:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B114B84F40
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 13:46:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uwB3hF05BM5r for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 13:46:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16CAF84F30
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 13:46:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3DCD982B94; Sun, 12 Dec 2021 13:41:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 14:41:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5778d7b76c098010a4abc339938f2694e8cf57f
X-Git-Newrev: f9287b263f0808c2f0632aa1560d88e39fbf970b
X-Patchwork-Hint: ignore
Message-Id: <20211212134129.3DCD982B94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dmalloc: fix strdup detection
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9287b263f0808c2f0632aa1560d88e39fbf970b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 5.6.5 in
commit 736932c71552adc4dfa95c5236d1064860900e8a:

In file included from /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/string.h:631:0,
                 from arg_check.c:31:
dmalloc.h:377:7: error: expected identifier or '(' before '__extension__'
 char *strdup(const char *string);
       ^

This build failure is raised because 0004-fix-strdup.patch was wrongly
removed and because configure.ac wrongly assumes that strdup macro is
not available when cross-compiling

As configure.ac can't be patched because autoreconf is not working,
patch configure as already done in DMALLOC_POST_PATCH. An upstream patch
on configure.ac will be sent as soon as upstream merges this old PR:
https://github.com/j256/dmalloc/pull/44

Fixes:
 - http://autobuild.buildroot.org/results/00565c4b0618ea5f553d8c22284637b6574e4a93

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dmalloc/dmalloc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 05943943d6..93dc45c15d 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -48,6 +48,7 @@ DMALLOC_CONF_ENV = CFLAGS="$(DMALLOC_CFLAGS)"
 
 define DMALLOC_POST_PATCH
 	$(SED) 's/^ac_cv_page_size=0$$/ac_cv_page_size=12/' $(@D)/configure
+	$(SED) 's/ac_cv_strdup_macro=no$$/ac_cv_strdup_macro=yes/' $(@D)/configure
 	$(SED) 's/(ld -/($${LD-ld} -/' $(@D)/configure
 	$(SED) 's/'\''ld -/"$${LD-ld}"'\'' -/' $(@D)/configure
 	$(SED) 's/ar cr/$$(AR) cr/' $(@D)/Makefile.in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
