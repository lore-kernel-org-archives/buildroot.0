Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF633C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 20:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4677F80EBF;
	Sun, 20 Sep 2026 20:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wL8peRpDQvvv; Sun, 20 Sep 2026 20:05:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4316280EBD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789934715;
	b=LFeXXxQgWOO3yRIj87bJdlfD4fXCssIK+CybDajNRxTAQvsEeyqHc5BBahOtX1a3ifpZ
	 uXQZUyjO7RMe2MLMwI6IsAFmUhfifUhNqucDY2XMdCH7HPon89rl/RnisSEIwncNmCJZo
	 fIb5l0sgZ9koWGJYFfpBl0ccpAsWNatfPUZ9hBdZ2vstH1GlOT7GGKnQy7ZejQ0S5ynlN
	 crxtfV1iZ6TcipkbHx+Mq8896rMIoy7lAFKR9V+HKxNgKB52V90IZoVp+t+RFbSv+cIqh
	 KjsaID0WNq0tNZQGEx7EG+odZ3t2YUmN4DE8e/sNNv+1JZUC90KjMQ5rEYcMoYN25lg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789934715;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Organization:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ICU9oznaUbMWuqekRBrtbfMgcq8qEr/1+B0gIPPuSDg=;
	b=GcrgfoFpZt39OmkOe5tzBLevsXPcT74DytF54yh4wL6yDE1EFvUwjE/8rtGTxqkEhopK
	 VV57Leis/U8dCiRGVpPIhJgupn7Yl7WwD9juXUYnyhepUGMHhst708EHzxLwVzw0tR7DR
	 QFWhZhKHW0czOD8dEHGTJwQYX4PCX4MiED9iUFDuLU1OOKKrBM5MY5pPFHIjNb2rJwmBo
	 A+67EjspAqv4evAVS04rNl/fgq7iie1XU8Ow31mZMjKfBWrF6AOjPQnzk6Nfjx9e0VeJF
	 PVIpUWya790+wagwbrGhIysITugCziB43enhDx9mSHRAskYMWAWNJf1QVRiT8bSu1RQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789934715;
	bh=ICU9oznaUbMWuqekRBrtbfMgcq8qEr/1+B0gIPPuSDg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nU1Rk4xE5BKkCkvtNX37uf00nX0NRMhy5Dv3jNzXqiTEjrpJYOQkSdDE0C2uHCdt3
	 SYAhz8L83nMJgNPgJLjpMVzHZmThTEqeQ+dDqHRqJvG8NPG1a6kQBIoXb9bfqYlBLC
	 HcXsxpYynXxkwQEbkwHdOajoaojHM+l63vhR++Pp009LRNnwWxVNWVCR0XWWOrdoxv
	 Ur2IvOQeJNUmd6cezT7tg7y5jE72XqQ9gqJzQCODe930fUgUHJ0O5JOHEx8x9QO2e7
	 bzyEk4V6uWp+urtpVCPfCLAGYqlVoPt0unDhRvuQfBC+n2fVx5ra/y2OJn8zIzndo0
	 hw/KP5MWTXR6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4316280EBD;
	Sun, 20 Sep 2026 20:05:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DE9725B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 20:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90260606E8
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 20:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14Hd6gkmSKtM for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 20:05:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 56CE36068F
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:33::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789934712;
 b=K9XSztfil1PP/oUXRs8UVmWcZgv7O+fBg3Fypjuhol9YWG+oryzy/xwgyNxhDpAJaTQi
 SQs9cwrRtH3KlWr2rAAE5AkjvQI0a/CsIrjy+aiW6WuBsaWyMaIUfEm+XL00UtLfIX1dU
 rKELTO0l7bmkJFUPD6nXco9urXCJLp5WP5nomMpLeLXBcNBq3//wijiXHJEMbgZIZAfJo
 zTy4JvMJhs9v5zIKMsb6ttuLFFFIABCjrMyXiM0dGZZCVYhwUQdW68htAmTybjTwgEjiT
 pVzrYfBhcJqaxa0SxprdFu7sWYY4nNHxx4uMgd943GOcc7n8Mej5P7b/Ma/Dnyj3u7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789934712;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Organization:Content-Transfer-Encoding;
 bh=Mg+9Cx1CQxSqvJ8YqJvV26jNZDkRBJfJwf9Py6OYrYU=;
 b=W2CaURtdyV6+zK3rTtzkedIk7CMQm9I8ZcOdkcnTYzespJ7vt5zIwa39X4kz77eanOmr
 GRDrGlrsLdLIZ04mlTfaxfDzkepu0zlSmXHipMPKvJjpLUXk2Znty1snOBYX82pAq7F86
 u6CynEIXA1Id/63SUklxITPrW7kZAXaQ8FEr7BONKJKxjnA2nhzS4ExPamlR+4E6RMpuo
 0bDjEWMDZMaUPna8742f/a1pIAL0pcheaEItGxL6dHtKTDEfKPbNcAMxYrC+61FTFU0zB
 y19kjMc0l0sG2sPrLeAlzokE5jjq26FcbVxK/7ZF/9ulItUZBJu1ZztpQcJe17Y0BOQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=CxxkvCqp; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:33::10; helo=mail-ed2-x10.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=CxxkvCqp
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com
 [IPv6:2a00:1450:4864:33::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56CE36068F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 20:05:10 +0000 (UTC)
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a985e8fcddso2758053a12.3
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789934708; x=1790539508; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Mg+9Cx1CQxSqvJ8YqJvV26jNZDkRBJfJwf9Py6OYrYU=;
 b=CxxkvCqp/XVCyCAjwe4Ss9NVZo35qQK/uIQGH9RE4TbjK/0nNWwceOo8yli27QLBbO
 tO8NKka7FUXBi1VqZwgXpiP8pEUWSWCspt8ywwdnVGxBED99Ok/KXACk7ccm7i0rC6wJ
 c2y2ovAGPRAFsxOEYxegrW7Iarxmj1BlzYAkbkBdTRVbjb6GodnUHFzRwkztorA41vtT
 qYMK7e2WVV6i4M0M/qpuULUCwex1uex1wXZf3oI/0Nue08JNhySRJTvf2YM5RVwQ0Pee
 BztuSNSYxYqUHGTsijWXmIqzfFTv84X/T/PmZJugsuPdCJO2CcHUqKqYOtaO9CgDUHd2
 1Z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789934708; x=1790539508;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Mg+9Cx1CQxSqvJ8YqJvV26jNZDkRBJfJwf9Py6OYrYU=;
 b=NOc+/ut/n98L/HgBjILyw12e9iz4fqpwVMAdoeeSutTBrBzkVQBPELdXtFgGOCzgxW
 E8WLQmHYdB1hN4pgATvR9Pwy1MxsDy0yQvezVfeYO2bYkcR6xNH4XHdicbgauoOPkvkC
 r8GMEapGujoyGlbd/yGTQVl6beZ1+ETL3rIoDOt14r5I5DCvGKsQffcGddSsUoX637/R
 iEVXUj3l6xLxTpzSwN56m7hG3yxj7u4ZIyoV/3akvBHt0MkB5hb7Ymi90KnwA2sLfwvg
 znIA50pkMex5gcQAvSxuIx+cappB8pQQew4HK+Kpb3lJauiLd4mnlhJIFSRJ26Vwqi13
 /rQQ==
X-Gm-Message-State: AFuF++mmPlXBqJxdQXgdpgNLZgnxlSfvBBoxdEzg3ZLwrLHkABrOw/j4
 L7MuqV11Q0dqoORmCuTlq8fCQ7yiUGSIpNj8W8iTn2P9FwjHxJHkGBTwKwE6sA==
X-Gm-Gg: AYBFou0FhwHqrUMtPp1aZK1mg3dhukB2RzEb2jHwe+eTXLwWC9zaPwA7EbBhgdhq8LR
 Cp3k9Rk5qVn4WISKLFGr+/X160IE37ZXA3QdFFcMs80dZsUFVvqs1Twx+6K5YP1pgcdQq4PULSz
 OxJWrhM8fZs3phL7opZTN7GRjpZPFya13ceXu2u1swBvm1+ioijrEHnhKxWu8w6xmTkhHQq7YqB
 6sjr8B/MEkESKZd2zihFbr+AONr/A+zZfj1LUxn7ybCkAjVgZgSd/8qaDKfQ80yLmqQ0BRSkeGz
 amEaT0BWC2jpFj+8MZtUtBXf+z9bahh5j056vMkVIxI9JYXqQP93JAWILiBJswEK4Jp/JfN/kob
 IB8ujk8J9H7TT9ecxQyqEB0C46D6P6XwcwHvc37pA3YhosBN6qf4g2/KI+owMDJ0332tJr3/qHk
 W8zgS6RLoOa5hbK7Fi6p9dmW3gWzX4H/Finc692pfcttBCy/pVuPB+ZigEOdAuid3K7Ktu6iuSz
 nDpYalI5tGa/XF4DMuxkEqTrgQ=
X-Received: by 2002:a05:6402:4018:b0:6a9:9cab:ff16 with SMTP id
 4fb4d7f45d1cf-6aa54ca6052mr6680420a12.0.1789934708073; 
 Sun, 20 Sep 2026 13:05:08 -0700 (PDT)
Received: from gimli.. (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aa67e1b7e1sm2796115a12.26.2026.09.20.13.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2026 13:05:06 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Joachim Wiberg <troglobit@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2026 22:04:49 +0200
Message-ID: <20260920200450.15964-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914103020.3485030-1-troglobit@gmail.com>
References: <20260914103020.3485030-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH v2 2/2] package/mrouted: bump to version 4.7
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

Multiple changes upstream, for the full list of changes, see the release
notes: https://github.com/troglobit/mrouted/releases/tag/4.7

Package changes:

- Drop local backported patch, merged in 4.7

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mrouted/0001-gcc15.patch | 33 --------------------------------
 package/mrouted/mrouted.hash     |  4 ++--
 package/mrouted/mrouted.mk       |  4 ++--
 3 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 package/mrouted/0001-gcc15.patch

diff --git a/package/mrouted/0001-gcc15.patch b/package/mrouted/0001-gcc15.patch
deleted file mode 100644
index 781f83f5c7..0000000000
--- a/package/mrouted/0001-gcc15.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From cdb388c8dc6e661d2a23f1e9b79102bc68e89af5 Mon Sep 17 00:00:00 2001
-From: Philippe Troin <phil+github-commits@fifi.org>
-Date: Wed, 23 Apr 2025 16:04:20 -0700
-Subject: [PATCH] C23 compatibility.
-
-bool is a keyword in C23.
-
-Upstream: https://github.com/troglobit/mrouted/pull/65
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/kern.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/kern.c b/src/kern.c
-index 27f8dd4..04f1c36 100644
---- a/src/kern.c
-+++ b/src/kern.c
-@@ -104,11 +104,11 @@ void k_set_rcvbuf(int bufsize, int minsize)
-  * in the kernel and "panic". The kernel patch for netinet/ip_raw.c
-  * coming with this distribution fixes it.
-  */
--void k_hdr_include(int bool)
-+void k_hdr_include(int flag)
- {
- #ifdef IP_HDRINCL
--    if (setsockopt(igmp_socket, IPPROTO_IP, IP_HDRINCL, &bool, sizeof(bool)) < 0)
--        logit(LOG_ERR, errno, "Failed setting socket IP_HDRINCL %u", bool);
-+    if (setsockopt(igmp_socket, IPPROTO_IP, IP_HDRINCL, &flag, sizeof(flag)) < 0)
-+        logit(LOG_ERR, errno, "Failed setting socket IP_HDRINCL %u", flag);
- #endif
- }
- 
diff --git a/package/mrouted/mrouted.hash b/package/mrouted/mrouted.hash
index aabfd19f33..a38fec413e 100644
--- a/package/mrouted/mrouted.hash
+++ b/package/mrouted/mrouted.hash
@@ -1,5 +1,5 @@
-# From https://github.com/troglobit/mrouted/releases/download/4.6/mrouted-4.6.tar.gz.sha256
-sha256  49443c47b5b28a5ab65d796f3495d72a94c1c95e54333cb11fe04075006b576b  mrouted-4.6.tar.gz
+# Upstream sha256 from GitHub
+sha256  24da2782297dad2727c7b467ce232837f3e71a8a42d15e0bd029495da83abc3e  mrouted-4.7.tar.gz
 
 # Locally calculated
 sha256  834f45ed282fd010f354ecc0a50538af519a1cfcc4d2866de3be06982fa9ed29  LICENSE
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 077afac2b9..e44a0e46b2 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MROUTED_VERSION = 4.6
+MROUTED_VERSION = 4.7
 MROUTED_SITE = \
 	https://github.com/troglobit/mrouted/releases/download/$(MROUTED_VERSION)
 MROUTED_DEPENDENCIES = host-bison
@@ -13,7 +13,7 @@ MROUTED_LICENSE_FILES = LICENSE
 MROUTED_CPE_ID_VENDOR = troglobit
 
 define MROUTED_INSTALL_INIT_SYSV
-	$(INSTALL) -m 755 -D package/mrouted/S41mrouted \
+	$(INSTALL) -m 0755 -D package/mrouted/S41mrouted \
 		$(TARGET_DIR)/etc/init.d/S41mrouted
 endef
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
