Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AA6C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 19:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EED14007F;
	Wed,  5 Feb 2025 19:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HOVgNVlAHGz; Wed,  5 Feb 2025 19:37:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E34F641356
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E34F641356;
	Wed,  5 Feb 2025 19:37:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6165E12F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 19:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 503C341356
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 19:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VJp14_9sGtu for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 19:37:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4587A40955
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4587A40955
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4587A40955
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 19:37:14 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3cfae81ab24so246745ab.3
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 11:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738784233; x=1739389033;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PJ6AHaWFOQWk9iMwTRu3PF6saIVcUQumrlpdmDesyiM=;
 b=LFqQhim9ibHskwaLIc4YaGuPpH7/v+2sL8i6EJfBc7mkBdpNOcki1BUWviZtATWXDL
 ddAHlXxsdui3gQbMljzJaxUNyhYfDD874v0JvTTs4v3RigUg+8NEsaBT053h/eataTr5
 542ZaP9Qp/X6HC9+x2U5jvgn6gz+zz0SnZi/hf6UapFt6Cv8XMJP8RUTtqW3KcpDh9+a
 t10rn7TE2HAsdNlOFWz9nIPmrrVxiKF8vhwmFYTFthLL+D8wkcY+LdsmoM6abVIdTAJ8
 rf61hlsYe+RGgolcJT61aZNx4cvufOM3V23ydyEN24vN6Bo8zhp+6Yk0Bh4LxARHOs8S
 Zmbg==
X-Gm-Message-State: AOJu0YwbwQgU1loJAuAdp97sGnr6YJO5XYaCntd58RbpEorcs9oqgrrs
 cMIBVPYrU0Uqvruov0N/3g4Jjsu8pAmhFJVxOw7+jgV8IlE5B4jx4qFWwQ==
X-Gm-Gg: ASbGncsBEG/IYa4nQOoG/4vQ7vW17LlQozd/+XvbIzAhYxf+0wchVlIxj/AtG63hSzG
 8eB9i+KwhHSEkezaq0kCCeDU8kVve04FoZMp/pZFBPt19Pjh6IMVmgJsmY4jKi7RwY/ElA3QSoP
 eXrnPBGTfRs17Sh3R8wfWBzXglsQCOBjAPX4AqF+fTnnsFCjl3WUND2FgyzhK6pAfa/IKCoWeXt
 AvNq3Vhjq3KMQDk65CyasGp2kPOijF5kMAZ6Fv4gPueIhclkhu1D6X4GgQzAQGAAPNqAnDWCF66
 iqjvcej4vC/9sgQC5NKc7IXjIrJmXrvUQR3oIqtlrhRlUI4R3QpbIH8Ah5GajKIliw==
X-Google-Smtp-Source: AGHT+IGmzg+HICvdJk2Ld4NanKItyc3i/bqkn+hCFwy5TYoc6lb1Nea3615Elp1VFrc2qcgxMP5Y1w==
X-Received: by 2002:a05:6e02:1546:b0:3d0:d0d:db8e with SMTP id
 e9e14a558f8ab-3d04f40204cmr38750045ab.1.1738784232936; 
 Wed, 05 Feb 2025 11:37:12 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec746e2efesm3351262173.134.2025.02.05.11.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 11:37:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Feb 2025 12:37:11 -0700
Message-Id: <20250205193711.3373936-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738784233; x=1739389033; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PJ6AHaWFOQWk9iMwTRu3PF6saIVcUQumrlpdmDesyiM=;
 b=D8+lFvOsteonr0KWpj+pd+whHmuO0NW29kjfVCah7dWewZgXi/wVUa3PzVnRBN4Ek0
 mO4fNx6tONT5Jt79xZsKFSKXP1HF8FBEVzGSymZmIAnm2D8tqaAemFMf6Z13eKPaqovv
 ZEM+k9idLxD8uNyiVuvFYR/KaHzQIvr13L7+JlCdYeCYjl0xpUS8Q0XGtLwcx3V4LnWR
 DLdm8IKIptInh7z6axlpr0gl2NxNUWsgk4ZsHFz7e/SJfRvhCIjMECw2umdiGIsNmYsv
 m4lDNlXIq0jKg/q1GhXKyyG7KiLH1jGIUpzI4uhUmxnKhSge35VTCUFAswNmi/bgCHfT
 mtGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=D8+lFvOs
Subject: [Buildroot] [PATCH 1/1] package/libabseil-cpp: bump to version
 20250127.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libabseil-cpp/libabseil-cpp.hash | 2 +-
 package/libabseil-cpp/libabseil-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
index 76f1bd0f32..701801a7c4 100644
--- a/package/libabseil-cpp/libabseil-cpp.hash
+++ b/package/libabseil-cpp/libabseil-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f50e5ac311a81382da7fa75b97310e4b9006474f9560ac46f54a9967f07d4ae3  libabseil-cpp-20240722.0.tar.gz
+sha256  16242f394245627e508ec6bb296b433c90f8d914f73b9c026fddb905e27276e8  libabseil-cpp-20250127.0.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index a27d013476..34d62c4dd1 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBABSEIL_CPP_VERSION = 20240722.0
+LIBABSEIL_CPP_VERSION = 20250127.0
 LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
 LIBABSEIL_CPP_LICENSE = Apache-2.0
 LIBABSEIL_CPP_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
