Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C435C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42DE540CF0;
	Sat, 19 Sep 2026 16:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9BtR8Ie_pkH; Sat, 19 Sep 2026 16:14:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 327A840D38
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834471;
	b=fMeb3RpbmZQBeA6JEkiLCzNtOKmas7Pwa9sz+zbEtL9mLK0CWePxUMVZbEbFOJwGaFuV
	 cwqmJQNpo20pG6z0YFzBOANXagF9z/z9ZhC1zsj3ZJI/o91cfKMGC8QIsIbCIZTe/M7mr
	 tBEJajcebaituLGiNRDpbLxGoYv72BZwxOofyzwqCmERdAMn8GfKL/TINumh3OUxEypC0
	 8K9zekV8NVLJIF3K6Rvz/MDadKQ8jbJ5CkF4x9EHKqiqxHgags1c3wUmCx9x1tGQsqHHB
	 K4uFgZemkvDqK3GfK3zhYkj99/C0sFfQ5EbiUfHp8f9ymKAU/rV4vYV2hM41HA6Mj6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834471;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HOaNpBA2TvDkLa/xAYN26a7XAMNIUziPUfu/qdRNHec=;
	b=BfMqV8fZ60dUaYsST/0CPHEzL5vp8iwbpM+7pTTlhY/3gwo4XATcE+jvQGgy1Nh/dzcM
	 m07jmte4QKbgW8trP8OjLIV3ZzPZVfjR0XD077OfN2uKcqvKL5jaZMmjKgP/OLwxo1qjw
	 Wex9FRz5Mqysauc9WCoQSBEuSCep7LCEfvR/085jrYp9EpDWK3DgA6qjjvm5VFMDDNaiB
	 6tVJXJW+GbWjvsaKPKTxLB7iv+Aekt3/sfkNSqEOHZWk//oAOdT2dZ83OJ8w5DTgO4zgM
	 Z8Cc6wWpLjAKBO9IWZ9IJ48hcWrORRuc022TkF+2ie14xGDB4y1AR/5O00tR5WHl+3Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jTdeg1Al;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834471;
	bh=HOaNpBA2TvDkLa/xAYN26a7XAMNIUziPUfu/qdRNHec=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RiJhgp6r7pTIgbEIQMIRmG7wPWR2GPh9j8LDIIihhhJRhF+MRQVJ5JmnhViPrtm+i
	 HsCvFJ0mFgHuTFo8gvMLiNdD+/B6T1JCl6ncLiGfl36B+UyG5GIfbx91y0I5HW8jF1
	 dVhrfFMECxJ9rKgcI+5t0Z8MugR/OEnja8oFBTTdtrgXbnZQXMB/+0ObXvaBNk1D/D
	 ghXdSf6oLszv8mGEelmGq7WsJVkq/0DgWywH289QReAR4YS9YWFK92ZZzG5r2FVClR
	 pGTi8anvTu45wqBHmQrrfYsNguXKfJSGrItMdKgLwhmKUnXYKzGefN59KIrDw2t9/s
	 Iuf5QMpftV5PA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 327A840D38;
	Sat, 19 Sep 2026 16:14:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B954333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01B6B40CF0
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RLruu_paLHr for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:14:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BEFEC40D38
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834469;
 b=OQh/9erAx25N2zMAr16LX+G7euuNE00CfJIPOgdAreGSve/mMFXYSEif6+IopDhhDDcL
 7l4uvO3z245spRB+1Qf+apdaVMpBg46Qv40uhhrhf31jrM4MBitfncYXG26cGUuREbglH
 O+wEcY1l0KQDR457V/0DlVFKlua0Uuv+ilyQs9T/3u3HZ0u0HrmwmZ+yIkppkNqFqxUWO
 bpM16BmICl+9HZiwjbQb6xwOF21Di1l0o7DivmZKTkEaqLdo6k/x2miAx0XVzvrp+Lw2d
 eXuhxAV3HkwV8HtWIfDzP6okzLa3U3f04zn5/rSnl+CG9fUeM2Dk4a3W/J8eSaiK7pg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834469;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=IJC03tXGgJw0D4V9eMbZfpkefgypuWN7oU55xSEMQhI=;
 b=kcUWD/FTcvjd34uAnDLmrYDc3y/l2bIOC93jnaUTSL6pp/L9tM3s6Ceqx/RqSqPyDd4e
 oXSAdnKBstWwb4yG4ECa4rYa7JvSMDXUWOjL/yoUJpNv+VoESWWd/sSs1f+XOV1mp8+Ff
 6aoUXly8oxt6Sa4PIPJhqbrGXO08cm2RUObuw3N+Php5rUple1C5HSAQ+tA1Dv6tSwFlD
 beyJYGsj5pQoA5xOFzuwmrQMYSoZh8C0+mzO7Vtl+FIJv7k7JwXEq1oqRkc4JKZylqoDx
 ROqEmC+qMpgUQQZzue/cAlLXGDegbgRtpH7ZIHqnLrd7OuZSitPsnDoq404gx/2IseQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jTdeg1Al; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jTdeg1Al
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BEFEC40D38
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833559;
 bh=IJC03tXGgJw0D4V9eMbZfpkefgypuWN7oU55xSEMQhI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jTdeg1AltP3jfAV6C1FhIVFPvGwV4Yf/RpcHZjnnVFGEmg5L+GAtNkIFeSh0eUcrD
 zJQRlbVdwyJFfQVfA/Lt/10Fg2J1f2Ms4iEUWVgfdfKfKf9aOzMelQpBeGs44Q1wHh
 jVX9iSKkI5hATp5T1DmLJ0lZlGBVJqBOfc5PDt46FDBKm4KT9KW97kuvFXKShZpmly
 xcbWMmnJuH1M9i1EQjwV4njoVv+q5V9ZFumF1MZgizzQ+qbt4cSHUe31aU2hiFXeGC
 gT1Ptfr8JsnJELYG/5nRb3JGXHxxxTv1Hqm1veKq5p99wnqc9dCYpEeOuh8L6h+6nI
 ZbgYWCUOImtKg==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:MviKH1h+neTYt+hf84OGS3Y6IhVCNJJkhztiyl9zkW0hJCPs6cYonNsLQpOqQ3cOMEqAraqolyEy/Yz5JfTJ4bMDLBA1JQIZLUhkrJI+Imt7N+lNfR45WO1bA+cDApceYtX4gdbFocHSVVnm6F3PWMd3f9mSHxiwpRvKCiVRJnQNhnW65IOxuI89Ii8sE2VXiqhkij/CTF5t0AbpDlJLh7NDj7JDciWiFcprGsW6aaSROhcDZ9Xo5toNkHrjFI4UXFtMMCPoyRWmh0sPdpvVrfhVJDqHBD0sWTqIBNfXQJ8aOzSZFbJo7BAJ682YvUbPuzt8kucGEbtAaDwLP/MvrCi6mp1bvW9OGAALUrYz5ZJXkY1ysuxnEKJc8QHKXa8sQ3d79W7A95gN2CF86EJfDOB3YHpE9wtLx4ILELwn54rP5YvVXJnwoI/LmgUB0+ql0BJNJWYv2kFPNmBOyG+gnFKxp8r1+wWe0YsGHoX4uveQfLm4yvMFZ84Diqjljju3uDjYBnw5tNIpUrC0fuqV0wuDnP2MFxIiVtTaEYVhPwP2AoklQnidSOgRJqmJP8lIr3EOc2vf6iqyUQXMZml6eBHlmBZqLFsY2wuiHq5HrzRsIn
 apUONJWprvYv5xT9D7LDqpFzFVLGy6T1Wi0tDAmp5onWr7K78hBReXr2nP0drCxYRfxdfQ
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5C94AA4C4860;
 Sat, 19 Sep 2026 17:59:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSx-000000005Jx-0KMx;
 Sat, 19 Sep 2026 15:59:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:39 +0200
Message-ID: <20260919155845.5776-75-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 74/77] package/uboot-tools: Fix build with
 OpenSSL 4.0.0
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...Add-support-for-OpenSSL-Provider-API.patch | 304 ++++++++++++++++++
 1 file changed, 304 insertions(+)
 create mode 100644 package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch

diff --git a/package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch b/package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch
new file mode 100644
index 0000000000..9a5071cae3
--- /dev/null
+++ b/package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch
@@ -0,0 +1,304 @@
+From 9f78e701fa5a4faf69119d9fe1e485e76de2fe3b Mon Sep 17 00:00:00 2001
+From: Eddie Kovsky <ewk@edkovsky.org>
+Date: Mon, 23 Feb 2026 09:43:22 -0700
+Subject: [PATCH] Add support for OpenSSL Provider API
+
+The Engine API has been deprecated since the release of OpenSSL 3.0. End
+users have been advised to migrate to the new Provider interface.
+Several distributions have already removed support for engines, which is
+preventing U-Boot from being compiled in those environments.
+
+Add support for the Provider API while continuing to support the existing
+Engine API on distros shipping older releases of OpenSSL.
+
+This is based on similar work contributed by Jan Stancek updating Linux
+to use the Provider interface.
+
+    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
+    Author: Jan Stancek <jstancek@redhat.com>
+    Date:   Fri Sep 20 19:52:48 2024 +0300
+
+        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
+
+The changes have been tested with the FIT signature verification vboot
+tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
+Engine library installed and with the Provider API.
+
+Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
+
+Upstream: https://github.com/u-boot/u-boot/pull/918
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/aes/aes-encrypt.c |   4 +-
+ lib/rsa/rsa-sign.c    | 102 +++++++++++++++++++++++++++++++++++++++---
+ 2 files changed, 100 insertions(+), 6 deletions(-)
+
+diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
+index 90e1407b4f0..4fc4ce23247 100644
+--- a/lib/aes/aes-encrypt.c
++++ b/lib/aes/aes-encrypt.c
+@@ -16,7 +16,9 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++# include <openssl/engine.h>
++#endif
+ #include <uboot_aes.h>
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x10000000L
+diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
+index 0e38c9e802f..f456f3c58e6 100644
+--- a/lib/rsa/rsa-sign.c
++++ b/lib/rsa/rsa-sign.c
+@@ -19,7 +19,47 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if OPENSSL_VERSION_MAJOR >= 3
++# define USE_PKCS11_PROVIDER
++# include <err.h>
++# include <openssl/provider.h>
++# include <openssl/store.h>
++#else
++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++#  define USE_PKCS11_ENGINE
++#  include <openssl/engine.h>
++# endif
++#endif
++
++#ifdef USE_PKCS11_PROVIDER
++#define ERR(cond, fmt, ...)				\
++	do {						\
++		bool __cond = (cond);			\
++		drain_openssl_errors(__LINE__, 0);	\
++		if (__cond) {				\
++			errx(1, fmt, ## __VA_ARGS__);	\
++		}					\
++	} while (0)
++
++static void drain_openssl_errors(int l, int silent)
++{
++	const char *file;
++	char buf[120];
++	int e, line;
++
++	if (ERR_peek_error() == 0)
++		return;
++	if (!silent)
++		fprintf(stderr, "At main.c:%d:\n", l);
++
++	while ((e = ERR_peek_error_line(&file, &line))) {
++		ERR_error_string(e, buf);
++		if (!silent)
++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
++		ERR_get_error();
++	}
++}
++#endif
+ 
+ static int rsa_err(const char *msg)
+ {
+@@ -94,10 +134,11 @@ err_cert:
+  *
+  * @keydir:	Key prefix
+  * @name	Name of key
+- * @engine	Engine to use
++ * @engine	Engine to use or NULL when using pkcs11 provider
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 				  ENGINE *engine, EVP_PKEY **evpp)
+ {
+@@ -157,21 +198,24 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * rsa_get_pub_key() - read a public key
+  *
+  * @keydir:	Directory containing the key (PEM file) or key prefix (engine)
+  * @name	Name of key file (will have a .crt extension)
+- * @engine	Engine to use
++ * @engine	Engine to use or NULL when using pkcs11 provider
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
+ static int rsa_get_pub_key(const char *keydir, const char *name,
+ 			   ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
++#endif
+ 	return rsa_pem_get_pub_key(keydir, name, evpp);
+ }
+ 
+@@ -207,13 +251,44 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+ 		return -ENOENT;
+ 	}
+ 
++#ifdef USE_PKCS11_PROVIDER
++	EVP_PKEY *private_key = NULL;
++	OSSL_STORE_CTX *store;
++
++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
++		ERR(1, "OSSL_PROVIDER_try_load(pkcs11)");
++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
++		ERR(1, "OSSL_PROVIDER_try_load(default)");
++
++	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
++	ERR(!store, "OSSL_STORE_open");
++
++	while (!OSSL_STORE_eof(store)) {
++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
++
++		if (!info) {
++			drain_openssl_errors(__LINE__, 0);
++			continue;
++		}
++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
++			private_key = OSSL_STORE_INFO_get1_PKEY(info);
++			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
++		}
++		OSSL_STORE_INFO_free(info);
++		if (private_key)
++			break;
++	}
++	OSSL_STORE_close(store);
++
++	*evpp = private_key;
++#else
+ 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
+ 		rsa_err("Failure reading private key");
+ 		fclose(f);
+ 		return -EPROTO;
+ 	}
+ 	fclose(f);
+-
++#endif
+ 	return 0;
+ }
+ 
+@@ -226,6 +301,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 				   const char *keyfile,
+ 				   ENGINE *engine, EVP_PKEY **evpp)
+@@ -293,22 +369,25 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * rsa_get_priv_key() - read a private key
+  *
+  * @keydir:	Directory containing the key (PEM file) or key prefix (engine)
+  * @name	Name of key
+- * @engine	Engine to use for signing
++ * @engine	Engine to use or NULL when using pkcs11 provider
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
+ static int rsa_get_priv_key(const char *keydir, const char *name,
+ 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
+ 					       evpp);
++#endif
+ 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
+ }
+ 
+@@ -325,6 +404,7 @@ static int rsa_init(void)
+ 	return 0;
+ }
+ 
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_init(const char *engine_id, ENGINE **pe)
+ {
+ 	const char *key_pass;
+@@ -380,6 +460,7 @@ static void rsa_engine_remove(ENGINE *e)
+ 		ENGINE_free(e);
+ 	}
+ }
++#endif
+ 
+ static int rsa_sign_with_key(EVP_PKEY *pkey, struct padding_algo *padding_algo,
+ 			     struct checksum_algo *checksum_algo,
+@@ -480,11 +561,13 @@ int rsa_sign(struct image_sign_info *info,
+ 	if (ret)
+ 		return ret;
+ 
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret = rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 
+ 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
+ 			       e, &pkey);
+@@ -496,16 +579,21 @@ int rsa_sign(struct image_sign_info *info,
+ 		goto err_sign;
+ 
+ 	EVP_PKEY_free(pkey);
++
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 
+ 	return ret;
+ 
+ err_sign:
+ 	EVP_PKEY_free(pkey);
+ err_priv:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 	return ret;
+ }
+ 
+@@ -645,11 +733,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
+ 	ENGINE *e = NULL;
+ 
+ 	debug("%s: Getting verification data\n", __func__);
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret = rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
+ 	if (ret)
+ 		goto err_get_pub_key;
+@@ -726,8 +816,10 @@ done:
+ err_get_params:
+ 	EVP_PKEY_free(pkey);
+ err_get_pub_key:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 
+ 	if (ret)
+ 		return ret;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
