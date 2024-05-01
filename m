Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA62C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 12:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6382606AA;
	Wed,  1 May 2024 12:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ECarXnYBw68; Wed,  1 May 2024 12:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B649760B70
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B649760B70;
	Wed,  1 May 2024 12:41:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 701F51BF842
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 12:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BF0C81DFF
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 12:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbM5APA9M1Vw for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 12:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56E5781AF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56E5781AF4
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56E5781AF4
 for <buildroot@buildroot.org>; Wed,  1 May 2024 12:41:18 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 6D47635282E7; Wed,  1 May 2024 14:41:14 +0200 (CEST)
Date: Wed, 1 May 2024 14:41:14 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZjI4anypCjkVxtjO@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1714567275; bh=GF7430UjaDoH793l73K/NDvTYH7NW7FE6FlenKCwlqc=;
 h=Date:From:To:Subject:From;
 b=KZRi+cajwxO27FH3vox98SfEdGFDTg60ksZuz8CReSCriCcNJeb51b3F6W37Qwqw3
 wXumFhCu7TA0FkwkrcwIgxViLlJNDFSwO3f0G0QZC8+JrVVhwNMy3A43lNDmSyrK+D
 fe0KmvEaYZRuMTakHopkjuKarBxioKMIzuv7cWGtQt8M7LR3xYRekX+hXVZzyTiU6N
 fkdpGSnfjswUcXOR/sAS9QlmNPRkg5Co1Q/A1H+bk/WkZWCbnP9alfaf3QeOylnL6G
 ZCRZe8+G9x6Tn9Qg8V0vzsq54sB5+Lkjkq5YI4h5NTjEtUp225wEsR7XxdIMaiFgE5
 ewKgvLMRbwJnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=KZRi+caj
Subject: [Buildroot] [PATCH v2] package/asterisk: fix compile issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix a compile issue when libyuv and libjpeg is enabled.
Detection of following function fails:
checking for pjsip_dlg_create_uas_and_inc_lock in -lpjsip... no

In config.log you see that libjpeg is missing.

Fixes:
 http://autobuild.buildroot.net/results/7bed9fc68fc9331ad12942c3eab9742ee8a7a4c4

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 v1->v2: package libjpeg must be enabled, too
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 33d2e78bcf..c37aa5ec9d 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -113,9 +113,15 @@ ASTERISK_CONF_ENV = \
 
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-ASTERISK_CONF_ENV += LIBS="-latomic"
+ASTERISK_LIBS += -latomic
 endif
 
+ifeq ($(BR2_PACKAGE_LIBYUV)$(BR2_PACKAGE_JPEG),yy)
+ASTERISK_LIBS += -ljpeg
+endif
+
+ASTERISK_CONF_ENV += LIBS="$(ASTERISK_LIBS)"
+
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 ASTERISK_CONF_OPTS += --with-execinfo
 else
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
