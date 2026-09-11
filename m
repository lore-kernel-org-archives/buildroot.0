Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417A0C88E53
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 21:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEFC66060C;
	Fri, 11 Sep 2026 21:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCu0AZOUFb12; Fri, 11 Sep 2026 21:14:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ED51D60613
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789161256;
	b=R5FsNbPGrJjjDSaJwJ/fths0doo5LTIi/0O9YvAq0yAXTxLYnfp2xzlDc8a8gM81/OE5
	 gn/3z1UyJvsP8nWbcNwDX9Z4hMXRK5uiu+kdX0BNoHRqTV5wtzEzoVlVjavLJxy/ipUir
	 QpvtJcta1MpGR6JzJQQrrFeOPtQ4kQiclF+TO5mnrfImS9Ugl9hEZmxtxe8aAGFT7RrT1
	 mFUqicQFrlhlxUfeN9wSAbPy/IwfIubw6TpJKLarsUoPvwtmivlu/SW950NYh2zvDxqN9
	 0IA1FryOxLnVdR7gi71rZAXvf6WJPQYi4SeeWrsXUjPnpFremEuibV8+b8NOk7IuyHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789161256;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=GVO9xItJoamcn2m8MyM16tLoUqPzjHGcb2p/EWoAXjk=;
	b=k1tUmSjJQsAsQmeATT2qFxdHwhk/WUW9rFkgWrH01Zy0/F2i3d47jr5WhjDw+9575p1s
	 yyLUmfxr/DtL8H5Wv0o03RqvvdVMlWQipibXd2WEDqs9G0bkmmKHX976Oo0S2LVRck9RJ
	 Mr3PFQ0ttXGpBty4/+IqHlqdduW3JK50n6qdWS9+g3IBZEsfrn6k0BNg2VXCmNb/wSgnt
	 mTPCaWKW4p+7KpA7ZABLAlxhwpQgGRymMkUocEdPkQCBP+z+RErgsBdiVbYUntI4gxQBP
	 O2eK/pWOHlmEuxf9E2m5oiQGA5b7X5QmJvw2Am70bPKNi/EDTfbutuP4LNsnTUqGlpA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="lE5/ZpC5";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789161256;
	bh=GVO9xItJoamcn2m8MyM16tLoUqPzjHGcb2p/EWoAXjk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hdt6aU6Crpnos+etT5xokcwDlakAnCMK5YwEsnV/yBrt22/YEwhWRFLZV94eG1rT+
	 dpyyG/j81uIrC9Lv/4i1GgljLGDu4E4WBSiyKmb+lTz/SZ149rkfmeAOYxgQ4vIIzQ
	 v5cXjeGDlrlRahSyylMeYQp8ZxpXH2zAawSNGLW9C4elT6qVIM+ZpbJRbKQ4okPWMX
	 vvxfJj7R6Xo41ERs37iMZ1yCCr1JIwqN/KeZbphABzeq5VCSV3bjPJ4m8B6S+WlKkh
	 74mr1K/nLzDjRgtkf3XrZvks5YXX0VkRJZJ3N3fV2ll3QkRe5fzJa6nk6rH0mIl4e7
	 Dj4dEQezrEzsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED51D60613;
	Fri, 11 Sep 2026 21:14:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E55887AB
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 21:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB6E360613
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 21:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LF8zTBaSu6_G for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 21:14:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B525E6060C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789161253;
 b=nz7M35W7+Xzk3KgEzZRxh6+GUBsQtwPD4vGGF/o7RXtRLI5TLHQVCBLu3rZYV5GRGrK7
 3QEmFn5aGGAYSr/IFb9fevJQZxrzAHiE+vCFc53QfUuZT1r/Mjz8SspXf8ljLO6UAFTF+
 kOUaCIr23vP3cUpfL1rllKYFDun9v7yNvSaWjVCptSsf45Du0TlsBxreFSY1GBbLAKz5K
 BFpoZMa+GKukSaObFlJrd70Z/nssbBfiIl2Z/4TGX+4Xym/WLT2fcBKBdgiGoc/M/hYf3
 NaWrmuZEOlpd6+TMQn9sDUAAZ2w19UoM2XTcClvGZW1qh8FpZTzGorWrTNUeKCSNcbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789161253;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=G/4BjK8+0xVxbMksieNusmQAALRSFIaRP+ycvqugBuU=;
 b=j27niOrYJUv8YkOwIE6QSeWIv/DgMR3mMBPdnJiobpcdcR3AXbttYxqILunWXIgWiGjx
 zQmQWNW9ChUOkIMKOcCdFKapj4D1L/t/zN9ltdZ/kCr9nG5PEB9wq9p/jUxK02HSkyM9j
 3yGJm/95DKLHwpTnsvu/pZAcQcno3Aoq6qyHV4MIFavflTjxAG5D8e5SbKxz0FQK0lZB5
 Gte/e2UIIUqIRwJtcgLFXyP9LhHUfv1Q3g34WZUA1YlM1jqgBJ4T9x5Z8ojxoWUqsw6cc
 dN9+9kJfJVKsOrBt6GdN3i8AQZbs7jFmjuLCjn02RRglhI2ytzD/Ovf7X0pppYtfawA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="lE5/ZpC5"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=lE5/ZpC5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B525E6060C
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 21:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789161250;
 bh=G/4BjK8+0xVxbMksieNusmQAALRSFIaRP+ycvqugBuU=;
 h=From:To:Cc:Subject:Date:From;
 b=lE5/ZpC5YoG7zGajB613rPlBMM1EIjlezVL9kj0ZHXOc0NIRy6Lafh88NE/X4PMhK
 juZzm7f2p7QQK7Ht3/AhDapGH7J+Wk9AmGTmlRYa9muWmmwkU1sfq4j7CVXIjkVowa
 t3LXs28ELjYkrxH8xSqlV9cM11ULitlF9z4h1e4LrpZdH7Amh3Bb/nMwxlrVnRD1yP
 NVbLhulsEAt6reQFxlL4198Aei/ACX6EkWk6coKwdiBt3lzNLZUbYU3avh4qI2p6tb
 URgwN31IOM3L7M5XUp+WQWtExYU4ZwblggB55O5w3lu93kgv/LGmJddphevwYy71E0
 0ki/yjMdhIlnw==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 70EACA4C4041;
 Fri, 11 Sep 2026 23:14:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56996)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x58ZW-000000005BV-0CPO;
 Fri, 11 Sep 2026 21:14:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Yair Ben Avraham <yairba@protonmail.com>
Date: Fri, 11 Sep 2026 23:14:10 +0200
Message-ID: <20260911211410.775928-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/tpm2-pkcs11: bump version to 1.10.1
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

https://github.com/tpm2-software/tpm2-pkcs11/blob/1.10.1/CHANGELOG.md

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/2a1957a0f0c369aec014c5afaea6f4be2c70a8fb

 package/tpm2-pkcs11/tpm2-pkcs11.hash | 3 ++-
 package/tpm2-pkcs11/tpm2-pkcs11.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.hash b/package/tpm2-pkcs11/tpm2-pkcs11.hash
index 5f5abfbbe8..5cde9f01c0 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.hash
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.hash
@@ -1,3 +1,4 @@
+# From https://github.com/tpm2-software/tpm2-pkcs11/releases/tag/1.10.1
+sha256  f3315d17811f918779a1046ba20e49060a40b2b586a06ab013ff8c8da53752e4  tpm2-pkcs11-1.10.1.tar.gz
 # Locally computed:
-sha256  ce24aa5ec2471545576e892b6f64fd873a424371bbf9be4ca3a0e689ea11c9b7  tpm2-pkcs11-1.9.1.tar.gz
 sha256  793aa007f793458434d7cc60b1c827053a399308658b32fcaa6023802adc22e1  LICENSE
diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
index b26f53de27..7652df94cd 100644
--- a/package/tpm2-pkcs11/tpm2-pkcs11.mk
+++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_PKCS11_VERSION = 1.9.1
+TPM2_PKCS11_VERSION = 1.10.1
 TPM2_PKCS11_SITE = https://github.com/tpm2-software/tpm2-pkcs11/releases/download/$(TPM2_PKCS11_VERSION)
 TPM2_PKCS11_LICENSE = BSD-2-Clause
 TPM2_PKCS11_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
