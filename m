Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCF5C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57744408C0;
	Tue,  2 Jan 2024 20:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57744408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRiQtrswZtru; Tue,  2 Jan 2024 20:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4280240A5C;
	Tue,  2 Jan 2024 20:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4280240A5C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 862801BF302
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E90841725
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E90841725
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cR0-i0DEf3Oq for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C8114172F
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C8114172F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76A6982AD1; Tue,  2 Jan 2024 20:17:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 21:06:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92040c4bf762d4a5e836cb04bc457839fb57f7f9
X-Git-Newrev: a5cacb63082b9e58194c4b9f8b2af2c3e38ff15c
X-Patchwork-Hint: ignore
Message-Id: <20240102201716.76A6982AD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: fix s390x build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a5cacb63082b9e58194c4b9f8b2af2c3e38ff15c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use linux64-s390x configure target to fix the following s390x build
failure raised since bump to version 3.2.0 in commit
973b1eba5a4ee72f040bd471b147267e36be73ad and
https://github.com/openssl/openssl/commit/79040cf29e011c21789563d74da626b7465a0540:

/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/13.2.0/../../../../s390x-buildroot-linux-gnu/bin/ld: libcrypto.a(libcrypto-lib-dh_key.o): in function `dh_bn_mod_exp':
dh_key.c:(.text+0x3c8): undefined reference to `s390x_mod_exp'
/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/13.2.0/../../../../s390x-buildroot-linux-gnu/bin/ld: libcrypto.a(libcrypto-lib-rsa_ossl.o): in function `rsa_ossl_s390x_mod_exp':
rsa_ossl.c:(.text+0xd2c): undefined reference to `s390x_crt'

Fixes:
 - http://autobuild.buildroot.org/results/77c5e13127de67a69782f138aa28c8b0ad951941

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libopenssl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 49958d9fd6..0c8db52e2e 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH
 	default "linux-x86_64"			if BR2_x86_64
 	default "linux64-riscv64"               if BR2_riscv && BR2_ARCH_IS_64
 	default "linux32-riscv32"               if BR2_riscv && !BR2_ARCH_IS_64
+	default "linux64-s390x"                 if BR2_s390x
 	# no-asm is needed with generic architectures such as
 	# linux-generic{32,64}, see
 	# https://github.com/openssl/openssl/issues/9839
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
