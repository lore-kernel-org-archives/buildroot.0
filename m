Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70F2CD98D2
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 07:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42F818516B;
	Tue, 16 Jun 2026 07:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16aNt0Js9RIT; Tue, 16 Jun 2026 07:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 334D985167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781594168;
	bh=zCPX5w7Pt12kADwvX3Ey+ylxm/I4Q4AExF4jJXaPjTk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dic/gEHYmFvfJil2jTwQDpyVa1NnFHom6Cou0oxXH9a55E7EXx5aJNX94NqLUQHQS
	 z5twOSM+xdkQkdvONRT2NVGpS3SmJSxHA+gfuHXDfvndhkrIdMcjIOUw9yeRKKUPuZ
	 TbYHYtqs4Qs8jIl6ArzORGfwroWkyT3l7q9JJmJmTIciOnVUmuEM4fq+usbgsQbS5d
	 HRdWnLMxcVH8EExTlNPtaX4gGrf4xVD/k80ybesV8/2GckZDrqJUb1o9VANkkVsRWc
	 DgL1msFfnH/Vs8MTB1p6jY3v57nJuSDCAHd8pERPwJIZHMMXKVbst80sxK7Jdp2lEl
	 MxvKRCYPVsvFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 334D985167;
	Tue, 16 Jun 2026 07:16:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE1D6169
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 07:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1FA385167
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 07:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHgmAzdproZs for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 07:16:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4261C85166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4261C85166
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4261C85166
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 07:16:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b12b.dip0.t-ipconnect.de [84.161.177.43])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 25294A4C00F5;
 Tue, 16 Jun 2026 09:16:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44668)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZO1j-0000000051t-0t1T;
 Tue, 16 Jun 2026 07:16:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Tue, 16 Jun 2026 09:16:02 +0200
Message-ID: <20260616071602.1201697-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781594163;
 bh=ooUvpMIUvSmT3nf3NdauWQ8Ebyl2vQpeCap4vdCn+aQ=;
 h=From:To:Cc:Subject:Date:From;
 b=fOFM803WBHd+oxmy5TGpMq1jqDE/N52Va45SxTYO/HCTKs+IPAzm/br+mgNxTLJTe
 rqqC0mHqmqA7jTTjO9kgco57I/9hyAzE5wpX2Vf+NPceThcpltIMeqTqqm7VJDAHYv
 TVXdBVHQQOcq2TQTI1dRX52/govn3F19Icd9dj3fdYCGBv2/ZDBRNZL1llSS6dhq5G
 aAwRnevepD29K4T2y8KNGh1c4BX+V3EYqPY7yD/T9TvQHDGAr9eU2Es/IsRFuHyuAN
 YMsUdAeKLmVLnCXeATkvlFMCD3OjVPyu04oUGFumItUTyyVMzlbzUND11D2Se5Q1eP
 3zo4kORDJZArg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=fOFM803W
Subject: [Buildroot] [PATCH 1/1] package/binutils: bump version to 2.46.1
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

https://sourceware.org/pipermail/binutils/2026-June/149568.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/83c007455807354f0c2ed7abdcad100af5d9bd0b

 package/binutils/{2.46.0 => 2.46.1}/0001-sh-conf.patch        | 0
 .../{2.46.0 => 2.46.1}/0002-poison-system-directories.patch   | 0
 package/binutils/Config.in.host                               | 4 ++--
 package/binutils/binutils.hash                                | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename package/binutils/{2.46.0 => 2.46.1}/0001-sh-conf.patch (100%)
 rename package/binutils/{2.46.0 => 2.46.1}/0002-poison-system-directories.patch (100%)

diff --git a/package/binutils/2.46.0/0001-sh-conf.patch b/package/binutils/2.46.1/0001-sh-conf.patch
similarity index 100%
rename from package/binutils/2.46.0/0001-sh-conf.patch
rename to package/binutils/2.46.1/0001-sh-conf.patch
diff --git a/package/binutils/2.46.0/0002-poison-system-directories.patch b/package/binutils/2.46.1/0002-poison-system-directories.patch
similarity index 100%
rename from package/binutils/2.46.0/0002-poison-system-directories.patch
rename to package/binutils/2.46.1/0002-poison-system-directories.patch
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 8032bfe005..90315f8053 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -23,7 +23,7 @@ config BR2_BINUTILS_VERSION_2_45_X
 	bool "binutils 2.45.1"
 
 config BR2_BINUTILS_VERSION_2_46_X
-	bool "binutils 2.46.0"
+	bool "binutils 2.46.1"
 
 endchoice
 
@@ -32,7 +32,7 @@ config BR2_BINUTILS_VERSION
 	default "arc-2024.12-release"	if BR2_BINUTILS_VERSION_ARC
 	default "2.44"		if BR2_BINUTILS_VERSION_2_44_X
 	default "2.45.1"	if BR2_BINUTILS_VERSION_2_45_X
-	default "2.46.0"	if BR2_BINUTILS_VERSION_2_46_X
+	default "2.46.1"	if BR2_BINUTILS_VERSION_2_46_X
 
 config BR2_BINUTILS_GPROFNG
 	bool "gprofng support"
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index df2613055a..14fd65d4a9 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -1,7 +1,7 @@
 # From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
 sha512  b85d3bbc0e334cf67a96219d3c7c65fbf3e832b2c98a7417bf131f3645a0307057ec81cd2b29ff2563cec53e3d42f73e2c60cc5708e80d4a730efdcc6ae14ad7  binutils-2.44.tar.xz
 sha512  ea030419eba387579ab717be7e3223fc99e93b586860b06003c12489f93441640d4082736f76aa5e98233db4f46e232f536a45e471486de1f5b64e1b827c167e  binutils-2.45.1.tar.xz
-sha512  32f880bb4f69351f4ae54a5d00359625c6c49d8e76624fb5cffdf174c79c8d3212f66225b81c12933c6ed59604ab652560773dd92fab384b930c97a9d4e1fdf2  binutils-2.46.0.tar.xz
+sha512  a5c65e56e400ed3fb8906a995dbb93eb5bea54b16344244653d7f44ef29ceb60270da263b19d25302c37759784e14fcb4b9421b29e0e2c7f450bd99f6bb4595c  binutils-2.46.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  46c336a16bde7b73dc4ceac0986887d47d542a1452e1936ef871b5e76afdb6cad4b18ccb4d93341358e7bb92c2ef74781e1fb72935d527d15251ac9f9daa8305  binutils-gdb-arc-2024.12-release.tar.gz
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
