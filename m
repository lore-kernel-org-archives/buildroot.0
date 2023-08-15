Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC305C001B0
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 04:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 444AC40114;
	Tue, 15 Aug 2023 04:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 444AC40114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UxixcKl8xUnz; Tue, 15 Aug 2023 04:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CBBF4020B;
	Tue, 15 Aug 2023 04:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CBBF4020B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31DEA1BF371
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 04:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 073FA4175C
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 04:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 073FA4175C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WJz2J35FiIlw for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 04:06:06 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B4BD41750
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 04:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B4BD41750
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 7CA0535206AA; Tue, 15 Aug 2023 06:06:04 +0200 (CEST)
Date: Tue, 15 Aug 2023 06:06:04 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNr5rFHGHQd11YNe@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1692072364; bh=Z5GnToupyUAJ4EF/xfR/HcixtHgbGrGpmYYpFYOl1/U=;
 h=Date:From:To:Subject:From;
 b=dM2N17mBwA0Z+7lqKVn/SoyHyZpN3FJcW21Ot9Qy8GgZ2BYu0WVoNaqE96YQWVjbc
 fyueCZx5TxlsEaOsyLYo4qfrgUgy3jDnBU+rYP1YNK0yk+iTW9Ms4HfzWAzjlhJFOW
 80Z4e8VAueJkvfA2PwtcAEDu/gehStR5fwNer0xqPuSF0SgJu/400/Rtf4hN96Tleu
 qtuWHp6a6AHL4f3Y4G4fcCgS8MCd3qqNjCMxZ3KPf+DMpvnHD01PokX6eYtBgiYCQC
 GQ5kNfMh4xcdj2t5BLNA5/Fy2yh5rezr7HBZb/UrEJTiXZRR9YSStC0AlxKHqb5NFw
 mbyv5zgNrOiIQ==
Subject: [Buildroot] [PATCH] package/dmraid: fix compile issue with musl
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Musl removed LFS64 alias of lseek in 1.2.4.
Tested wth qemu_mips32r6_malta_defconfig.

No need to backport to older Buildroot releases.

Fixes:
 - http://autobuild.buildroot.net/results/c6f/c6fc3a7f03171cced5a26246d14113c29e641086

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/dmraid/0002-remove-lseek64.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/dmraid/0002-remove-lseek64.patch

diff --git a/package/dmraid/0002-remove-lseek64.patch b/package/dmraid/0002-remove-lseek64.patch
new file mode 100644
index 0000000000..1e6636bf31
--- /dev/null
+++ b/package/dmraid/0002-remove-lseek64.patch
@@ -0,0 +1,19 @@
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: N/A upstream appears dormant
+diff -Nur dmraid.orig/1.0.0.rc16-3/dmraid/lib/misc/file.c dmraid/1.0.0.rc16-3/dmraid/lib/misc/file.c
+--- dmraid.orig/1.0.0.rc16-3/dmraid/lib/misc/file.c	2010-01-11 17:19:29.000000000 +0100
++++ dmraid/1.0.0.rc16-3/dmraid/lib/misc/file.c	2023-08-11 13:18:25.762988533 +0200
+@@ -68,12 +68,7 @@
+ 	if ((fd = open(path, flags, lc->mode)) == -1)
+ 		LOG_ERR(lc, 0, "opening \"%s\"", path);
+ 
+-#ifdef __KLIBC__
+-#define	DMRAID_LSEEK	lseek
+-#else
+-#define	DMRAID_LSEEK	lseek64
+-#endif
+-	if (offset && (o = DMRAID_LSEEK(fd, offset, SEEK_SET)) == (loff_t) - 1)
++	if (offset && (o = lseek(fd, offset, SEEK_SET)) == (loff_t) - 1)
+ 		log_err(lc, "%s: seeking device \"%s\" to %" PRIu64,
+ 			who, path, offset);
+ 	else if (rw->func(fd, buffer, size) != size)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
