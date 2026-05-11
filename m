Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53027CD4840
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 16:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 042418073F;
	Mon, 11 May 2026 16:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXyMx0QQWJHi; Mon, 11 May 2026 16:18:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0657480739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778516325;
	bh=jR0Ra14Fz12Em5MS3o0O1OgwFxCgP1JXWPjNTEqTOEM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VMhj6eHftCnRv1dvSKy21t+fuE0lH5gvZN8gWKnvz/8sqB25LNpQBFH+aef2aGHI0
	 h249ZDjmIk4iQMroOG3CV1JreGPLNPkUTbLXqTvSxR+3SiwQ6wIVOO5UVKTwJk2ue/
	 dxShhGLZMmH1qBZYdF+McRMtvR35QS+jQDWB017L/e7NPxgtRYHcdocy2DC/cv7Rgd
	 TMJY1BY6ZqUMU9OSoOXH9+3R8Q08L+hqIakVUmQNtXxd3P9nVOE7/NWbOk33AC5zay
	 lrCndZF6tzSy72dhFSnQ4Tu+X7fCBSe87alHtsCC+ubMuVWnhcygmG9enXeVYWdawk
	 np/RNvBBEI1tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0657480739;
	Mon, 11 May 2026 16:18:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24D56173
 for <buildroot@buildroot.org>; Mon, 11 May 2026 16:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09CDF80739
 for <buildroot@buildroot.org>; Mon, 11 May 2026 16:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8CJ1LRo4br6c for <buildroot@buildroot.org>;
 Mon, 11 May 2026 16:18:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04635806AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04635806AE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04635806AE
 for <buildroot@buildroot.org>; Mon, 11 May 2026 16:18:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c559.dip0.t-ipconnect.de [79.214.197.89])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 25A17A4C20BF
 for <buildroot@buildroot.org>; Mon, 11 May 2026 18:18:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55562)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMTL5-000000002Pz-1tg2
 for buildroot@buildroot.org; Mon, 11 May 2026 16:18:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 18:18:39 +0200
Message-ID: <20260511161839.1256214-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778516320;
 bh=GD3+hsCQFx+dX+EzM1p/Fyg6xXjyhTsBw3f1Hz1ljhQ=;
 h=From:To:Subject:Date:From;
 b=eponEB4lb+mqLuFGp6ULewGKMlN0NCU2HUmgAEQuUSUuUyP5Bmsdn98xw39Ds9xjf
 w1QSd3bgdlCmYA4OEr0V+96OBSCIYuFzkkml3POsYd8pwNGEyP7xO9SuMUwKiCscwu
 3tFVOOU55oq+FxHfBJgyXsHsJFlmrm5/W4IKOvMcH82LQRz6mU+o/Cjxp0X54PmZfU
 58lH8FyDDNfDSg5hCpWoEknWibP8VyD0SJljQXaGbxJXtHsLJ4PaFlfZ7NMTvqjJfd
 LYfmihFVI0nKs0QQmuL2iLoC6R8xI6oqn5+5MU9d21KfpqiSlEJUZ6AxWkMaZKSV7v
 itQUYbNy6Uz+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=eponEB4l
Subject: [Buildroot] [PATCH 1/1] {linux,
 linux-headers}: bump 6.18.x / 7.0.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.0.5 => 7.0.6}                     | 0
 linux/Config.in                            | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.18.28 => 6.18.29} | 0
 package/linux-headers/{7.0.5 => 7.0.6}     | 0
 package/linux-headers/Config.in.host       | 4 ++--
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename linux/{7.0.5 => 7.0.6} (100%)
 rename package/linux-headers/{6.18.28 => 6.18.29} (100%)
 rename package/linux-headers/{7.0.5 => 7.0.6} (100%)

diff --git a/linux/7.0.5 b/linux/7.0.6
similarity index 100%
rename from linux/7.0.5
rename to linux/7.0.6
diff --git a/linux/Config.in b/linux/Config.in
index 44a67a0e4d..0b511e7d24 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 2c97dbab36..d80a04c02c 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  965fb0a1c1675399fc60c6063b227c0523041b5f9a662b66462f1212c438ac3c  linux-7.0.5.tar.xz
+sha256  cba44440aa57affd7c21241dc5bc234b0df53c499f8ffc3ebc290dd3390a7523  linux-7.0.6.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f360789483586cf8a20b4ab2bffe76ead6b62c0db1eeb0d917294456c4d77b74  linux-6.18.28.tar.xz
+sha256  c33ea75b1f3bc5fccab836790cd3684eab7057ff383464b5efd8a68ba622a83c  linux-6.18.29.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.18.28 b/package/linux-headers/6.18.29
similarity index 100%
rename from package/linux-headers/6.18.28
rename to package/linux-headers/6.18.29
diff --git a/package/linux-headers/7.0.5 b/package/linux-headers/7.0.6
similarity index 100%
rename from package/linux-headers/7.0.5
rename to package/linux-headers/7.0.6
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a51f7171a5..405d136ea0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -473,8 +473,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.172"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.138"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.87"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.28"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.5"		if BR2_KERNEL_HEADERS_7_0
+	default "6.18.29"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.6"		if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
