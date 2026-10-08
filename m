Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B92CA600B
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 11:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADDE78123F;
	Thu,  8 Oct 2026 11:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1EzqC6aUb3JG; Thu,  8 Oct 2026 11:16:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 53EBC811FB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791458219;
	b=UGAPY74j99CENtOrQradpTiwEoFmh01oAYGHIi0Y/xF4JthrF231cLCoFPX0+dd2AQwh
	 QdFWXZPHl+JL0+DzwpCc4oHjqrPnEE9LU1TcHffqPYMoj/q9eh4leIUTRrh1imQuEITwV
	 PUpZhKADjFaeDx4VbWAmm3X/9J+hSje3A9uvdTxXhEquM6KLiWhlVuoRH3mhUChXtY5zj
	 KSiWXDsJ5tifMyJ3tvN7hDRKd+dytBoe8ScS1a4Py4zg1D9XaRTphqaMc+RpjDw++RizD
	 cPDt48ol+B9cJq6A1ExqdyqCIBul+y2S5TiuBqxR/J2SgIRvXhsiVveI65/BYzsP/vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791458219;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=nj65FainJbgx/4xfmQeTdCspoOkLn0Oe04I+Hqhjemk=;
	b=n2i6Q4cQM+7ikxAmvt2n63k7N5EBEuL9OvR+ddBNkoYoboe4lGl4fW/Bu8NgkTDJXikT
	 Np31RMmP6na3BE3GgKLN21IcG7uxJR6mmW4Nfu5FvivpXNnyGbaoiBE8BPT/csjK6qN93
	 2D4ZPy4SnuriFgDvdqhf6M6xyUQ+3F6QH6q+w3Ow7Mv40ImT3ShHZ2pDRnrhdpY0hwdjw
	 85YDnY1ysnvRzF3JA3Rz3ZS0pGCg8GZcL8T7oqbSiKmxvMABsoT4vnM5CTdzRnv4GrUnw
	 85w6hzK9ZSjbMPl2WZD7vcrSOr3fVI4/HxqiqsIeo8ZZtbuGRaqQbtHZz3Cq31ckw9w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ic23Zl5t;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791458219;
	bh=nj65FainJbgx/4xfmQeTdCspoOkLn0Oe04I+Hqhjemk=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R84mvJqinyHxUtSjrsyR8Pz0iepOTO8CZJIhAzMHhEUJ6WW0R6vYiNYk4ylyFddw1
	 LrlQx/z1xMFeabXNMAQEkOxgUwaSTsI7wxqE04uORZgK7ezI+gXLDYyy5GXiQnrtc0
	 XWClqJ8+oZRmWMvUVIA3i6Ens3A9NjpNOA6lo28fXjP1tg4G48dSVRJnkyCpEttox1
	 /+d5GFYTLpAx59VF0V3zkcZzqhHBDnuXqd1C9ufFqYZJ3JdprpsTZQrKJb2/a+u8gJ
	 peByMWzv8tO4htWq5Ax7E0xs+A3lMC0kJ9/ObQvlPmgGbBpSrBrusLlKqmryr3wVNX
	 gXgL4TReYXzDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53EBC811FB;
	Thu,  8 Oct 2026 11:16:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8458E2AA
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 11:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75BCE811FB
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 11:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jaLd56Uy2Xq for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 11:16:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7F77E810C0
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791458216;
 b=ieAElClh3Acrbrenvq5WgJXQOc8eh3W7aPgLaodxpG2M5uylEnlyyk7sFcLQpYW0DF89
 BwjVJDSQnWUnh/716ziyQ7tlifEJt+HBIIEs9OWNXzLoS/ZICT//3b4Kn+tvZZPoogwGW
 zVJ8z375+C0NI3AG9ow4LCVHSc/fdho6BxAAVPzCCowF7il+23JnuuwCK1TkTSGbhawUc
 2fkj1Jzb3cL/hUAgk5MJdmhJ0tvMIpS+IDRYp7LSw67UL4j293k6PaLX8mK85bYsp2+ho
 huWWEsTl9qPEg2iUzGFNpJXtQfEdYSATXKCxdTLuucn19V/07M7+NugNs+FUGHG+h7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791458216;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding;
 bh=JzIL1Xiu/6078LWKmWUdIywsnXVMjGti5L8nJCmvYbw=;
 b=Ls0nDVFxd1D+eOsQ0zAeJ+3wOgGRkQE5qlehqvw1SWXSe4dipJ67eKzvBAqwiFPaw1Y8
 tJPl2W6uU03ctQZgA/LbVWNqAU3MmnZfYtjjJgE4l97MRs3yVnWbwqfw1F+auRm4S/0IY
 bYZCW7Ij8Nwl8YnHYwrxqsuAMfeBVRaAkspCGMetkeGc0QPvrn41oy1BDrHUqHwTzb904
 mfFJgqu2DxoPmoXfg9CIN0iWLdwYfE3k6ImTbxBoAtp8rqkIxniWEcHxR8sa6K//yNTIY
 iofCQucZzGJv3lvOM8B5FX2XKi0VMwmc3sYv8k+bMYcMj8RwH8Nf4ouR6FfOaFGkHGQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ic23Zl5t; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ic23Zl5t
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F77E810C0
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 11:16:55 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48b0584ad71so1949215f8f.0
 for <buildroot@buildroot.org>; Thu, 08 Oct 2026 04:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791458213; x=1792063013; darn=buildroot.org;
 h=content-transfer-encoding:content-disposition:content-type
 :mime-version:message-id:subject:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=JzIL1Xiu/6078LWKmWUdIywsnXVMjGti5L8nJCmvYbw=;
 b=ic23Zl5tpGbY+NccQHmQLs5vLSBu5c4RSv5fhKUZZC6svsA76fHeKWRYaEC914H9WL
 Q7/mQWXKHiA8BWzzpbenCAJVgMB4x0wfmkrBF6E0URLKYx/IWN5gM0Hm/8kZKLtlHsaM
 8egd6d5swayflb2U5lWpTFfHPu4un6CNjZ7lpCO3tJCkdKosbAjcuObSvAPG5ue/nQ3v
 4o5YSDPQCtDRlDs9ByDWDtYxYazvYv3uV8QCayijApaH/+1AdjQblHHhfW4SlbdFCoHj
 hiBHFjI6OSst7ICnpZA2U9GYkkEsyDgRr2cTNw1/BnacwCqX/nVrNpNNGG6SiBXHzPdX
 XJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791458213; x=1792063013;
 h=content-transfer-encoding:content-disposition:content-type
 :mime-version:message-id:subject:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JzIL1Xiu/6078LWKmWUdIywsnXVMjGti5L8nJCmvYbw=;
 b=2Jh1hKXlNr+4XCpuoBko2/amV0UaxllSG0r2n8nGUPB8aBBRCiWgomjxX1ftGWWG+s
 l/S7w1CrjzKQgzqHnxtH1arOAQ/UDil7zULt3gwRP0+e8iu4A2RPWsd2LvvHVZP57iP/
 XhLREQ7qRhRGfZ1Z9vxnL0D8UtS9312RnKLtaIBRe1PYIKwt57GGestA2xu3MZDNe7oA
 mWAckBGI+2rtFpqQmimPpCmjrPQIDHw4bF7QDTY2cf2gOa4nzqOmIzyWsi4QIOt8I2+b
 eR4AdSTB93UVb+WQfM0rKatmQ/Clhe3T2mzle4uMZBoiJHmUl3Delt5pYANT0wTRW7RW
 yWcQ==
X-Gm-Message-State: AFq9FYKxDjKkEzBseBkCPR56I9p8EbggLvsR2j7XowpjmH6mN6ChPs3A
 pgRmLNoBwelNLsSDQJFanjnni0gCD1VK3ONMd+2H0yvIo1rOiKrOCO1EvcIDD41T
X-Gm-Gg: AYBFou0s97i3fMWyP7p4+HQj4YI9ITdA8NmlkJCfNjIqyUQMk3CKgbvz5p+U2SOMG9u
 NYzKZ8SvE6WWpHNwh81PbYiTgzc+0va7fCIacMuwFXcWgIEwSLA5Mjuu2rlamj1Vld8KPu0ol4c
 S/bnf4gEXArl6+dt59Fvb7tL9oPQJB1XSxozCRJqm1GW7Sly9E0WMAY5RGtwtzFDgjTcHTFXUim
 Ts+wUA1NF1ebGBcIfXbGKH3KCL4vgstXMPOMltWm6dBDxfMOvEgHUAjIvl6GEX3DeLPFh+6+raR
 Mz/ao0KCmXolHduESS8TkRsY+qTHBBEhoHUeSVeTYA79J3qsJYeMU/4NoVVXmxFEHgwO7x0CzFu
 8EczqMOaYMWMBJhjycsAhCGLH+dhXwOvcU7X5nI3BxUR0yHr5dZtoxAfQ0bQOvKe25MBX5KRcqN
 ncSKdK7RLqo7hgxhB2xJ+P7TuUr8i/KnHPq832wgPae4HBW1tXpKF/HE/OcjtleIbmWE3upVZF+
 NtRWWDWl8xfQAvSg4umgaQoAURHHatRxn1rYovaYGKVHEBPf5jAJgVPMeAPLpf/nCqTzvB/Lt6N
 RoH4e7YJYl/x
X-Received: by 2002:a05:6000:178f:b0:48c:4f83:f42f with SMTP id
 ffacd0b85a97d-48c72703262mr8661273f8f.8.1791458212644; 
 Thu, 08 Oct 2026 04:16:52 -0700 (PDT)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c7af26edasm5406082f8f.1.2026.10.08.04.16.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 04:16:52 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:16:50 +0200
From: Leo DENIEUL <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Message-ID: <asd7onZj-V4Bfyc3@leo-ThinkPad-P16s-Gen-4-AMD>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH v2] package/cst: new package
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: L=E9o Denieul <ldenieul@iliad-free.fr>

NXP Code Signing Tool (CST) for QorIQ and Layerscape secure boot.

Signed-off-by: L=E9o Denieul <ldenieul@iliad-free.fr>
---
Changes v1 -> v2:
 - bump to lf-6.18.37-2.1.0
 - replace the OpenSSL 3 patch by the commit merged upstream, as no
   release tag includes it yet
---
 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 package/Config.in.host                        |   1 +
 ...0001-common-port-to-openssl3-evp-api.patch | 438 ++++++++++++++++++
 package/cst/Config.in                         |  12 +
 package/cst/Config.in.host                    |   8 +
 package/cst/cst.hash                          |   2 +
 package/cst/cst.mk                            |  45 ++
 8 files changed, 510 insertions(+)
 create mode 100644 package/cst/0001-common-port-to-openssl3-evp-api.patch
 create mode 100644 package/cst/Config.in
 create mode 100644 package/cst/Config.in.host
 create mode 100644 package/cst/cst.hash
 create mode 100644 package/cst/cst.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 32ac338dc8..7e535cc1d1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2162,6 +2162,9 @@ F:	package/petitboot/
 N:	Lee Jones <lee.jones@linaro.org>
 F:	boot/afboot-stm32/
 =

+N:	Leo DENIEUL <leo.denieul.yoshino@gmail.com>
+F:	package/cst
+
 N:	Leon Anavi <leon.anavi@konsulko.com>
 F:	board/olimex/a10_olinuxino
 F:	configs/olimex_a10_olinuxino_lime_defconfig
diff --git a/package/Config.in b/package/Config.in
index a82e369aff..58f1a8ea47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2723,6 +2723,7 @@ endmenu
 menu "Security"
 	source "package/apparmor/Config.in"
 	source "package/checkpolicy/Config.in"
+	source "package/cst/Config.in"
 	source "package/ima-evm-utils/Config.in"
 	source "package/lynis/Config.in"
 	source "package/optee-client/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 595caf9e7f..39910a53ba 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -24,6 +24,7 @@ menu "Host utilities"
 	source "package/cramfs/Config.in.host"
 	source "package/crudini/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
+	source "package/cst/Config.in.host"
 	source "package/dbus-python/Config.in.host"
 	source "package/delve/Config.in.host"
 	source "package/depot-tools/Config.in.host"
diff --git a/package/cst/0001-common-port-to-openssl3-evp-api.patch b/packa=
ge/cst/0001-common-port-to-openssl3-evp-api.patch
new file mode 100644
index 0000000000..3477896a85
--- /dev/null
+++ b/package/cst/0001-common-port-to-openssl3-evp-api.patch
@@ -0,0 +1,438 @@
+From ef3aa97df6d2378eeb2dc53f6097ba79b04884db Mon Sep 17 00:00:00 2001
+From: Vincent <vjardin@free.fr>
+Date: Sat, 5 Sep 2026 01:41:20 +0200
+Subject: [PATCH] common: port to the OpenSSL 3 EVP API
+
+Fix compilation: upgrade to OpenSSL 3.0.
+
+Side benefits: it gains the support of "RSA PUBLIC KEY" (PKCS#1)
+and "PUBLIC KEY" (SubjectPublicKeyInfo) PEM files.
+
+Older toolchain and openssl kept "build"able.
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: https://github.com/nxp-qoriq/cst/commit/ef3aa97df6d2378eeb2dc53f=
6097ba79b04884db
+Signed-off-by: L=E9o Denieul <ldenieul@iliad-free.fr>
+---
+ common/crypto_utils.c           | 127 ++++++++++++++++++++++++-------
+ tools/key_generation/gen_keys.c | 131 +++++++++++++++++++-------------
+ 2 files changed, 178 insertions(+), 80 deletions(-)
+
+diff --git a/common/crypto_utils.c b/common/crypto_utils.c
+index 9a83411..0882cd0 100644
+--- a/common/crypto_utils.c
++++ b/common/crypto_utils.c
+@@ -34,36 +34,65 @@
+  */
+ =

+ #include <crypto_utils.h>
+-#include <openssl/ssl.h>
++#include <openssl/evp.h>
++#include <openssl/pem.h>
++#include <openssl/bn.h>
++#include <openssl/rsa.h>
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++#include <openssl/core_names.h>
++#endif
++
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#define EVP_MD_CTX_new		EVP_MD_CTX_create
++#define EVP_MD_CTX_free		EVP_MD_CTX_destroy
++#endif
++
++static EVP_MD_CTX **hash_ctx(void *ctx)
++{
++	return (EVP_MD_CTX **)ctx;
++}
+ =

+ /************************************************************************=
***
+  * Function	:	crypto_hash_init
+- * Description	:	Wrapper function for SHA256_Init
++ * Description	:	Wrapper function for EVP SHA256 init
+  ************************************************************************=
***/
+ void crypto_hash_init(void *ctx)
+ {
+-	SHA256_CTX *c =3D (SHA256_CTX *)ctx;
+-	SHA256_Init(c);
++	EVP_MD_CTX *c =3D EVP_MD_CTX_new();
++
++	*hash_ctx(ctx) =3D c;
++	if (c =3D=3D NULL || EVP_DigestInit_ex(c, EVP_sha256(), NULL) !=3D 1) {
++		fprintf(stderr, "Error in initialising SHA256\n");
++		exit(EXIT_FAILURE);
++	}
+ }
+ =

+ /************************************************************************=
***
+  * Function	:	crypto_hash_update
+- * Description	:	Wrapper function for SHA256_Update
++ * Description	:	Wrapper function for EVP SHA256 update
+  ************************************************************************=
***/
+ void crypto_hash_update(void *ctx, void *data, uint32_t len)
+ {
+-	SHA256_CTX *c =3D (SHA256_CTX *)ctx;
+-	SHA256_Update(c, data, len);
++	if (EVP_DigestUpdate(*hash_ctx(ctx), data, len) !=3D 1) {
++		fprintf(stderr, "Error in updating SHA256\n");
++		exit(EXIT_FAILURE);
++	}
+ }
+ =

+ /************************************************************************=
***
+  * Function	:	crypto_hash_final
+- * Description	:	Wrapper function for SHA256_Final
++ * Description	:	Wrapper function for EVP SHA256 final
+  ************************************************************************=
***/
+ void crypto_hash_final(void *hash, void *ctx)
+ {
+-	SHA256_CTX *c =3D (SHA256_CTX *)ctx;
+-	SHA256_Final(hash, c);
++	EVP_MD_CTX *c =3D *hash_ctx(ctx);
++
++	if (EVP_DigestFinal_ex(c, hash, NULL) !=3D 1) {
++		fprintf(stderr, "Error in finalising SHA256\n");
++		exit(EXIT_FAILURE);
++	}
++	EVP_MD_CTX_free(c);
++	*hash_ctx(ctx) =3D NULL;
+ }
+ =

+ /************************************************************************=
***
+@@ -79,7 +108,6 @@ int crypto_hash_update_file(void *ctx, char *fname)
+ 	FILE *fp;
+ 	unsigned char buf[IOBLOCK];
+ 	size_t bytes =3D 0;
+-	SHA256_CTX *c =3D (SHA256_CTX *)ctx;
+ =

+ 	/* open the file */
+ 	fp =3D fopen(fname, "rb");
+@@ -102,7 +130,7 @@ int crypto_hash_update_file(void *ctx, char *fname)
+ 			break;
+ 		}
+ =

+-		SHA256_Update(c, buf, bytes);
++		crypto_hash_update(ctx, buf, bytes);
+ 	}
+ =

+ 	fclose(fp);
+@@ -112,14 +140,16 @@ int crypto_hash_update_file(void *ctx, char *fname)
+ =

+ /************************************************************************=
***
+  * Function	:	crypto_rsa_sign
+- * Description	:	Wrapper function for RSA_sign
++ * Description	:	Wrapper function for EVP_PKEY_sign
+  ************************************************************************=
***/
+ int crypto_rsa_sign(void *img_hash, uint32_t len, void *rsa_sign,
+ 			uint32_t *rsa_len, char *key_name)
+ {
+-	int ret;
++	int ret =3D FAILURE;
+ 	FILE *fpriv;
+-	RSA *priv_key;
++	EVP_PKEY *priv_key;
++	EVP_PKEY_CTX *pctx =3D NULL;
++	size_t sign_len;
+ =

+ 	/* Open the private Key */
+ 	fpriv =3D fopen(key_name, "r");
+@@ -128,7 +158,7 @@ int crypto_rsa_sign(void *img_hash, uint32_t len, void=
 *rsa_sign,
+ 		return FAILURE;
+ 	}
+ =

+-	priv_key =3D PEM_read_RSAPrivateKey(fpriv, NULL, NULL, NULL);
++	priv_key =3D PEM_read_PrivateKey(fpriv, NULL, NULL, NULL);
+ 	fclose(fpriv);
+ 	if (priv_key =3D=3D NULL) {
+ 		printf("Error in key reading %s:\n", key_name);
+@@ -136,14 +166,23 @@ int crypto_rsa_sign(void *img_hash, uint32_t len, vo=
id *rsa_sign,
+ 	}
+ =

+ 	/* Sign the Image Hash with Private Key */
+-	ret =3D RSA_sign(NID_sha256, img_hash, len,
+-			rsa_sign, rsa_len,
+-			priv_key);
+-	if (ret !=3D 1) {
++	sign_len =3D EVP_PKEY_size(priv_key);
++	pctx =3D EVP_PKEY_CTX_new(priv_key, NULL);
++	if (pctx =3D=3D NULL ||
++	    EVP_PKEY_sign_init(pctx) !=3D 1 ||
++	    EVP_PKEY_CTX_set_rsa_padding(pctx, RSA_PKCS1_PADDING) !=3D 1 ||
++	    EVP_PKEY_CTX_set_signature_md(pctx, EVP_sha256()) !=3D 1 ||
++	    EVP_PKEY_sign(pctx, rsa_sign, &sign_len, img_hash, len) !=3D 1) {
+ 		printf("Error in Signing\n");
+-		return FAILURE;
++		goto out;
+ 	}
+-	return SUCCESS;
++
++	*rsa_len =3D sign_len;
++	ret =3D SUCCESS;
++out:
++	EVP_PKEY_CTX_free(pctx);
++	EVP_PKEY_free(priv_key);
++	return ret;
+ }
+ =

+ /************************************************************************=
***
+@@ -158,9 +197,15 @@ int crypto_rsa_sign(void *img_hash, uint32_t len, voi=
d *rsa_sign,
+ int crypto_extract_pub_key(char *fname_pub, uint32_t *len, uint8_t *key_p=
tr)
+ {
+ 	FILE *fp;
+-	RSA *pub_key;
+ 	uint32_t key_len;
++	int ret =3D FAILURE;
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++	EVP_PKEY *pub_key;
++	BIGNUM *modulus =3D NULL, *exponent =3D NULL;
++#else
++	RSA *pub_key;
+ 	const BIGNUM *modulus, *exponent;
++#endif
+ =

+ 	fp =3D fopen(fname_pub, "r");
+ 	if (fp =3D=3D NULL) {
+@@ -169,7 +214,11 @@ int crypto_extract_pub_key(char *fname_pub, uint32_t =
*len, uint8_t *key_ptr)
+ 		return FAILURE;
+ 	}
+ =

++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++	pub_key =3D PEM_read_PUBKEY(fp, NULL, NULL, NULL);
++#else
+ 	pub_key =3D PEM_read_RSAPublicKey(fp, NULL, NULL, NULL);
++#endif
+ 	fclose(fp);
+ 	if (pub_key =3D=3D NULL) {
+ 		fprintf(stderr, "Error in key reading %s:\n",
+@@ -177,17 +226,32 @@ int crypto_extract_pub_key(char *fname_pub, uint32_t=
 *len, uint8_t *key_ptr)
+ 		return FAILURE;
+ 	}
+ =

++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++	key_len =3D EVP_PKEY_size(pub_key);
++
++	/* get N and E */
++	if (EVP_PKEY_get_bn_param(pub_key, OSSL_PKEY_PARAM_RSA_N,
++				  &modulus) !=3D 1 ||
++	    EVP_PKEY_get_bn_param(pub_key, OSSL_PKEY_PARAM_RSA_E,
++				  &exponent) !=3D 1) {
++		fprintf(stderr, "Error: %s is not an RSA public key\n",
++			fname_pub);
++		goto out;
++	}
++#else
+ 	key_len =3D RSA_size(pub_key);
+-	*len =3D 2 * key_len;
+ =

+ #if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 	/* copy N and E */
+-        modulus =3D (BIGNUM *)pub_key->n;
+-        exponent =3D (BIGNUM *)pub_key->e;
++	modulus =3D (BIGNUM *)pub_key->n;
++	exponent =3D (BIGNUM *)pub_key->e;
+ #else
+ 	/* get N and E */
+ 	RSA_get0_key(pub_key, &modulus, &exponent, NULL);
+ #endif
++#endif
++	*len =3D 2 * key_len;
++
+ 	/* Copy N component */
+ 	BN_bn2bin(modulus, key_ptr);
+ =

+@@ -202,7 +266,16 @@ int crypto_extract_pub_key(char *fname_pub, uint32_t =
*len, uint8_t *key_ptr)
+ 	 */
+ 	BN_bn2bin(exponent, key_ptr + key_len - BN_num_bytes(exponent));
+ =

+-	return SUCCESS;
++	ret =3D SUCCESS;
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++out:
++	BN_free(modulus);
++	BN_free(exponent);
++	EVP_PKEY_free(pub_key);
++#else
++	RSA_free(pub_key);
++#endif
++	return ret;
+ }
+ =

+ /************************************************************************=
***
+diff --git a/tools/key_generation/gen_keys.c b/tools/key_generation/gen_ke=
ys.c
+index da74cc7..c4f7495 100644
+--- a/tools/key_generation/gen_keys.c
++++ b/tools/key_generation/gen_keys.c
+@@ -37,13 +37,18 @@
+  *     Eric Young (eay@cryptsoft.com)"
+  */
+ =

+-#define OPENSSL_NO_KRB5
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <openssl/ssl.h>
+ #include <unistd.h>
+ #include <getopt.h>
++#include <openssl/evp.h>
++#include <openssl/pem.h>
++#include <openssl/rsa.h>
++#include <openssl/bio.h>
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++#include <openssl/encoder.h>
++#endif
+ =

+ #define RSA_LEN1	1024
+ #define RSA_LEN2	2048	=

+@@ -52,79 +57,99 @@
+ #define PRI_KEY_FILE "srk.pri"
+ #define PUB_KEY_FILE "srk.pub"
+ =

+-static int generate_rsa_keys(const unsigned int n, FILE *fpri, FILE *fpub)
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++static int write_key_pem(EVP_PKEY *pkey, int selection, FILE *fp)
+ {
+-	RSA *srk =3D NULL;
+-	BIGNUM *public_exponent =3D NULL;
+-	int ret =3D 0;
+-
+-	/* Allocate space for RSA structure */
+-	srk =3D RSA_new();
++	OSSL_ENCODER_CTX *ectx;
++	int ok;
+ =

+-	if (srk =3D=3D NULL) {
++	ectx =3D OSSL_ENCODER_CTX_new_for_pkey(pkey, selection, "PEM",
++					     "type-specific", NULL);
++	if (ectx =3D=3D NULL)
+ 		return -1;
+-	}
+ =

+-	public_exponent =3D BN_new();
+-	if (public_exponent =3D=3D NULL || !BN_set_word(public_exponent, RSA_F4)=
) {
+-		BN_free(public_exponent);
+-		return -1;
+-	}
++	ok =3D OSSL_ENCODER_to_fp(ectx, fp);
++	OSSL_ENCODER_CTX_free(ectx);
+ =

+-	ret =3D RSA_generate_key_ex(srk, n, public_exponent, NULL);
+-	if (!ret) {
+-		RSA_free(srk);
+-		BN_free(public_exponent);
+-		return -1;
+-	}
++	return (ok =3D=3D 1) ? 0 : -1;
++}
++
++static int write_private_key(EVP_PKEY *pkey, FILE *fp)
++{
++	return write_key_pem(pkey, EVP_PKEY_KEYPAIR, fp);
++}
+ =

+-	ret =3D PEM_write_RSAPrivateKey(fpri, srk, NULL, NULL, 0, 0, NULL);
++static int write_public_key(EVP_PKEY *pkey, FILE *fp)
++{
++	return write_key_pem(pkey, EVP_PKEY_PUBLIC_KEY, fp);
++}
++#else
++static int write_private_key(EVP_PKEY *pkey, FILE *fp)
++{
++	RSA *rsa =3D EVP_PKEY_get1_RSA(pkey);
++	int ok;
+ =

+-	if (!ret) {
+-		RSA_free(srk);
+-		BN_free(public_exponent);
++	if (rsa =3D=3D NULL)
+ 		return -1;
+-	}
++	ok =3D PEM_write_RSAPrivateKey(fp, rsa, NULL, NULL, 0, 0, NULL);
++	RSA_free(rsa);
++
++	return (ok =3D=3D 1) ? 0 : -1;
++}
+ =

+-	ret =3D PEM_write_RSAPublicKey(fpub, srk);
++static int write_public_key(EVP_PKEY *pkey, FILE *fp)
++{
++	RSA *rsa =3D EVP_PKEY_get1_RSA(pkey);
++	int ok;
+ =

+-	if (!ret) {
+-		RSA_free(srk);
+-		BN_free(public_exponent);
++	if (rsa =3D=3D NULL)
+ 		return -1;
+-	}
++	ok =3D PEM_write_RSAPublicKey(fp, rsa);
++	RSA_free(rsa);
+ =

+-#ifdef DEBUG
+-	printf("public modulus (n):\n");
+-	printf("%s\n", BN_bn2hex(srk->n));
++	return (ok =3D=3D 1) ? 0 : -1;
++}
++#endif
+ =

+-	printf("public exponent (e):\n");
+-	printf("%s\n", BN_bn2hex(srk->e));
++static int generate_rsa_keys(const unsigned int n, FILE *fpri, FILE *fpub)
++{
++	EVP_PKEY *srk =3D NULL;
++	EVP_PKEY_CTX *ctx;
++	int ret =3D -1;
+ =

+-	printf("private exponent (d):\n");
+-	printf("%s\n", BN_bn2hex(srk->d));
++	ctx =3D EVP_PKEY_CTX_new_id(EVP_PKEY_RSA, NULL);
++	if (ctx =3D=3D NULL)
++		return -1;
+ =

+-	printf("secret prime factor (p):\n");
+-	printf("%s\n", BN_bn2hex(srk->p));
+-	printf("secret prime factor (q):\n");
+-	printf("%s\n", BN_bn2hex(srk->q));
++	if (EVP_PKEY_keygen_init(ctx) !=3D 1 ||
++	    EVP_PKEY_CTX_set_rsa_keygen_bits(ctx, n) !=3D 1 ||
++	    EVP_PKEY_keygen(ctx, &srk) !=3D 1)
++		goto out;
+ =

+-	printf("dmp1 [ d mod (p-1) ]:\n");
+-	printf("%s\n", BN_bn2hex(srk->dmp1));
+-	printf("dmq1 [ d mod (q-1) ]:\n");
+-	printf("%s\n", BN_bn2hex(srk->dmq1));
++	if (write_private_key(srk, fpri) !=3D 0)
++		goto out;
+ =

+-	printf("iqmp [ q^-1 mod p ]:\n");
+-	printf("%s\n", BN_bn2hex(srk->iqmp));
++	if (write_public_key(srk, fpub) !=3D 0)
++		goto out;
+ =

+-	printf("RSA SIZE: %d\n", RSA_size(srk));
++#ifdef DEBUG
++	{
++		BIO *out =3D BIO_new_fp(stdout, BIO_NOCLOSE);
+ =

++		if (out !=3D NULL) {
++			EVP_PKEY_print_private(out, srk, 0, NULL);
++			BIO_free(out);
++		}
++		printf("RSA SIZE: %d\n", EVP_PKEY_size(srk));
++	}
+ #endif
+ =

+-	RSA_free(srk);
+-	BN_free(public_exponent);
++	ret =3D 0;
++out:
++	EVP_PKEY_free(srk);
++	EVP_PKEY_CTX_free(ctx);
+ =

+-	return 0;
++	return ret;
+ }
+ =

+ void usage(void)
+-- =

+2.53.0
+
diff --git a/package/cst/Config.in b/package/cst/Config.in
new file mode 100644
index 0000000000..eb6cb3168f
--- /dev/null
+++ b/package/cst/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_CST
+	bool "cst"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  NXP Code Signing Tool for QorIQ and Layerscape secure boot.
+
+	  The purpose of this variant is to verify the signatures of
+	  the bootloader directly on the target before an update and
+	  not to generate keys. It prevents the target from bricking
+	  the board by verifying the signatures.
+
+	  https://github.com/nxp-qoriq/cst
diff --git a/package/cst/Config.in.host b/package/cst/Config.in.host
new file mode 100644
index 0000000000..efe01ec8b6
--- /dev/null
+++ b/package/cst/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_CST
+	bool "host cst"
+	help
+	  NXP Code Signing Tool for QorIQ and Layerscape secure boot.
+	  Provides tools to generate keys, create security headers and
+	  sign firmware images, especially the bootloader.
+
+	  https://github.com/nxp-qoriq/cst
diff --git a/package/cst/cst.hash b/package/cst/cst.hash
new file mode 100644
index 0000000000..6fc183acfb
--- /dev/null
+++ b/package/cst/cst.hash
@@ -0,0 +1,2 @@
+sha256  6a4febf221c894cd0566d4c35722b8df753b386b8871deedfed5b5f4d52e09c3  =
cst-lf-6.18.37-2.1.0.tar.gz
+sha256  7c8437ed27fc42fb35a90e3be5f1dfbe1b877058df1784eeb59057ceb5acc8cc  =
LICENSE
diff --git a/package/cst/cst.mk b/package/cst/cst.mk
new file mode 100644
index 0000000000..d4c6149d2c
--- /dev/null
+++ b/package/cst/cst.mk
@@ -0,0 +1,45 @@
+##########################################################################=
######
+#
+# cst
+#
+##########################################################################=
######
+
+CST_VERSION =3D lf-6.18.37-2.1.0
+CST_SITE =3D $(call github,nxp-qoriq,cst,$(CST_VERSION))
+CST_LICENSE =3D BSD-3-Clause
+CST_LICENSE_FILES =3D LICENSE
+
+CST_DEPENDENCIES =3D openssl
+HOST_CST_DEPENDENCIES =3D host-openssl
+
+define CST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC=3D"$(TARGET_CC)" \
+		LD=3D"$(TARGET_CC)" \
+		CROSS_COMPILE=3D"$(TARGET_CROSS)"
+endef
+
+define CST_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		MANPAGE=3D"" DESTDIR=3D$(TARGET_DIR) \
+		prefix=3D/usr install
+endef
+
+define HOST_CST_BUILD_CMDS
+	$(HOST_MAKE_ENV) \
+	CFLAGS=3D"$(HOST_CFLAGS)" \
+	LDFLAGS=3D"$(HOST_LDFLAGS)" \
+	$(MAKE) -C $(@D) \
+		CC=3D"$(HOSTCC)" \
+		LD=3D"$(HOSTCC)" \
+		CROSS_COMPILE=3D""
+endef
+
+define HOST_CST_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		MANPAGE=3D"" DESTDIR=3D$(HOST_DIR) \
+		prefix=3D/usr install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- =

2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
