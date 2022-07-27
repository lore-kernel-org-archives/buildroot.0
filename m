Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FA9C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D131240940;
	Wed, 27 Jul 2022 07:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D131240940
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sP3Ne99FCbTF; Wed, 27 Jul 2022 07:14:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 986A640356;
	Wed, 27 Jul 2022 07:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 986A640356
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2618E1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F349840356
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F349840356
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gjkqO1o4g7zi for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:14:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9969B40339
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9969B40339
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:14:27 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d8so22836827wrp.6
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 00:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sM/GD1ANnQC8N5MC3hD5NrZXQxCcIb80K1kyT4/FwJc=;
 b=WWtkCW2u1sMmW2NHWxc2TFFppLJ+0i9PdpYbdzg27F/dIwGP8A1r4FpoVHsh8dWPwF
 viJ3aKQQpGjyZF7oCCXprm8q8Ns1laZxJ3xy99jnLg6Tt/ZnC7T6PX3pmBWvJhX0Q123
 pUacF+uQB/BGbs9w1mH+hMhqqf3da0qCWe4/bvwMiO9VGl3rVA9uhmcWK1LDJP1Ps97y
 iAeJqKRRzN01S06n0sSeNEL4XvWCirlTjmrv3FB3dnZjhSCrajeABKOzeKeMpMJYXSyg
 HvK/cOzGkatlvWQBHTMKl2HE3f68u/NfQWtYNEYyz2/Q7EfYr699sds1MojOIFl/i3OX
 4hzA==
X-Gm-Message-State: AJIora/17HxdqCVDoM+ElI4w9RBp1JvtdRFkStX04xw+DcbRY5/TKN/U
 x5qb6alNsjMiq4Byp5YPzdPacWn/4gk=
X-Google-Smtp-Source: AGRyM1tNS2UQ5E6I2+ObJG2P6Op/vLlDsAdl0OAxxcVDknzSLPUczGGuKX+rit3T2rz1gzRDeGDy+g==
X-Received: by 2002:a5d:43c3:0:b0:21e:6a2d:4dc3 with SMTP id
 v3-20020a5d43c3000000b0021e6a2d4dc3mr13423682wrr.177.1658906065461; 
 Wed, 27 Jul 2022 00:14:25 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a5d5226000000b0021d6d9c0bd9sm16157122wra.82.2022.07.27.00.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 00:14:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 09:14:12 +0200
Message-Id: <20220727071412.330214-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sM/GD1ANnQC8N5MC3hD5NrZXQxCcIb80K1kyT4/FwJc=;
 b=CRWpYihykVSWxiegHEnSD8j718k0Rqkxl8V55H7xYAOSR1ZHYvEWymE7hjGXXWtTFJ
 n0RX/iBi8DL2YKbTj2XK1BZDWZ7KrkZ45Y4A101u/bMgblt81faHo0p0SiH5LAWBiECK
 +fyxy3i0Ww5SDft5VQE6OzJkPWG8FumobF9m8oiHyQpWUIkV/hijObFb7VnftssHTEf0
 y+p/IpRjoXxOnu6j5mO9SSfs7padIONQ756J+GenIErCubYMiJZi/U6RPLG8Ii5qZeGf
 b8GMK2hu21vEY/njKXbUm949jgXF+zi75D5PVjqC8vgWakGQcQOaJvipg5vmQIHxxIjg
 MbNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CRWpYihy
Subject: [Buildroot] [PATCH 1/1] package/zeek: disable with uclibc-ng
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

zeek unconditionally uses f_owner_ex which is only available with
aarch64 on uclibc-ng
(https://github.com/wbx-github/uclibc-ng/search?q=f_owner_ex) resulting
in the following build failure since the addition of the package in
commit ea36681572255ec906167308c07adc42ed2ac9f9:

/home/giuliobenetti/autobuild/run/instance-0/output-1/build/zeek-4.1.1/auxil/libkqueue/src/linux/platform.c: In function 'linux_kqueue_init':
/home/giuliobenetti/autobuild/run/instance-0/output-1/build/zeek-4.1.1/auxil/libkqueue/src/linux/platform.c:279:23: error: storage size of 'sig_owner' isn't known
  279 |     struct f_owner_ex sig_owner;
      |                       ^~~~~~~~~
/home/giuliobenetti/autobuild/run/instance-0/output-1/build/zeek-4.1.1/auxil/libkqueue/src/linux/platform.c:383:22: error: 'F_OWNER_TID' undeclared (first use in this function)
  383 |     sig_owner.type = F_OWNER_TID;
      |                      ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f15bc6fda2a6117b2beef91a3f97a5d063789102

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zeek/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/zeek/Config.in b/package/zeek/Config.in
index 123fedb339..01f5337292 100644
--- a/package/zeek/Config.in
+++ b/package/zeek/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_ZEEK
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # f_owner_ex
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
@@ -34,7 +35,8 @@ config BR2_PACKAGE_ZEEK_ZEEKCTL
 
 endif
 
-comment "zeek needs a toolchain w/ C++, wchar, threads, dynamic library"
+comment "zeek needs a glibc or musl toolchain w/ C++, wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		BR2_TOOLCHAIN_USES_UCLIBC
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
