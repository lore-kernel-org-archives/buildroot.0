Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490B6E7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 20:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED144605C0;
	Wed,  1 Jan 2025 20:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_qgnHCVXxam; Wed,  1 Jan 2025 20:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 116D7605D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 116D7605D7;
	Wed,  1 Jan 2025 20:21:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFA91F27
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFFD340169
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rww3slMxcxjZ for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 20:21:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74A6140140
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74A6140140
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74A6140140
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:21:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 3982560002;
 Wed,  1 Jan 2025 20:21:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  1 Jan 2025 21:21:11 +0100
Message-ID: <20250101202112.1845113-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735762873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0WK8wTldEdQxE4oCUggGiC9dg7QQUWLOEyAP/r0dQ7Y=;
 b=dcDIcZ2YwPE/bGaTAE7QoJB4o/8tGKHckk0tDuTPGtoUG2XJ5rwhKgogaltPrluUsjsKMc
 KWbJLGOKxvODvTne1U5N5ZVJeW5YfhebnNanhSYRSfS8QaDbDL2V0yFpWy1YaoKTxoF0Nn
 Xj17gJv0gIK26o7C0+QHGy348nsf0NHJOtbxJtmOuLOVouS2kp0eVrGQIgKluxXswLJefK
 HR0Ya+skP42SUn1zQA43omP2aoWrtt4hwxkSOoQg4QQVJc6NU9INvW41I0M/U7DKvg3Ovl
 5TXqwXaCQKNQaY1hSNZGTHCsZhkA8HJi1hlrJHchtS1lQUVeLx9DSABipw6WRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dcDIcZ2Y
Subject: [Buildroot] [PATCH] package/perl: properly pass CFLAGS/LDFLAGS when
 building host-perl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

HOST_CFLAGS and HOST_LDFLAGS are currently not accounted for when
building host-perl. In particular, it means that executables
built/installed by host-perl do not have a RPATH pointing to
HOST_DIR/lib, which can cause issues as libcrypt.so can now be
provided by host-libxcrypt.

This was causing check-host-rpath to complain in the situation where:

1. host-perl was built, with no RPATH, linked against the system
   libcrypt.so

2. host-libxcrypt was built afterwards, installed as
   HOST_DIR/lib/libcrypt.so, which made check-host-rpath complain as
   HOST_DIR/bin/perl is linked against a library present in
   HOST_DIR/lib but doesn't have a RPATH to HOST_DIR/lib

Fixes:

  http://autobuild.buildroot.net/results/d4348d7f872ccd734795a1d071960a696148ed6a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl/perl.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 0f7038a048..dc7c0b8d42 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -98,7 +98,9 @@ endef
 HOST_PERL_CONF_OPTS = \
 	-des \
 	-Dprefix="$(HOST_DIR)" \
-	-Dcc="$(HOSTCC)"
+	-Dcc="$(HOSTCC)" \
+	-Dccflags="$(HOST_CFLAGS)" \
+	-Dldflags="$(HOST_LDFLAGS)"
 
 define HOST_PERL_CONFIGURE_CMDS
 	(cd $(@D); $(HOST_MAKE_ENV) HOSTCC='$(HOSTCC_NOCCACHE)' \
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
