Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E772C38145
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 20:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71C1D60C24;
	Tue,  6 Sep 2022 20:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71C1D60C24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HopivSac2LB5; Tue,  6 Sep 2022 20:34:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B49D6077D;
	Tue,  6 Sep 2022 20:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B49D6077D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2949C1BF2A6
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3F3C4167E
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3F3C4167E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5EwHfzqfrHIK for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 20:34:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95FF9414A1
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95FF9414A1
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 20:34:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b5so17180095wrr.5
 for <buildroot@buildroot.org>; Tue, 06 Sep 2022 13:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=8AkfG5nW4B1cyG3ZTqAF85WQO6EZvpHWQRm4Vdd77OE=;
 b=m6+XyxJhF9o9Or/1LV0s1VsjSLoW6ODNhd3SWgb9Pdf1FGkGOwbiY47wyjeeELIInr
 dTet/zaps5YFzSOgAPEq7l2a4EDUXGn92WIrda5zITcOsiFtymwBcZocgnTGXtUpCopP
 b0UUdSeuUMcFu3GpykMBvqCgSsrORUfnVILdP6HBejyWd1KcORvm3ubOvmh9H3Sl7XqD
 zULFL/tD5HmqcAe2/hlEHUB/EV+gCZSIySSVctH56zhQYOKSU8qSbXpCkV0L7DP62uYf
 SwbOlDn1L5vcWrjjTqTNqyT42ffc9HR4ueBvjCXFD5YeCdvEC0ZJRlVwf1iT0nNMnIBu
 W/Ow==
X-Gm-Message-State: ACgBeo2d4yAKv0Ze8q05yLdWeEtplMZZKtsnSSOvEfdbqosojeIpiIFJ
 J7W2SYpGZXmqPo0z5v4eC0RIGkLeVds=
X-Google-Smtp-Source: AA6agR6PJ6EBF4ZvdSUUDQPU2QZKlIj8orbtj9v6w4o8qun23BDJ6sKWR1ZnXJCbkUT/fkxOVEWEog==
X-Received: by 2002:a05:6000:78d:b0:226:d5c1:5ebd with SMTP id
 bu13-20020a056000078d00b00226d5c15ebdmr109700wrb.565.1662496467682; 
 Tue, 06 Sep 2022 13:34:27 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b003a5ea1cc63csm23674711wmo.39.2022.09.06.13.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 13:34:27 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Sep 2022 22:34:23 +0200
Message-Id: <20220906203423.476196-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=8AkfG5nW4B1cyG3ZTqAF85WQO6EZvpHWQRm4Vdd77OE=;
 b=YhILUaHoCqsqgFuC6YE3EeFGdOC/fvhWzWBF4RxRxlnMmHsiOozj7W/bX2puVWNiAC
 aJXGWN0rWshvoZRj8iz0fcnhED+jVPN3fDwp5zbCx09wsXLZz42Dm0Tb8nkXgNW/bDYw
 tyMawvT85CjE64IP2l8QsPvvCLP+ZT3A40Rv6r+bWiJ2+yOYmkhmv50WqWqiPOfVDzAe
 Kyk2Fjkp/Tn0awzefw2/dsLV9bwa4sAWbMFuk6SAgMwjmsE1yHiqCHEUV8kVm5GfUqMH
 EdSnUGvUKRBfCiE9VZataKfTZ5M8j3b3gJNE9es4+F7gfDzwM/5jog+A6bYhMS52+EAZ
 Pl8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YhILUaHo
Subject: [Buildroot] [PATCH] arch/Config.in.powerpc: disable 64bits only
 target for PowerPC target variant
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
Cc: Romain Naour <romain.naour@gmail.com>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It turn out that some PowerPC variant are actually 64bits only and
fail to build an internal toolchain (fail on glibc, uClibc-ng or musl
build).

Example of defconfig fragment:
BR2_powerpc=y
BR2_powerpc_power4=y

Looking at gcc source code for PowerPC (rs6000) cpu definition allow
to understand which cpu target are 64bits and affected by this issue.
As soon as the cpu target is defined with MASK_POWERPC64 flag, it
means that gcc will generate binaries for PowerPC64 while Buildroot
will try to build for PowerPC.

This issue is now noticed thanks to the autobuilder script that
generates fully random configurations that can trigger configurations
that were not tested before.

Fixes:
[musl: powerpc/970]
http://autobuild.buildroot.net/results/184/18405f28f248a6a20b4373625bdfaacad2e351f1
[musl: powerpc/power4]
http://autobuild.buildroot.net/results/7ca/7cac82105590d90e964645464df1078dc1d3c0b9
[musl powerpc/power5]
http://autobuild.buildroot.net/results/cbf/cbfb2307c794d2f80a619915848fce8e790ee727
[musl: powerpc/power7]
http://autobuild.buildroot.net/results/c3d/c3d21c3bcb553ea414d2127798e6e6258885f9d6
[musl powerpc/power8]
http://autobuild.buildroot.net/results/e39/e39dd419e4a62f86fa748a56ccd028d83544f651
[musl powerpc/630]
http://autobuild.buildroot.net/results/bac/bac55dde44586d702bb0b4e6b22024e6fa24cccf
[musl powerpc/670]
http://autobuild.buildroot.net/results/ebb/ebbea8d0b678157c690243f453c50467589c8d25

[glibc: powerpc/power4]
http://autobuild.buildroot.net/results/7b6/7b67eeedf8bbda1fc35007bd5d56ea2ecd14a044
[glibc: powerpc/power8]
http://autobuild.buildroot.net/results/385/38564e11eb7920da30d7496c6eec36057c8cb1d5
...

[uclibc: powerpc/power4]
http://autobuild.buildroot.net/results/ccf/ccfadafb81e6a9a3d78444f4b97c4f0b18090b43
[uclibc: powerpc/power8]
http://autobuild.buildroot.net/results/286/2866e30e7111de1fd4da24f6f37219c80c99635c
...

[1] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/rs6000/rs6000-cpus.def;h=963947f693929b3bf2dcd08b50b60ebb1acf52f0#l200

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>
---
 arch/Config.in.powerpc | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index c48edd3bb4..b321dd2d4c 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -66,10 +66,14 @@ config BR2_powerpc_604e
 	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_620
 	bool "620"
+	# gcc support only powerpc64 target
+	depends on BR2_ARCH_IS_64
 	# No C library supports this variant on ppc64le
 	depends on !BR2_powerpc64le
 config BR2_powerpc_630
 	bool "630"
+	# gcc support only powerpc64 target
+	depends on BR2_ARCH_IS_64
 	# No C library supports this variant on ppc64le
 	depends on !BR2_powerpc64le
 config BR2_powerpc_740
@@ -97,6 +101,8 @@ config BR2_powerpc_860
 	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_970
 	bool "970"
+	# gcc support only powerpc64 target
+	depends on BR2_ARCH_IS_64
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_8540
 	bool "8540 / e500v1"
@@ -117,28 +123,42 @@ config BR2_powerpc_e500mc
 	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_e5500
 	bool "e5500"
+	# gcc support only powerpc64 target
+	depends on BR2_ARCH_IS_64
 	depends on !BR2_powerpc64le
 config BR2_powerpc_e6500
 	bool "e6500"
+	# gcc support only powerpc64 target
+	depends on BR2_ARCH_IS_64
 	depends on !BR2_powerpc64le
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_power4
 	bool "power4"
+	# gcc support only powerpc64 target
+	depends on BR2_ARCH_IS_64
 	# No C library supports this variant on ppc64le
 	depends on !BR2_powerpc64le
 config BR2_powerpc_power5
 	bool "power5"
+	# gcc support only powerpc64 target
+	depends on BR2_ARCH_IS_64
 	# No C library supports this variant on ppc64le
 	depends on !BR2_powerpc64le
 config BR2_powerpc_power6
 	bool "power6"
+	# gcc support only powerpc64 target
+	depends on BR2_ARCH_IS_64
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_power7
 	bool "power7"
+	# gcc support only powerpc64 target
+	depends on BR2_ARCH_IS_64
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	select BR2_POWERPC_CPU_HAS_VSX
 config BR2_powerpc_power8
 	bool "power8"
+	# gcc support only powerpc64 target
+	depends on BR2_ARCH_IS_64
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	select BR2_POWERPC_CPU_HAS_VSX
 endchoice
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
