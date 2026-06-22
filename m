Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D20CD98F2
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 13:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07E696F7AB;
	Mon, 22 Jun 2026 13:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfhYDzYazxxM; Mon, 22 Jun 2026 13:10:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 355946F7BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782133851;
	bh=zC1Ili7P/dIrsVyX610X9RWbcZzYQ+8lYKPbwrFZw5U=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bxFtt0SPQ2lUDKYVgBzPmh4ANpM7FJUtBFr5N+Z4/ltwymhmBw5I8aIUhDVYDW2Yz
	 IpatpDjrRqKSqar4/l5pscs6WSVxG7pMBY6hMJNg4BGtmNqjugXkChaSrW2zmy3brF
	 5SZDCIsVzIEmbS1gGA41s032rDLpWBMbwhX0sAfjFZh09KJgDHEHdZNJnwh9p+tYsw
	 DPKvKfhriyAr86Ze0lgCzvrgX00iQSZTt13Atxzx62LiWPs5fIAq87ksD2CqUwKhwn
	 s/nUBsgkfGMpOcmbOdZxX+OYplT/E+qtMOTZ/d2Kq6xqds4RqHoEyPCM9KPe0dsZIE
	 xj+66mWC83q2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 355946F7BE;
	Mon, 22 Jun 2026 13:10:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B00FF367
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 13:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95ADF4F03F
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 13:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qXM-9n-oKb16 for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 13:10:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 979BA4EE20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 979BA4EE20
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 979BA4EE20
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 13:10:46 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id beQGwsQBXtpTfbeQGwMjBm; Mon, 22 Jun 2026 15:10:45 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Alexander Dahl <alex@netz39.de>
Date: Mon, 22 Jun 2026 15:01:19 +0200
Message-ID: <20260622130119.90146-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEHRlLK8Gkk436JsoEzq/oUsbXf6Op96rE/OWNx/JzrfhF4IsidJL0SBtOFEPUTfn33loSiQufuCIkxYBsuiFTB2oWZLeX5MsutmIenScr8OapA1zEab
 4VGgMTYzYAY13Epmb4SeMyYnazS3DErc8LGV/9UhZiTsW1AkgyYhTTWXPu1Cgjjt6470arIXpfR+JPGSOGZm3RPtYWxdvp2Ur74rU3A+b9uArY84V7NqWzpN
 e/jp++cT5f8GWJXOcOQb/hGnfqZt2FhyI2ikpoeDUzwm7t/Q9QBs/CJK8MtgkfwUKpyaO82afldE00v1YVBL+w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1782133845; bh=72MUm+6RDjVFUx3o1qqFbgesdt+A6I1Wqe03cpHWVdU=;
 h=From:To:Subject:Date:MIME-Version;
 b=NVRiSvnQvzA1BMe4vS2jFDlepqyVSDY5TyGCnwmAF+PmRB1dfBb2+KygNZTJx76eJ
 6PCcpzABmuQ45ok0BmPgiHXEeWo/Ug7jZWnUwVBtdryxptoHW46RjpTLhhN0EWXPZu
 hc5nfQiPefs8QTQeDHnqBCgfPmocaWifmwmRLvtzgZV6yJZaZcl6nM3ZDhQ5azB9pb
 wH2/ZA357FgSD/sfKlsw9oGNLHrECWMvpZuZyM98j3jfT/Px5H/n1Lt6iQzBVnkujn
 2dRQ9zZxnaP0RovDs1QIXtu0BMkFz/KHgr52dx8ma/w2fT3LyhGjYNVv2OVUZgjMBL
 4vmI+0WetnSsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=NVRiSvnQ
Subject: [Buildroot] [PATCH] package/util-linux: fix CVE-2026-27456
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As mentioned here[1] we require patch[2] to fix CVE-2026-27456.

[1]: https://lore.kernel.org/util-linux/c2fo4x3lcppsj77k564i4qodmon3wagx47qf4mqwjwdtiplupg@jmaqrlzp273h/T/#u
[2]: https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?h=stable/v2.41&id=2dacaf3eea391e3bbf48e7d3ecce02cafe045b6d

Cc: Alexander Dahl <alex@netz39.de>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...at2-RESOLVE_NO_SYMLINKS-for-backing-.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch

diff --git a/package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch b/package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
new file mode 100644
index 0000000000..6d3b41603c
--- /dev/null
+++ b/package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
@@ -0,0 +1,56 @@
+From 2dacaf3eea391e3bbf48e7d3ecce02cafe045b6d Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 27 May 2026 15:15:22 +0200
+Subject: [PATCH] loopdev: use openat2(RESOLVE_NO_SYMLINKS) for backing file
+
+Use ul_open_no_symlinks() instead of open(O_NOFOLLOW) when
+LOOPDEV_FL_NOFOLLOW is set.  O_NOFOLLOW only rejects symlinks at the
+last path component, but TOCTOU attacks swap intermediate components.
+openat2(RESOLVE_NO_SYMLINKS) rejects symlinks at any component.
+
+Upstream: https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?h=stable/v2.41&id=2dacaf3eea391e3bbf48e7d3ecce02cafe045b6d
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 119d23f1e3f55cf10e3c66dab80fc308c9f26456)
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ lib/loopdev.c | 23 ++++++++++++++---------
+ 1 file changed, 14 insertions(+), 9 deletions(-)
+
+diff --git a/lib/loopdev.c b/lib/loopdev.c
+index 76685be70..31377fc9a 100644
+--- a/lib/loopdev.c
++++ b/lib/loopdev.c
+@@ -1412,16 +1412,21 @@ int loopcxt_setup_device(struct loopdev_cxt *lc)
+ 	if (lc->config.info.lo_flags & LO_FLAGS_DIRECT_IO)
+ 		flags |= O_DIRECT;
+ 	if (lc->flags & LOOPDEV_FL_NOFOLLOW)
+-		flags |= O_NOFOLLOW;
+-
+-	if ((file_fd = open(lc->filename, mode | flags)) < 0) {
+-		if (mode != O_RDONLY && (errno == EROFS || errno == EACCES))
+-			file_fd = open(lc->filename, (mode = O_RDONLY) | flags);
++		file_fd = ul_open_no_symlinks(lc->filename, mode | flags, 0);
++	else
++		file_fd = open(lc->filename, mode | flags);
+ 
+-		if (file_fd < 0) {
+-			DBG(SETUP, ul_debugobj(lc, "open backing file failed: %m"));
+-			return -errno;
+-		}
++	if (file_fd < 0 && mode != O_RDONLY
++	    && (errno == EROFS || errno == EACCES)) {
++		mode = O_RDONLY;
++		if (lc->flags & LOOPDEV_FL_NOFOLLOW)
++			file_fd = ul_open_no_symlinks(lc->filename, mode | flags, 0);
++		else
++			file_fd = open(lc->filename, mode | flags);
++	}
++	if (file_fd < 0) {
++		DBG(SETUP, ul_debugobj(lc, "open backing file failed: %m"));
++		return -errno;
+ 	}
+ 	DBG(SETUP, ul_debugobj(lc, "backing file open: OK"));
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
