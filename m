Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEC8C021A2
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 15:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABDCC4240A;
	Sat, 14 Sep 2024 15:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6I7BSDTgctU0; Sat, 14 Sep 2024 15:23:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65D2B42453
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65D2B42453;
	Sat, 14 Sep 2024 15:23:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C305C1BF844
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0AEE840AA
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 15:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2WLwhd-QFRx for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 15:23:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3EFE840BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3EFE840BA
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3EFE840BA
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:23:38 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so456744766b.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726327416; x=1726932216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E8v1yG/q0TJloCNZrnK1i0FZghd+/HAMuldExZS6XcA=;
 b=Bi3TEdwvq5s7WsvPKtXid/4jIQVP1dB75CF3X/68ri+OAWP9Ypm3NIArFSELbHCpIq
 ykw49y2g4nHzMIKdR+kLntUKdbtLOyqB1SEQUlpDyeTiWVyHCjpX1mhMhWWxH9/Pbrvu
 +KN0J3Oq28W+21OAxTrM9CipA0kRvTiiJlPvOY6koVMer3go53didhnyU7zLT3YQhTt5
 852axVQEL59qt7ujdue/W1g/EsspAAtGVatiRR157s+7P0toyjPx1AmkKk/p4xCVxzXd
 jA3lh5XohTe7ne9upqj7ZLwe3w2P2ROrc8fBjPlh5evS66EBhIKgd9HWsU/uCCGLnqfn
 jcKg==
X-Gm-Message-State: AOJu0YypRYSI/VwHo7I7GIFob8qjebg3z/ZLBG2mD78OBKKnOxKvHN/Q
 w9xO6Ml1qhljDOetIdY6WDGkeBolAVy+hRrzZHaD9OvAVmfFUQCUrMz3wY7S+IDMX+s0BIlhOBA
 Gs4F5WQ==
X-Google-Smtp-Source: AGHT+IH+XML86mnp/OiQ1fCpFQzg7fys94Co4U0L0TqOYMsRhpqcNgE+Nl4MIN91jI7EcsGwszcGeg==
X-Received: by 2002:a17:907:3f9b:b0:a8d:4b02:3351 with SMTP id
 a640c23a62f3a-a90296eac34mr1138278866b.50.1726327416505; 
 Sat, 14 Sep 2024 08:23:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:61:a2::872])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061116c28sm91660066b.95.2024.09.14.08.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 08:23:36 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 17:23:23 +0200
Message-ID: <20240914152323.2630539-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240914152323.2630539-1-thomas.perale@mind.be>
References: <20240914152323.2630539-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1726327416; x=1726932216; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E8v1yG/q0TJloCNZrnK1i0FZghd+/HAMuldExZS6XcA=;
 b=MYYNcLDxGzoXnM61a2EuxsQCBU7v1T/x3mDlMS2Z8JZdYr3v0CepoicDdcJihjTJej
 GpiKFyB342bIxWOhoo789LaUTTPj2E620wuJFJQA98nibo8cis7hG/Fc7ml4Ot92EFNV
 GdC6E6/351cQ2WynydKipVdQGMk3caJiEiU3AfmDXGyA/rIZUDNJzzwwsCwgGStOOgNA
 actarJ2c8v3jjoQn2aJXU4rnbHvEWxJyT+RSJFAuxIoiT8po8RqIvoHpESJuoMKOecuA
 lBkFKJY7ADBOWMYxuvQpOoBYiQGvo/i1/89Q0ZCm3sAPpBYMU69Nyw4uHkRDvmUjJufr
 Ql6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=MYYNcLDx
Subject: [Buildroot] [PATCH 2/2] support/testing: add tests for Go providers
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Test the go-bin provider of host-go to build a Go package.

The tests consist of building and installing a Go package in the root
file system of an ARM vexpress QEMU system.
The tests pass if the program runs on the target.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_go.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/support/testing/tests/package/test_go.py b/support/testing/tests/package/test_go.py
index 0b25fbc26d..305f8aeb3b 100644
--- a/support/testing/tests/package/test_go.py
+++ b/support/testing/tests/package/test_go.py
@@ -13,6 +13,20 @@ class TestGoBase(infra.basetest.BRTest):
         self.emulator.login()
 
 
+class TestGoBin(TestGoBase):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_PACKAGE_HOST_GO=y
+        BR2_PACKAGE_HOST_GO_BIN=y
+        BR2_PACKAGE_TINIFIER=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.assertRunOk("tinifier -h")
+
+
 class TestGoSource(TestGoBase):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
