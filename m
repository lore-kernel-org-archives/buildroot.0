Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59BECCA470
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 16:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A74E041723;
	Mon,  6 Oct 2025 16:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBebC_t9w6zn; Mon,  6 Oct 2025 16:50:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D8134173D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D8134173D;
	Mon,  6 Oct 2025 16:50:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33A8C909
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 16:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2403D61397
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 16:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RK3tvD4eWwPT for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 16:50:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EC7B261395
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC7B261395
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC7B261395
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 16:50:00 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b456d2dc440so825481666b.0
 for <buildroot@buildroot.org>; Mon, 06 Oct 2025 09:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759769399; x=1760374199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qtxIP/mBMeuq4xkvp62zr8fbVimrFFscuFA7s/Q8I30=;
 b=fMFvv7GS0mKycVL5KgiRjjlOWnWqGdcDDhuvtPh0p8fDKn+7jsGaLdCtywTarFxsKg
 63JQ7UUfj4kXvrwovKuWrJTMEfiIx8Jr/SSQReNkumBCqeY0HsUPtVhTZhaQG32dDh3G
 /rDVj+0jlVm2Co2rlkTBv4mYBkYlJWthk1GMUDGnCNMpiofXUnpO9beMolH7YtEVZPqr
 EJNaDg7pH1nAOtQexL75UShlkO8yjWtis42eyg2nB//676FrAqWIQpaIfrxUB6o06ylB
 KcEDXRFMGfVL6+sOOit3CEbwcQhGUqJ6lSA1mu1lTXzQLkzwRWPxvVFXo3Ph5XG7qiZ5
 Ucjg==
X-Gm-Message-State: AOJu0YwLbrZOQztFBwLnA9zPZNvjJYq6hCaeqsrUCnszjZbaCINHhfb2
 vrC8NWg04bdOBEHXEyw3dNxcBI9MMiwquCti2ViJ2hzNhbjNxNVmFupBB+EdfAwucN1NtskAIYk
 8oR3Q1N4=
X-Gm-Gg: ASbGncsMiu9f4c0LYWNgbqKXYMELR4VQkKO/MBp13mMp82pz/YGqIgzuloOrUTZQXp1
 psTAf9J7HN+bAlg+cnvSI65Mc2VB6eetwPDC60apcjdyHP/7MRD5sAm7jcyVIx2x5+e57bN2yJu
 ooB7P014jG1ZSMhSWddTHTYinlJuSzAKt5+LReZdQ1c+K11TNQVBr2AN7KvMHfs7J1ddeosnvda
 J3iMgnEf97Sm82ahq+HnZzFBMICRkyTTkugWiF7lMeeLZCf6QxtjCNKVN5kvKxxLinv//vq8DhF
 z8Hhn3ofKAf+GAI9MPs6Prv2xVZd6g6RjGm8z/ETevbdmtlXXEGgQ4zSeY/taVI09AZblZsVEC9
 KlvoNCYWP2AZ8XPYb3zMv8crjPLutA9y5BtrCYs3e5Lrwkqb+2RArMjImJdXEK6jp2kXOfq7XLn
 quvl//FyNR3IGLA8pV/0WRR6bPgIihlWF0ke0Qbz5i1uyLAKC4/QbPdDokR51nc77A4fidPlZ/0
 aLMyrx29XacgnBBlY97BQNGpA==
X-Google-Smtp-Source: AGHT+IHFI1ZiVH8tK+miH9diePJOrOPgydf2dX+JlDtU60iqEJfTMVzf93DjW9vbRH+idQDE3SQfAw==
X-Received: by 2002:a17:907:1c8c:b0:b47:d628:f002 with SMTP id
 a640c23a62f3a-b49c1275feamr1654298166b.13.1759769398756; 
 Mon, 06 Oct 2025 09:49:58 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652aa02asm1184513766b.8.2025.10.06.09.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 09:49:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon,  6 Oct 2025 18:49:55 +0200
Message-ID: <20251006164955.1887486-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1759769399; x=1760374199;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qtxIP/mBMeuq4xkvp62zr8fbVimrFFscuFA7s/Q8I30=;
 b=OmxRXeKvcwlWqHeW9UqxvJAnRR4zLmKlB0kAgmksJTxEMiHqHQx3hN3bt+loXkSVMc
 Hc8XSzWRtlBDjnu13vWgJpy64jZ6unLtvVm6OZOXY7Oj4Hu1rHMczCom29w4Ym6/mMC9
 N4PSHIIcTCY4p/LoTRHkvogxKoRHWfPpPqzGw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=OmxRXeKv
Subject: [Buildroot] [PATCH 1/1] package/freeipmi: bump to version 1.6.16
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

Removes the patches since they are all integrated upstream.

Release notes:
https://lists.gnu.org/archive/html/freeipmi-announce/2025-01/msg00000.html
https://lists.gnu.org/archive/html/freeipmi-announce/2025-09/msg00000.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...ipmi-sel-string-supermicro-common.h-.patch | 36 ------------
 ...sensors-fix-header-guard-definitions.patch | 57 -------------------
 ...003-ipmi-sensors-add-missing-include.patch | 28 ---------
 package/freeipmi/freeipmi.hash                |  2 +-
 package/freeipmi/freeipmi.mk                  |  2 +-
 5 files changed, 2 insertions(+), 123 deletions(-)
 delete mode 100644 package/freeipmi/0001-libfreeipmi-sel-ipmi-sel-string-supermicro-common.h-.patch
 delete mode 100644 package/freeipmi/0002-ipmi-sensors-fix-header-guard-definitions.patch
 delete mode 100644 package/freeipmi/0003-ipmi-sensors-add-missing-include.patch

diff --git a/package/freeipmi/0001-libfreeipmi-sel-ipmi-sel-string-supermicro-common.h-.patch b/package/freeipmi/0001-libfreeipmi-sel-ipmi-sel-string-supermicro-common.h-.patch
deleted file mode 100644
index 848539e7c31c..000000000000
--- a/package/freeipmi/0001-libfreeipmi-sel-ipmi-sel-string-supermicro-common.h-.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9239a686e4bfd862145f4654017112a0f8cbbb0d Mon Sep 17 00:00:00 2001
-From: Albert Chu <chu11@llnl.gov>
-Date: Fri, 22 Mar 2024 21:07:28 -0700
-Subject: [PATCH] libfreeipmi/sel/ipmi-sel-string-supermicro-common.h: Add
- missing function prototype.
-
-Signed-off-by: Albert Chu <chu11@llnl.gov>
-[Waldemar: removed Changelog patching]
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: http://git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-0-stable&id=9239a686e4bfd862145f4654017112a0f8cbbb0d
----
- libfreeipmi/sel/ipmi-sel-string-supermicro-common.h | 10 ++++++++++
- 1 files changed, 15 insertions(+)
-
-diff --git a/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h b/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
-index 5785f2b64..be5e41d7d 100644
---- a/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
-+++ b/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
-@@ -39,4 +39,14 @@ int sel_string_output_supermicro_overheat_event_data1_class_oem (ipmi_sel_ctx_t
-                                                                  unsigned int *wlen,
-                                                                  struct ipmi_sel_system_event_record_data *system_event_record_data);
- 
-+int sel_string_output_supermicro_dimm_event_data2_event_data3 (ipmi_sel_ctx_t ctx,
-+                                                               struct ipmi_sel_entry *sel_entry,
-+                                                               uint8_t sel_record_type,
-+                                                               char *buf,
-+                                                               unsigned int buflen,
-+                                                               unsigned int flags,
-+                                                               unsigned int *wlen,
-+                                                               struct ipmi_sel_system_event_record_data *system_event_record_data,
-+                                                               int *oem_rv);
-+
- #endif /* IPMI_SEL_STRING_SUPERMICRO_COMMON_H */
--- 
-2.30.2
-
diff --git a/package/freeipmi/0002-ipmi-sensors-fix-header-guard-definitions.patch b/package/freeipmi/0002-ipmi-sensors-fix-header-guard-definitions.patch
deleted file mode 100644
index b04b3058358b..000000000000
--- a/package/freeipmi/0002-ipmi-sensors-fix-header-guard-definitions.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From c3d1a3f5c550940577076ce2c4595b470ae963c3 Mon Sep 17 00:00:00 2001
-From: Albert Chu <chu11@llnl.gov>
-Date: Sun, 24 Mar 2024 13:11:55 -0700
-Subject: [PATCH] ipmi-sensors: fix header guard definitions
-
-Signed-off-by: Albert Chu <chu11@llnl.gov>
-[Waldemar: removed Changelog patching]
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-0-stable&id=c3d1a3f5c550940577076ce2c4595b470ae963c3
----
- ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h | 2 +-
- ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h | 2 +-
- ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h | 2 +-
- 3 files changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h b/ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h
-index 0b11e61ce..4ae808cda 100644
---- a/ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h
-+++ b/ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h
-@@ -17,7 +17,7 @@
-  */
- 
- #ifndef IPMI_SENSORS_OEM_INTEL_S2600JF_H
--#define IPMI_SENSORS_OEM_INTEL_H
-+#define IPMI_SENSORS_OEM_INTEL_S2600JF_H
- 
- #include "ipmi-sensors.h"
- 
-diff --git a/ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h b/ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h
-index 0607b125d..5c6410b7b 100644
---- a/ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h
-+++ b/ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h
-@@ -17,7 +17,7 @@
-  */
- 
- #ifndef IPMI_SENSORS_OEM_INTEL_S2600WP_H
--#define IPMI_SENSORS_OEM_INTEL_H
-+#define IPMI_SENSORS_OEM_INTEL_S2600WP_H
- 
- #include "ipmi-sensors.h"
- 
-diff --git a/ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h b/ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h
-index f4f3dc85b..204295bd8 100644
---- a/ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h
-+++ b/ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h
-@@ -17,7 +17,7 @@
-  */
- 
- #ifndef IPMI_SENSORS_OEM_INTEL_S5500WB_H
--#define IPMI_SENSORS_OEM_INTEL_H
-+#define IPMI_SENSORS_OEM_INTEL_S5500WB_H
- 
- #include "ipmi-sensors.h"
- 
--- 
-2.39.2
-
diff --git a/package/freeipmi/0003-ipmi-sensors-add-missing-include.patch b/package/freeipmi/0003-ipmi-sensors-add-missing-include.patch
deleted file mode 100644
index 8bc44165a02d..000000000000
--- a/package/freeipmi/0003-ipmi-sensors-add-missing-include.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6ac6f816dbfc83d8cd4f4f163b0f8ff1062d883e Mon Sep 17 00:00:00 2001
-From: Albert Chu <chu11@llnl.gov>
-Date: Mon, 25 Mar 2024 13:57:45 -0700
-Subject: [PATCH] ipmi-sensors: add missing include
-
-Signed-off-by: Albert Chu <chu11@llnl.gov>
-[Waldemar: removed Changelog patching]
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-0-stable&id=6ac6f816dbfc83d8cd4f4f163b0f8ff1062d883e
----
- ipmi-sensors/ipmi-sensors-oem-intel.c | 1 +
- 1 files changed, 1 insertions(+)
-
-diff --git a/ipmi-sensors/ipmi-sensors-oem-intel.c b/ipmi-sensors/ipmi-sensors-oem-intel.c
-index 5e0f3733a..3fc022e3d 100644
---- a/ipmi-sensors/ipmi-sensors-oem-intel.c
-+++ b/ipmi-sensors/ipmi-sensors-oem-intel.c
-@@ -34,6 +34,7 @@
- #include "ipmi-sensors-oem-intel.h"
- #include "ipmi-sensors-oem-intel-s5500wb.h"
- #include "ipmi-sensors-oem-intel-s2600jf.h"
-+#include "ipmi-sensors-oem-intel-s2600wp.h"
- #include "ipmi-sensors-oem-intel-quanta-qssc-s4r.h"
- #include "ipmi-sensors-oem-intel-node-manager.h"
- 
--- 
-2.39.2
-
diff --git a/package/freeipmi/freeipmi.hash b/package/freeipmi/freeipmi.hash
index 2f81d90c1d37..9d06be8cf939 100644
--- a/package/freeipmi/freeipmi.hash
+++ b/package/freeipmi/freeipmi.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  1a3dac5c76b7ccc4d4f86aa12b8ef9b212baef7489bf05e899b89abb7e14edb5  freeipmi-1.6.14.tar.gz
+sha256  5bcef6bb9eb680e49b4a3623579930ace7899f53925b2045fe9f91ad6904111d  freeipmi-1.6.16.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.bmc-watchdog
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiconsole
diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index fbbfd536e465..0581b931b09d 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREEIPMI_VERSION = 1.6.14
+FREEIPMI_VERSION = 1.6.16
 FREEIPMI_SITE = $(BR2_GNU_MIRROR)/freeipmi
 FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
 FREEIPMI_LICENSE_FILES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
