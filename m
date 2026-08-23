Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8964AC5DF9B
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 09:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3C0F606E3;
	Sun, 23 Aug 2026 09:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4xpea2xyuvb; Sun, 23 Aug 2026 09:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787477211;
	bh=ioElaHX2jufbaonKz94ve2cRf2wrJ4GNWT8ys9FVjkM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YC9ao1d0Xa1wtusFNlGXMa2vwEkJspMdQ0TpEfaPY8ah/G63au4wzInYohVKgoPDm
	 QjZJDbMBL/AriH6LtAsHwnuIOnfVOpiMZV3BcnKgIfpmmxh8+NX9X5jFeE00FnLvQm
	 lJeXBCp1MjT3fq0fzfAbvIV/Ng9yPQ4mbqNOf1HBiQawmlOEWFay4AkyvG1rIynPAq
	 PtBsoUcZNtlRwJHsMfsEWo1Utr8m8YkH1MF7rG8hizGvPvDT76CfnwseGzFatRMr2w
	 HKXSR5POcAOEbGndngSO8o+xwElJb6mcs6S6uyBpsEdWyuOAaVvHTEVv/KpBqH5RFz
	 C3uZPMFdh3taQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1007C60621;
	Sun, 23 Aug 2026 09:26:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E35922FD
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 09:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C96B34066F
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 09:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELiMUgRaIgKE for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 09:26:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Bwbdqp8T
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B7B64066E
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 09:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1787477202;
 bh=552ue/2V2mY8L0y4wCdD/JMBMZjXem/q+X8gT8jJ64g=;
 h=From:To:Subject:Date:From;
 b=Bwbdqp8T22KasHHYs92oLVmhAMdWef4dK8TNUWy0CzhFnvtOcNvH/yc+/Eo7DbkSW
 C/B0pqlb98h20wU5KNHMI14C9a/Nm2F1fgx2gFOjO2/3OXaXuEYsLCBUa1mHfve/u3
 od74HhWBMWC97eq9fgiXUBEjUkz9AWgV79pV9L3E5eu0GUmZjD36VGSk1JKcm6fp1B
 d+PiQqjN+xYTUjhFxKRZxEwmOF19YFv+PuUNs8ocqiVIzsh4wRcJbcgtJ9uZID/wH3
 2uxAgsA7dSXhRTXsVnhNEDrbUjNa/pGLzJJ9SPFpGybC/hmWwPs6thNGt532YFijBQ
 zDCeRcb330o5A==
Received: from fli4l.lan.fli4l (p4fd6cbb1.dip0.t-ipconnect.de [79.214.203.177])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E2918A4C1057
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 11:26:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48236)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wy4TS-000000001UY-1OWJ
 for buildroot@buildroot.org; Sun, 23 Aug 2026 09:26:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 11:26:42 +0200
Message-ID: <20260823092642.1284862-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/clamav: requires DES in openssl
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

Buildroot commit 8b1d8dd25d39df120700666942278b1a99fef416 bumped the
package from 1.4.3 to 1.5.1 which includes upstream commit
https://github.com/Cisco-Talos/clamav/commit/8d485b9bfd26a91301592b99590a7eb2069dd905
that adds the usage of the OpenSSL crate from rust.

This crate depends on DES and causes build errors when missing:

/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3_cfb8'
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3_cbc'
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3_cfb64'
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3_ecb'
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ecb'
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3'
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_ede3_ofb'
/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ../libclamav/libclamav.so.12.1.0: undefined reference to `EVP_des_cbc'

Fixes:
https://autobuild.buildroot.net/results/b93/b9359c5c177f3e4bcef991cde3c2dcf412dee5de/
https://autobuild.buildroot.net/results/300/300721a882f3410528878db730aaff1aa6822986/
https://autobuild.buildroot.net/results/a16/a163a9229c04f638a46e6250dc135c475e5d1576/
https://autobuild.buildroot.net/results/7e8/7e88cba9974f6f5acd125b69b95b7269d8128886/

A backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/clamav/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index ae5cad036a..839518ebd6 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_CLAMAV
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
