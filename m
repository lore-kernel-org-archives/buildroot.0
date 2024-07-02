Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BC4C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A539680F1A;
	Tue,  2 Jul 2024 06:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OZvYBj1XdcH; Tue,  2 Jul 2024 06:09:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F77380F26
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F77380F26;
	Tue,  2 Jul 2024 06:09:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFD0C1BF316
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D992A4096D
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5S0wLqkrCLpF for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:09:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 054F140699
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 054F140699
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 054F140699
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:09:25 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 851E34403F7;
 Tue,  2 Jul 2024 09:08:41 +0300 (IDT)
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 09:09:16 +0300
Message-ID: <886d3fd3b90b4f92d332f1eeadbb499996b1bdc0.1719900556.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1719900521;
 bh=wuS/v3VsmiaUw07+U6sTYmEf97n5CVdHI9aPK9CaEfU=;
 h=From:To:Cc:Subject:Date:From;
 b=KBS4a87p9u7N6qY7UCU+B+K1Y1AmBf0R9yBAOgndhkX+/IbdZv2625Kei1CqQ/L/3
 pPoAhVjMCOTaUZKFko1zwz8KLmNdPt74+jbrRq01eK/QtREoDHabvLK1vXrKXJ/5eg
 1SN9pGF3e/V7t8KtljkEjmrbzIqHgbsXYOJDNsULQ9KxbkH4a7mc3cwCjRkFH9jhyh
 r3CTkw710NPEntc6qPOHTn/nC2POoNjDXoD1kChIhnU83HUoJ+fLUmZl9lseI3xizm
 0ITuhzSZl4MBkoWGzITq4Y7T0OMz8gYWAPBg4ZmHFWOT3Wq6KQ4p+xMd6/C7mEIQvV
 6Sm2jnJEBv9dQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=KBS4a87p
Subject: [Buildroot] [PATCH] package/empty: fix patch fuzz
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update patch to apply with fuzz 0.

Modify upstream status information to match current practice.

Fixes:
http://autobuild.buildroot.net/results/dc119fed6ae341bc4b581e64148be414eedf4ef4/
http://autobuild.buildroot.net/results/3daba0971f422f2085bb152c0e97859ab980a9e3/
http://autobuild.buildroot.net/results/8353079e7b8ee8e2d431f99026c93ec3b0bcc239/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .checkpackageignore                      | 1 -
 package/empty/0001-respect-LDFLAGS.patch | 7 +++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a122f74bb8ce..949b7467cfe6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -571,7 +571,6 @@ package/elftosb/0001-fixes-includes.patch lib_patch.Upstream
 package/elftosb/0002-force-cxx-compiler.patch lib_patch.Upstream
 package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch lib_patch.Upstream
 package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch lib_patch.Upstream
-package/empty/0001-respect-LDFLAGS.patch lib_patch.Upstream
 package/erlang-p1-sip/0001-correct-include.patch lib_patch.Upstream
 package/erlang-p1-xmpp/0001-fix-includes.patch lib_patch.Upstream
 package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch lib_patch.Upstream
diff --git a/package/empty/0001-respect-LDFLAGS.patch b/package/empty/0001-respect-LDFLAGS.patch
index b98af07eac84..64e8b5ca30a2 100644
--- a/package/empty/0001-respect-LDFLAGS.patch
+++ b/package/empty/0001-respect-LDFLAGS.patch
@@ -4,15 +4,14 @@ http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/app-misc/empty/files/emp
 Reported on the Gentoo bug tracker
 https://bugs.gentoo.org/show_bug.cgi?id=429664
 
-and reported upstream
-https://sourceforge.net/tracker/?func=detail&aid=3554236&group_id=136798&atid=736886
+Upstream: https://sourceforge.net/tracker/?func=detail&aid=3554236&group_id=136798&atid=736886
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 --- empty-0.6.18b/Makefile
 +++ empty-0.6.18b/Makefile
-@@ -16,7 +16,7 @@
- PREFIX = /usr/local
+@@ -22,7 +22,7 @@
+ UnixWare-gcc OpenUNIX-gcc HP-UX-gcc SunOS-gcc
  
  all:
 -	${CC} ${CFLAGS} -Wall ${LIBS} -o empty empty.c
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
