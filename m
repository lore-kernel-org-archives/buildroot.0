Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF1CC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 18:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E1841570;
	Sat, 11 Feb 2023 18:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46E1841570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hka_AJ-zG4vt; Sat, 11 Feb 2023 18:29:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41114415DC;
	Sat, 11 Feb 2023 18:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41114415DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BD6D1BF59D
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAAAB403CA
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAAAB403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2SYiaEs5WA_r for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 18:28:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC1E140148
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC1E140148
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 18:28:57 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id bk16so8280901wrb.11
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 10:28:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LN3bYeXMgAZAIBFsqP7HkLcFXsV2H0pNSb6YWYVcxnQ=;
 b=63TcQMmAKE5T0cUj/EYSSGHR6qPPgVnt2dN8MeZTxzMK4mtaK3OkpyKwybNd1a+tTX
 x591EChOyl4ia2ecdNafUYLYo9U+q4zClLDEEgOPirdN0mjl8i8y29Xgqzcso1mNgd/L
 Irjx0tf1WMaSwyY5upVqo2I+BLoaajjqj28JzlssJ53ZkuYb3xfgGameDugAhHDV9NRi
 /3m8KAIosCOI46fFYXeeoBnHKGf33wjORrCcXwfY1UBiaEYYWFnjYZyj8y8vjLbMrFBZ
 wxJyfIxRuZN45iyHks/vpOQKb3Hlt1B3yXFuZFWHECZt4RDRTVY6JO5BIwF/aLmOb7Aw
 Y13A==
X-Gm-Message-State: AO0yUKVOutVOeYyobsq6sqpijI6Xb1AjVuiCvTy+sRnyMrKQ+bIbebdK
 ZxNpESPXPxpo7qPQXjKOX1YbQTJ/CwY=
X-Google-Smtp-Source: AK7set9sJJF0SdxvwvVy31ITAAmXS5ugS6rdJTd58vnEsUCh0teXNhY2++GBOWNaWrM5E9gQYFAEPw==
X-Received: by 2002:a05:6000:1b88:b0:2c3:ea8b:2724 with SMTP id
 r8-20020a0560001b8800b002c3ea8b2724mr15496124wru.21.1676140135807; 
 Sat, 11 Feb 2023 10:28:55 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c468d00b003e001afa274sm9446499wmo.2.2023.02.11.10.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 10:28:55 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 19:28:38 +0100
Message-Id: <20230211182839.3841661-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LN3bYeXMgAZAIBFsqP7HkLcFXsV2H0pNSb6YWYVcxnQ=;
 b=S7p0P6alHjSW/4mKQB5qnQJYGN/bntARSA5XhClzCBTOiJ4XnhfinocNWqgfG5iGeF
 0miBXe2brafmskWR8rr4Li2DsRB1QTiS2SL2qxJmSRxzMwfx2QfXy68ottQBVM5PsKq0
 pWSFODCvprgKf1A/mj9vQbrMgFA8nvjBLzIlszcEby1x6L2xC7WcmhPAu2l153pQJUrZ
 wP+VJ1LIZi2PIOWTRDhZInPxp/sFH0AewnfQk/f88CEslhLkxYkakpbc6kuCeOaob4ng
 oxzz7UATAlo5YOJR9PlJzGqt++CgXPTwWNZEYQp2oMtZo7rwZvPjSqB3MHVDcWm42hT4
 VIKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S7p0P6al
Subject: [Buildroot] [PATCH 1/2] toolchain/helper: check the arch sysroot
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the commit [1], the utils/genrandconfig script improved the
configuration randomization used by autobuilders. Since then it can
generate a configuration that is not suitable for an external toolchain
such the "Codescape IMG GNU Linux Toolchain".

Indeed this toolchain can be selected for mips32r5 or mips64r5 while only
mips32r2 or mips64r2 are really supported. The toolchain issue will be
fixed in a followup change.

We want to catch such issue in check_unusable_toolchain function otherwise
it is detected late during the sysroot import into staging and trigger
a weird error message:

ln: failed to create symbolic link 'output/host/mips64el-buildroot-linux-gnu/sysroot//nvmedata/autobuild/instance-25/buildroot/libc.a': No such file or directory
ln: failed to create symbolic link 'output/host/mips64el-buildroot-linux-gnu/sysroot/usr//nvmedata/autobuild/instance-25/buildroot/libc.a': No such file or directory

This is similar test than for the main sysroot check but this time we have
to use the toolchain cflags to check the architecture sysroot.

If the architecture sysroot doesn't exist, the toolchain will reply with
"libc.a".

Either the toolchain is really broken or we used a wrong target
architecture variant. In the later case, the toolchain infrastructure will
print a meaningful error message.

Note: We also may get a similar issue using the toolchain-external-custom package
if a toolchain is used with a wrong target architecture	variant.

Fixes:
http://autobuild.buildroot.org/results/701/701e8a5f713f7bdd1f32a4c549cdaac580e2522a/

[1] aeee90ec109b83c42779e6a2617f7d57e25a2b65

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Note: We should improve the Buildroot testsuite to test the toolchain wrapper
      corner cases.
---
 toolchain/helpers.mk                                  | 11 +++++++++++
 .../toolchain-external/pkg-toolchain-external.mk      |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 1cd7494fdb..24c482923a 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -422,12 +422,16 @@ check_cross_compiler_exists = \
 #   the host tuple.
 # - Exclude distro-class toolchains which are not relocatable.
 # - Exclude broken toolchains which return "libc.a" with -print-file-name.
+# - Exclude toolchains used with wrong toolchain cflags or broken toolchains
+#   which return "libc.a" with -print-file-name and toolchain cflags.
 # - Exclude toolchains which doesn't support --sysroot option.
 #
 # $1: cross-gcc path
+# $1: toolchain cflags
 #
 check_unusable_toolchain = \
 	__CROSS_CC=$(strip $1) ; \
+	__TOOLCHAIN_CFLAGS=$(strip $2) ; \
 	vendor=`$${__CROSS_CC} -dumpmachine | cut -f2 -d'-'` ; \
 	if test "$${vendor}" = "angstrom" ; then \
 		echo "Angstrom toolchains are not pure toolchains: they contain" ; \
@@ -449,6 +453,13 @@ check_unusable_toolchain = \
 		echo "Unable to detect the toolchain sysroot, Buildroot cannot use this toolchain." ; \
 		exit 1 ; \
 	fi ; \
+	libc_a_archsysroot_path=`$${__CROSS_CC} $${__TOOLCHAIN_CFLAGS} -print-file-name=libc.a` ; \
+	if test "$${libc_a_archsysroot_path}" = "libc.a" ; then \
+		echo "Unable to detect the toolchain architecture sysroot." ; \
+		echo "Please check the Target Architecture Variant selected, the toolchains may not support it." ; \
+		echo "Buildroot cannot use this toolchain." ; \
+		exit 1 ; \
+	fi; \
 	sysroot_dir="$(call toolchain_find_sysroot,$${__CROSS_CC})" ; \
 	if test -z "$${sysroot_dir}" ; then \
 		echo "External toolchain doesn't support --sysroot. Cannot use." ; \
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 299b6008aa..c37f3500d9 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -563,7 +563,7 @@ endif
 # kernel headers version, type of C library and all C library features.
 define $(2)_CONFIGURE_CMDS
 	$$(Q)$$(call check_cross_compiler_exists,$$(TOOLCHAIN_EXTERNAL_CC))
-	$$(Q)$$(call check_unusable_toolchain,$$(TOOLCHAIN_EXTERNAL_CC))
+	$$(Q)$$(call check_unusable_toolchain,$$(TOOLCHAIN_EXTERNAL_CC),"$$(TOOLCHAIN_EXTERNAL_CFLAGS)")
 	$$(Q)SYSROOT_DIR="$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC))" ; \
 	$$(call check_kernel_headers_version,\
 		$$(BUILD_DIR),\
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
