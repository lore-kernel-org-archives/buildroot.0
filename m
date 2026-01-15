Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7997ED4661C
	for <buildroot@archiver.kernel.org>; Thu, 15 Jan 2026 19:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D39884789;
	Thu, 15 Jan 2026 19:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hr-Slly44QWP; Thu, 15 Jan 2026 19:46:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 190D884780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768506368;
	bh=20FeIhFhTH8JUD2vLrrXmCRh1M6miTS11S53gsY+AtU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K7xZb7izTONOO32dtzmiIui+lFcvzpC4x/KmXqf9T0VDKkA5dTdSqsNboTog7EGv4
	 idqhzOQvkfcOhmniLRSaL0w9g+utOfnIKmP7an+HG1oGavAjGhdNmfc8mykyX5QTyN
	 TLblHzjRLK6Sev65wYta1tKTyEmY6Aov0WyGoydu2aeAiXAtQLyluBpPqbDl/E05RA
	 H7h5WgYukfG3FtpZribn2OV3igpLLKMUo3mJNCDhmbbFqXfGniwazYW6FFBGrK1m7A
	 OequS3YkVMD4VHTRdTavZvUdzJ0pPbNEQAdbU1IwFSdm/eATQdzPLiNeIJzGrXMSeX
	 OGT5u8wFHxXJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 190D884780;
	Thu, 15 Jan 2026 19:46:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84349223
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 19:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7529A40197
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 19:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aY6NWO4R03c2 for <buildroot@buildroot.org>;
 Thu, 15 Jan 2026 19:46:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCFCC41676
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCFCC41676
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCFCC41676
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 19:46:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd81.dip0.t-ipconnect.de [84.161.189.129])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B084AA4C36A2
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 20:45:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35394)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vgTHx-000000006ua-0Dg8
 for buildroot@buildroot.org; Thu, 15 Jan 2026 19:45:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 20:45:48 +0100
Message-ID: <20260115194549.1208078-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768506358;
 bh=5FSyDZGzz9eFNzJZkmlNwj6Z/sVAZ/JI443tZi4F4h8=;
 h=From:To:Subject:Date:From;
 b=bXBH3a/JJ4cu8MaxC0ZeOUWdFSiGPwNFe2JWzh7VrDTs4RwKzDP7HqIpxQt9IbZ8z
 zUDttHsDunVrvwgjb4TUYl3s/0fAZu5zKw6u5l27m76MtP70bQxOYqlek9wdZ92S/b
 4m8Q89KAqnvnEGGjg3WKvTbNNPtOzPSfL8/9BJZp0CDmr12scCEfkSWp2wNbHs9btf
 ORJydx+10q0S3vr/d3TbhdiBQInVd0gMLTsH+lu1DNpoiQevUX9nDfOWQeeGUvCBey
 8iqCFJqqasAWmp1EmcONHytXP9euBRPoFWhO3ZqNByLChPRWPeoMGhqttJIvSLxMn8
 ZiHXD3nPOr2dQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=bXBH3a/J
Subject: [Buildroot] [PATCH 1/1] package/berkeleydb/: fix non-threaded build
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

Building berkeleydb is broken with a non-threaded toolchain with gcc >=
14.x:

../src/rep/rep_method.c:1740:25: error: implicit declaration of function
 '__repmgr_get_nsites'; did you mean '__rep_get_nsites'?
 [-Wimplicit-function-declaration]
 1740 |                 return (__repmgr_get_nsites(env, n));

According to src/repmgr/repmgr_util.c, line 503+, the function
'__repmgr_get_nsites' mentioned in the gcc error message "may only be
called after threads have been started".
This source file repmgr_util.c belongs to REPMGR_OBJS according to
dist/Makefile.in, line 249+, which is, according to dist/configure.ac,
line 956, only build if thread support is present.

In a non-threaded build '__repmgr_get_nsites' does not exist causing the
build error.

To fix the build error we disable replication for non-threaded
toolchains.

Using gcc 13.x the build error does not occur, tested with this
defconfig:

BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PTHREADS_NONE=y
BR2_GCC_VERSION_13_X=y
BR2_PACKAGE_BERKELEYDB=y

Using this minimal gcc 14.x-based defconfig

BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PTHREADS_NONE=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_BERKELEYDB=y

the build error can be reproduced.

The oldest build error of this kind, afaics, dates back to 2024-06-13:
https://autobuild.buildroot.net/results/e0d/e0d6bdbef01bee277b0da83605b2906af876058a/

Fixes:
https://autobuild.buildroot.net/results/792/792ed942d17bb8d00cd321536a102f6dd63b6a8a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/berkeleydb/berkeleydb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 6c487400ae..46838ca85c 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -45,6 +45,7 @@ define BERKELEYDB_CONFIGURE_CMDS
 		--with-pic \
 		--enable-o_direct \
 		$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-mutexsupport,--disable-mutexsupport) \
+		$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-replication,--disable-replication) \
 	)
 endef
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
