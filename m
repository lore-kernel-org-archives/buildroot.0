Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA2FC44502
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 08:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0ABE40372;
	Wed, 21 Jan 2026 08:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5t9TUiasjLQ; Wed, 21 Jan 2026 08:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C52F041462
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768984860;
	bh=uVy9Od1PXmFKeFGqUibIBr8bwi5bxuKZXki/4nWHous=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LxMLg4A1fW7Pgg+dtJursrjJgnsNulVrQiWh1L05fnX3MRrIHUGDiEt2EhOP6IkJz
	 e3rkReWZk0cT3hKjI8fBCN3FHLtzRFHrFVaf9bVbFFydIkgQ81osrculsIbyLMe3Dw
	 LKmXvoM/sY8obroZxgMmkGWWr1NqgAh5TPX4fBsXs5y506INOPHOjOuyS84zQzzZx7
	 xaBgD81120JJloOEy9vPxW7rdAY8vAmLyir1hlK5Q9i09rVKwWT6XsasCxDznuhjSK
	 i3LG2gNZKjFM9QbC3jZyEjZ+gTVDIT3uxip13hYtQ53ElOel1qPqzrV7Z8YmgpIpiI
	 d9Wo8QJiA4wMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C52F041462;
	Wed, 21 Jan 2026 08:41:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C695E160
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 08:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B599940C3F
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 08:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Q34s2YZUMhc for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 08:40:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=nolange79@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF42C40C3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF42C40C3E
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF42C40C3E
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 08:40:55 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47ee974e230so49418615e9.2
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 00:40:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768984854; x=1769589654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Smjl9mpfwWBc9S6caPgoUqqmpBds5OfAewF0yqugLrM=;
 b=wMs5fU8lJwEEFOb/9DtSD1IncJhA96mXqJc6UvAnDvmffNk7lBiBw5B7WnsVvxL9aK
 IAM+7fX4lv5/Z/y2850uOwAWBGVfJVfMbLpcTsj7kNQdBlAlFSwj1zQ+yyeWqWE+Y0/i
 V7W1U/5kY/opV0urfGCESa/TygTEa3NM2Zsze0wvr3GQIDkdBhkhW9gNXnt6a71R1W+E
 +UghcQvB7vHgNdJXFBvJXjL8PGP1JCaEhBaIrZbCFYRuR+4bydKso2ZqG0FVkxnWfHIV
 g9BgRs1TFWMfTk5W61Fp0HtBgnSh2b8Mxh5aIVaZzCh0QMlCAqvxQ6Qj6bVfyo0yiFF5
 fwVg==
X-Gm-Message-State: AOJu0YxTL2GGVykY6abQr7h0yqvOgXQ+101URMybSBNuT4IPDnJZW2T7
 rmf9FUT99F2OtZ3ZNKs0nNRAm45+YtGnMskQIrtC8vDsw0B1jaURMXJMEZFwlw==
X-Gm-Gg: AZuq6aKa48ivg3X/2Ibao8CINPsBze97b/qiBPtlsQVqxFc3ZxMUqVS0S6RBsmNfXDB
 9FOKYjSxUhbE63CDChFm7cCgG46W0GzuVmEC1JwgMLHZFpLnLsZdGuXDY8Cxa7MoVtdvvDhkSbl
 8Y+r9paAD+9y5MAsBvAkbGRYuaNEFnJyAhgRZLPzp0fzJBg9m8auZJpvjqKUdJxB67rPwsT/5I7
 RRslcsQGHsvbcfPA0Fk1CBfHZ96SYdJ4DVu2HNYS5j+soW5+KtO0lMMsSI18I+d9C7mTu3i07Rp
 9TEe8SnmHQsblxqa4kgNqsJDGAUraz02p96kcnTHjTL/A39vuHU6PLvbJDjxyG2NHiyjTLv/mYE
 98ulyDT1pqB0xfrXhoBqTUQIt8dSFU9jT0lAk5yHbL4Vq/dpdSOCXBzsFLxim65dFVMydPmv7t+
 UAnXEN7GE6K8EwCFLAiyOnyH1dhTlkQfRdFwO7FuwKoUU=
X-Received: by 2002:a05:600c:3e0d:b0:479:3a86:dc1c with SMTP id
 5b1f17b1804b1-4803e803c1amr74375095e9.36.1768984853495; 
 Wed, 21 Jan 2026 00:40:53 -0800 (PST)
Received: from vcllano-01.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804249be6dsm17011735e9.2.2026.01.21.00.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 00:40:52 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>
Date: Wed, 21 Jan 2026 09:40:48 +0100
Message-ID: <20260121084049.3613479-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768984854; x=1769589654; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Smjl9mpfwWBc9S6caPgoUqqmpBds5OfAewF0yqugLrM=;
 b=hPAZ1g2q8tGAt1xnjC8SoL44HjILyqKSPbk+tOsjthtPXJz2KpaybaVTekirrgxvOU
 n9+lLrr73hu/iNIM8tAg1AQpYtGHxxVfv/kHQzJTYTpCoBuZPVl2q4vjqPpNejzVQK3O
 z6OXJM21vEuRNT7waojbgpKFzH/531aVdXeMFeEkpLJf8vzifyr94w4pmfk3R7d8lEsE
 KXUlveFtrPEBw+M3bJMjwtx/7dLcd0Hsvup8dMyb9EHhPDDDurCZ+EXwHiOGgCfjo/sp
 P7W9qLBuFTAJRnA1Q5PX8T03DGP2hcI/0W8yPwphACP0BcQ7wRqwjivAs7P8LGz+sjZC
 noqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hPAZ1g2q
Subject: [Buildroot] [PATCH 1/1] package/dbus-broker: bump version to 37
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

https://github.com/bus1/dbus-broker/releases/tag/v37

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/dbus-broker/dbus-broker.hash | 2 +-
 package/dbus-broker/dbus-broker.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-broker/dbus-broker.hash b/package/dbus-broker/dbus-broker.hash
index fd4f43d16e..f4abd668d3 100644
--- a/package/dbus-broker/dbus-broker.hash
+++ b/package/dbus-broker/dbus-broker.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  d333d99bd2688135b6d6961e7ad1360099d186078781c87102230910ea4e162b  dbus-broker-36.tar.xz
+sha256  f819a8db8795fa08c767612e3823fd594694a0990f2543ecf35d6a1a6bf2ab5b  dbus-broker-37.tar.xz
 sha256  3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4  LICENSE
 sha256  ce7b8b8fb05126e556b3f9ed97fe21aa654e4ff411c00a9fd219ecbaae26abe0  subprojects/libcdvar-1/AUTHORS
 sha256  8153c478102dc209b30dd4627cf5bb3596263f99692bf3eec174b1e17bbf8a3b  subprojects/libcdvar-1/README.md
diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index 0bbdd304af..7e029879f9 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_BROKER_VERSION = 36
+DBUS_BROKER_VERSION = 37
 DBUS_BROKER_SOURCE = dbus-broker-$(DBUS_BROKER_VERSION).tar.xz
 DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS_BROKER_VERSION)
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
