Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D09FA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 18:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C8BB40730;
	Fri,  2 Jan 2026 18:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCFg2ClmcYyh; Fri,  2 Jan 2026 18:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34B54406D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767379899;
	bh=W1T/mghpJ0uceT38xiusRbqG8o9d8NqpemnN+EJv1nc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s4ILgR0nucQkMnwnqyNFVs1Z7nTYY6rRaSWTJhERZHkZ4wyFupf2G4x/WwCbFQfOG
	 qBibV5M8XMwbSN2crxiYo4RcWl4vwmOq/oYwPawfqjEf460PV0qCZ67KkDS8J7YIKA
	 kVHuPfJ0tPytHFwCp92NRVhHMfPr5xZLk8jaMSJHNTXD8Psa6NsjjtbwxThqdUcSKk
	 MHukvjQjo3USyCCMdJdrtrPrvCwzmZKi2jxm8MfecqdfKug21lceIvq8dzjw2dciQB
	 Znvby2H6/ZzGWCeEOsxZ9z5Jvv81hl4hU6GTiwMGoRPq9e5ZrVcv+oIPwg9wpVvzRT
	 ZVBINMmgMVBRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34B54406D7;
	Fri,  2 Jan 2026 18:51:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D2BFCD7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 18:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7D17608C8
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 18:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOLnX-OMBs4s for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 18:51:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.50;
 helo=mail-ej1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D046D608D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D046D608D4
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D046D608D4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 18:51:36 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b7cee045187so31941766b.0
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 10:51:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767379894; x=1767984694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lRBjAWksFlUgSo8YdFM9LWTxdLS8zq4hcMLeQXGE7hE=;
 b=jewcu/wqJIju4iN3ItW4ZRSGHMXvCh/VqpjN88CJ2p5BK8NFBEfK1yHtlIZFqet3vT
 Z5/eR5OLQpPIEu9xj1UDSv3B4elgav/SGqG37zd1rmJiGdl+jK7gJE96ovUtOGDNBb8U
 uo5x66PMhScFlWXZiH0XViwpJ/N/0J3jCKZGg3QnYnz8+GW1rI0BwtE0tM1yp1I4USe5
 UFjKMU6770+pqgIr7BuZk9L8uNml4d3+4kVuaWLqL2lx/rovJj5hmpJ7A2PU4jEshjPa
 Vnm4b8omjQ3JKkLdobg8JUAE4OFkZRAgNmosngeQl1AbgOEZLEzSt9jEl+yNbudTSJwL
 VPHw==
X-Gm-Message-State: AOJu0YxmPojiMAY2pkWTJr5UHtiei/IZVC7RdH7+EnBcEib8/plL7++E
 l6MTYqvHGZsxEAyUzddz6zgZ+mv9dYhC/kP3am/X4kFLXM53BH03xA5JJbP7x3Le
X-Gm-Gg: AY/fxX7Ok9fNIakH2JmlxKu0wfi1yQizYKuCKmDDfyJNM0RKrECd3pTuw2VGpe7BEJi
 IBsKW1Fr9fgTUIF6YgotNmKYWX+dZqd0PJWSyNQngTSgiCQRpLO4amfduBbYg4IFHKDwiW9FC6e
 wkVz4V5Craxyd9OSQF9SPlkADkATExGCYTn8WamUQP742JHMzcSJXqXN5Cc72MRymM1N0glsRkD
 oPgZ0HMUFjvAOWQ0x+vQsbrwbwUWe7iQ9LQNZWk+/b5LriIGidGJL4KjrETB5HgiEMZEiWQM+Xe
 udSJ3NryW0lhcfo78XvPZEH/0d9HoxumimEfiMj92VL0ADgyXZTOm9w8ZnFS4yMrDc31EsRrBK3
 4HPjmy7c2BpZlv7jReSB/Wpy6BGIP0lXEn2Gohd99trs3iUOIg1YgMykovUBdJHuysRMqZDsnmx
 63jcnhcDbZiV86TdGJ+0Mc66zAOjGB54C8e9TKMVoKKb3IPb1V27g2BabvPlEghnK0O06Lvg==
X-Google-Smtp-Source: AGHT+IFn+zyxbcapGMsOIO25H+eCrQFXGFOtqPBRb/qtdl2ac+Aa53ixsMBzy9ekst37fNTtirhWNg==
X-Received: by 2002:a17:907:a05:b0:b83:1327:890f with SMTP id
 a640c23a62f3a-b83e2756e5emr57275966b.25.1767379894289; 
 Fri, 02 Jan 2026 10:51:34 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb5f:fa00:69e3:f983:61e8:2bf3])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b8037ad8577sm4637658466b.24.2026.01.02.10.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 10:51:33 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: buildroot@tudorholton.com, thomas.devoogdt@barco.com,
 thomas.petazzoni@bootlin.com, thomas@devoogdt.com
Date: Fri,  2 Jan 2026 19:51:30 +0100
Message-ID: <20260102185130.1183951-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260101150828.20c47d75@windsurf>
References: <20260101150828.20c47d75@windsurf>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] support/testing/tests/package/test_openjdk:
 drop the X11 dependency
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

Commit 3dd73c3 "package/openjdk: allow compiling without X11 support",
dropped the need for X11, so drop it from TestOpenJdk.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
$ ./support/testing/run-tests -o /home/thomas/br-test/ tests.package.test_openjdk.TestOpenJdk.test_run
09:49:46 TestOpenJdk                              Starting
09:49:48 TestOpenJdk                              Building
10:36:12 TestOpenJdk                              Building done
['Hello, World']
['Test: Get JNI Version passed', 'Test: Read Native String Constant passed', 'Test: Write Java String to Native Library passed', 'Test: Write Java Char Array to Native Library passed', 'Test: Write String Member to Native Library passed', 'Test: Set String Member from Native Library passed', 'Test: Execeute Java Function from Native Library passed', 'Test: Instantiate Java Class passed', 'Test: Call Native Library to Set System Time passed']
10:36:50 TestOpenJdk                              Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 2850.304s

OK
---
 support/testing/tests/package/test_openjdk.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/package/test_openjdk.py b/support/testing/tests/package/test_openjdk.py
index 26b7f9ee92a..3bf89f9efe3 100644
--- a/support/testing/tests/package/test_openjdk.py
+++ b/support/testing/tests/package/test_openjdk.py
@@ -18,7 +18,6 @@ class TestOpenJdk(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_TARGET_ROOTFS_CPIO=y
         BR2_TARGET_ROOTFS_CPIO_GZIP=y
-        BR2_PACKAGE_XORG7=y
         BR2_PACKAGE_OPENJDK=y
         BR2_PACKAGE_OPENJDK_HELLO_WORLD=y
         BR2_PACKAGE_OPENJDK_JNI_TEST=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
