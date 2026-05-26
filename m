Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E192CD5BC8
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 20:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB50740CA5;
	Tue, 26 May 2026 20:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00DyWz_mToKB; Tue, 26 May 2026 20:07:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C821640C1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779826020;
	bh=xYaMPvA1f8qSydQ3dkO3DniYu2T+6mt+PoWNTPjc/iE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UkVp+ZvRHUZmJG+0bMXImwRHQLofHQV0qS+pt6BEQxD0aJrs2qXiH6mpFIdkP9D0u
	 1vxkSDhjWLCgpCYBRM4ZsMKQrZK4Sf4RM38r53Flv2iehp2rz6XhAUuF3JL8Piznp7
	 jiA0rJDCzgDUeB9UsxPfmBIQzarTDcgqV2/FXYdSmAhrxZBBoofFTA66ynMyWq+Uo1
	 wv1BgCi/Ib1jkOK+qbRPcMKwCBBMkhW0PagDd7dY1Br2WONx7UM0sK21ljQYS3mOGl
	 quZgR7pZ89rQ5HRG49PVSU+PLF7/LGGop3gx4d5zkCtunqADnRGNKtj02KK6MmEn1Z
	 /VsJoOlPZFGOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C821640C1B;
	Tue, 26 May 2026 20:07:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26BD323F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CD65610A4
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlsJ41mLdGDF for <buildroot@buildroot.org>;
 Tue, 26 May 2026 20:06:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3B16610A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3B16610A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3B16610A1
 for <buildroot@buildroot.org>; Tue, 26 May 2026 20:06:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6DEA5A4C2BF4
 for <buildroot@buildroot.org>; Tue, 26 May 2026 22:06:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39036)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wRy2z-000000000xj-2rGx
 for buildroot@buildroot.org; Tue, 26 May 2026 20:06:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 22:06:39 +0200
Message-ID: <20260526200641.939539-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526200641.939539-1-bernd@kuhls.net>
References: <20260526200641.939539-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779826002;
 bh=eUCOJlTHNp7vVyfVYqJ5E7MMWPqw8n1rQPyoNxtrJqw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=AmMxqkkcB+84k31YNDzMs1WEfLr3h1AjXRNlMW1I0uqZDC8q1MtH9boXLqaR4jeLc
 JXPW0wFefNKoniHRVbKzYIJ3sNUDWGgUZcPpFr9ckoThgoTFijj+4fSDfdWLEEs82F
 m4YftZ/2v7OC+rDJAyyVDrW2kfF8STdmUiaZyIKU7y1GjNns4VMAIBJcrduyhLI+/E
 y/feutfqXxnhmM6pmhZ5+RlvsKfTuI/7OZFI1OUO+dnFpIzwvXZbtC/x3vzhKg9ptq
 5igbddKUCfchdHcC75uyWjIKVUBKkf5DIg3393NVRhoJNiSe/hkiMmculwrH40+OOp
 OnOh/2l/CHHKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=AmMxqkkc
Subject: [Buildroot] [PATCH 2/4] package/libde265: disable neon support for
 armv7m
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

Buildroot commit d4b8a42fb253116befe539e5529ac4efd97ab421 bumped the
package from 1.0.16 to 1.0.18.
Upstream added optional neon support in version 1.0.17:
https://github.com/strukturag/libde265/commit/f22cf00a86f4a47f9423deb3b1daa35d981b2ec9

The configure check detects neon support:

-- Performing Test HAVE_NEON
-- Performing Test HAVE_NEON - Success

but causes a build error at linking stage:

[100%] Linking CXX executable dec265
/builds/bkuhls/buildroot/br-test-pkg/bootlin-armv7m-uclibc/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real:
 error: ../libde265/libde265.a(hevcdsp_qpel_neon.S.o):
 conflicting architecture profiles A/M

so we add a configure option to disable neon support.

The build error was not yet detected by the autobuilders but can be
reproduced using this defconfig:

BR2_arm=y
BR2_cortex_m4=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y
BR2_PACKAGE_LIBDE265=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipeline:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2554360744

I am not familiar with the various arm archs, the configure check for
neon tests 'check_c_compiler_flag(-mfpu=neon':
https://github.com/strukturag/libde265/blob/v1.1.0/CMakeLists.txt#L120

 package/libde265/libde265.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index d7e3df83ca..b559a9f607 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -16,4 +16,8 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LIBDE265_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
+ifeq ($(BR2_ARM_CPU_ARMV7M):$(BR2_ARM_CPU_HAS_NEON),y:)
+LIBDE265_CONF_OPTS += -DHAVE_NEON=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
