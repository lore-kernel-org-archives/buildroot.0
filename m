Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCF9C87FCB
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 00:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53F65837C4;
	Tue,  5 Aug 2025 00:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzXJUV6CshrE; Tue,  5 Aug 2025 00:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 635A7837CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 635A7837CD;
	Tue,  5 Aug 2025 00:03:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FF271A2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 00:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45A3C410EE
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 00:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOXZk-EG1T7Y for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 00:03:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 803CF40C70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 803CF40C70
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 803CF40C70
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 00:03:55 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-70739d1f07bso52088736d6.2
 for <buildroot@buildroot.org>; Mon, 04 Aug 2025 17:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754352234; x=1754957034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dhNGMBQuSTSCc8iJtHoTPy9qdlJpnNUYka9BNT448KU=;
 b=nOw4TRMfQkvL+uZxwfJJbRgw6D3UXRIIfqM94ysMuTxzRtUybPOJRvvaDVbG+2nfsQ
 m8UNwGE4QuVSHTkd2dZEseBDeWRZMCHq9Z0hyuX2XWhoJGSwyWLbveKStN4JxAH1SieY
 9Tv8i6RsnzKfZE2n3bBd5wwJEnQFS41RyOU8HxIC5goKDazq8KYj6L0LR+9EM7oNduYv
 7Ie7/Z/jPa62ZMEpeggLC+vzBRQv55WHVtxQ3Myq6c0PnarprsPyNkZKUBUpAiMikN2L
 RTi5Z08mTIzZOEDqo3dHw79mGQsYmks/gs962ml0rPCX+xVugHp8KMxuXldQCoe2sYLp
 dCqA==
X-Gm-Message-State: AOJu0YzWde8FdLWY/bvNXLrjzgfXa4w6yCv6AdGh7k6MUQrsUgyTdeQu
 NYx1m6NDAFpkcM9d72H6XLmhVQGb4Ie8C0fkGhwUspArAzTr906fL3/9EOLoEw==
X-Gm-Gg: ASbGncsLYQ1zeAROxy4ecIreP5T1Z+q9TzB5IBbRKWsp7oWU7FTxSJAQlFwfaOfGjlQ
 Xz+GeXEW7ECl9uyNAEmk1N/nXgd28t9JyNU4YTReSR8BC6u3ktqPwTrjD9qFDIKzaGGuPn/WZg1
 agekdob7N0TpuPVEz/b9/DjWOSoFkGkVOeTevtvjN15ta5Xbvhb51dSHw23qQ7VIGwa0u7cle0v
 AmtBk/aa0uMe633pPyPclbnIrK32ztOTiIaEGdofcWaW1KtiPGSlK53WoupMpRiOJwK+cjHB+Da
 W/ctb0re3Lj3URj58wzot7LVaGbK5QOvQ49C4fmSue5GSqeaAMnvbSI6dgKOCiDn3aqPKo8a+05
 /0/nurEzEBpYobUXS+2gLaiLJ6jqaHYKPhpqcxzLG01KrcOacruZIh+TOG00D5U5k/6SEf40YS8
 oxvG2Lew==
X-Google-Smtp-Source: AGHT+IH4CLjX05qY2uo6II5AA+K4K3cMc4cg3VJcQ+3XRwek5Vnxdw1sqpX0aowfkdjOQf+5Qo19vg==
X-Received: by 2002:a05:6214:246a:b0:707:4daf:641 with SMTP id
 6a1803df08f44-7093673f190mr180429446d6.39.1754352233925; 
 Mon, 04 Aug 2025 17:03:53 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-215-125.bstnma.fios.verizon.net.
 [108.26.215.125]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077ca3621asm64065846d6.33.2025.08.04.17.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 17:03:53 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Taube <Mr.Bossman075@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>
Date: Mon,  4 Aug 2025 20:03:51 -0400
Message-ID: <20250805000352.4062434-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754352234; x=1754957034; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dhNGMBQuSTSCc8iJtHoTPy9qdlJpnNUYka9BNT448KU=;
 b=Fj/ojAkTDz9/NQUpy/7VovfgOysJN109THQArJvRUDVSgtMgzTLhgDuIoD3/Jyes1Z
 7pmA3KXf3aERRCj1zE53jmGFflWCjMaJfD7FChFP8nE7b+F/rrHufDE+Z/SCRudq9ho3
 5Ygp3YvmOEgdxGT50FDt3Oy6ir9O/HnXK3vVaSpM+i/V2K9cbzCObqY/unnz11wIe2zC
 FXGuWOr8GDeU4KOJYOXsU29CqZ/ibgJC7NAIL6IkOEXbNC53PBef5fP9GAY58oCpO2Sx
 tIZRrsmVmZUQboNaU02jTu1/bwLt7/PuAm0VSsGjfZ3ZYQwpFi2xrAQYYHJfLaEWeb93
 qQlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Fj/ojAkT
Subject: [Buildroot] [PATCH 1/2] package/picotool,
 pico-sdk: Bump version to 2.1.1
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

pico-sdk and picotool 2.x.x adds support for the rp2350 bump package to
latest version.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 package/pico-sdk/pico-sdk.hash | 2 +-
 package/pico-sdk/pico-sdk.mk   | 2 +-
 package/picotool/picotool.hash | 2 +-
 package/picotool/picotool.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pico-sdk/pico-sdk.hash b/package/pico-sdk/pico-sdk.hash
index 5db7e8bdb4..6d40417f3a 100644
--- a/package/pico-sdk/pico-sdk.hash
+++ b/package/pico-sdk/pico-sdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  95f5e522be3919e36a47975ffd3b208c38880c14468bd489ac672cfe3cec803c  pico-sdk-1.5.1.tar.gz
+sha256  979af5c5aa5a07990544bc65e24a2121c096abd72ad0e6a03e7c524302e0f26e  pico-sdk-2.1.1.tar.gz
 sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
index 27930651b9..cf487ac568 100644
--- a/package/pico-sdk/pico-sdk.mk
+++ b/package/pico-sdk/pico-sdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PICO_SDK_VERSION = 1.5.1
+PICO_SDK_VERSION = 2.1.1
 PICO_SDK_SITE = $(call github,raspberrypi,pico-sdk,$(PICO_SDK_VERSION))
 PICO_SDK_LICENSE = BSD-3-Clause
 PICO_SDK_LICENSE_FILES = LICENSE.TXT
diff --git a/package/picotool/picotool.hash b/package/picotool/picotool.hash
index 26b790d968..3ebd592430 100644
--- a/package/picotool/picotool.hash
+++ b/package/picotool/picotool.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f1746ead7815c13be1152f0645db8ea3b277628eb0110d42a0a186db37d40a91  picotool-1.1.2.tar.gz
+sha256  19200c6dc4be5acd6fb53de3d7f35c826af596c18879d56f214b795300100260  picotool-2.1.1.tar.gz
 sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/picotool/picotool.mk b/package/picotool/picotool.mk
index 42f74fb244..bc76900c07 100644
--- a/package/picotool/picotool.mk
+++ b/package/picotool/picotool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PICOTOOL_VERSION = 1.1.2
+PICOTOOL_VERSION = 2.1.1
 PICOTOOL_SITE = $(call github,raspberrypi,picotool,$(PICOTOOL_VERSION))
 PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(STAGING_DIR)/usr/share/pico-sdk
 PICOTOOL_DEPENDENCIES = libusb pico-sdk
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
