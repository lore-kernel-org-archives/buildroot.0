Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BBBC55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 06:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2C9340819;
	Sat,  8 Aug 2026 06:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_0adTicZT_o; Sat,  8 Aug 2026 06:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5971B40807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786169163;
	bh=26ZcjuJjAvv/KoQ+20G/Gf8VjJNmB5LbJL59lDU4m1Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sX8ueRlvBp2Wt7cnQXpRnpTsvZbrW9tn8HmGbH9KpovBUGq0HOqet+HikSyu8X0mO
	 sF6w7C1PnitTjwIdq4UsSGsmkywG+jf/o0EjoHHKucY1MIvOB95DOqeTVABHiD+t+M
	 HaVdrBfrKUi5FHYPVoiiDqTtakIwV/BCrhf5g58qpT5t+pOEJ1GJMVvAv45M2Mv2uZ
	 2cuDjOD7u6SaOJYhvxM1UGgsqGYTFxe4lNslR1E5304qrG8T4srMMfszACuoMMvGAm
	 X64lwK9+F+T6rAkdZsoE60pCubAQbGZUsM6H1QQLz7nIaJU9TtR2vtYcmvjVshJVbM
	 SvBiu8rCeM8CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5971B40807;
	Sat,  8 Aug 2026 06:06:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 477F12B6
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 06:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2445F40126
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 06:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EbQE8Fswbil for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 06:06:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D3DC40056
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D3DC40056
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D3DC40056
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 06:05:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c228.dip0.t-ipconnect.de [79.214.194.40])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 920AAA4C205F
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 08:05:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44262)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wsaBv-000000004VF-3u0Z
 for buildroot@buildroot.org; Sat, 08 Aug 2026 06:05:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Aug 2026 08:05:56 +0200
Message-ID: <20260808060556.4358-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786169156;
 bh=JUJQK5vxP8qEA6XMd9D60s+KFUAnHP7D9ihNzI9FIxg=;
 h=From:To:Subject:Date:From;
 b=VP+Srs+KsUy7JWay2jKu5FVE/crL43y1R864y4p4+Ny7BX/OAe1zbnWtYIREa+Cmy
 Hiiw/LOL2WtexXbWAQokxXDfaqldQDGwr55j/tQm9luc1oJ6TOubvjPemGwwupz2KX
 Kz3DeW6QlF8iQVERn8/513flvvC0cExilosIJLu8MkcQ2k4cJXEDXJ/jwrvlswSOh9
 DOLyQSh578v7DAFQXW66VTS98WpqJ0XicIC+EkvTJY1EG4fav4abzuer865E2yZ6W8
 sTn+xD+jdSocoXfr1lczCjblvtGgr4YgYST0OEWhwidFbw2GmmK+Vh0cLCfKpJGQOB
 FRkMhc0qQVF9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VP+Srs+K
Subject: [Buildroot] [PATCH 1/1] package/php: fix OpenSSL detection for SNMP
 extension
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

Buildroot commit a9e5cf6ac2cb7ba62d23c842899b3f7816eca14c bumped the
package to version 8.4.13 which added upstream commit:
https://github.com/php/php-src/commit/dbdc79df954a22495d0939eceb3ab4e09ced1c1e
introducing changes for netsnmp detection.

Since this bump building php with its SNMP extension enabled and openssl
globally disabled is broken:

/home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 ext/snmp/snmp.o: in function `snmp_session_set_security':
snmp.c:(.text+0x677): undefined reference to `usmHMAC384SHA512AuthProtocol'
/home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 snmp.c:(.text+0x9c2): undefined reference to `usmHMAC192SHA256AuthProtocol'

because php configure misdetects the presence of openssl support in
netsnmp although it is not present.

To fix the problem we add some autoconf variables to forcefully disable
OpenSSL support in the SNMP extension when OpenSSL is disabled.

The build error could be reproduced with php 8.4.17 but could not be
reproduced with php 8.3.24 so a backport to LTS branches should be
considered.

To reproduce the build error this minimal defconfig can be used:
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_PHP=y
BR2_PACKAGE_PHP_EXT_SNMP=y

Fixes:
https://autobuild.buildroot.org/results/45c9271bf504c8f241544806ad52b82d6efb711a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/3f95ee27031eb6f7bbe082f3a65e398f6882e77a

 package/php/php.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 05eb4b9092..5e2ff442cb 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -294,6 +294,11 @@ endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_SNMP),y)
 PHP_CONF_OPTS += --with-snmp=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += netsnmp
+ifeq ($(BR2_PACKAGE_OPENSSL),)
+PHP_CONF_ENV += \
+	ac_cv_have_decl_usmHMAC192SHA256AuthProtocol=no \
+	ac_cv_have_decl_usmHMAC384SHA512AuthProtocol=no
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GD),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
