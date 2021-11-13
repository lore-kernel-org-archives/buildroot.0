Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2CDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 10:53:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71D35610A0
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 10:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71D35610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B7F1402A8;
	Sat, 13 Nov 2021 10:53:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZH0M8er1u1q6; Sat, 13 Nov 2021 10:53:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B4154029F;
	Sat, 13 Nov 2021 10:53:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD1401BF2F0
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 10:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BF9080BC8
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 10:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vy3o6O5fRFGC for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 10:53:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7260180BB2
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 10:53:37 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t30so20073436wra.10
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 02:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/EmqQoKQsWQKKVxvpm9eA88GrtlH30Op4R106aPkyGE=;
 b=YW8PssZZjqiwndH/1drSmINTuxvJaLyaMWTbKmoXSnMUuMlI/6NLCFnwpCld3KtgHw
 eFchFtxqyrEADW8n+FyX3ILzOdEZwXoVFwOLnr/H+cfwJ+EzNoumPDxQTqurXJ2NTF5J
 D6byjoNNZYqmDoNKGzBhMXHbIVS3CAs8Mpd1z21xWJuR6J1hEmB6g3OQ/jP8peKYj8U+
 ANgaGzrt1ObuK3r1Kr7hNmVp07XUUsxuJrb2xsuB/Wy7EaFH+RfoMzlaTG9D4vsuI4Sb
 JtSDbl37blogtA0zidgtOue6xQrFtJs8cZ1gwqgSDHVOtnB6vJvQLKgXf+8FwWk8xSu7
 vg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/EmqQoKQsWQKKVxvpm9eA88GrtlH30Op4R106aPkyGE=;
 b=1pfioFT0v6RNAb0lJWg9cdYc0EXAQ8J9a57GBTp1w4bgDuR3585p0lkItP2W9Yg4bi
 r2K8MbrsoQwM0Gb3srwb3tSVzwZxvIzv6xFvR5cP790sRU+r01HaNsbCNDPilQGT8AWW
 NaqGL0zc22wODMyz+ubF9wDT71llJ1ay01vM83CdtlGmdjEjjMOvaeLptf9Tv5A+1CES
 SYfYaAN4WXhdnB73Cl9HDt2PaHLi07aY4PHjr/Vea44z70b9MD9DiaJsOQZJRlcUgxND
 a0EBLhaZSoppeOGP7nmVagCyon1LJXpvbDFh6OVd3S6KQ17uB90fuQi0OqFDHan/+GRQ
 jqYA==
X-Gm-Message-State: AOAM532V85iFb9omjaOR/D8kct4wteBDmtrL/aESd/rDPeHliMHrHXv1
 PEIGyZYuvsGrNPTI89pSvEVpKv9EUj0=
X-Google-Smtp-Source: ABdhPJyMnkBT1pxfm605vivWLvnPTkh2xUmUVMgCZ//n5dYrS7a6QjjQN5B53F34XFtvzbS8bQGrKg==
X-Received: by 2002:adf:f9d2:: with SMTP id w18mr27230539wrr.303.1636800815138; 
 Sat, 13 Nov 2021 02:53:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id f81sm15160909wmf.22.2021.11.13.02.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 02:53:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 11:51:30 +0100
Message-Id: <20211113105130.541926-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libodb-mysql: don't use
 mysql_config outside static build
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uclibc (and glibc) installs the following ld script in
$(STAGING_DIR)/usr/lib/libc.so in addition to the 'standard' library
installed in $(STAGING_DIR)/lib:

/* GNU ld script
 * Use the shared library, but some functions are only in
 * the static library, so try that secondarily. */
OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc",
	      "elf32-powerpc")
GROUP ( /lib/libc.so.1 /usr/lib/uclibc_nonshared.a libpthread_nonshared.a AS_NEEDED ( /lib/ld-uClibc.so.1 ) )

For an unknown reason, if this script is used, this will result in
the following build failure:

configure:3286: /home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/powerpc-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -rdynamic -L/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/mysql -lmysqlclient -L/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/oracle-mysql/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -lz -lnsl -lm >&5
/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find /lib/libc.so.1
/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find /usr/lib/uclibc_nonshared.a
/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find /lib/ld-uClibc.so.1

To fix this build failure, don't use mysql_config outside of static
builds.

It should be noted that this issue also affects open2300 and rsyslog
which should also be updated.

Fixes:
 - http://autobuild.buildroot.org/results/9e3c09dd3d9bd55de14fc89a1d17ba9c008b195b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libodb-mysql/libodb-mysql.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libodb-mysql/libodb-mysql.mk b/package/libodb-mysql/libodb-mysql.mk
index 88b6f4cb31..d2fa977209 100644
--- a/package/libodb-mysql/libodb-mysql.mk
+++ b/package/libodb-mysql/libodb-mysql.mk
@@ -12,8 +12,10 @@ LIBODB_MYSQL_INSTALL_STAGING = YES
 LIBODB_MYSQL_LICENSE = GPL-2.0
 LIBODB_MYSQL_LICENSE_FILES = LICENSE
 LIBODB_MYSQL_DEPENDENCIES = libodb mysql
-LIBODB_MYSQL_CONF_ENV = \
-	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
-	LIBS=`$(STAGING_DIR)/usr/bin/mysql_config --libs`
+LIBODB_MYSQL_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBODB_MYSQL_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/mysql_config --libs`"
+endif
 
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
