Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D273FC79F82
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 19:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 961B74064A;
	Tue,  8 Sep 2026 19:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YA0KVezhIvj9; Tue,  8 Sep 2026 19:14:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 97B6640692
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788894863;
	b=oeCPPhibwxGgrRQp72k77jdMBX0tNxgarj5duoIAKUXKWHBLl17vbGU9WGO+sLkvnaTw
	 5bddbzRRpoXrMn+zbO8KyUDhM1d3ms23KpHiN1//7YxVaOnxpq9OOVv6OX4RL5Ezb0G2k
	 FmLk+tM91pEFhBa2QneoZJYcvJg0tEK0pUTPzSE+2574upGrMKnADpQAa4KTOSA5cwF5n
	 e5qCIA0ZktWDiVk+1Lvxc0tYor56d5pW4CZe18DV2pEedatObMxLOGwAnIzxGjWYw2114
	 KAP3mQA9d3N3WXnS15cqBROx84b0EcG1hKmr6frXRMWWnS37Bsj2vOCm8qWM3AzDCcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788894863;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZK+Yii4dcyGQrYpfJ+sC2JwIU9fQNW/7m5W3TyUuYrk=;
	b=FoCsHXk0lRAmJMZuKjCGC1q9RWQVAeAj0TD6hMi875iVaREYnRNLyt3XKrwuoyDUDpI7
	 YY6Z9RxIHPSy7kcZ4uhnSZ/8tDrB9COKzW7gdb2nlj645AV0yZ3NgKLfVvVEiTark2rm/
	 PD3X2r2mR4+7+vCQGnz42zyB4gmPIxkF2m7z4K0yYzkU1CZtHJH2BU9p42meqpoZo+jYe
	 8AilRT2zRPyJadcLF97ZvBfcy8v04Y9cROS+66g/MWUSa5ZaPivef/qvdI3YUNAZaXywE
	 k2MShGIxBJFL6Q1BMk/ZlCZPcfYBk9iAwV/gutXWH+Xi7zpB+VM5pzHGcKvDIrjNqiA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788894863;
	bh=ZK+Yii4dcyGQrYpfJ+sC2JwIU9fQNW/7m5W3TyUuYrk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OxkwNSgaKr/+18/4a0QrC1u9+shvDY4oraObT4CEYCgQDyJu5kJs1CciP1TKhTJ+G
	 F5NKNsA4Lrcqid0hP6zgUXJNdW8LMhMHFRCoDRK0KLMQ+7O8viM2rORk3IgtitUrzm
	 8lVKMEn+BOzygtPGTWvAdJoiixrN600ljFIH98geaNtfJzLKIZXCZDvSkmh5zBmTsz
	 dsNqzLW5NuMQBfj1aRFZ5XGS1DU3trgDwpCsqKXdOCx1nl7dhbKcaHf8tdvyCCUjvP
	 bBMf6ymGYoQym4tmCPGGCB5bPLmQxvkOtTtUNMqYzI7Qb/20djBIxrxBtpjwYLFm1h
	 il7lfBDrJZQkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97B6640692;
	Tue,  8 Sep 2026 19:14:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E43B2D2
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 19:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0498E40176
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 19:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHYn72q44_lO for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 19:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 851614009A
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788894860;
 b=k7u+DCo5PNqVNvUxWk+YlVED6V6URjpPOxwW2GVxKmqGksFvqJPd04MxZV4CQnk4bdux
 kPPnaTiQaXEOTRv3VMFHvIi1El37zP8f+RNg+c0jFJJBKn0x+JrHsD0Cr0iclDm+F7+Ku
 a5x6R/9dc9gde3zhTCoaYFf7adz6g4Jg/iLU87R+g51tWChGKat4ZWexih9iWOgQaer3M
 gkcI/gk7oe7YraKBnAoF+bKchJBMmu8Z1QRzQSQFFEWXzSrHxUQdfKD85kL5aBHtAeXF3
 OJ9nrvjxgA30qXtcn8gQD0KMPmfiz2gcUXYTVRjcxMXd6PdpMF+CvaC5ss8qqPcDg1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788894860;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=6R+cmqvDjv7qIYF4Cf8v07jcHbAUswGpqex9bxEAFyw=;
 b=fFjAhD0oOg2XzRhzB7ddFYIl7gQvfQUul71OohgeqYpbLrQkqufjm5l9i6WtU8CdLEpX
 onnHPA0k1N+mAayMcLZ5jHsPPWIvD+4RMCqC7vG4n7Kqsy0Bi9sGGBj6IAacMYTwsojnb
 s2oW/J+qfmZF/a/Uu2yw8T4UDVvGAu8nrJXa8rnfa3o7qvs2/tyuyZ1sI9VHRTxkAi9hJ
 xZHefpqDtKAYFJ+sc+rnypGy8ltxmuhmT+aQdDORWVEFvyudEeeQhkOIxmGuRcH/VqM8/
 mObkgLTjjpXpm9snIgVvWQK9Ko1ACpAazF1WiGhUVIbj+EgX4d4qzSlI2a6NV1F6OGA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WzNCRdGm; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WzNCRdGm
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 851614009A
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 19:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788894829;
 bh=6R+cmqvDjv7qIYF4Cf8v07jcHbAUswGpqex9bxEAFyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=WzNCRdGm6iRshsOY8XqOEPIngKqkxh/dgVNjKD/2AQvItXauZZl63ws2eEptFulmZ
 1dPH6HGaLQkk7zaUHQJcM/hcf1/Ako5oUJ2GJ8vwE56f5deI4YEECZ7fGLWAT/LyGV
 N6JhbSVaLu3Tan/HEFGi6ouN1MAy8xGHuM1gHqOvEOpHR60zIqwzgetkfVyckMUyUS
 AOipoj6FSLXt9MJl+0q/MeJECOHdAJp1XfkFDXvr8UAvTgIwzq69CyK8myHqUd/uVY
 5oqa6qkcXpRo6RzX1bfWsWYP/nZFlOn0XcrKSKYYjF4P19TQmP8HZEt/l5wCacupPx
 PVLwgcr7RDKlw==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3735CA4C3BD4;
 Tue,  8 Sep 2026 21:13:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41268)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x41GP-000000006av-0Aaj;
 Tue, 08 Sep 2026 19:13:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Tue,  8 Sep 2026 21:13:48 +0200
Message-ID: <20260908191348.1892945-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908191348.1892945-1-bernd@kuhls.net>
References: <20260908191348.1892945-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 3/3] package/libest: bump version to
 r3.2.0-9-ga464ba8a6
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

The only commit in this bump
https://github.com/cisco/libest/commits/main/
is patch 0005 which was removed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commit/bdbdbd0557ae43c5cc6f186ee93a01eb7610c1b5

 ....h-add-missing-extern-on-e_ctx_ssl_e.patch | 42 -------------------
 package/libest/libest.hash                    |  2 +-
 package/libest/libest.mk                      |  2 +-
 3 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch

diff --git a/package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch b/package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
deleted file mode 100644
index ba0ecb4a86..0000000000
--- a/package/libest/0005-src-est-est_locl.h-add-missing-extern-on-e_ctx_ssl_e.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 32fe99fa403d2f51931615745a64f8aede1ca46f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 8 Jan 2022 13:38:17 +0100
-Subject: [PATCH] src/est/est_locl.h: add missing extern on
- e_ctx_ssl_exdata_index
-
-Without this extern, the variable gets re-declared in each compilation
-unit including est_locl.h, causing gcc >= 10 to complain with:
-
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_client.o:(.data+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_server.o:(.bss+0xc): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_server_http.o:(.bss+0x3b8): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_proxy.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_client_http.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_ossl_util.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_client_proxy.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_enhcd_cert_auth.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: .libs/est_server_coap.o:(.bss+0x0): multiple definition of `e_ctx_ssl_exdata_index'; .libs/est.o:(.bss+0x8): first defined here
-collect2: error: ld returned 1 exit status
-
-Upstream: https://github.com/cisco/libest/pull/107
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/est/est_locl.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/est/est_locl.h b/src/est/est_locl.h
-index 62dcbea..b16f62d 100644
---- a/src/est/est_locl.h
-+++ b/src/est/est_locl.h
-@@ -590,7 +590,7 @@ typedef struct est_oid_list {
- /*
-  * Index used to link the EST Ctx into the SSL structures
-  */
--int e_ctx_ssl_exdata_index;
-+extern int e_ctx_ssl_exdata_index;
- 
- LIBEST_TEST_API void est_log (EST_LOG_LEVEL lvl, char *format, ...);
- LIBEST_TEST_API void est_log_backtrace (void);
--- 
-2.33.1
-
diff --git a/package/libest/libest.hash b/package/libest/libest.hash
index dc9bc05255..2c2804a76f 100644
--- a/package/libest/libest.hash
+++ b/package/libest/libest.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  83983ac05137fd73586ddcb4874e30689fe694ee9a329797b60b3defc9a87327  libest-f8a6e5b53a5f70e72fe4029981df0693b17cbb32.tar.gz
+sha256  2e5c46610f6a3c12c1916c8a84de77421a88c9722e776e862a716f4a48220f2a  libest-r3.2.0-9-ga464ba8a66717419ba71d289ef82c7b2315b2006.tar.gz
 sha256  fbdb055f98babf8d86095d6f9b9e34d2ff21a8212e442b8f18bdcb403e44366c  LICENSE
diff --git a/package/libest/libest.mk b/package/libest/libest.mk
index 9f3168767d..5f93b2ab32 100644
--- a/package/libest/libest.mk
+++ b/package/libest/libest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEST_VERSION = f8a6e5b53a5f70e72fe4029981df0693b17cbb32
+LIBEST_VERSION = r3.2.0-9-ga464ba8a66717419ba71d289ef82c7b2315b2006
 LIBEST_SITE = $(call github,cisco,libest,$(LIBEST_VERSION))
 # We don't build examples, so we're not affected by the OpenSSL
 # license
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
