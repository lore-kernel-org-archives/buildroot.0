Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19F2C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D39740BE2;
	Sun, 11 Sep 2022 09:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D39740BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SMSb7y2IPGST; Sun, 11 Sep 2022 09:10:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADCF740B88;
	Sun, 11 Sep 2022 09:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADCF740B88
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25E2A1BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F56B8291A
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F56B8291A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D4NxCQivo6_W for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 404AB813EA
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 404AB813EA
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3038683518; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Aug 2022 20:52:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7cb17577d42aad959a65702074061eeaf54447d7
X-Git-Newrev: 04d3aef6805aa2dbd5483ed4f9826b14c29faa50
X-Patchwork-Hint: ignore
Message-Id: <20220911084828.3038683518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbedtls: add configurable
 DTLS-SRTP support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=04d3aef6805aa2dbd5483ed4f9826b14c29faa50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new option to have MbedTLS builds that support DTLS-SRTP.
We can only enable the support, it's disabled by default.

Signed-off-by: Dmitry Ilyin <dima@doty.ru>
[yann.morin.1998@free.fr:
  - rename variable
  - fix variable name in .mk
  - drop unnecessary ref to AWS library
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mbedtls/Config.in  | 6 ++++++
 package/mbedtls/mbedtls.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in
index a39ba65d98..abbe3356d8 100644
--- a/package/mbedtls/Config.in
+++ b/package/mbedtls/Config.in
@@ -29,4 +29,10 @@ config BR2_PACKAGE_MBEDTLS_COMPRESSION
 	  sure CRIME and similar attacks are not applicable to your
 	  particular situation.
 
+config BR2_PACKAGE_MBEDTLS_DTLS_SRTP
+	bool "enable DTLS-SRTP support"
+	help
+	  Enable support for negotiation of DTLS-SRTP (RFC 5764)
+	  through the use_srtp extension.
+
 endif
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index af87d62b30..1a888e8c67 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -72,4 +72,12 @@ else ifeq ($(BR2_microblaze)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
 MBEDTLS_POST_CONFIGURE_HOOKS += MBEDTLS_DISABLE_ASM
 endif
 
+ifeq ($(BR2_PACKAGE_MBEDTLS_DTLS_SRTP),y)
+define MBEDTLS_ENABLE_DTLS_SRTP
+	$(SED) "s://#define MBEDTLS_SSL_DTLS_SRTP:#define MBEDTLS_SSL_DTLS_SRTP:" \
+		$(@D)/include/mbedtls/config.h
+endef
+MBEDTLS_POST_PATCH_HOOKS += MBEDTLS_ENABLE_DTLS_SRTP
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
