Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7310BCA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 11:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34D4C615DA;
	Fri, 29 Aug 2025 11:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zU_k2K0jsVY; Fri, 29 Aug 2025 11:26:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 579A4615C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 579A4615C1;
	Fri, 29 Aug 2025 11:26:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D0B369
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19E15842F7
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gCZdrHp0O8h for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 11:26:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D432842F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D432842F6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D432842F6
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 11:26:53 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb6856dfbso358651266b.1
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 04:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756466810; x=1757071610;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KSaMTHY2ZkzWc+DUjIXJ1mNinTXqn0iEB1V7kAmqMuc=;
 b=CUmJRk7GehWLXE3NhqZ7hyMBO4yH5vET6APSghYqiYvIR1gv3ISN1VS8J6gqwLPOyO
 LBuglaQ2Va/PN9gKmgU/9zh58EeGAq2MTTjbLJFuD7P8IebWh/gkbcbiz2qWX5yYT6WK
 gbbgbWZAtefqes/zkPjvZfZT/eBUcMGrG0/JI/bpJc4UECBzpN8SxkZm9Q747kgFwHXD
 o9irCpXT5AmhYWNALUso/u9j7i0s6H7Ewzn5YTuwjZ7cuR1pOoaS530NpBoAuxsIwwIJ
 +68Vt0URNkIak8UEYI9tYixi7jXk+6mMbNcTXneE38aKdBVB+A+Ao2YDThlJQk4+a266
 kw2w==
X-Gm-Message-State: AOJu0YwKHya2LJ+nicUa62iJmIfZAUNiWc2ZVoOcTgCrYI0oXsN/IBw2
 WLh1R/LkFtBCzvCa+Q24l5n5pBmfdLGh6mRFJfmQxH60c3VsgJNk2UsLs+Cl8Q==
X-Gm-Gg: ASbGnctgjYgrrl6K8sTnToPXjp/kbFAYWcGUQ8MAshVJlWWshkAAmTId0WYVOeT9nEZ
 HBOpVguVeR+VjfwhLLa48DpubfCVIKWsm89TlE54SWr8KVPdKClMp++1ctAb2oBuhmdSdkSyzHK
 4HbjWsJzS7i3T4S7w3alM8qX+MLZSt+yCvMgeVx3fFpNO7V0jt8LEnMJL3k6NWBJW6r5s8mNf5X
 8ei6AgyZZhLOkayQUqjurVMW6xnKF7t8UnzpFrsLqta8DNPwCsyt1FExr4F3O6XRoxuQYgeHlvU
 I+o15jg3pHZd98aox4pBPHyQpyn31uAZaFyH1guXqHCA1awcqVU3/MyICqi3qZm7ujWS2a8GD0L
 6P0TlLoemeGEQF60ahAw8JRTy3tHnWNwr/S7nR/Q+yrTUilWzUsyiyu0+FL0sD143+QvwP5uhT6
 BddzpMyEKI2QCywQ==
X-Google-Smtp-Source: AGHT+IF2eYchB2iKVYNfcjDNIVtMJH/jbofVY9cIHWvsvcAti/kWW2QqdJqjOkCuGaddokE6fNdQeQ==
X-Received: by 2002:a17:906:1c02:b0:afe:d5bb:f444 with SMTP id
 a640c23a62f3a-afed5bc15a2mr526392766b.32.1756466810110; 
 Fri, 29 Aug 2025 04:26:50 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbcba56sm178051766b.53.2025.08.29.04.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 04:26:49 -0700 (PDT)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 13:26:40 +0200
Message-Id: <20250829112640.2631731-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1756466810; x=1757071610; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KSaMTHY2ZkzWc+DUjIXJ1mNinTXqn0iEB1V7kAmqMuc=;
 b=gr6yEgt+u0djexIoPtOGuz7vsX6abxuwNQr4S7S5UoOAwgtyaFm8vjYbyvci92chKa
 o1caOby0Bq4CQ3f81lhAvxgU8jw/nsWW9X2rEx3/4NtQrA8MpbjvlGRS+F+P7I6CpIoC
 ACoQfL6NfijYqcmn1TWuz4DleH+z18VxXS5IaJjNhyg5l3/r845MMFC5EmtfFfSAqA+R
 c213nLA0HDjB8fWrzCIw1teIH05SgtsdYZz2i8qSQf7fhkXKaYP21GPD21erUakvbexY
 64B6Nnmp1t8hy3ZNLX9mwyZuiqkF7JMutwd2RKcIEMkFiKVivyUYfDCONnvJ+rU+Di8n
 kc0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gr6yEgt+
Subject: [Buildroot] [PATCH] package/tcpreplay: bump to version 4.5.2
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

From: Yegor Yefremov <yegorslists@googlemail.com>

For change log, see:
https://github.com/appneta/tcpreplay/releases/tag/v4.5.2

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/tcpreplay/tcpreplay.hash | 4 ++--
 package/tcpreplay/tcpreplay.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index 6dc6e48f9a..4307fa60fc 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://github.com/appneta/tcpreplay/releases/download/v4.5.1/tcpreplay-4.5.1.tar.xz.asc
+# https://github.com/appneta/tcpreplay/releases/download/v4.5.2/tcpreplay-4.5.2.tar.xz.asc
 # using key 84E4FA215C934A7D97DC76D5E9E2149793BDE17E
-sha256  5126613f783062b43f514b05ad981376050a8fee35b03c8de4445ddeefd95049  tcpreplay-4.5.1.tar.xz
+sha256  2df15bc6d49f96a77617d137049f998193bbae95c1a31b04ca02856a24cbf384  tcpreplay-4.5.2.tar.xz
 sha256  07cf5e92d475287a7d1663b33097f40cae5adf03ed8920fcd4374e3dfb48c8ad  docs/LICENSE
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 17766707e6..32bcf8d278 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.5.1
+TCPREPLAY_VERSION = 4.5.2
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
 TCPREPLAY_LICENSE = GPL-3.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
