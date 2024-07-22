Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA27C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18A25400D2;
	Mon, 22 Jul 2024 12:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVKq8XvEsGOs; Mon, 22 Jul 2024 12:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC7EA40177
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC7EA40177;
	Mon, 22 Jul 2024 12:30:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 740A11BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 615B140177
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUje5wSFU9gy for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5932E400D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5932E400D2
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:30:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42FB287029; Mon, 22 Jul 2024 12:30:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 14:29:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91738f5093f80eeda8637b9a73636539d6937475
X-Git-Newrev: 1b8e5c93d3789c900fbd5ab62badfe4d4eec61a6
X-Patchwork-Hint: ignore
Message-Id: <20240722123039.42FB287029@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnutls: disable tpm2-tss
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b8e5c93d3789c900fbd5ab62badfe4d4eec61a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable tpm2-tss to avoid the following circular dependency if
BR2_PACKAGE_TPM2_TSS_FAPI is selected:
tpm2-tss -> libcurl -> gnutls -> tmp2-tss
resulting in the following build failure of libcurl or rtmpdump since
commit caff4179a4481233257f5f475ca57ce9061af900:

configure: error: TLS not detected, you will not be able to use HTTPS, FTPS, NTLM and more.
Use --with-openssl, --with-gnutls, --with-wolfssl, --with-mbedtls, --with-schannel, --with-secure-transport, --with-amissl, --with-bearssl or --with-rustls to address this.

[...]

In file included from rtmp.c:32:
rtmp_sys.h:110:10: fatal error: gnutls/gnutls.h: No such file or directory
  110 | #include <gnutls/gnutls.h>
      |          ^~~~~~~~~~~~~~~~~

Fixes: caff4179a4481233257f5f475ca57ce9061af900
 - http://autobuild.buildroot.org/results/72e1843de650c9ed4795f1141e9fd485b71a14c3
 - http://autobuild.buildroot.org/results/918f0f7efa810b17f6d2266a890bf0150cbed146

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnutls/gnutls.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 8302194812..cf2f02cc9d 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -30,6 +30,7 @@ GNUTLS_CONF_OPTS = \
 	--without-librt-prefix \
 	--without-libz-prefix \
 	--without-tpm \
+	--without-tpm2 \
 	$(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools) \
 	$(if $(BR2_PACKAGE_GNUTLS_ENABLE_SSL2),--enable,--disable)-ssl2-support \
 	$(if $(BR2_PACKAGE_GNUTLS_ENABLE_GOST),--enable,--disable)-gost
@@ -99,13 +100,6 @@ else
 GNUTLS_CONF_OPTS += --without-p11-kit
 endif
 
-ifeq ($(BR2_PACKAGE_TPM2_TSS),y)
-GNUTLS_CONF_OPTS += --with-tpm2
-GNUTLS_DEPENDENCIES += tpm2-tss
-else
-GNUTLS_CONF_OPTS += --without-tpm2
-endif
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GNUTLS_CONF_OPTS += --with-zlib
 GNUTLS_DEPENDENCIES += zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
