Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2985BC43458
	for <buildroot@archiver.kernel.org>; Thu, 16 Jul 2026 05:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A317C607E2;
	Thu, 16 Jul 2026 05:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d31-6UggelQK; Thu, 16 Jul 2026 05:42:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC02A607FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784180539;
	bh=oS+Qo7q8Ql6QeYaujnuTS2byKpfH8QBHoCo5G7Fjd60=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hYh++WFs7xOaXW+uCjmiPeSUgpyVmuzI27Ke1H0BJe/h90ip7tcVBW5UKqHop6n9R
	 Qfetk5hzx4D1KZDRVlDSqSAfNM8AcBqe2/qcZlqecHqgCHfhbCsRSE3fJSnykb8sII
	 xQnPKV6KxbizBXbixp57Slt3kEVIZbk6D1hEEVBrHUnZcZ5+N1cEW3uVjIotuO0Peg
	 pyoHW6dWKFvLcox6aX7ZOQG0/X1Q4tZIDEsYwtZoDOojtKNeSTQAUd0+OXL1VRpy29
	 yJ0STeyaOXr7utTTLL5SWhQdpketW/HsSxRzUAxNj56DY72BQCaWVP8xxaQIPU86BH
	 m/6pa5PCZEzRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC02A607FC;
	Thu, 16 Jul 2026 05:42:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80C98320
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 05:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 667CE40820
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 05:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Elhxl88rolUS for <buildroot@buildroot.org>;
 Thu, 16 Jul 2026 05:42:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4EA9140572
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EA9140572
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EA9140572
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 05:42:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b1ce.dip0.t-ipconnect.de [84.161.177.206])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0794EA4C39FC;
 Thu, 16 Jul 2026 07:42:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43878)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wkErO-000000007j6-1dpM;
 Thu, 16 Jul 2026 05:42:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Neal Frager <neal.frager@amd.com>
Date: Thu, 16 Jul 2026 07:42:14 +0200
Message-ID: <20260716054214.14597-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784180535;
 bh=R97G20SLZdZwLmJIV8PzqTfW4CogVjbqxy0mdHn6ycQ=;
 h=From:To:Cc:Subject:Date:From;
 b=RuQYRvyNBbHXVSw5obwtSSgeklQfXvVniUU1blqz67VguJ69IFZTrobM/13YK/8e6
 fJ16q0GqUqnD3S+VOy7Shq3tgOuSz6PASdJ2DsCTY9fcrK+ADo2DD0uCe6zbR3WyjH
 R73pgsijNmJvdETgB/n0cm2mq7DCxz0Y2UZ8N339VH6TRtThHr7ATSIYpYTrUtuloR
 /MCGw9WlzSCdxUphJHr1yMHzh+YCA63nX0rKly2KMZoVjFy/2Q+sx/ti50xcwv4jol
 Wab8q2Mv8KtMLKQwzuHh58luSaTtN/DgOQpPsKyaMwAqeZv2TBp/rHc5vgobsc4s4C
 QBRsngCzJPJbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=RuQYRvyN
Subject: [Buildroot] [PATCH 1/1] package/bootgen: fix build with host-gcc >=
 14.x
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

Fixes:
https://autobuild.buildroot.net/results/2db/2db65dc1e84255eef74beb19a44eb38bdf469724/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/05ebd0270039fb37151d467a5d2cc8920a6dcc8e

 ...ible-pointer-types-in-cdoseq_load_cd.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/bootgen/0001-cdo-Fix-incompatible-pointer-types-in-cdoseq_load_cd.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
