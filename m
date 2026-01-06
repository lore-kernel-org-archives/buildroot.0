Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14266D0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE4704083A;
	Wed,  7 Jan 2026 18:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9qQmPbws3S8; Wed,  7 Jan 2026 18:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAC72414D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808964;
	bh=V3j4Bq9s9DePv85Ys3/MqNHy2HiSfQrLk5ExjE6zcJc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TAn7F9xLhmxKM1Y4sN+4oRHoXFy/7TCjxuaUm27K0OmkziIyP2SsPAKs3avSAcv2t
	 wP5OngGFB61DwCYKonTF6Y5D9kl+6C4vihnwGltZiwjd5yymaFZgFrjDqVzbVs/3b+
	 CfniKIzLPl3Q8KMedoXCtuS/+UMgMw+Mku/xMgTcDMO3qYNMJ6afermcinVL0JXJW9
	 ItUAPknfWeTbVq+w3k3P+3uWtTlhALPpaJmEFMLw4lsLh0wojaE0QrnKthvJZ+Ugj2
	 E7CCO1RyrlI2JHTczDNetew6nElpLeaZ3kFgSJoNOxbzFRPRoHAOgRmDS6bLaP0/cJ
	 lvyIN7vF+o/OQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAC72414D6;
	Wed,  7 Jan 2026 18:02:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0256825B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 116F040A36
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Huormu5a7NzN for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F9FD40A6B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F9FD40A6B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E5F38039B; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:55:33 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 934795b78d383863d7385c0a8c5c03e44e5733e2
X-Git-Newrev: b0bf5cb73a24def1a9fef8c0e7e2561eaaf9c8cb
X-Patchwork-Hint: ignore
Message-Id: <20260107180113.2E5F38039B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/matchbox-lib: fix
 build failure with GCC 15.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3203845632070026326=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3203845632070026326==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b0bf5cb73a24def1a9fef8c0e7e2561eaaf9c8cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Backport upstream patch fixing:

hash.c:76:6: error: conflicting types for ‘hash_empty’; have ‘void(struct hash *)’
   76 | void hash_empty(struct hash *h)
      |      ^~~~~~~~~~
In file included from hash.c:22:
hash.h:41:6: note: previous declaration of ‘hash_empty’ with type ‘void(void)’
   41 | void hash_empty();
      |      ^~~~~~~~~~

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2bfdadab434d3f9100b66a783ee317d118b5623c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

--===============3203845632070026326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3203845632070026326==--
