Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0813C433FE
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 16:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8604260B46;
	Sun,  9 Oct 2022 16:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8604260B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mUOaIHT7QRH; Sun,  9 Oct 2022 16:01:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A63D560615;
	Sun,  9 Oct 2022 16:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A63D560615
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D30A21BF36C
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 16:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC1D860615
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 16:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC1D860615
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ourhlkivdki for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 16:00:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B797C605EC
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B797C605EC
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 16:00:02 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id x18so2273766ljm.1
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 09:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6B0+1vATm4SFDE7dRunGD6BaCMc+y1J0KsbtSTZq9WU=;
 b=Ym2iV0gHCdmc0qK4Dg7SzSB9G4mRZ8XHR6JkjZ9TUAebZSakQWP6nNpq/7NOirda47
 nxfpMtYCmEFhMMiE/JPppZTRVe3+Cwbv8FCuqVUf9fDjsJdI1686W85c849X4D6g5BbN
 CXCAcmV7MdlbzX0ccaLSBYPg6SkxH0xezIFLKILMZz9R3LKe8B7uWvcjNwUzCsGzLHuC
 KHaNLzOVXe+nXN55iHBKViUbg6iwL0gb0WF7iN1eN2h8Pcvkxpu4z8Zuz70kLrQ4eITV
 gLtPDjs8hDXHCAyb5MuFNYs7OQcRh384cccKbogoj9kmepcTqJM7ZGCUfbgVpF7TBcbo
 sX4w==
X-Gm-Message-State: ACrzQf0IRbyJb/5nw1BI7k6rpG097JgqL520pFeGu6Mtg/8Lak1MISWA
 D/n9V6qqaLQcLBKaGT+svCiEcDL/ncI=
X-Google-Smtp-Source: AMsMyM419CminVLRFIbHXNKD0/QbRxPYJQlt1uM58yqWnVUyjEyXbL2/Z4LvhRIQmoX20DNJg9Yx4g==
X-Received: by 2002:a05:651c:c97:b0:26e:943d:449 with SMTP id
 bz23-20020a05651c0c9700b0026e943d0449mr2184920ljb.31.1665331200532; 
 Sun, 09 Oct 2022 09:00:00 -0700 (PDT)
Received: from luthien.lan ([98.128.186.104]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05651210cb00b004947a12232bsm1057918lfg.275.2022.10.09.09.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 09:00:00 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 17:59:36 +0200
Message-Id: <20221009155938.2041695-9-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009155938.2041695-1-troglobit@gmail.com>
References: <20221009155938.2041695-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6B0+1vATm4SFDE7dRunGD6BaCMc+y1J0KsbtSTZq9WU=;
 b=lT6GtxC2BFx0eCjDb5txkCX9XjF4ajp73e6FtsvIyC7vHJrGXA14YyugZADWqxWiuz
 PsCsomV/BtQX0GG2zgUzkUz336rfj82J711Q6wKXGaq2BCO+QqNd7U/uhICA+ghhVh5M
 CSdPuF8PygUJd5S+EL1isnTV9tf6ZRIG/8wj3gOj/0r5SnQr2F7wf10qh3SJ/kFYCldO
 vzdVbbN3h/Ozbc9363b1gyBwN2Zkdi4MsxCc+hZNzADOQ+nN5VFMVtFtbHVPaGv9UEck
 O7VxA2OWFDZThcnYxBMS+FnL0mQxcpn3FCygs2mOuPrRmzWFWcbgiXC38c5jB6NSQJMj
 f5Ag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lT6GtxC2
Subject: [Buildroot] [PATCH 8/9] package/s6-networking: bump to v2.5.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Summary of changes:

 - skalibs dependency bumped to 2.12.0.0
 - s6-dns dependency bumped to 2.3.5.4
 - skalibs dependency bumped to 2.11.1.0
 - execline optional dependency bumped to 2.8.2.0
 - s6 dependency bumped to 2.11.0.1
 - The obsolete minidentd program has been removed.
 - LibreSSL optional dependency bumped to 3.3.4
 - LibreTLS optional dependency bumped to 3.3.4
 - Client certificates are now properly supported in s6-tlsd-io.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/s6-networking/s6-networking.hash | 4 ++--
 package/s6-networking/s6-networking.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-networking/s6-networking.hash b/package/s6-networking/s6-networking.hash
index 9e333866d3..1890f95221 100644
--- a/package/s6-networking/s6-networking.hash
+++ b/package/s6-networking/s6-networking.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  a3fbca789dc5c82b3055fdbd2f55110902198f3136447617ce8f8b79fa8aa554  s6-networking-2.4.1.1.tar.gz
-sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  7ac79d4de3d9c13532e444ab7497c4e04ad0fa7229d502984d9dc7d48aa64418  s6-networking-2.5.1.1.tar.gz
+sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index 03807f0652..f740f22635 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_NETWORKING_VERSION = 2.4.1.1
+S6_NETWORKING_VERSION = 2.5.1.1
 S6_NETWORKING_SITE = http://skarnet.org/software/s6-networking
 S6_NETWORKING_LICENSE = ISC
 S6_NETWORKING_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
