Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F295AC0502A
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 16:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72ECF8194A;
	Sat, 27 Aug 2022 16:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72ECF8194A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6WKG8QC2fgjl; Sat, 27 Aug 2022 16:14:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2CC4818AC;
	Sat, 27 Aug 2022 16:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2CC4818AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC95F1BF314
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 16:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8825960D78
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 16:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8825960D78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOeHrONTXsDz for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 16:14:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7548D60D4D
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7548D60D4D
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 16:14:45 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e20so5138755wri.13
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 09:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=7a/P4MlUj7CXqj2k3zDG+Wi2yfkkPj6o/SyzONwbdYU=;
 b=5mOt2saT3F++0NNlRKS92TZzrkTMuTvCTgOm93p4m5U6QpEapIXo/qadiyD2lJVf9c
 cAJhXVB3No0wIant4FziXGyvobGmD9Iasz2p1ao85um2EZFPUSC1Hs/EpHcieVNgoBUx
 WDqX/szwy5HU/E468gIxZx3S4LkxFfqPWFj6mqBnwGiB2QX0v3U9ZMlcv9ovD1K8W8UC
 drp6BvdrCGESLZpPNCRNn8kR49iMXtqox5lLg3unRlFbQhSH+4jQuKSD1zgDkRL/+pAi
 6zo/tRCunJ6LwhEV2fVKkdf6DwpNYeR27AqoBeHXS/LBFmLDOCMh5tKG2p04vtHJ1OTp
 Ft8Q==
X-Gm-Message-State: ACgBeo2SxuZtc9n/C7Q14TWMzLQpr/Zjjd7tH/f6T5OZcMBdQcRvP49e
 KZneth9ZkG1OWLMwzdhZNXq7c/ZDJKw=
X-Google-Smtp-Source: AA6agR74tLKDdiCxRNxAaOr/KGPo7yGJSR5n/1UKm3N2WI7uThJcc9bUQuQ3Ffy9ikpf0jKman1UzA==
X-Received: by 2002:a5d:5941:0:b0:225:3fc3:d923 with SMTP id
 e1-20020a5d5941000000b002253fc3d923mr2444802wri.522.1661616883632; 
 Sat, 27 Aug 2022 09:14:43 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a5d6391000000b0022511d35d5bsm2696016wru.12.2022.08.27.09.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 09:14:43 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 18:14:31 +0200
Message-Id: <20220827161431.333659-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220827161431.333659-1-romain.naour@gmail.com>
References: <20220827161431.333659-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=7a/P4MlUj7CXqj2k3zDG+Wi2yfkkPj6o/SyzONwbdYU=;
 b=S0jmyB3YbbA9/KUos7pMx+cGr0W7eq4sTB7bWOFLK2IrDVa1gUtbCbFSStax2hEX/x
 6zraH3h8dmdnYGnZzB/Me4YGJfVFo22P2yRZRUCmVxRfAmM8VMwI1pCtaLdA6xv7YUbm
 JhWfpC/fHHOYp8SX0YRGEoEThBhXpBquDHynRd0ABW5QR0sH8nb9C3YhRS8vcSweQ4CJ
 0+nGO0XiYZJfZuFj10O+3H/DXcNIAkEILG9sTeBVxUjpOOHpkwvCDNfOYxjpk/NSj/ou
 ynehdy3mxJaBiOtZ1K6EU+v9GMLCcaGeh2Pzj/Qb8dsk9aLJ1s3Xccb/4vOwYV3uTgki
 Nsqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S0jmyB3Y
Subject: [Buildroot] [for-master 2/2] package/gdb: prevent gdbserver being
 selected for or1k builds
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
Cc: Romain Naour <romain.naour@gmail.com>, Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is currently no version of gdbserver for or1k. Until this
is implemented we will prevent both the direct and indirect
selection of gdbserver for or1k builds. In practice this means
that 'cross gdb for the host' cannot be selected and that
'full debugger' must be automatically selected for the gdb target
package

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Stafford Horne <shorne@gmail.com>
---
gdbserver for or1k requires gdb 12.1 [1] but this version is
not available in Buildroot 2022.08 and only in the next branch
(upcoming 2022.011).

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=4933265c3f71b9134363d0c05f09542d5cc677f4
---
 package/gdb/Config.in      | 3 +++
 package/gdb/Config.in.host | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 71fa6f6064..8fd5eb9fbc 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -17,6 +17,8 @@ config BR2_PACKAGE_GDB
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
+	# no gdbserver on or1k
+	select BR2_PACKAGE_GDB_DEBUGGER if BR2_or1k
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
@@ -43,6 +45,7 @@ if BR2_PACKAGE_GDB
 config BR2_PACKAGE_GDB_SERVER
 	bool "gdbserver"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
+	depends on !BR2_or1k
 	help
 	  Build the gdbserver stub to run on the target.
 	  A full gdb is needed to debug the progam.
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index a294103ca3..15d5f52a36 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -3,6 +3,7 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 	default y
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
+	depends on !BR2_or1k
 
 comment "Host GDB Options"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
