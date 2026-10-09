Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A251CA601E
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 19:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AD1040953;
	Fri,  9 Oct 2026 19:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QilARcqDEOya; Fri,  9 Oct 2026 19:55:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 95AC440955
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791575708;
	b=BhWk4OgQEp9llWQuejJZ6ItOQjmP3xQA84N9ic018bsNLhMz7NLmg6NojoPMYBRvWpSX
	 gEB8sLOpvgkTDPD4Mmhhw0U8hp2zWRny/0gWLN2ODoJG7Gkzqf/N5OKhNshQ8DLjs0H0i
	 XyAerGhoqxQJbyPkBBZwd7Pp/3hr5LbiAx2i1EXmO60akxX0LDbMLckXVU6lsC/MjEqZU
	 DiKC52q4eXuqH5iM7yeRAJUF/AWUxid6BXimTkhAjCXesGTTMBXvdgpW3s7HlyqhxsKl5
	 /qRqM+WTgC2BDU8tcWUOJf+m7I1HISG0Ir04qsmzXTSNFvlFP+piza0n2+nb0fOHXPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791575708;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=riG3tDnrAruF+RiqDVdaAGpDGZFKsryn9qktjFoFdJk=;
	b=FosxYuxkUMiCq5oEqx18k6zak5ORNAMmNRMQZuJCp3ytjhf5q4kQHSdKvDDSf9uw6uy+
	 TnOq4at8n1H12BaDxROQ1f2NvTcQy3i+I1q+mrl/pG0Zphsds8f/g09CxlPgIg/btg7H4
	 GO+orKfnUdhpbXBsEgQW3KqBaz6G/FXcUUJVmD9avMRHg7IDMSj3GecdUsbTkvusfyJ//
	 6vDbvgWXl6ensn6mvJMkT7BhYIwQeLxwyTQT0G5H2tte04hqko9FikpRzYHdZFU1fpl/v
	 AG01sje82NKZ6RNGqX0YItzUkqEj9kKBuJgu4mTMAkMfQ8MM3Mm/3T/OVLYi5seRAug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791575708;
	bh=riG3tDnrAruF+RiqDVdaAGpDGZFKsryn9qktjFoFdJk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eDXB15LNVQ2Y12PIuVnTsxvh5T5DoONH8qyJAMeZHJlaOlfGqSjIowuhayfGV7S9J
	 PRPnfHW3ThV233FrJXGGno3QPNi2N+sTJGI/52iJfjy5k2XS0qNT7WC8i8FFNddv0C
	 i9yLtERTSJQOTt3POL/XoWs04/CCUm2MyvrlgH8sWTbxR74Q+5h5BSFoWdBJxEsmoA
	 jf1jMezeqwn8bhln7WGJZRL9GJjRL4uOe43FfUW68+PJeDYQtJvJUlPsCp8YcOu/zk
	 lz2ga3U/lFzDRKUONNa1AdikENTzPUD2d73fxIOuFI8wR5VU9oUIHrSGyZM0y2v52B
	 88+uZj+KhxyOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95AC440955;
	Fri,  9 Oct 2026 19:55:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EC2C3B4
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7027640935
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlj1j6MG69zc for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 19:54:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 64E0F40850
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791575653;
 b=U2SpHt+5uQI8PXiCeo7fdhynMaSc+s+j1+PFB7B3lNanM9A7a4uII7O7/fB1/g1ge0p4
 J3R3Fkt7Qm81n5LJyzghdQrhc2ZrR0t0eK05a0fjv/nuFH8/Cr6uBO0kCH399qD5tZtQ/
 dumudaFwV+zdIHVsGIvzi2Sl8PttN2vylanI9h5RlzptYA8LAS17QjNxeQFWAPDbqiNP3
 x7VLGKHWtcEC4rL164GX83yAGCWt6qZTUwmo36tJKJPfVtZZUXXiM6BdXibN42/v+5hW8
 Mt9ugzzedH3lgz9nIOmgDqFqBHF2bsleGa3RFkWv1a+jN87YAabPAR/5s9s8KP6jrtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791575653;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TyLHq0hJE40STVFCxXahGcfGjd+i6G79n0yx/gI5Wbo=;
 b=TUPAurz4rw1D0ypF2qNUBMqiKoVOQLaGOhWQ2MctP22U2yGrt57hr0lqF1ODYGeYXAGL
 xAb2gPtKGjJSJHi7IQW7KXqJRmeVfqBT3Id1rCvaXRIIlpIdUE4VbNOw5+48yfpFqTiNj
 AO21y0NaskvIeZoA0a4DehHpCjc3YpXgMksY1i+hWF3fhd2qWwsyv+zNmERs+8Mmgd6h4
 dvDfDGunU3lyzYCSri0UHkIieNtJYPwBZ3d6/o0IgrFL/I3QqPwciCodZHKmKtLYsTtmn
 BrLfT4kVzaYnwnmGx5AzlGgfvF9puuX1X2W1goiRqPy3RvNf9W23CvbcpwoFhZ0A3jg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64E0F40850
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 19:54:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 839B08E12D; Fri,  9 Oct 2026 19:52:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Oct 2026 21:48:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48d56536794f9ca33244cc11dc91a6ac203d175e
X-Git-Newrev: 7b19a12922b9785ad2b0558138415e5207bbf0e6
X-Patchwork-Hint: ignore
Message-Id: <20261009195255.839B08E12D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shapelib: bump to 1.6.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7b19a12922b9785ad2b0558138415e5207bbf0e6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Also removing the gcc-15 bool keyword patch as it's already in this
release

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...build-failure-with-GCC-15-bool-is-keyword.patch | 39 ----------------------
 package/shapelib/shapelib.hash                     |  2 +-
 package/shapelib/shapelib.mk                       |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/shapelib/0001-Fix-build-failure-with-GCC-15-bool-is-keyword.patch b/package/shapelib/0001-Fix-build-failure-with-GCC-15-bool-is-keyword.patch
deleted file mode 100644
index 1fde0c7594..0000000000
--- a/package/shapelib/0001-Fix-build-failure-with-GCC-15-bool-is-keyword.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From bf455986557e88cce6a2a85448798e1dc05541f2 Mon Sep 17 00:00:00 2001
-From: Bas Couwenberg <sebastic@debian.org>
-Date: Tue, 23 Sep 2025 15:59:57 -0700
-Subject: [PATCH] Fix build failure with GCC 15 (bool is keyword).
-
-https://gcc.gnu.org/gcc-15/porting_to.html#c23-new-keywords
-
-Upstream: https://github.com/OSGeo/shapelib/commit/bf455986557e88cce6a2a85448798e1dc05541f2
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- dbfadd.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/dbfadd.c b/dbfadd.c
-index b464432..e0a6ef5 100644
---- a/dbfadd.c
-+++ b/dbfadd.c
-@@ -45,7 +45,7 @@ int main(int argc, char **argv)
-     const int iRecord = DBFGetRecordCount(hDBF);
- 
-     SHPDate date;
--    char bool;
-+    char boolean;
- 
-     // Loop assigning the new field values.
-     for (int i = 0; i < DBFGetFieldCount(hDBF); i++)
-@@ -64,9 +64,9 @@ int main(int argc, char **argv)
-         }
-         else if (DBFGetFieldInfo(hDBF, i, NULL, NULL, NULL) == FTLogical)
-         {
--            if (1 == sscanf(argv[i + 2], "%c", &bool))
-+            if (1 == sscanf(argv[i + 2], "%c", &boolean))
-             {
--                DBFWriteLogicalAttribute(hDBF, iRecord, i, bool);
-+                DBFWriteLogicalAttribute(hDBF, iRecord, i, boolean);
-             }
-         }
-         else
diff --git a/package/shapelib/shapelib.hash b/package/shapelib/shapelib.hash
index 3759917148..6c8642030f 100644
--- a/package/shapelib/shapelib.hash
+++ b/package/shapelib/shapelib.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  4b74a36ced94e9a7bea401157e664addcc5be251e7df7f88d4674361da012c21  shapelib-1.6.2.tar.gz
+sha256  3ff5ead18ca6d2fe249f0e80b361e1ad6782165115268ed4a58c780a60c1e0eb  shapelib-1.6.3.tar.gz
 sha256  681e386e44a19d7d0674b4320272c90e66b6610b741e7e6305f8219c42e85366  LICENSE-LGPL
 sha256  3f46082162242563bf4f43b091871cb19064bc5a398c6d2b024f6b64c6710516  LICENSE-MIT
 sha256  15e1205bb007d4d7821f7b1cc461ba8d051647e86dbc9baf1bb6f68b10588eeb  web/license.html
diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index 08bf3c9f94..c1478caf3a 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAPELIB_VERSION = 1.6.2
+SHAPELIB_VERSION = 1.6.3
 SHAPELIB_SITE = http://download.osgeo.org/shapelib
 SHAPELIB_LICENSE = MIT or LGPL-2.0
 SHAPELIB_LICENSE_FILES = LICENSE-LGPL LICENSE-MIT web/license.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
