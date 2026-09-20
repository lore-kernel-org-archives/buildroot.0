Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538D5C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 299E580C13;
	Sun, 20 Sep 2026 14:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qIoYCEzqmSmg; Sun, 20 Sep 2026 14:57:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E2B98809EE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916235;
	b=KvfTCGTNCtGBPSikuE+TZAFIJgGpu7ja0SkeRdyWMhy0Fx1T52/mBHE0XnzZL6CMHKoq
	 SovUERjxbUb8Y5LvAUJzN3OYgLdB+jRcWbDcf4a+xKrpQ9uk/ky6MK28ntFWUwfKEPK74
	 8CzXwqYVIP9cZXVrlZ5IODOCSt5qFdg4kZexAOGYXVW7wUQhpqIMMUTb0kmvL1NYKKTjc
	 oeKIzsK7Q0kxlBa2Be5R7+TD3WiWs981G9uVS4F/Ku4GFepQEacIny2ubBC4pMJUa3pkT
	 bDdTNEILnhjz9BE6j3Vog2NxsmsPeehNHCo3/J1wnLLaeBi9d2UxqbEp+cTiwYZceqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916235;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HOaNpBA2TvDkLa/xAYN26a7XAMNIUziPUfu/qdRNHec=;
	b=JlebZ753feIjq5QJhK4W3y/o5obSEKBHmoXCAAwjsAP4/+W6PerH1hpVHxKk+cKKs5+0
	 L4sKKeKkUScTlWMhlwnIP+qXOn9YQUfDKge7stYmEkAbk8nfwhdTnrx5LakxGRd/jAjIo
	 4c3CJQwX8lgL5RH0Scp/N8EuBb8aKICBXKpCsTS1H7/UM2rlts3DIMUQjID4TYvG4erRH
	 mmMHsbaY+M0am4MuMv1b8G2H8B/UT68OeWBmnTI53tyZmzZKWzxCCsXuypGg4aDDnAc+U
	 gmkhhgaqemwyyRnZ9ND7kv4r8nZtnsdUmGGlkecIx3wsMPSnyJMaLwVfwYG/rXZcHgQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916235;
	bh=HOaNpBA2TvDkLa/xAYN26a7XAMNIUziPUfu/qdRNHec=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JkZfB/lWII1HV8Ki3QOECI1ff6IG3Cxag/228sXjPeS/qHm84jBonJBemkbz/yMDe
	 MvsmyCTm9P6vOqVJrPUSr5jbXBU+xfWBBRAGvcypSEV5ealQlzXCZ5fe+fKA33rZJ1
	 0I9beBFk6UYf2AUVjqRxnHnFVz/ZG7pvK/WR5LK5UiDwhKBaT5flWvqxE6zfuA9PM3
	 fjsDFZ5jYKBs/wAHESjQFjMkqMuJOIq8tlm+OYMMuZct83O8uJvNhJl3jkQ1v537fX
	 2GzrqP8c06EVKQejSJ72sriypYLn0IKYYG8Q5d8qwdSCcVNYvws4/8r/GvEVGl+4sv
	 +gtDuTHPtjU0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2B98809EE;
	Sun, 20 Sep 2026 14:57:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7013A24D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61EA860767
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2k9Q4AhPhiw for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:57:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 267676073D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916232;
 b=fh6aMpKUbtFT5xt2KVttmqFhWr1cIn1kw4J1wDxtx80jJLkvIOEZDXt5mmr9piEWmX0T
 //oJN75JP9KL2y7jaAfJAqu86VIjwsIDK06P+fUHJTSt4mCeck7/18bW0wiG8XjJWX1Vw
 lYiMy5+LsOsYKqK8DEivJ8KxxBEH9OJzDGzcR8OQRpknvUfpQur6v77gpTXKLxUW10gRT
 lkpw4PA0w308E2Ov2weL4puPieXRrT0krmW1SX5vDUUvUSovT3gbxNvFmjGmAwjNgFS22
 dNacovWhLENfuf5yliOqvGrdMX9wBtdonazz2IJrjihVGATwyAqO3JHpOp5iKb3tZVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916232;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=IJC03tXGgJw0D4V9eMbZfpkefgypuWN7oU55xSEMQhI=;
 b=JgydZBokaCxYxb0JcpdXeTIMHcGUA+LWi8RgzAXV9XWc9JXWqhRW/r8AseWkqbfQjDFQ
 rXpGGxm3sgZRQHXw9fzwL1jcknziG1NZDa8k9+0gr/RPIJu65FNLMg331mvAJtyvA/df0
 3hIrBC5ZJc+ozeVHelaEwxu1NZ/vJ8nNGMFElOT1QDTCBkm0VdksVjeAhdsIn5yu53qSk
 +EEbUdQ/Nim0mo14k/79XHbgUDDoMNL7v0FrTxG+KeUp+JuudXfmltgmrnA3GDkmXSl2d
 JLdKVs0rbXkMfdAI+hDVN+uuYDGk3yrY8/PZyf8BoTG0p/BuuS6juA4uTizTWskhjow==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CySMLx9P; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=CySMLx9P
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 267676073D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915506;
 bh=IJC03tXGgJw0D4V9eMbZfpkefgypuWN7oU55xSEMQhI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=CySMLx9PSlFPA1f6ZFP1HSnuLBnNeEw+j3NQuFrddNaD7pDD0xdLDalqk9E7maQkk
 fbm3dwrrDm3pzhGrRrIqtLdoTPTuYciXjy+5oVn6Pf/MzrHqbw+imVrVZmQMvy1kdu
 c0kWyu6da1Rt/PeFjtkmTvgusRNTD/hGQPfXPd+rvZA3PD8bUvtzPjhDBDUnVyOLks
 a7ud6gsmXv3w1byrpn2cshU3Tu/HfX1wjJIyy5rUFz4UuTlahS76JmdCBGjVKK3a5V
 nkNIACSxHmnUUlX8HwDNr7TVB4d9rEZ0KwzpY6UGKPI+QgX0YMqNseu2jMUpFgAfay
 Ex7OHVUq8XGCQ==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:NxKSICkX7KOAsiyO29WbETULiVq1qSpE7UwElwzj4Kj0n+um1/L9HlC/n2thVSlTosgwjmbss8l+rWn6Mbw8q1RN4MfcElZ/IFhyME460+m4goVuCcOEaMhTFWzEL+7Fww+2CDmVdVzsU57TVM3FlC9piLY/9aqgyZ1e2c6IncE0YteAJ04BLzUp6y6TSt25/BHhzwxW2sJa+E57GLE0l3lHhZzznIxkHiwlSDwhOthMkubdnSmkIfs0BSzFdFnwX3sh+SVnQlsZCuTjwZRamatMI4oO8RpWX0azXju/nXD6lAOj+DbHSK8030IPezU2ea61xfke0n+3po1AKMS0i3o3TU4Nh1NW+79pfvBzAz+Q+ElNzJ7S4EqHo14oUtHD6fCWMiAKhXRacE7bRbo7POPlZK1xu6oNL8zS+oOgW4Uyt8lPgHwNWbFZUQigDNeoDN99yhKCSEe1JWpRHSvBegriJusQwm9fQvWlOsqt934B1nKbH5fAGzroep529sK2CW59sn44S/gkRUYbcLIx3g6V0Pw/ONfPgv9SkeMtNwgImtkDSUyud65All0ORkltji8wsT05R/FHZbFGEajCgTFj7xZCKuY=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2E83EA4C48B3
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imn-000000000hB-3Tpw
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:24 +0200
Message-ID: <20260920144428.3009612-64-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 63/66] package/uboot-tools: Fix build with
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
