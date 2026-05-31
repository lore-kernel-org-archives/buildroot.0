Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751BBCD6E5D
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 14:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A27760F7C;
	Sun, 31 May 2026 14:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ETZGNdEVO3kQ; Sun, 31 May 2026 14:38:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 756D860F7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780238317;
	bh=REjaXIpsJf2s22h/ljRp2WebAaaqUCWrQgxfCpW3w0o=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pgyq/s9TRUhtADg7le/C+jyXsApG4KupdOfYUbVwa07tqKGo7Ki8W8Y8V0ti4YInh
	 vXir3w7LLvobwTIpFbecEGBWBtcbjYeYYvcAN/MMhxmqJYrSyzhPVuKi97pTimflDa
	 xGOx+hfhbRMge30VnVbcESLu1Pf2TXSVRyyEVybyZ31cE6lcEDofeG7zBP1znPbdHq
	 uYM+ZExik69fjUnddi8paSE0+LwCQ4OoCzIkQkjjro6Z9T07kLibT3OyB/ybF4WxBy
	 QHc60Tf5bZNU0LPvhL9QH9BQ92UF5ILyqZhMBcnNaTzBFbwZK717ioUzsCNd+wBW8i
	 WGwIriX1w4evQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 756D860F7E;
	Sun, 31 May 2026 14:38:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52D31257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3843240233
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id labwz_nDusbK for <buildroot@buildroot.org>;
 Sun, 31 May 2026 14:38:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2886040183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2886040183
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2886040183
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:38:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DAF22A4C37D0;
 Sun, 31 May 2026 16:38:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54352)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wThIy-000000000aC-3lVt;
 Sun, 31 May 2026 14:38:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 16:38:19 +0200
Message-ID: <20260531143820.2967481-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260531143820.2967481-1-bernd@kuhls.net>
References: <20260531143820.2967481-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780238300;
 bh=PqeMLvUV0NN8gSwywbXU6cD0W4YIA/FG10Xu5sX33kA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=N77YCZ7adV1MvJLZA3cnOjeZu6nh/ap/PrfwVinaWjKVB0dG/HUFNeNSJdYKMLaYJ
 Ygl0/XfZZHWmRSo/3SrYqII4G6KPyeGnSZRydBj0W2j1LzH+tuAzlu66yEmTzUB4P3
 iIn3YyxIYfUmYDnsFk5+QmbgcTCRKg05JbOAOTR9S2gFsh1/HiMZ2nF/q2AcHEl91T
 dlHltMrDgyWJ57yRhzRaMc3AJZvz2qf+UgJPlUXR1I3Z2OvApK0jp2SXlhwR5RX8e/
 gkRu5dfIMWRV/+rNemJo/KdB1uDU+pIQeO8pVD2Qb5Ig8Rly6c7YZw1HHTi9gTI6T5
 satO4NybtvrDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=N77YCZ7a
Subject: [Buildroot] [PATCH 2/3] package/sane-airscan: needs
 BR2_TOOLCHAIN_HAS_SYNC_4
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
Cc: Guillaume Chaye <guillaume.chaye@zeetim.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes a build error

output/per-package/sane-airscan/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 libsane-airscan.so.1.p/airscan-http.c.o: in function `http_data_ref':
airscan-http.c:(.text+0x1c88): undefined reference to `__sync_fetch_and_add_4'
output/per-package/sane-airscan/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 libsane-airscan.so.1.p/airscan-http.c.o: in function `http_data_unref':
airscan-http.c:(.text+0x1cd0): undefined reference to `__sync_sub_and_fetch_4'
output/per-package/sane-airscan/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 libsane-airscan.so.1.p/airscan-trace.c.o: in function `trace_ref':
airscan-trace.c:(.text+0x32c): undefined reference to `__sync_fetch_and_add_4'
output/per-package/sane-airscan/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 libsane-airscan.so.1.p/airscan-trace.c.o: in function `trace_unref':
airscan-trace.c:(.text+0x358): undefined reference to `__sync_sub_and_fetch_4'

with this defconfig

BR2_sparc=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_SPARCV8_UCLIBC_STABLE=y
BR2_PACKAGE_SANE_AIRSCAN=y

detected by the Gitlab pipelines while testing to bump of sane-backends
to 1.4.0 in this series.

The build error is caused by an upstream commit added in 2020 to version
0.99.14:
https://github.com/alexpevzner/sane-airscan/commit/fccd8402a6bc5fce22805edf4e0fb6b0f24479e7
so a backport to LTS branches should be considered because the initial
version of the buildroot package was 0.99.33, added with commit
f78280bf262ceb1c1abbdade9de77fcc4add74ae.

An autobuilder error was not recorded yet because it is masked by various
build errors of the sane-backends package which are resolved by its bump
to 1.4.0 in this series.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sane-airscan/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sane-airscan/Config.in b/package/sane-airscan/Config.in
index 2324a3f661..63ef06b582 100644
--- a/package/sane-airscan/Config.in
+++ b/package/sane-airscan/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SANE_AIRSCAN
 	bool "sane-airscan"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # avahi, gnutls, sane-backends
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_THREADS # avahi, dbus
 	depends on BR2_USE_WCHAR # avahi, gnutls
 	depends on BR2_USE_MMU # dbus, sane-backends
@@ -26,5 +27,6 @@ config BR2_PACKAGE_SANE_AIRSCAN
 
 comment "sane-airscan needs a toolchain w/ wchar, dynamic library, threads, C++"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
