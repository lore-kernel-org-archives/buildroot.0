Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67411C55172
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 10:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21B8A6072C;
	Tue,  4 Aug 2026 10:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bl_JNZ4qQRFT; Tue,  4 Aug 2026 10:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D30460731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785839951;
	bh=Qcgt1xeFPFZnrW8ItO37gtTzD3EQKCNC8xjoNdBlw2U=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n1cBpETU46pXCG66sy9S4FpI8kEQbxCNhgweIKvbOnaMMnZJcKzlXLOBjN/dthWVJ
	 XHQxAZBZVAUP0CSTjgZLS6SGUzneDsy1U7NrNdGaVm8oSllDHgncxEuRlR766LABiI
	 eggXG1a9B/jTvFKH43yr8tQy3jBcYRlsMeIjXpdMGB+jjjkbk4I0dgseIDnUVRTTP5
	 TUgBgw0ysz9/etGDLAseNaaQS4jzVYNBMRE9xuoXljk/Il+qox5+JOEfnyybI5F9n0
	 UZ/tYQzacxe4HOEWS7kV2Fajk3S2Jt4syOEUf9u1nQbZNnDZT2FpeIqnjPmTOccfpK
	 toSrRnrAGbagA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D30460731;
	Tue,  4 Aug 2026 10:39:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0303350
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 10:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1E1D60731
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 10:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 49kkVEt7cVy6 for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 10:39:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE9766072C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE9766072C
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE9766072C
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 10:39:08 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-51c5382806fso41721191cf.2
 for <buildroot@buildroot.org>; Tue, 04 Aug 2026 03:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785839947; x=1786444747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vvg6Sllb2u5//reof2weTJyIypCMW9UvhGlyMg8iqDw=;
 b=jBhW6gSWyW7F6BGKnHmYnN41siFm2sR1saKURNSMuMyLmM5dzxlbI+10oOn62mQnmZ
 ts3QkRlGQX235KrhVrnKMShC1O6jZfo0rDiCwAD4nm9RW0H9EoNm98ZVF7uFYTSvqN2u
 e55wE1r4/KGoX+sbEn1xGJzu/P/STTchg6qPxOiUtibL1NmWlQL2MS9cNgOH7QW/TVGt
 XiNK8Mns9WxjI7lrI75fXHp405mO/siz06c4w6UhckghUbBCQMtn3HogrexUNPwpEdtB
 TBpL7Up8R6IpOFR/jZLmhWpnzet3e1UaX53FyUZiewc3EPeZEdShRCtNnzSAJrbXXkO6
 8RQQ==
X-Gm-Message-State: AOJu0Yx7CrwEBam/CZCxQ38m6X0osPQLJAt4NNfZevi3uUMGP5jPcOZG
 Wjtkjae4s/vb7i4vIurN+aiABiPfLoLNrwl0QKVewnCxJkrzJ32J1Ru9+NXVDcuzx2s=
X-Gm-Gg: AR+sD130WDh/8DUXfVwCO/86aYNFNXdtaAhh4RXSzJjusvNGZ4zfeqzjbjHIUpz/yQb
 tmatsR5HoosQp7vR7p+witEHlfetIv9GJvsoBdFtAPSTNd8H1OxXAKO6Ni2ciA6guUkz8+nNt2S
 CN9UZVMQB+RMUBqF1be/TOHCXQv4wjjrUW0RR6osGvkZYk3RTKi/49nmLz+aY5AdA8CZBtjbZVV
 pgizCrGdxV+rlWVMzIleyq+CRmaVVVQQ6fYAbsj0yKb62D4wiPcNYXO4WGkBrjsswEhNBzVybQS
 iyPSrdOdUPAF3+NDtsdw9SnWuQs87s7jdxH+T4qH/nURHcmTBsWPFkQ9TUQdyrq5zJ0ASEerMUK
 ccMnMLHW75xOpqLUJQgx3WSQJL9szJdWZGpukhrMUy+DH8TU/IMG5HYLwlemyPhjjvfqv3fpnbr
 WJL7RT2eRSQX2KrXeVvF/HBKyePWSGvoIm2Vp0/0sM5cc2aPDcuwNhjCOUBo22Zp6lOZI/CpOeP
 haNJjtXvtYbKJ8=
X-Received: by 2002:a05:622a:1f86:b0:51c:22c5:daf5 with SMTP id
 d75a77b69052e-52b567d07c3mr277742391cf.38.1785839947372; 
 Tue, 04 Aug 2026 03:39:07 -0700 (PDT)
Received: from optiplex-7020.tail176fc.ts.net ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52b4e7edd06sm79871711cf.2.2026.08.04.03.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 03:39:01 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Alsey Coleman Miller <alseycmiller@gmail.com>
Date: Tue,  4 Aug 2026 06:38:53 -0400
Message-ID: <20260804103854.429758-2-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260804103854.429758-1-alseycmiller@gmail.com>
References: <20260804103854.429758-1-alseycmiller@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785839947; x=1786444747; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vvg6Sllb2u5//reof2weTJyIypCMW9UvhGlyMg8iqDw=;
 b=GXNEC41UruA7GcbQDOadiIbkmbC9dwEZBU3p+rH57r2fYBtpLyERDziaT9BTGenC+D
 MnEU7occrKp07p3FPrlyaX91XW2psRvczAjfQR6ImN+vC4ghqND9lj2gU8IQ1YtI+68Q
 cPySEpeyrc/j1Q9AIVr7dLZytX/reTpQpUqzBbpldvxX9G+/k5vik+5dDSIBa8vP8xjn
 8jlc/8v2WM7wsOYk+tomt+605kfbV3JJhLvPAlqHWQEKbbE1LarkjKyYqEyKuGuGO0td
 X6ZzQLHK1/XxuuUS6Zm2reZ1RnxpONQyQfrPxtMYDak7bdSKVZwCKLsKTAMIzvBmyzNs
 OR0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GXNEC41U
Subject: [Buildroot] [PATCH 1/2] package/liblc3: new package
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

liblc3 is the Google implementation of LC3, the mandatory codec of the
Bluetooth LE Audio profiles. The PipeWire bluez5 plugin can use it to
encode and decode LE Audio streams.

https://github.com/google/liblc3

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/liblc3/Config.in   |  8 ++++++++
 package/liblc3/liblc3.hash |  3 +++
 package/liblc3/liblc3.mk   | 16 ++++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/liblc3/Config.in
 create mode 100644 package/liblc3/liblc3.hash
 create mode 100644 package/liblc3/liblc3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f2713c7239..f8a6e5bdd0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -166,6 +166,9 @@ F:	configs/hifive_unleashed_defconfig
 F:	package/libspdm/
 F:	package/xen/
 
+N:	Alsey Coleman Miller <alseycmiller@gmail.com>
+F:	package/liblc3/
+
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
 F:	package/dcron/
 F:	package/libxmlrpc/
diff --git a/package/Config.in b/package/Config.in
index fc1e57d30d..82d11b5bdc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1570,6 +1570,7 @@ menu "Audio/Sound"
 	source "package/libgsm/Config.in"
 	source "package/libid3tag/Config.in"
 	source "package/libilbc/Config.in"
+	source "package/liblc3/Config.in"
 	source "package/liblo/Config.in"
 	source "package/libmad/Config.in"
 	source "package/libmodplug/Config.in"
diff --git a/package/liblc3/Config.in b/package/liblc3/Config.in
new file mode 100644
index 0000000000..8dbd1d00b4
--- /dev/null
+++ b/package/liblc3/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBLC3
+	bool "liblc3"
+	help
+	  LC3 is an efficient low latency audio codec, specified by
+	  the Bluetooth SIG for the LE Audio profiles. This is the
+	  Google implementation of the encoder and decoder.
+
+	  https://github.com/google/liblc3
diff --git a/package/liblc3/liblc3.hash b/package/liblc3/liblc3.hash
new file mode 100644
index 0000000000..269316d501
--- /dev/null
+++ b/package/liblc3/liblc3.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  276752ff54ce6a77d54ec133397b9d7e71f90caf3d9afa32d8b0e891b8ecb8af  liblc3-1.1.3.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/liblc3/liblc3.mk b/package/liblc3/liblc3.mk
new file mode 100644
index 0000000000..87ab68105a
--- /dev/null
+++ b/package/liblc3/liblc3.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# liblc3
+#
+################################################################################
+
+LIBLC3_VERSION = 1.1.3
+LIBLC3_SITE = $(call github,google,liblc3,v$(LIBLC3_VERSION))
+LIBLC3_LICENSE = Apache-2.0
+LIBLC3_LICENSE_FILES = LICENSE
+LIBLC3_INSTALL_STAGING = YES
+LIBLC3_CONF_OPTS = \
+	-Dpython=false \
+	-Dtools=false
+
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
