Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DE7C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 08:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55938409C4;
	Sat,  4 Jul 2026 08:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHNiIq3x-P7K; Sat,  4 Jul 2026 08:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 596EF409A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783155177;
	bh=1Ythyfl5XsgCZfy/MaOcH9eErc4PYxh6v9Rw7LHgew4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=en6Y+O76IbSfhVttRFfNsU6IVA52sARr12igoT27uFInFM+O8e/feAt8mrtaCDlsb
	 tUruscxS5KB25WGeyPON/bO3RjY2Usim613OigDdPG0SaqtkxuLr3MfAE8FftIxPwb
	 lcjoV0J5LxiYbnh0iJZjObKz65VoHSTJ1IyZXBAHnzSHW1Mx/zb/G2jj8bpjK/jyIG
	 WSdhC3dgD4ExYPlVMAN0xRVYWwi0ag/6zQZ+sE93+VLUat+TJ8znJSblN3PJ7z4okQ
	 c4jod8kRdqHA3kgwW8GKzQk5MoMINr1BUuVpyYV5wRUVG7v58vKsbd6iixlf/94Rsz
	 +PzXFe2a2BBwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 596EF409A7;
	Sat,  4 Jul 2026 08:52:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DBAE363
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 08:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 208FA606E2
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 08:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtCOHBcHXKsg for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 08:52:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE380606DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE380606DC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE380606DC
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 08:52:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6AA75A4C07F5
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 10:52:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53940)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfw76-000000001Nv-0Bay
 for buildroot@buildroot.org; Sat, 04 Jul 2026 08:52:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  4 Jul 2026 10:52:38 +0200
Message-ID: <20260704085239.2901837-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783155160;
 bh=kTjbagUsI0EIKp3fngCMojQJGOwYA6eO3O7vG30zijk=;
 h=From:To:Subject:Date:From;
 b=A1/6OPxmAniOi9sTfadL+XEe1zxFqadWhFj6GFWPfJ1apWaRpLsbJgnnW16Lj843q
 0sEwzEC2OHq/NB777vIvA/pEdvwGdDiDfZZfsG7b4xRbEqaHog/OUxkDkttci7snN6
 uqdncEIndVljni8looCRoVT2GX9QU+0cs2gPlQ7M+apXq6up0z573aWb4/rIVwqo5p
 XQdhbr9I6HnjIqcBvyyOxc0F2S+SXl7xK6Q5Bj3jlhRUw7TWewO7DvBaYjRL1V3n8M
 S/X+ypy8eS793gqjsSwscBgKjPwU2a5mjYmRGcgt27Orw+Tz0UjUQfVu87RI2GsYp/
 +k2bcXBWSK4GQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=A1/6OPxm
Subject: [Buildroot] [PATCH 1/2] package/samba4: fix build on m68k
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

samba4 uses very big switch statements, which causes the build to fail
on m68k, because the offsets there are only 16-bit.

We fix that by using -mlong-jump-table-offsets on m68k to use 32-bit
offsets for switch statements, but this is only available starting with
gcc 7 [0] [1].

Only one package selects samba4, mpd, but it already depends on gcc
>= 12. As such, we do not need to propagate that new dependency.

Fixes:
https://autobuild.buildroot.net/results/b60/b606da691bb462879d4f9769928b5a40b9170837/

[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57583#c15
[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57583#c16

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/00a09b88bb7905e5daf558adf59cbb13a05e05dc

 package/samba4/Config.in | 5 +++++
 package/samba4/samba4.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index e1d3dd9bf7..59f040e96a 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -4,6 +4,10 @@ comment "samba4 needs a uClibc or glibc toolchain w/ wchar, dynamic library, NPT
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU
 
+comment "samba4 needs a toolchain w/ gcc >= 7"
+	depends on BR2_m68k
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+
 config BR2_PACKAGE_SAMBA4
 	bool "samba4"
 	depends on BR2_USE_MMU # fork()
@@ -12,6 +16,7 @@ config BR2_PACKAGE_SAMBA4
 	depends on !BR2_STATIC_LIBS # cmocka, python, gnutls
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_m68k || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # m68k needs gcc >= 7.x
 	select BR2_PACKAGE_CMOCKA
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_GNUTLS
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 2d6bc80b9e..006fbff6c5 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -32,6 +32,11 @@ SAMBA4_CONF_ENV = \
 	XSLTPROC=false \
 	WAF_NO_PREFORK=1
 
+# m68k needs 32-bit offsets in switch tables to build
+ifeq ($(BR2_m68k),y)
+SAMBA4_CFLAGS += -mlong-jump-table-offsets
+endif
+
 SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python3"
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 SAMBA4_PYTHON += PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
