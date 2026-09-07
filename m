Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7192C79FA0
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 18:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 537F960662;
	Mon,  7 Sep 2026 18:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gAKWiBTnPunQ; Mon,  7 Sep 2026 18:43:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 53B376066D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788806596;
	b=nmleQ44kMDMnHjnr2xDC9cBovSrL+9mY/7etfB/eEqI9ilNybovQiYy0EtwDShmtKZOX
	 UBPdhjC3ByCdyiLqwSWOUeIYQ2kJzc21JD/Z2Q6XHmPpudO7H+SOsH6ZfIsgvJCf8JYsQ
	 8gjDn+GRfmwk9jD9ZmI8kt8WKRx55qqvfAiKzdNXxhpnEOsSo2WdZxbnLAXWGh5LrY0oc
	 /axPdoZcySAN9BPEmaXzgSELi/n5j7IDro+69mSTnGtvdtfux8DPqXcVFbHEW+0hBFDUE
	 a6PB5LHUZCx+tZ/KWYqzbFgvtvp+/b2bszH4txaFVAxhzW8rnNfELPW2MUmFAcWiK0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788806596;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UeZJL8K0sZ4k4/E9x5SwEmQfzeUfIilu49CtEPigFtc=;
	b=jYsvQQiRAaAqZgl0MHUwELVEZ563gFZkOWdcFSEQH5xRh9XvLFX0POYTK/pYh/XhAfTW
	 6MLDqANoeVVQ7Ibm4unxbBN8aaKH58hLsFv/d0yM8Er2vBV3DZCi7jzgx63IY5qIkoOEC
	 segLO4u8Gzq5D5P04y3KQxKCodUwWRCZde42dymVnyuQmu2GmAhuxYakRN49aMu4Ou0A/
	 1TdyEi1wbs3Sj098mX0IbHJ4jA822gXk7p6AjnzrNMzmFfW0JLqG88CINZm/JzQ5vY/ex
	 5nCipRMeJosXUTttyDHvZbq3PEz21RqkbGZHF3sVWtZVA4CuNl/fmfVmuZdEsNM24RQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788806596;
	bh=UeZJL8K0sZ4k4/E9x5SwEmQfzeUfIilu49CtEPigFtc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=baFQq453p/Y9h4XZT7h+GKPX7F5l1XisRe+dN2uRguneinByyJLi2zRf5RJWmo9Sw
	 dhzcXxHSCZHDlGB590gHBVzLqV0zF0lJanxEmh6ivQLv+YWpTVIAchOlC0G1xpFh2s
	 ALhiZBXI7ywpL1ol8nklkgoyIaQ9qNZ70Fy+a596IjVvAAumWmUnRsbwhMs8m8mJc2
	 U0+8vrmpKDj/l9WMotj7Za8LHLq7uWzcHqy9UJsrqjAiDnL2Ag3zs9lRE3OMR0oWsJ
	 CljBdbmNYIwQwpS34iecrHZQgY14CdxhTNLHxStHWaXIoYZ4rItKY4ifAKxORE1qM+
	 NR5m/xUqY8x3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53B376066D;
	Mon,  7 Sep 2026 18:43:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 896679CF
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7009D6066D
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzJYlmpAnclb for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 18:43:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6848C60662
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788806594;
 b=ptJoiNRV2p1nwd8O4DoSKr9TFTncBLnUEQEHpKisHSC3IsDHc+hzyMgP/x8DCHidACCq
 iRmO6UAiV7Fwp2g50+CXXY9zf7AvkVyktfdBO4DmjDsSUlVWLN1TDz9m9d5x4iSQJRevv
 xYAhKXrvZMMHI4xP/EifI3aWEpIcQOctQln2wiAT1uj5NzRCvJRmBoa9jOVcFki8ys7kd
 Zey4tABQiutU+/ff4lo7kuKo8FwOH3WU+90mkHF7+hj2oXWrr1kOdMBhSEK9F0JA0Xa3j
 qP1w7IgqD26JQKltkZ/bmlZHqH3OOqf9glgU2eDBqk2dlzFkFufVdlGXfz9BXWcl6tw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788806594;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LyNISf6i1xzKiZp8LSgcG/pq1moh4v0b5HMBSS9Npvk=;
 b=EXmmG4DGoSdo6O1rnzaV0w8Zxly7W3SH32zfcksR8UROafotlB2FeTV/eZ/7BU2fe6oC
 I+5sHL3ECIboOi8CbdafmPHvRta4oMA4hXK1KN0nHA4fBQ39eOdLWHC6Im755a96EmT3Z
 8Kl1vgFL1ENzYa/tIupCisK9UxHsyYRLhur3jwQllH0rbMzHrcszYw3YwhFjXLMGBot2x
 RAFUkLii67+fNm9wjofXQmdTvgoUbp+KhM8B0yboJrIWK4yqGq9Mtjvidi9Of4+1nmCPE
 8AeJlo9WQpiLRFhgw3sprmPEtT774Yy7uwhUqkmxpgcSwMteZrXDX4eCPIam7Kf+mHQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6848C60662
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:43:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B44B95440; Mon,  7 Sep 2026 18:42:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Sep 2026 20:41:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b69d0b3a9c05d2ad256d9abad14bdbfc656b6d53
X-Git-Newrev: 325912fa2bf2c1698247826dd3756e5ffb5ebf68
X-Patchwork-Hint: ignore
Message-Id: <20260907184212.3B44B95440@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strace: fix build with uclibc
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
Content-Type: multipart/mixed; boundary="===============1202562406690878162=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1202562406690878162==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/325912fa2bf2c1698247826dd3756e5ffb5ebf68
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit a1e25fe7051 ("package/strace: bump version to 7.2") breaks strace
build with uclibc because of missing header. Add a patch to fix that.

Fixes:
https://autobuild.buildroot.org/results/054705652027d990fb1b418ed4a3c129fb0cdfe3/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../strace/0001-defs.h-fix-build-with-uClibc.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/strace/0001-defs.h-fix-build-with-uClibc.patch b/package/strace/0001-defs.h-fix-build-with-uClibc.patch
new file mode 100644
index 0000000000..120121a499
--- /dev/null
+++ b/package/strace/0001-defs.h-fix-build-with-uClibc.patch
@@ -0,0 +1,41 @@
+From 1fd644054b06189871502b3fc02f98d97060125e Mon Sep 17 00:00:00 2001
+Message-ID: <1fd644054b06189871502b3fc02f98d97060125e.1788801670.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Mon, 7 Sep 2026 20:11:51 +0300
+Subject: [PATCH] defs.h: fix build with uClibc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit ee5459531280f ("open: refactor sprint_open_modes64 to support
+multiple xlat tables") added a reference to va_list, but did not add the
+required header. This breaks build with uClibc:
+
+In file included from bjm.c:12:
+defs.h:1060:53: error: unknown type name ‘va_list’
+ 1060 |                                    enum xlat_style, va_list xlats);
+      |                                                     ^~~~~~~
+
+Include stdarg.h to fix the build.
+
+Upstream: https://github.com/strace/strace/pull/420
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ src/defs.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/defs.h b/src/defs.h
+index 91aa32c085fe..3cdae04d19f2 100644
+--- a/src/defs.h
++++ b/src/defs.h
+@@ -24,6 +24,7 @@
+ # include <unistd.h>
+ # include <stdlib.h>
+ # include <stdio.h>
++# include <stdarg.h>
+ /* Open-coding isprint(ch) et al proved more efficient than calling
+  * generalized libc interface. We don't *want* to do non-ASCII anyway.
+  */
+-- 
+2.53.0
+

--===============1202562406690878162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1202562406690878162==--
