Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726B3E63FF9
	for <buildroot@archiver.kernel.org>; Sat,  4 Apr 2026 21:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 798E440D05;
	Sat,  4 Apr 2026 21:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5EH2ehvi0c2; Sat,  4 Apr 2026 21:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFCDC40A01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775336785;
	bh=ACIVM4Ts0rLOh0XFU01+rJ/9uzBENJg48rPOdyTII/s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=omQPmH0zQGUGEwDuMHxEBPo2houGArk8BA2uNjS0PHu7Ai2RhVMhSPwRDShLPwoUf
	 SySHq7WHum9Ps0MZLO4rTuKPbE6iA+TtU20NnDJQ2m4z/UpS4anE1dcnqi625lJK+a
	 4UqctdAlPc45nEnW4pqEpyQ38zsH2T2VfDwSqfYoxWRugPav5O9GVifHwVRvfWaxf2
	 P7IzvcRPOJiePcYT/K1dtLGA8T6/Gk+3hp78r7fMy/ETU98/clrTeSmgxqQRjgnupz
	 ToECPRPHJ9QHhfRcaQppa8TBdekCHK+AMUfkX//yhKfHFRNpx2u3zxuTyZLNQpe2eM
	 x75FpdmARJgYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFCDC40A01;
	Sat,  4 Apr 2026 21:06:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C1BCCF2
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 21:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B03246089E
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 21:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lHS76jG9AjK for <buildroot@buildroot.org>;
 Sat,  4 Apr 2026 21:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BB0760877
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BB0760877
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 21:06:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96C08802FD; Sat,  4 Apr 2026 21:06:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Apr 2026 19:37:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f44e9c879ddd791e7b320cf02b5a87cc2785424
X-Git-Newrev: fd017ee7545ffc89cea8ec0c35b96ff94c533276
X-Patchwork-Hint: ignore
Message-Id: <20260404210621.96C08802FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdevd: fix build with glibc >= 2.43
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fd017ee7545ffc89cea8ec0c35b96ff94c533276
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 227378b5930b681c79a13476ae60a98753a98a03 bumped glibc
to 2.43 causing a build error in mdevd:

src/mdevd/mdevd.c: In function 'act_on_event':
src/mdevd/mdevd.c:797:36: error: assignment of read-only location
 '*(const char *)strchr(ud->devname, 10)'
  797 |         *strchr(ud->devname, '\n') = 0 ;

Add upstream commit to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/92b/92b9b307996a44b66dc3f7f7d35dd74816b62480/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Some-libcs-have-a-char-const-strchr.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/mdevd/0001-Some-libcs-have-a-char-const-strchr.patch b/package/mdevd/0001-Some-libcs-have-a-char-const-strchr.patch
new file mode 100644
index 0000000000..f039d34a05
--- /dev/null
+++ b/package/mdevd/0001-Some-libcs-have-a-char-const-strchr.patch
@@ -0,0 +1,29 @@
+From 4594ed03e4ced04cb914c8fccad1ffab41cc4ee5 Mon Sep 17 00:00:00 2001
+From: Laurent Bercot <ska-skaware@skarnet.org>
+Date: Wed, 18 Mar 2026 15:45:17 +0000
+Subject:  Some libcs have a char const *strchr()? need to investigate
+
+Upstream: https://git.skarnet.org/cgi-bin/cgit.cgi/mdevd/commit/?id=4594ed03e4ced04cb914c8fccad1ffab41cc4ee5
+
+[Bernd: removed non-related content of the upstream commit]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/mdevd/mdevd.c |  2 +-
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/mdevd/mdevd.c b/src/mdevd/mdevd.c
+index aecd5a7..7df3aaf 100644
+--- a/src/mdevd/mdevd.c
++++ b/src/mdevd/mdevd.c
+@@ -794,7 +794,7 @@ static inline int act_on_event (struct uevent_s const *event, unsigned int actio
+       if (ud->devname)
+       {
+         ud->devname += 9 ;
+-        *strchr(ud->devname, '\n') = 0 ;
++        *(char *)strchr(ud->devname, '\n') = 0 ;
+       }
+     }
+     if (!ud->devname) ud->devname = basename(ud->sysdevpath) ;
+-- 
+cgit v1.2.3-70-g09d2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
