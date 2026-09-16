Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F18C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E07C76061D;
	Wed, 16 Sep 2026 20:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tl_nAN0Lg1wK; Wed, 16 Sep 2026 20:08:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 06BF960640
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789589295;
	b=dBCUu+6LdKCSDRGOIGiCko394HLb6GEIFtVEy+x5lN5R4u/bVEU2oulJoH7zNCRMJiur
	 ZAyZHzONKZ/N4uLauGPqXJkZ30sH4J54/CAlEYqSg4dw+arNbVweiceO6bc/Em1laR253
	 RDu5oU0ZRPjOsjeos+QG01F/SvvXx35WEG1WKBYRIipUuJkOyhKBbgQj6pcmBVoewqVvb
	 0YZzvSZO6f7DWwzzs1ULmhZsOkcq93pHrkp09W842wd1HePIySlk46nHgcyAEdMzJzaOn
	 RZY5mF0Q1wPaxN+RyVuKo5MfpA4FdHM+eks2ik6sOLdIPw4DdFZQsDm08RxCgud1sJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789589295;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2L8pib34BqK2n8xhI/OAvVE+8yTgS0xg5ghrAccXkeE=;
	b=sLJsJpCkWStJiJooPa0ytldb/rymHyWUi43FWGbYoABJ417d7Kw5kcJgZL7DPl96t5zp
	 B087wItYc5uXFePtwbd6AT29uH6Sy4V3aDNnzJ9Q1i2wD5g+zOCNttMpZN9+HYZsf/QLb
	 dx5LkkA3VSsQt63PmVgACVX4v28ciAzjwjn4mUGB7VVlNPtNaQlzztwv2n8fsOElLkG9j
	 Qr9n0xbX5CeTYnW+Zxoy/KbLE6BDc9cGDSVto7PeMt/gponButx+bH+ku5bj+pDjksvTA
	 GfNAX2p24F47N6mqyy8ktBY9AcJFj812rpD3b/76Q7ZzWe2mU5fLanNZI+2DjpN2ZYw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789589295;
	bh=2L8pib34BqK2n8xhI/OAvVE+8yTgS0xg5ghrAccXkeE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EEQNmvbfxfKH8IQYupvSzPskDf0BPecoj4fa7ZiEQN8cQxDKLdyQxwLdcItsM3gC4
	 jcc0sgTgXwYNXGhx/0lT7AYJeArgGPwbZkBk+TBof0bzQDNiLaYLd8tEc6/DCf7CBA
	 ogLNcPrQIX5GvaBD+07IU0Y1b3zMg9GBnrxYimy4VCoM/MHYj6ifyqTP93j1AcOvsl
	 kAGEDLGn0ptz4zVwjarbmdve9Fz/V0/x+8Gko0FT4EDqBklLtH5bn4vXCYYsAqKH6d
	 U+/aUy4FH9cyPQ/bh7RPxT2RJd+23dcOLTsaCoPNro+v4IuVKKCBeFBvvWxrU5xMGD
	 p9VVzbywYI3Rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06BF960640;
	Wed, 16 Sep 2026 20:08:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E29F493
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DEEE400F9
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gw29tQ1FUIZV for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:08:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7CB2D400B0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789589291;
 b=GghyUifUfkQ5C56sjviENm1pUY0EXFy137R5mYonhesM5gQDNz9DXLafHvykqosHLuco
 VV8A2O2pQlF8yVNrkMnCEinUqIXstNs21m6xc+aT7gKcRYjaMIzR4odmuMdSOC3w17TJf
 VNQqMSAUq7rf6fKlXyY4bUDIbZvd9fhzIjktd+KQO+O7CYEiT2r4hPASYhTe4R/03QHPs
 7PgzW5SK8vxb2rSpGBppuibRToyuNR3DDh3ELZyZCPR4agSIg8hGUtMXVE/yr7/yYWWdZ
 pSIFjW1wzbyHb2nKciahJg+LadesQ7c5C72H5Rgl9BdwDf+I9gjGKR9PYe1ybL0QsFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789589291;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GuL1h+2cE8ogHqjUz1b/yLQ2JwB5kAmwjoxWQgahYtM=;
 b=tZ9OwPGXb8zN5rsHohsmw99lys835v/DPpeB6euu0ku3zIbIYmfCwSS5ipyWxH0BwDpH
 PwWaqjZ2Yz8tA3nKTPJypI3EojFee9Tay+RUPEwSmc7NPw9o3qKZ1+e5FVP4Wb2ixoqoj
 zjEGv3fHs7Co12KAU24+6h69W42Czt3abP80XA9bVUYjDWE7Lj9tkYTcBt8uvONai8iiP
 UNtre7xshXvydxHEOInguSQPUcqYU79raqg3ZPC9pzR/wSFIinSE1xfzTieYZcTeHPZVf
 1fAenanO+TWeLXpmu4SpZkMZY1Kp3cz4OKGPR+IZTwf0Hf+bjYPoOBAsrlXwQkGjHUA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CB2D400B0
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:08:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F216F96A93; Wed, 16 Sep 2026 20:07:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 22:04:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26122fd02e013f9470c5fb97bf964cf2540fb203
X-Git-Newrev: 2d7e810f731bb11fc4c866c52dda1a6e171aa513
X-Patchwork-Hint: ignore
Message-Id: <20260916200704.F216F96A93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-lunix: fix build with gcc >= 15
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2d7e810f731bb11fc4c866c52dda1a6e171aa513
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:

  https://autobuild.buildroot.org/results/7fba1da21af93a7a0431fb9431dc3c8e872a00ac

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-fix-Wincompatible-pointer-types.patch     | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/lua-lunix/0002-fix-Wincompatible-pointer-types.patch b/package/lua-lunix/0002-fix-Wincompatible-pointer-types.patch
new file mode 100644
index 0000000000..910d684b88
--- /dev/null
+++ b/package/lua-lunix/0002-fix-Wincompatible-pointer-types.patch
@@ -0,0 +1,37 @@
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Wed, 9 Sep 2026 20:36:07 +0200
+Subject: [PATCH] fix -Wincompatible-pointer-types
+
+src/unix.c: In function 'unix_sigaction':
+src/unix.c:9721:32: error: assignment to '__sighandler_t' {aka 'void (*)(int)'} from incompatible pointer type 'void (*)(void)' [-Wincompatible-pointer-types]
+ 9791 |                 act.sa_handler = unixL_tosighandler(L, -1);
+      |                                ^
+In file included from src/unix.c:48:
+/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
+   72 | typedef void (*__sighandler_t) (int);
+      |                ^~~~~~~~~~~~~~
+
+note: this warning is enabled by removing -std=gnu99 from CFLAGS
+
+Upstream: https://github.com/wahern/lunix/pull/25
+Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
+---
+ src/unix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lunix-rel-20220331/src/unix.c b/lunix-rel-20220331/src/unix.c
+index 2e0d77a..6d91e51 100644
+--- a/lunix-rel-20220331/src/unix.c
++++ b/lunix-rel-20220331/src/unix.c
+@@ -1278,7 +1278,7 @@ MAYBEUSED static void ts_timersub(struct timespec *r, struct timespec a, struct
+  * manipulated in C as type pointer-to-function. Accordingly, our code
+  * expects lua_touserdata to return pointer-to-pointer-to-function.
+  */
+-typedef void u_sighandler_t();
++typedef void u_sighandler_t(int);
+ 
+ MAYBEUSED static void sa_discard(int signo NOTUSED) {
+ 	return;
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
