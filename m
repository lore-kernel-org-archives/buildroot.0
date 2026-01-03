Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D97FFC6179
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 13:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 266D86074D;
	Sat,  3 Jan 2026 13:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUWppIf6d59D; Sat,  3 Jan 2026 13:26:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B89C560716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767446760;
	bh=ovbGPm+7A/9AvBgs2hrCsjWxCHY7328dinarfyBNpCM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pmfAdKAiG42OaEOzTtv8u3ozSdpOUziFhLC+1g5EYzt2g8Xw2XrkTXLHsfp9nuTBL
	 t3DbWKge3EK3b0u2E4cLTDqZVt41ndB1uj/OUgIcV1VnPWYIZ42zrlZkglAFGKuVXE
	 ChPLdSFatjbVGyg9qtDbFDgsvgUdA7uk742o4T2lC53ITJvJIwq5evqVejSJURyJAh
	 tzNkfMKQ6lPh+1q0rSzXXNn5LRCchuQobhle9wYTnZKGFYbVfQ1cZXbIPwjpUXlC07
	 TRAdXnu3UWCWHCopYXlW4HuZkyb5THNVwlcDhq1offqwLKXNZWG2JpTsc9XACpMnZT
	 k8end8UT1LaHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B89C560716;
	Sat,  3 Jan 2026 13:26:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40407440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 264E560716
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ox4_ywqp_KFH for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 13:25:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 078396059E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 078396059E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 078396059E
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 13:25:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9F68EA4C2F19;
 Sat,  3 Jan 2026 14:25:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51748)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vc1dg-000000000rJ-0oj7;
 Sat, 03 Jan 2026 13:25:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  3 Jan 2026 14:25:47 +0100
Message-ID: <20260103132552.3979708-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767446752;
 bh=9noIT+m3ATOi8BBiKrIMZDdrD1tXjD1AMuSR92+r22s=;
 h=From:To:Cc:Subject:Date:From;
 b=no1BMuMfTnaxqzy10vS9l5M7IEdZB3GL+EO9JhDoQkpvub1dS8EB7Wb9MGvXcCeRB
 6YPsAM2zY90EsDwmfxiCravmy80CcfLWyROJ5IgczjjHt1KAK4zrSliQRSt9uGqAEc
 MbYumxlBS7Znk6yRvNlBtBtJmLppb8E61lS8W3V8ZlFYGoe2M6drsSK0iBl3GpLMP1
 iaymebTxcwtKO6IzwlYGXJw/yB4lkuHxXlnyzJrMZenQTe5U8avsnr4INidXr9Rf6b
 G0DA9mSyvpA9pfh3A+ZSTklrAak/78/2Xecqogd4WGpPk1ixJP5p+717trx+4sllL0
 8snhljm5AHb8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=no1BMuMf
Subject: [Buildroot] [PATCH v4 0/5] package/libtirpc: introduce
 BR2_PACKAGE_LIBTIRPC_RPCDB
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

Hi,

this series fixes build errors introduced by the bump of libtirpc to
version 1.3.7 with buildroot commit
3f3d6e43de9b4aac7df8545fd811171256f878d3 which includes upstream commit
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

These build errors, caused by the forementioned upstream commit, only
occur with non-glibc toolchains:
https://patchwork.yoctoproject.org/comment/30091/
"but I believe it breaks the build with musl"

As shown by our autobuilders also uclibc is affected:

https://autobuild.buildroot.net/?reason=nfs-utils-2.8.4
https://autobuild.buildroot.net/?reason=quota-4.10
https://autobuild.buildroot.net/?reason=rpcbind-1.2.8

And indeed, building this glibc-based defconfig does not show any
libtirpc-related build errors:
BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_NFS_UTILS=y
# BR2_PACKAGE_NFS_UTILS_RPC_NFSD is not set
BR2_PACKAGE_RPCBIND=y
BR2_PACKAGE_SNORT3=y
BR2_PACKAGE_QUOTA=y
# BR2_TARGET_ROOTFS_TAR is not set

so we enable rpcdb support only for non-glibc toolchains following Yocto:
https://patchwork.yoctoproject.org/project/oe-core/patch/20250812221917.3926403-1-raj.khem@gmail.com/
"Add packageconfig for rpcdb

Enable it by default on musl, these functions are needed by
packages e.g. quota, nfs-utils, snort3 on musl"

This patch series is based on v3 from Giulio:
https://patchwork.ozlabs.org/project/buildroot/list/?series=485299
with the following additions/changes:
- added quota and snort3 to the list of packages needing rpcdb support
- enable BR2_PACKAGE_LIBTIRPC_RPCDB only when needed, see individual
  patch comments for details
- libtirpc: move gss comment into if-block

Building this musl-based defconfig does not show any libtirpc-related
build errors anymore with this patch series:

BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_NFS_UTILS=y
# BR2_PACKAGE_NFS_UTILS_RPC_NFSD is not set
BR2_PACKAGE_RPCBIND=y
BR2_PACKAGE_SNORT3=y
BR2_PACKAGE_QUOTA=y
# BR2_TARGET_ROOTFS_TAR is not set

The snort3 patch included in this series only fixes the libtirpc-related
configure error.

Regards, Bernd


Bernd Kuhls (2):
  package/quota: fix build failure due to missing
    BR2_PACKAGE_LIBTIRPC_RPCDB
  package/snort3: fix build failure due to missing
    BR2_PACKAGE_LIBTIRPC_RPCDB

Giulio Benetti (3):
  package/libtirpc: introduce BR2_PACKAGE_LIBTIRPC_RPCDB
  package/nfs-utils: fix build failure due to missing
    BR2_PACKAGE_LIBTIRPC_RPCDB
  package/rpcbind: fix build failure due to missing
    BR2_PACKAGE_LIBTIRPC_RPCDB

 package/libtirpc/Config.in   | 17 ++++++++++++-----
 package/libtirpc/libtirpc.mk |  7 +++++++
 package/nfs-utils/Config.in  |  1 +
 package/quota/Config.in      |  1 +
 package/rpcbind/Config.in    |  1 +
 package/snort3/Config.in     |  1 +
 6 files changed, 23 insertions(+), 5 deletions(-)

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
