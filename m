Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBE8E8FDD5
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 10:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03D2340631;
	Sat, 27 Dec 2025 10:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzqTDaVVDL5m; Sat, 27 Dec 2025 10:23:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EDF340647
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766830988;
	bh=RJRV1aiSPj/kpUMcv6HccKmOP/i+zQIiGsPvzMahKdc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=PJtRFLQ59iCjQTcQONokphftctENnnD9IFB+KPyEXm1A0ShH0Uahf/zWCWp3ScaY4
	 VBaZxxUBAhMfRq/KG87bV8MAGMKDCmQckN2X5G0dDBs4NiHvOraTH30F4PHj/bOoCw
	 yYocEoVVROEdTKNnguQFcV7D3AQBqde9+5+ksNjc9iHiwdokwaZc/HB8eR0XwZj2Q8
	 zUKzKB95wpz5H4+0l+fhBqj9RrmQ6zArneGC5oShVPRaiWO4y9TbbmdH2Y4ra4sGOu
	 +udSBZR51yRvmcIIiVmRSdOngBnpci2JOs7wO96V2Zr9nrwfSZI1r58xfa5FR+RkgU
	 CLisBRFxq4u0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EDF340647;
	Sat, 27 Dec 2025 10:23:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4011F119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 10:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 319896071D
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 10:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T05VgVK9LmUa for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 10:23:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8112260758
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8112260758
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8112260758
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 10:23:03 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so80932775e9.2
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 02:23:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766830982; x=1767435782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5tD1qe/gKkjcb79Ab/2Y4zcb/eSxcucT0v6OFalc3fw=;
 b=aSi2o9HnnM2rEg3wYlWCZOKpiL4phsZaBxJV0hy+CPYG820jwT6Oo27dAQ/Yr7wcnf
 CR36aW/9bQQsIJH1JshIeb4BbiKA8AUQePGKOz7Lgk5yn//S4N/5UuWv87Oucm+ac8H2
 nDTnQObYthfJQ5ATQf8cxr/woGoAGPgNtimgnY0selikHS9RyHokGC+0RJ8A2J51ycQD
 JkGl/6ZEG6SgU+7S9hMmHUuoItk2ldl4Zyc0pIUqGnlUhIOw4TlSk70kNrDo36695OUO
 0w86IDdQxB/9JRAHbVjbyEeUsfB9bFhFq2utH/repIyyv5zQZiqxf0Si45yokEsN/C1/
 D2ew==
X-Gm-Message-State: AOJu0YyC1/OOIeboA8h3cAcfUHwCQT0tuBmvE2D+IiWL0RYrQvDgttIl
 gJ0RDp4NOSmkWcKmad5LVhWoDoZp3fk4EEznEbymxZYCkzDmY23SKzKb63eIPu9McyaXzDJiliN
 CO4c8CWk=
X-Gm-Gg: AY/fxX4zZC69kQvMPvX9Pujnpr+gww8acgLNrGSiFzy4SJhha8O2zclJhYPYLlT9xLv
 RvLRHrlvu8cjmqwtZyPWDyf0tLFj4Drf/K1kL0jYjxrpl0PT1Sjl9n7ce/5rcr9vC7RDqOsSaf9
 Xj8A0vkRbaowywxEn7/ISYvheMHsqK6N7qM/I7GsJRGjKVeUMDw7dUzaDQcEIAQFcjV7cfvExRm
 aZPC2q23oN2ommoikNkdhS81cCsFZkw5RhimdHk1vB35u97T3F3w51gl3UwAilnrAJfuUIig45o
 ODinrSdMLp9+zCiY9wkrbHdUPokkAep6aZtim/CLDFYbOHN4/V63iDm+6ahDMI3U0V7ZWsXmMc4
 YvypCzhOxoUkKrT0yyRJoJaLKZvT238XqiQdOWZLxWiPcA6jO2c04ZrCHq3sau78OMb2W27IRHP
 LmaIswLIU/KkGOSHywsdS8T8jIGI66sxlRpqCPNweY7o1xROd/I577CXkBgUtHDEzmOLy/6j/ab
 Q==
X-Google-Smtp-Source: AGHT+IEMSH0OwR1w5naiU4hDvmP/il2zi3IqKp+jo4d2M/qJuk6yvl+VN1jwRbNyHdYXrGT9BtCI3A==
X-Received: by 2002:a5d:5f87:0:b0:430:fd84:315a with SMTP id
 ffacd0b85a97d-4324e5061d8mr30936583f8f.39.1766830981596; 
 Sat, 27 Dec 2025 02:23:01 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab33f5sm50499401f8f.41.2025.12.27.02.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 02:23:01 -0800 (PST)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 27 Dec 2025 11:23:00 +0100
Message-ID: <20251227102300.148605-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766830982; x=1767435782; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5tD1qe/gKkjcb79Ab/2Y4zcb/eSxcucT0v6OFalc3fw=;
 b=a/jD2w1oELM/EeR7f6ED+tHOXkaZKILQIiBZ7mwIAp7AfNRwExPGGDbqtiTL67sYeu
 wyQA0wT+TIZMmcyb967WEwwzMcec256D/ZP7mPcNSJQwGsCKPYnXi4R+8uG9sqeLMSfh
 EJM0lXsKx18hgKLHIyC+lpd8MbbtN4hRhwQSw3xeBybFCxpeKtVvaWt+ebs+m0iGyPS6
 ae8HLtoXyF7x8iPF1BX+Bj0yo8x64YJh6zNC0E+UghTSxT23JRFl2pOQNYalZ/VpCIqV
 NQ8JcRSrcvNQzhWwDimvP9tL6IUq0haCWj6XMDCinZK6ca/dWifio6lWFVGjdQgxmbZj
 P1LQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=a/jD2w1o
Subject: [Buildroot] [2025.02.x, PATCH] package/php: bump to v8.3.29
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more information on the release, see:

- https://www.php.net/ChangeLog-8.php#8.3.29
- https://www.php.net/ChangeLog-8.php#8.3.28
- https://www.php.net/ChangeLog-8.php#8.3.27
- https://www.php.net/ChangeLog-8.php#8.3.26
- https://www.php.net/ChangeLog-8.php#8.3.25

Fixes the following security issues:

- CVE-2025-14180

For more information, see:
  - https://github.com/php/php-src/security/advisories/GHSA-8xr5-qppj-gvwj

- CVE-2025-14178

For more information, see:
  - https://github.com/php/php-src/security/advisories/GHSA-h96m-rvf9-jgm2

- CVE-2025-14177

For more information, see:
  - https://github.com/php/php-src/security/advisories/GHSA-3237-qqm7-mfv7

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../php/0006-Sync-headers-installation.patch  | 21 +++++--------------
 package/php/php.hash                          |  2 +-
 package/php/php.mk                            |  2 +-
 3 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/package/php/0006-Sync-headers-installation.patch b/package/php/0006-Sync-headers-installation.patch
index da1c6a6e4c..3c4e6b1779 100644
--- a/package/php/0006-Sync-headers-installation.patch
+++ b/package/php/0006-Sync-headers-installation.patch
@@ -22,9 +22,11 @@ systems by installing only what is intended outside of php-src.
 Closes GH-13210
 Closes GH-13213
 
+Upstream: https://github.com/php/php-src/commit/52dba99d47563f38d8ed5f84690a3cb2c1785475
 [Thomas: minor backporting tweaks]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://github.com/php/php-src/commit/52dba99d47563f38d8ed5f84690a3cb2c1785475
+[tperale: xxhash include fixed in https://github.com/php/php-src/commit/be8819259417d63b389eb9ea6c00abd6aeb8e1c6]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 ---
  ext/date/config.w32        |  2 +-
  ext/dom/config.m4          |  2 +-
@@ -190,26 +192,13 @@ index d38b032efd3..bafbd0b9f8d 100644
 -									'php_hash_murmur.h php_hash_xxhash.h');
 +									'php_hash_murmur.h php_hash_xxhash.h php_hash_fnv.h ' +
 +									'php_hash_joaat.h xxhash/xxhash.h');
-diff --git a/ext/hash/php_hash_xxhash.h b/ext/hash/php_hash_xxhash.h
-index a1e8840ce27..ace70deedb0 100644
---- a/ext/hash/php_hash_xxhash.h
-+++ b/ext/hash/php_hash_xxhash.h
-@@ -18,7 +18,7 @@
- #define PHP_HASH_XXHASH_H
- 
- #define XXH_INLINE_ALL 1
--#include "xxhash.h"
-+#include "xxhash/xxhash.h"
- 
- typedef struct {
- 	XXH32_state_t s;
 diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
 index 3cf400fe962..63221eddb0b 100644
 --- a/ext/iconv/config.m4
 +++ b/ext/iconv/config.m4
-@@ -149,7 +149,7 @@ int main(void) {
+@@ -163,7 +163,7 @@ int main(void) {
  
-     PHP_NEW_EXTENSION(iconv, iconv.c, $ext_shared,, [-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1])
+     PHP_NEW_EXTENSION(iconv, iconv.c, $ext_shared,, [-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -DICONV_CONST=$php_cv_iconv_const])
      PHP_SUBST(ICONV_SHARED_LIBADD)
 -    PHP_INSTALL_HEADERS([ext/iconv/])
 +    PHP_INSTALL_HEADERS([ext/iconv], [php_iconv.h])
diff --git a/package/php/php.hash b/package/php/php.hash
index dbb130f30b..02ebf1b0f6 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  388ee5fd111097e97bae439bff46aec4ea27f816d3f0c2cb5490a41410d44251  php-8.3.24.tar.xz
+sha256  f7950ca034b15a78f5de9f1b22f4d9bad1dd497114d175cb1672a4ca78077af5  php-8.3.29.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 5460f440cb..37dabdcd1a 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.24
+PHP_VERSION = 8.3.29
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
