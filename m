Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE301E92725
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 23:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD05D60814;
	Sat, 27 Dec 2025 23:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKKoJKvMPHC8; Sat, 27 Dec 2025 23:40:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A560660812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766878805;
	bh=/pLomgh4Gcz5Z/LUnC3Gy+HvUP6l1qEztlhZ2J0of2k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Rb+SPpfNAtdOlUwGDQDSJpcwCQ/qF1HkqPKF1OxpaBBt3yxZdx+SDcI9wjZZsylzQ
	 rQRIchHlR+kPO1ebTKHdCbSjZdCHiLHInGslfpqYDdFwL8Iwow852uOCjgv5CgFtsk
	 z/zl6QUq0f53zSPAo2y2FM0UthfORtnL5ZFBOxxTy/OkRAjNkRTkt+Eql1CNffW7ek
	 QDqe83kiXZc9rdbPBLo2eBYF55+zs3eJBrXafB9cAfe8UmTuxfg2GiXG9wnQPHJQuJ
	 hN3mqrhvHZdNwl1pRf15tZhcJXGa3PMJCCRIT28U2Hqc57sHyxJauCAOnUePbU6vFB
	 ZqDK2rIXItl0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A560660812;
	Sat, 27 Dec 2025 23:40:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13EB0119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 581A5607BE
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWpxjraJc264 for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BCBC60586
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BCBC60586
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AE928790C; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 00:15:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5bb2902ec53070ac2db82f77f45f1e0fc3ab160
X-Git-Newrev: 2bfdadab434d3f9100b66a783ee317d118b5623c
X-Patchwork-Hint: ignore
Message-Id: <20251227233954.4AE928790C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/matchbox-lib: fix build failure
 with GCC 15.x
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
Content-Type: multipart/mixed; boundary="===============6111830418223333727=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6111830418223333727==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2bfdadab434d3f9100b66a783ee317d118b5623c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport upstream patch fixing:

hash.c:76:6: error: conflicting types for ‘hash_empty’; have ‘void(struct hash *)’
   76 | void hash_empty(struct hash *h)
      |      ^~~~~~~~~~
In file included from hash.c:22:
hash.h:41:6: note: previous declaration of ‘hash_empty’ with type ‘void(void)’
   41 | void hash_empty();
      |      ^~~~~~~~~~

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...2-Define-correct-prototype-for-hash_empty.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/matchbox-lib/0002-Define-correct-prototype-for-hash_empty.patch b/package/matchbox-lib/0002-Define-correct-prototype-for-hash_empty.patch
new file mode 100644
index 0000000000..ac65d03b12
--- /dev/null
+++ b/package/matchbox-lib/0002-Define-correct-prototype-for-hash_empty.patch
@@ -0,0 +1,34 @@
+From 312c04b6ba60dca0d6c4a7d1393f0ec816a265e3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Mar 2025 14:16:03 -0700
+Subject: [PATCH] Define correct prototype for hash_empty()
+
+GCC-15 follows C23 standard which does not allow function
+declarations without parameters and types
+
+Fixes
+
+../../git/libmb/hash.c:76:6: error: conflicting types for 'hash_empty'; have 'void(struct hash *)'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream: https://git.yoctoproject.org/libmatchbox/commit/?id=312c04b6ba60dca0d6c4a7d1393f0ec816a265e3
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ libmb/hash.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libmb/hash.h b/libmb/hash.h
+index 86f18bf..43827b2 100644
+--- a/libmb/hash.h
++++ b/libmb/hash.h
+@@ -38,5 +38,5 @@ struct hash* hash_new(int size);
+ unsigned int hashfunc(struct hash *h, char *s);
+ struct nlist *hash_lookup(struct hash *h, char *s);
+ struct nlist *hash_add(struct hash *h, char *key, char *val);
+-void hash_empty();
++void hash_empty(struct hash *h);
+ void hash_destroy(struct hash *h);
+-- 
+2.52.0
+

--===============6111830418223333727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6111830418223333727==--
