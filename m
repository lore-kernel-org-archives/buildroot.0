Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865B1EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3806C821D2;
	Thu, 27 Jul 2023 21:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3806C821D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g60Vzg0vtqDx; Thu, 27 Jul 2023 21:49:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E9882007;
	Thu, 27 Jul 2023 21:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81E9882007
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 556EB1BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F0AE82007
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F0AE82007
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fN0zWh98YqVz for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:49:43 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0042F81EC4
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0042F81EC4
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3A2BCA4C00B2;
 Thu, 27 Jul 2023 23:49:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48504)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qP8rb-00087Y-34;
 Thu, 27 Jul 2023 23:49:40 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 23:49:39 +0200
Message-Id: <20230727214939.1578036-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690494580;
 bh=ZfWW78cDyjYcd4fo5SUUPuLqlE3i1FSncGyk0taa5y4=;
 h=From:To:Cc:Subject:Date:From;
 b=Y+xlsINiLfycJ/AWj/MYoHoonGjk/zPLEqqyJPG8KSlTAAI6/CUCcc+x6FWfSKpfK
 fhGWxrpZcbssGxp7iAkffnQuTbHfqLbfm8CqaQxjqPvsXaKpCdEn14VN+791rxoNqs
 aZd6WctZulRrJxieKIheN9Mn7X3D3pzjB/5Kxr2hX3oaPuKsCPENFreeEwA2WOykA3
 /gLwaxrkRbHKxRDTad1kzv6WQ3zN3WU0e1OMlAt1/IUJRKDwVjGjOga46/MGxyVDfR
 ScLUk/X/hztEsu/qMWuIE/s8hHn1piZ1LZKfLooisQPJSJbFsYCDpmJEhe2WUgsxYZ
 YGptEEUV46E+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Y+xlsINi
Subject: [Buildroot] [PATCH 1/1] package/gupnp: fix build with meson 1.2.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/10f/10f30e804b3b497d603afa93bdd2b02fc66646f4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...properly-spell-provide-in-wrap-files.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/gupnp/0002-build-properly-spell-provide-in-wrap-files.patch

diff --git a/package/gupnp/0002-build-properly-spell-provide-in-wrap-files.patch b/package/gupnp/0002-build-properly-spell-provide-in-wrap-files.patch
new file mode 100644
index 0000000000..0632469a98
--- /dev/null
+++ b/package/gupnp/0002-build-properly-spell-provide-in-wrap-files.patch
@@ -0,0 +1,30 @@
+From 884639bd29323cbb8fbd36bc69d08097a2ae2cd1 Mon Sep 17 00:00:00 2001
+From: Jan Beich <jbeich@FreeBSD.org>
+Date: Sun, 9 Jul 2023 03:30:47 +0000
+Subject: [PATCH] build: properly spell [provide] in *.wrap files
+
+meson.build:1:0: ERROR: Unexpected "[provides]" section, did you mean "[provide]"?
+
+Upstream: https://gitlab.gnome.org/GNOME/gupnp/-/commit/884639bd29323cbb8fbd36bc69d08097a2ae2cd1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: backported to branch gupnp-1.4]
+---
+ subprojects/gssdp-1.6.wrap | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/subprojects/gssdp-1.6.wrap b/subprojects/gssdp-1.6.wrap
+index b0b6504..8adc1a2 100644
+--- a/subprojects/gssdp-1.2.wrap
++++ b/subprojects/gssdp-1.2.wrap
+@@ -3,6 +3,6 @@ url = https://gitlab.gnome.org/GNOME/gssdp.git
+ revision = gssdp-1.4
+ depth = 1
+  
+-[provides]
++[provide]
+ dependency_name = gssdp-1.2
+ 
+-- 
+GitLab
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
