Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34D3C4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 16:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F26340B00;
	Fri, 17 Jul 2026 16:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_UBfjUpH29p; Fri, 17 Jul 2026 16:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6A6740B01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784307530;
	bh=DViuFbQlqj0k4jiq5dgY+wMnXd8QBJG55jDAG63ZImQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nrut8AYO7YeVbvVaOu2qoZFQmNmJdeSBnWZv2plze+2q89+COjwvkHGXv47e/V5+r
	 VLfAcmCB1IqLt5u4SE+DjErE8ztWhTn+ow/v5bN8jNnkl75x8lhoCBaQW1f1PVwYgZ
	 iNloHhpAYOGSy/yv6Gm9gkwqSsicsaKCGSCOLT20MLreajKoygLtusUCsSXEvEXe4r
	 h+K2rPVOS4Ofguww8D1M0BymQC2xUWoiMUwBBEPMUa1m/tGBZkfdxHE7VAsxY/VY94
	 F1c9byba9COCKd8u2GSFZMxIIKnSwgvXhN7Pitsx1GAcIlB6dxSoobQ1gneC/xC9SR
	 pNnHh9X/dAFnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6A6740B01;
	Fri, 17 Jul 2026 16:58:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 821ED320
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 16:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67C5281170
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 16:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENpumtm5mpCz for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 16:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 927DE8116D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 927DE8116D
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 16:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CF3A88E54; Fri, 17 Jul 2026 16:58:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 18:58:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23ce1c145ee385d94017bbe6fd8409be8f5a5529
X-Git-Newrev: 12077e4d4957b4b34d43a7da1267018fa2510c47
X-Patchwork-Hint: ignore
Message-Id: <20260717165812.3CF3A88E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bootgen: fix build with host-gcc
 >= 14.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/12077e4d4957b4b34d43a7da1267018fa2510c47
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/commit/4412e6e1af11637ae8ff8dec4adf9cf37a8a2bd3
https://autobuild.buildroot.net/results/2db/2db65dc1e84255eef74beb19a44eb38bdf469724/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Neal Frager <neal.frager@amd.com>
[Julien: add link to the commit introducing the issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ompatible-pointer-types-in-cdoseq_load_cd.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/bootgen/0001-cdo-Fix-incompatible-pointer-types-in-cdoseq_load_cd.patch b/package/bootgen/0001-cdo-Fix-incompatible-pointer-types-in-cdoseq_load_cd.patch
new file mode 100644
index 0000000000..8c879238c6
--- /dev/null
+++ b/package/bootgen/0001-cdo-Fix-incompatible-pointer-types-in-cdoseq_load_cd.patch
@@ -0,0 +1,45 @@
+From 33f6391e6e87dfd8906899de7e765a48bd51144b Mon Sep 17 00:00:00 2001
+From: Andrew Bradford <andrew.bradford@konsulko.com>
+Date: Mon, 22 Jun 2026 14:48:15 -0400
+Subject: [PATCH] cdo: Fix incompatible-pointer-types in
+ cdoseq_load_cdo_from_buffer
+
+GCC 14 promotes -Wincompatible-pointer-types to a hard error, so the
+build fails with:
+
+  utils/src/cdo-load.c:140:14: error: assignment to 'char *' from incompatible pointer type 'uint32_t *' {aka 'unsigned int *'} [-Wincompatible-pointer-types]
+    140 |         data = raw->data;
+        |              ^
+  make: *** [Makefile:81: build/obj/cdo-load.o] Error 1
+
+The function parameter data is char *, but raw->data (struct CdoRawInfo)
+is uint32_t *. The sibling function cdoseq_load_cdo avoids this because
+its local data is void *, which accepts any pointer without a cast.
+
+Add an explicit (char *) cast.
+
+Signed-off-by: Andrew Bradford <andrew.bradford@konsulko.com>
+
+Upstream: https://github.com/Xilinx/bootgen/pull/47
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ utils/src/cdo-load.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/src/cdo-load.c b/utils/src/cdo-load.c
+index cb0ff49..96a479a 100755
+--- a/utils/src/cdo-load.c
++++ b/utils/src/cdo-load.c
+@@ -137,7 +137,7 @@ CdoSequence * cdoseq_load_cdo_from_buffer(char * data, size_t size) {
+     if (data == NULL) goto done;
+     raw = cdoraw_decode(data, size);
+     if (raw != NULL) {
+-        data = raw->data;
++        data = (char *)raw->data;
+         size = raw->size;
+     }
+     if (is_cdo_data(data, size)) {
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
