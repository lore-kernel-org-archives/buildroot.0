Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13087C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 11:31:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB5D160C40
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 11:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB5D160C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E66F4016A;
	Tue, 14 Sep 2021 11:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j7X7pVVvK_ex; Tue, 14 Sep 2021 11:31:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1688400E7;
	Tue, 14 Sep 2021 11:31:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21AAA1BF5AA
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 11:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B10140383
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 11:31:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQLNaMNHfrsB for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 11:31:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 804874032D
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 11:31:34 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 w19-20020a17090aaf9300b00191e6d10a19so2511855pjq.1
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 04:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gXpbSl2fCKetBdzzwz8aZYZnksmvb4pI8eWyiyc+FnA=;
 b=KxHNaYROqEC2hRWonwf51Gr6DLNFg5qCfXOIEj4+ZcYioICqsueh2ypQutF+nkEJ/u
 D82LfzQR/G01AUA7rXduaXfMUPTQpfqAte+mkfKHoURHjhWQ+X/nWaTrOwBmZEKGFKq4
 AJ/rmmBR9DbuL9WnrBULaEM1NaIew41u/jfwBsuaUNXhxgyU/75ahegVGmDNt+2R73Hb
 Vt2nRgkgGwhgurQ52VZZ5e1taNtL4I+lU7vpds88/hlsj4oxRiCid9Ah6oIEV2FsKfTh
 shTr34r3ER/qPTdeDUmopFapzUZn6tuzJ+joy1UOWp7Sz3OaiQrXpK3aZF+6x4B4ou/t
 Ch+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gXpbSl2fCKetBdzzwz8aZYZnksmvb4pI8eWyiyc+FnA=;
 b=znHX/j7ixhrsgKqguCFkXPEhuJjC2Aw7ueeKzFjjG0qnqUo+P/OkSsLpH8Qxx8N806
 z9nuCUcgoAZT5a17jCg7OvMA69SjGknljHmvZorXLrw1C/npB6A3wGyYvrfzqH9hP+Sn
 IvTht2P67XOs0LuMk5eqtJNBClEf7x8gzYcCtJOsEYfnV96QlzSLHIv75KXlGLJ7L/Ze
 tZaesmxvZGXyaPdy/sroXLzm+UN7rgiptW2gVRxzoJrMCphucQFSvfVmX8YG34XCB4wp
 qd3ujCaBJ7tWmSvUkHsclb2uxUzdRDhUck/JXkgmzjpfgKUzleYlVAOhZLKOngNNA28M
 S6kw==
X-Gm-Message-State: AOAM533GHdGYByXMwHaFU+/c4r++zd4hedAkvlHlqCqgpn2oQIbQKzGo
 Olar93WIoJ0bXhZTfYzCpn+PnQVsyQidMw==
X-Google-Smtp-Source: ABdhPJzLvvXTIvsvj8vg9JAEMNsQVi/zwsVgERKhfJSHtPS89pN46mAsi2gx6oYxy03BLlt7/ez+qQ==
X-Received: by 2002:a17:90b:3b4c:: with SMTP id
 ot12mr1585298pjb.36.1631619093843; 
 Tue, 14 Sep 2021 04:31:33 -0700 (PDT)
Received: from localhost ([2400:4051:e000:9e00:690b:bf80:8ebb:9efd])
 by smtp.gmail.com with ESMTPSA id h191sm10458013pfe.78.2021.09.14.04.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 04:31:33 -0700 (PDT)
From: Takumi Takahashi <takumiiinn@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 20:31:30 +0900
Message-Id: <20210914113130.267141-1-takumiiinn@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] board/qemu/aarch64-virt/linux.config:
 Support QEMU Virt UEFI Boot
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Takumi Takahashi <takumiiinn@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

QEMU Virt machine type requires ACPI support.

Example:

```
qemu-system-aarch64 \
  -nographic \
  -M virt \
  -cpu cortex-a57 \
  -m 512 \
  -bios QEMU_EFI.fd \
  -kernel Image
```

Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
---
 board/qemu/aarch64-virt/linux.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
index e3a4a92913..20e8367fc6 100644
--- a/board/qemu/aarch64-virt/linux.config
+++ b/board/qemu/aarch64-virt/linux.config
@@ -14,6 +14,7 @@ CONFIG_ARCH_VEXPRESS=y
 CONFIG_COMPAT=y
 CONFIG_FW_CFG_SYSFS=y
 CONFIG_FW_CFG_SYSFS_CMDLINE=y
+CONFIG_ACPI=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_BLK_DEV_BSGLIB=y
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
