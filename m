Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54579D715E5
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 15:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A0F040A4E;
	Sat, 24 Jan 2026 15:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8iw7E71sF4sf; Sat, 24 Jan 2026 15:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48A9840990
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769269093;
	bh=Ts8pagUZCIsKzye7/fb3EnPau4StAndCwjmfPmDDOQA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pYbyrbYo9YFzSrsuBcK6BhtcXrnTbeDTby9eJFe6sBTz7IxMZ2gt/YpbYvWFwKRlO
	 7ZBinw5fhD+Mj2zFbm6spqyPQ8G3QZTNRHoTin5D9gUy/Xw1bGP0YoC6KtgGAsGmyW
	 8sj2dpsZ/7IEKzChpAyKdX6+M5swQ88MazDv2ko0HheaP7vaRuI753BgyDpM1CSCDS
	 ktVyCxf6tI9ywWu7E2QrgUM/pWeLWiVrOywc5BkJ0Ui6kx7LIdHo3fQzFFdvi4nH32
	 5bdmfrYOUAgZ0Z0ev4fhA1c5nG1M552iywgmKyRgeIy4GoKFqXHmkAgF7backtmltZ
	 jCswDt7zJbPPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48A9840990;
	Sat, 24 Jan 2026 15:38:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B42DA71F
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A29F540990
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FlBNDn0OKggs for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 15:38:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B7CD540930
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7CD540930
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7CD540930
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:38:10 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so2038258f8f.2
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 07:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769269088; x=1769873888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OC895AihZNP7D9DCmZZhgQIuHCLnFXf9MUqrDafOjfc=;
 b=QVFAsrJIazrKOcSmV4wForOZMkZpShL4jmDOw/0IOF385N0aMpk+N5O6VDa/VF/O9u
 QrcuU6HDwO3qfYoT0ZB6lXE5B5HybA79JXCv7BRmTxSwrhOK2v2rKYIVqdB7w8dxMo6X
 eKQc7tB0btXjufkNyQefCsUSInUnBNKzZjVkamcJ8O3pcIrFp0BnkNlDVFOWOsR9F+La
 Z3bW5zAamNkdzFGp9hsznwJIcergMhZVqPSvI6igKdHr0oRGLbCespaZMSh/4NfhiZ87
 HpNX1aCwEIxN7QeSynzXkghySr/Xq4aW0KG2XA/gQb2d75iaq9FkAdhpFIUFqdEs4wKZ
 ++DQ==
X-Gm-Message-State: AOJu0YwVRCprEyrdSENMhQM/W2bkY/ONNmnItWO5Xwkx+B17LAPtwn1z
 gJcdLsjcU9WO2e8HEp65eoO6clT5VpLDXsMXZ9tuuAR8ZC6AAj8qRwpDEfdToofgxrIZHOdXGsq
 TBbPE
X-Gm-Gg: AZuq6aK21VAMYcdA6qKJQFvJ7OUdwml0EEJ9HlYd011CrOgGl6qy0+qD1Fr13kv5nOn
 pPlcvMRaxzITKK/nTNWyV6vBO2YTGU8gUjqzUp8uVa+qDAWexVmgGfRj5oCcCI/bg+knhGgQ3xn
 FnlQoKjgIKZIZeNE5kB4eu/0upqn3r1Wg4ZaV5G5vXD0U8gjMI+KT4Qaame0I2cqBRhGybbO+Py
 PEgoN4dLTi6JVCJ2uo7wlnmp4hYNcdJDfTP0MivwCk2Y3HHyex0BT0S4EQXAU27Vh2jiAuXiL2B
 IHjzKMJvYi3twxLxqGro9Q9z8t+BHdhfq1axPVOxZxzKR/0WiwuVsJAcx5PZzBSFPlx55aPkJaT
 M/Tb9V2eYRLHi9XCSoNUewV+gdlpKlpQj7SZfzKQuaFfvuAtm+zDpxJxojOSeadFGtKY19K6RI4
 2TfRy7nQrTMCJAR0sOhmXjiz34DjPfhPFN/Pq49kxzp/AJy+GLc0DaiFWL4X9dIx981x3l6F+/1
 yiMmro5IpihkyOeXGZCmhtVrk07jhV5htbJDE/Kpn4r3xarUcvs1vpkOIJ1vb3eFzZ22dGTngly
 B/QxvmEiaDw=
X-Received: by 2002:a05:6000:2382:b0:435:a782:8fd6 with SMTP id
 ffacd0b85a97d-435b15969a3mr10817671f8f.24.1769269088178; 
 Sat, 24 Jan 2026 07:38:08 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1e715d3sm15799741f8f.28.2026.01.24.07.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 07:38:07 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 24 Jan 2026 16:38:03 +0100
Message-ID: <20260124153803.1077707-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1769269088; x=1769873888;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OC895AihZNP7D9DCmZZhgQIuHCLnFXf9MUqrDafOjfc=;
 b=dS8EpfDM9YyeRCe2xukMclWeHppk2OUSMdmWO5uHHqIMP/CqF+vMEp9lqjBvQLSOs6
 IZbXeSHsklZpSPOPs9vCfGsyJSuRKAKDgEc5T5tB8Xnf4AzJPjhjQybT9n23rcO8xP9u
 diJU7hxCldncOR5/gsLMWYkvlXqDTedZ4bcKM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=dS8EpfDM
Subject: [Buildroot] [PATCH 1/1] board/stmicroelectronics/stm32f469-disco:
 exit post-build.sh on error
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

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/stmicroelectronics/stm32f469-disco/post-build.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/stmicroelectronics/stm32f469-disco/post-build.sh b/board/stmicroelectronics/stm32f469-disco/post-build.sh
index 03e9dcae8215..74c59fdb72dd 100755
--- a/board/stmicroelectronics/stm32f469-disco/post-build.sh
+++ b/board/stmicroelectronics/stm32f469-disco/post-build.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
+set -eu
+
 BOARD_DIR="$(dirname "$0")"
 
 install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${TARGET_DIR}"/boot/extlinux/extlinux.conf
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
