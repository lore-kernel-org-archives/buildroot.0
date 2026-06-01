Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07033CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A868B606BA;
	Mon,  1 Jun 2026 20:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajCrTf1jFbrT; Mon,  1 Jun 2026 20:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0CA160728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780346870;
	bh=sIwhyGsxrkhtN+8feKY9dVE1cJTUPBtmOGgqTXqOCXE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B/k271Usc0ZPy1toDpOHrAEOweG5Buz+7Qvty5PK0UPqI2EPK7/p0YmTsjQWsXxGY
	 7ZinqG9pz/2hkmmepSz+VgpMyy5Cg7sMzAOpIMWqMR9uzx0Db0K1M3hTxCbavO6cIo
	 cJGyvE7PrjeGiAD3u1tWk3AmH5afobB9RlHCbGNRYpw1/neOzUr6ep71qJSalVLcr5
	 DkFoCfM7owW+HG2PEcdtwRd1ci2WdkX0olMkj/vvD4aIRX9bk4O1Y0DTz576wCERsg
	 uqEWbIyzUVLSrrQoiyLhbKO4wpQmlrdCwQO30A+A5ljc1Hl4y2lGI90bToNCrXi+K8
	 FbX7tKaijqsNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0CA160728;
	Mon,  1 Jun 2026 20:47:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D3E0223
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32F25404E7
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AONwGQvtzPEL for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:47:48 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24D0940523
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24D0940523
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24D0940523
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:47 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3966c0d5ac9so23629681fa.2
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 13:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780346866; x=1780951666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C//Dw2ZY3WROfqzloT4NWqe+RNqL9PCC7iZSAtDf158=;
 b=dL6COl6OjjBSFuE9Eo1Uvi1yscuITMqvVSiJIRsquebQGNm5LR4Gq/3tpjh7XRSpeK
 +xs2IkTjrjeqqc/ypuElu1a6QTXVl8WF50K6neRviiO71Vu0aeltFhnx9+ZniLmi1JFG
 EA7qqN1kq6UlQfno2lCom/hol1qPt7eCMhEnNsduDG4ogkvpFHN92K1ORjDUiPmY8z+y
 mQ0WXJ5+7B7wZWN0kiDYqL/LXM4O8uqk9XT17onO68Ys3TUvmn/6QqKe6QEvM5SHpQ6V
 fwRpto5ihrbR0yLr7wa46bNpvT7rXuForuJz2oYxfhSANC3cdUmw8HwWc0l7MDNN35yy
 UlBw==
X-Gm-Message-State: AOJu0Yxbjc86b7F0pBHZ18pyyPF99/2ltLGNIQJ968AhcyqkaNTGTT9+
 wogyWu6Gca2Av9CL3QwKd8DyaTusexLEetB6TZZM98jiC0mCOwvI+sldlsbuQ7xl5TI8tqN44zc
 If537e1PkcQ==
X-Gm-Gg: Acq92OHkGHYMN+uigVd84Sxx3RmGIoMUFbTzyYbyPSR0yTznUoK6f4WBwUPnGzN+Uc9
 brWCD4J10EOB2SF347MrWCl6PozTuJ6U0tDitqEWnrxRCGlGiVVxmdatruUQPx1IDkf/sAQGZdB
 D0yZTAU/7FhdtNwlkWg+OxEbHnbJysoBeiESDdSTqqA4WsRWfFk4fhNyhBrv8MTqAoarBEgJlZA
 psWmDA7yzTGpXgjA1EFwPj67bJUc6d8URUfXPhJLJoO2jh0vubk73vtqzTW378/1Rh2zNl8l3yr
 GJrhEGZlYvIEMDauET2b2KvMzlTWodCuNVd0EscZosEAkdTuwwudWcqgH+AOtbvuQf1LRWU257V
 dr/jzLEkxFc/kznqSBA7ipIbJhy4l8pJSEoKMBOPTPlkIqCAvlY/7zAMXc8oMsvOJlVhRItXLuu
 8QNR0EVqbraY1hGqc7vZR1Hc2kb/Whpnh8l+LtKJdpAl95tUxRxLd6jt+LET5awg==
X-Received: by 2002:a05:651c:1595:b0:396:8e76:9701 with SMTP id
 38308e7fff4ca-3969a5d7f07mr5652091fa.14.1780346865728; 
 Mon, 01 Jun 2026 13:47:45 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 38308e7fff4ca-39659c93943sm25530241fa.17.2026.06.01.13.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 13:47:45 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>, John Ernberg <j@j-ernberg.se>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Mon,  1 Jun 2026 22:47:28 +0200
Message-ID: <20260601204735.888967-3-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601204735.888967-1-j@j-ernberg.se>
References: <20260601204735.888967-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1780346866; x=1780951666;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C//Dw2ZY3WROfqzloT4NWqe+RNqL9PCC7iZSAtDf158=;
 b=P9jXNIiM0m20zjXcsHUADe5FYUFYEK6WiYurd55yuzaFQ0wWBOj0Cr5rPul4pGg0yk
 df4qdcL5/Qjwm4BJ7ifMHy0b/GplF1l43VckDT14Fnw6ptzeWa3hiHY9tqDEox5diTTM
 a9TOt0/9n3cXOGdZURYM9+N9chTjy84nfJTgUxXBz9+vo8fpVaEspp/rrzOu993L9A5Z
 AKX+yDlU3mCrTwwdsK6qx1+OFdXzP2Ac89yEqlkWUnoCJcQBcnOTgVzaHPTbg8YJ9pqM
 R1Bum8ap8AaiuuRNQV68inKtUMPkKADDJMrVDqfZZoV1l2RvcqnsS0XPL0WrkPnU8sI5
 cB1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=P9jXNIiM
Subject: [Buildroot] [RFC PATCH 2/9] package/libest: Drop java support
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

The package doesn't compile when Java is enabled.

It has been broken since commit 3c66f65a6a54 ("package/libopenssl: bump
version to 3.0.9") from 2023, and was left unfixed by commit 8dc7445056d1
("package/libest: Add support for openssl v3") from 2024, which added a
patch to support OpenSSL 3.0+ with libest.

No one has complained yet, so remove the support as it's clearly unused.

Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>

---

RFC: upstream has not made a single commit, responded to any tickets nor
reviewed any pull requests since 2022. Should we drop the package instead?
---
 package/libest/libest.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/libest/libest.mk b/package/libest/libest.mk
index 9f3168767d..16cf40b203 100644
--- a/package/libest/libest.mk
+++ b/package/libest/libest.mk
@@ -21,6 +21,7 @@ LIBEST_CONF_OPTS = \
 	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-pthreads,--disable-pthreads) \
 	$(if $(BR2_PACKAGE_LIBEST_BRSKI),--enable-brski,--disable-brski) \
 	--disable-examples \
+	--disable-jni \
 	--without-libcoap-dir \
 	--with-system-libsafec
 
@@ -35,15 +36,6 @@ else
 LIBEST_CONF_OPTS += --disable-client-only
 endif
 
-ifeq ($(BR2_PACKAGE_OPENJDK),y)
-LIBEST_MAKE_ENV += JAVA_HOME=$(HOST_DIR)/lib/jvm
-LIBEST_CONF_ENV += JAVA_HOME=$(HOST_DIR)/lib/jvm
-LIBEST_CONF_OPTS += --enable-jni
-LIBEST_DEPENDENCIES += openjdk
-else
-LIBEST_CONF_OPTS += --disable-jni
-endif
-
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 LIBEST_CONF_OPTS += --with-libcurl-dir=$(STAGING_DIR)/usr
 LIBEST_DEPENDENCIES += libcurl
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
