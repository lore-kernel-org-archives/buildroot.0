Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8005CC6B1A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 18:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43079606CB;
	Wed, 14 Oct 2026 18:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNyW7dpcCKFz; Wed, 14 Oct 2026 18:05:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 557D160811
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792001132;
	b=K/RKPkNCuJoV+H7ezsKrK2tc+ewaQ5AY+pGzZkG2jyNRdysJ03cW2igH/8Qu0XKVhL0U
	 W/Pw/Se6COaawhnu4s7G0oagOl3WSo6wrEzAxcv0TAFqpiT8DHtL1CPs1JqSCRNt/lsCo
	 ahl9w+AaEK7lbaE1XAUZLxgRDvR6jFtHTOzpYeuOWN6lfyvEvafvj/SOdfOaQAHL2krRZ
	 qFGBYshrJtF+ytEWp7DzUuUgpkP7KyrftVL6+cgTEvj+hrjCAXqrEFJM25PZKmCFdmXXx
	 2+BIQgD5Fi37WeRQEV9VKS5gPXzqVpIw965SDU4/j9AWWv5JCaituZN6dnTpl8Q6ObA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792001132;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hugvNol7a9emEb/MDvLCNbgpB/25nkAJiBkjJtkYv1s=;
	b=oH+2T/6K4bg/qMQFwDyIB1yQLPh/wez+fM9g7L5CLtyYS5Q+E7MZ7v86TIkR6qlcLxZ7
	 nsCPMWjrdKstwCZNK72NI30QGC/+Q6ppKRmR1QBGDbPQazzR6ymwurMFa6uYl+47iuHFs
	 qKcXkDjGY+7fDHp0WdW4xQmsaVvsvwwtJfzoOfHmpV7Cde9V5qTTb8shSrFMwjGLFQvjZ
	 eSU4neuaQaENEkTJXmPFyFQ6Lhtwgrm27Zjxq5NW3gqx7a5zriJMP2DzX3AiYdVrO/SsK
	 uH186LAHyiw2UGmVDpIX943CxXTG/dqkZVW4L9JY1FjXW5uoMgjqhxV10LhOjncka9A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792001132;
	bh=hugvNol7a9emEb/MDvLCNbgpB/25nkAJiBkjJtkYv1s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rlFSyVt2IAvEUYi0PyAiCrAUtDtFqV6zbGqrGNxcjPXKDL9ePfW80ofyahJ0ujPk9
	 u+hDTIevR0a87t8VbP6Dk93xf+6TZ6SGaR4XHcv4IutBqviHMvOEt+Zz4FdLoH8W6M
	 C30e/uQV7tf21UAYRvV9jw6rPqEcG97MTEKaT1OzLSOznMWZl2Y9/YQbqwdVNYy2HS
	 Tz652Z73sSavWo6M5MsK/rEyJ9/hs0XRm778Ia9e8/LXk5Ekq7FXFY7OueoZKR8QxP
	 Js/aVS0fBZaozrl5a+seik1bX5gcLCilEfMM1FnzWTg1gsSe6/Nc6AeAeNIHi5W2Z5
	 H+bKJtnIPsaaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 557D160811;
	Wed, 14 Oct 2026 18:05:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2F564DD
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 18:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 986B84061F
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 18:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhzfRKNy0dK6 for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 18:05:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6B60E40619
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792001129;
 b=PD2bvIU7wBBNN1vO5nCcL7IlFj6AzGDRbAI47ZtE0hVD21BFwDX4LPlBSXupxBSrjx35
 XcJx9kelv9POnHAtWL+GnLECrV+hOTwfpo5FJmgx+QkpFgzDqz8exUSPWnIyWk4BmF7iU
 FHpQnWMFwNAviOoBQM9vTG4ZBWDYLCoqlr//WzSLmHjzn0fETs7tkmfYIO/iTEfZ42hiC
 WY4yJrTcLRCEL5QsYEtyeZD1LVXMzC10pijGB4LPMhNbnmFPpdc64wsKNQPPl3QBV8u6y
 qhRH8ZWQYJ0L/TmZ0higBMfbal0LOr5aE4Rg4YuU3ONzj/gLR7pbKul5VzeAW/FcPcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792001129;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TEcMCc8UZ+rgJCR1Y+4Q/97zZt8GhzBCuMZ1j38EOdM=;
 b=cdZFItulHQdPeobsCKG5M8Rk/f89r6dpNMqw2Q/q4qgAethyXgPLVHqhK2HXVps0v0+m
 ngXnxaSNhhJdMMz4EpckHGeUtz9J5HU4fqZOVlXMnUURCy2bv+ose5Qg9lk7m4mGsTT+8
 RyD+1LDbErF3u+pOWcQF7e8/r2O09J2zQU43mMqQoaYx7qf5b6XdOyvmxSS4FvEOjnDlY
 RzfE2XU9srk2NUbBtRo16reiz0aaZ1Z1Ma89nCoT2LYtpmNIPWLcRYr3l3ZeJ+2YXmMqQ
 0hZmAbBB6uMye/efAc0bE7l+Is6OEiNtduD9AI3Yohm+DuQRLk2Kydv4Mo6bHaxnfTg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B60E40619
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 18:05:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C3F495C53; Wed, 14 Oct 2026 18:04:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Oct 2026 20:04:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: acbcc911b71f93bb7ea9400aa19713f3464c8e69
X-Git-Newrev: 58e72377a0eaa0b76f252c6351d25cf31c25a7ee
X-Patchwork-Hint: ignore
Message-Id: <20261014180409.2C3F495C53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzlib: upstream patch for
 CVE-2026-85091
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/58e72377a0eaa0b76f252c6351d25cf31c25a7ee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This fixes the following vulnerability:

- CVE-2026-85091:
    zlib versions 1.3.1.2 through 1.3.2 contain a heap buffer overflow
    vulnerability in the gz_vacate() function when processing non-blocking
    gzwrite() operations with stale external buffer pointers. Attackers
    can trigger the overflow by calling gzprintf() or gzvprintf() after a
    write stall, causing an unchecked memmove() to write beyond the
    internal input buffer boundary.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-85091
 - https://security-tracker.debian.org/tracker/CVE-2026-85091
 - https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148.patch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 ...ffer-overflow-bug-in-non-blocking-gzwrite.patch | 31 ++++++++++++++++++++++
 package/libzlib/libzlib.mk                         |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch b/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
new file mode 100644
index 0000000000..32aaabcc76
--- /dev/null
+++ b/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
@@ -0,0 +1,31 @@
+From df84af25dc1942490e1d1c899a07619152a46148 Mon Sep 17 00:00:00 2001
+From: Mark Adler <git@madler.net>
+Date: Wed, 16 Sep 2026 16:26:14 -0700
+Subject: [PATCH] Fix buffer overflow bug in non-blocking gzwrite.
+
+This addresses CVE-2026-85091.
+
+Upstream: https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148.patch
+CVE: CVE-2026-85091
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ gzwrite.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/gzwrite.c b/gzwrite.c
+index b217b85ce..512329244 100644
+--- a/gzwrite.c
++++ b/gzwrite.c
+@@ -242,8 +242,11 @@ local z_size_t gz_write(gz_statep state, voidpc buf, z_size_t len) {
+             n -= state->strm.avail_in;
+             state->x.pos += n;
+             len -= n;
+-            if (ret == -1)
++            if (ret == -1) {
++                state->strm.avail_in = 0;
++                state->strm.next_in = state->in;
+                 return state->again ? put - len : 0;
++            }
+         } while (len);
+     }
+ 
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index d71d5d5233..9ce08d7093 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -15,6 +15,8 @@ LIBZLIB_PROVIDES = zlib
 LIBZLIB_CPE_ID_VENDOR = zlib
 LIBZLIB_CPE_ID_PRODUCT = zlib
 
+LIBZLIB_IGNORE_CVES += CVE-2026-85091
+
 # It is not possible to build only a shared version of zlib, so we build both
 # shared and static, unless we only want the static libs, and we eventually
 # selectively remove what we do not want
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
