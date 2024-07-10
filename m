Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34099C3DA45
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 12:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E14E181FEF;
	Wed, 10 Jul 2024 12:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yg7U5kTvTCQA; Wed, 10 Jul 2024 12:30:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 019638201E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 019638201E;
	Wed, 10 Jul 2024 12:30:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98DCE1BF310
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 12:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86F2E60FC2
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 12:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XM2oud5De-Q5 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 12:30:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD44960EBA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD44960EBA
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 12:30:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3F6D8463A; Wed, 10 Jul 2024 12:30:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 14:28:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4aa7a4ad8a6f729ad6ee6baf16f01d657559b3e6
X-Git-Newrev: caff4179a4481233257f5f475ca57ce9061af900
X-Patchwork-Hint: ignore
Message-Id: <20240710123055.B3F6D8463A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnutls: add tpm2-tss optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=caff4179a4481233257f5f475ca57ce9061af900
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tpm2-tss support is available since gnutls 3.7.3 using
--{with,without}-tpm2 configure option [1].

Since the option is not handled by gnutls package, tpm2-tss support
can be enabled if tpm2-tss package is build before gnutls package.

Likewise, tpm2-tss support can be enabled for the gnutls host variant
if tpm2-tss libraries are installed on the host.
Make sure to disable tpm2-tss support for the host-gnutls.

[1] https://lists.gnupg.org/pipermail/gnutls-help/2022-January/004736.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnutls/gnutls.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 8a4f3345aa..8302194812 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -57,6 +57,7 @@ HOST_GNUTLS_CONF_OPTS = \
 	--without-librt-prefix \
 	--without-libz-prefix \
 	--without-tpm \
+	--without-tpm2 \
 	--disable-openssl-compatibility \
 	--without-libbrotli \
 	--without-idn \
@@ -98,6 +99,13 @@ else
 GNUTLS_CONF_OPTS += --without-p11-kit
 endif
 
+ifeq ($(BR2_PACKAGE_TPM2_TSS),y)
+GNUTLS_CONF_OPTS += --with-tpm2
+GNUTLS_DEPENDENCIES += tpm2-tss
+else
+GNUTLS_CONF_OPTS += --without-tpm2
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GNUTLS_CONF_OPTS += --with-zlib
 GNUTLS_DEPENDENCIES += zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
