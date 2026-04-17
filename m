Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C74F43680
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 08:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B33D960D5C;
	Fri, 17 Apr 2026 08:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPmeZHtjSI4f; Fri, 17 Apr 2026 08:57:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B573D60D5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416235;
	bh=/Yz0P+RmUhNEfxtT1/2MiP3ZfABmIuJZ6t4KODkqZW4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AdAgk9qjfAj8gMOnm98/PLzgHNsadQ9HbepwAI8gqeZpoQhpRfcfzJ3N36o4yE6W+
	 gxmTE1W7T4M4J3iehORhlS6nG4iZyPy6oNQj7G3mCk/5rJiRn2uQud+enRo53ACVFo
	 IYLZPb7KkThAhdmi/thLR4BBZ/vfeDADremuuvUvPicHoA1VSEo5DyIm0JpzIWRX5g
	 3KDFKNY6+a4xqz4FvdNNtCNM5q0vh/cBYYP5ibTv3KUOdR0fFQwtTYbNaP9Vyggl48
	 rhh2xs3tR1VY+Iqqg0C9pQVkHTVVfTlQYzW1stb+RGu79R0JopZj51O4zjhb5u2a3Y
	 C2oAusm/7qm9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B573D60D5E;
	Fri, 17 Apr 2026 08:57:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30D5E259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22FD360D5E
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vg8pWxAu0sWR for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:57:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDEB260D5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDEB260D5C
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDEB260D5C
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:57:11 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43d7650202fso401305f8f.2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416229; x=1777021029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KOnHUfkUY7gBsr9VfwDCDI81D1xKCzM1xtW/996E8oE=;
 b=dpQ50CHhif0tVwB6WT/t2GSBUiNdxeNlqIppkucAL1uwvQopEmjEilSTww8Zg6PZLB
 2hUHvxUpWbSXSBkoyu9lqBMAJ1RDPCXde6rI1Hx8iMEhX1uWr6MCXCgjYLqqaEWWnt0L
 fs/e1TDz2cuYaPUgKyip3jOXh3jondMaYjSI4ZbwhC10wGsh2NFnHcUcD0FHptjvpaLH
 cxD3BnPzOgQHCXHS4SpnnuBHzbmove1lFH0NLKGIOvU7wGX9qnqXRULQ5XCrU7masCb2
 L/o4d7xPv570uei9HBKy7noxjekXoBqkfBGF9Ho9o0HaLT2cJD6E0xafsc5Coai9mO1I
 HQqw==
X-Gm-Message-State: AOJu0YzhcSAugdGWOzHGx5+kRbDpGqbrYGkcxHMGM7p/kgHthhSO8wrc
 hsKj7rYIC3iYQQznmPFrIdXHDw/d75v342V9nLhbkRAEoKF0ObZH++tEXLDmxnsps2RfNN3i6i/
 SFsz818c=
X-Gm-Gg: AeBDieubhfhdx8qKTBeFqJEQYH1e0NuioTqzifqxIpob4kIAiOBMk2rf35k2aeCotYe
 COmcTw8vbQQ4Xo2ymRldNG4rOe1G8GJ6a5fuzu5aLjqnakAAPpt3RUXqohFFllNmd2mw1YHe4CI
 yX6mBno02xI12dHM9e2++qwb8lliGmcyIr73ntr7T6jXpU+rQOfVnXThdJHiSTzg8Dpv2gPfI1P
 UL2rNyFCJoqOPdlAuYGigNi2R/Of3aU4ZxCxuaufIQFTceSSjqAxbToUkC5Jz1cTRgfKj9E/4J7
 m1aLDUvv4J7pOTEhDLHTuVAwuxIKBqpCm+Vvirs1kWFoc9LUBndvNo5edQcgmXB2K9XfecJ7SE+
 Tnwtj2SQkmwc0z8F8S7DPYIyOUDRb+KM+VId4CKzngxJjnFCZpMVlygDQB0TTXdZ+6buAd/XpBG
 wy5tHq/bkMydREsqVZUssPqcXwAcHE7UT0dTvCO1cIU++A5DnLE7kb4dagZE3O7dDQKn3aDoq9J
 7AHsvNqYsl13tCoMgmkFPbnvN0EpQKf9HDRoRtcTQ==
X-Received: by 2002:a05:6000:178f:b0:43d:2be:e4e with SMTP id
 ffacd0b85a97d-43fe3e23d1fmr2878378f8f.46.1776416229368; 
 Fri, 17 Apr 2026 01:57:09 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e59f97sm2989465f8f.37.2026.04.17.01.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:57:09 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:57:03 +0200
Message-ID: <20260417085703.200145-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416229; x=1777021029; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KOnHUfkUY7gBsr9VfwDCDI81D1xKCzM1xtW/996E8oE=;
 b=huto7pcglohQBLVvfLQ3KCRyEjRsMACRbQ3Toj8LUIfcRAq/BQxGipGrRXM5h4AFlL
 MhG1/ReAW9WnHA4G0gGAeH5E6lMIZnRIAiFSbNnSMPcUNammSNgeaHMhmoTWGugDrk2X
 fT54wdtu3huAY+CCtUpjVmNU60Ja3jKEa6V6Y=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=huto7pcg
Subject: [Buildroot] [RFC] support/testing: test_podman.py : Build failure
 due to bump of toolchain
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The recent update to the AArch64 15.2.rel1 toolchain (including newer
glibc and GCC 15) has introduced a regression in the build process of
host-protobuf v34.0, which is a dependency for Podman tests.

The issue manifests as "incomplete type" errors and "missing definitions"
during the compilation of several generated files (such as type.pb.cc,
timestamp.pb.cc, and any.cc) [1].

This is caused in particular by the stricter header inclusion and inlining rules
enforced by GCC 15, which expose missing explicit includes in the
Protobuf 34.0 source code, so it appears to rely
on legacy implicit inclusions that are no longer provided by the
latest toolchains.

This failure prevents all test classes from the podman test from
completing, as the host requirements cannot be built.

The DCMAKE_CXX_STANDARD=17 option was added to the protobuf Makefile but the
issue still persists. What would be needed to fix this issue ?

Thanks for your help. Sincerely.

[1]: https://gitlab.com/buildroot.org/buildroot/-/jobs/13698215942

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 package/protobuf/protobuf.mk                 | 3 ++-
 support/testing/tests/package/test_podman.py | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 1d110fdbf0..2d4ecd0d65 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -42,7 +42,8 @@ HOST_PROTOBUF_CONF_OPTS = \
 	-Dprotobuf_DISABLE_RTTI=OFF \
 	-Dprotobuf_INSTALL=ON \
 	-Dprotobuf_LOCAL_DEPENDENCIES_ONLY=ON \
-	-Dprotobuf_WITH_ZLIB=OFF
+	-Dprotobuf_WITH_ZLIB=OFF \
+	-DCMAKE_CXX_STANDARD=17
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 PROTOBUF_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
diff --git a/support/testing/tests/package/test_podman.py b/support/testing/tests/package/test_podman.py
index 9d86a06129..72552b945b 100644
--- a/support/testing/tests/package/test_podman.py
+++ b/support/testing/tests/package/test_podman.py
@@ -15,10 +15,10 @@ class PodmanBase(infra.basetest.BRTest):
         BR2_SYSTEM_DHCP="eth0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.202"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
         BR2_PACKAGE_PODMAN=y
         BR2_PACKAGE_UTIL_LINUX=y
         BR2_PACKAGE_UTIL_LINUX_MOUNT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
