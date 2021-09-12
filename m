Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4360C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:14:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7792461050
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 14:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7792461050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5412B824DC;
	Sun, 12 Sep 2021 14:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jjq9Y9rAS6J; Sun, 12 Sep 2021 14:14:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85B6B824CE;
	Sun, 12 Sep 2021 14:14:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCB711BF471
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2E62401E6
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 14:12:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fDuaYlgj7FJj for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 14:12:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE7594014E
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 14:12:00 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id g128so275297wma.5
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1pjN6fLUxD1XsdWP+1w/KmD4pD0Zb52r5YuWDljjZGs=;
 b=NwsrpMuYzk040i9y/62S4P/o/r4bdRY4yJdtu+d+vrRcfbg6FMhlXt4jMGnZwX41ec
 EL/7i224VdBx2Yn9tEkbU8966rCg0xjyKsYjMyw4LvdIVKISUjZpZvUMh18mdanK7Qka
 6GP0R2hl+2+24Pk46oLuuIoNmSKtkK2soOdf8RxiOj4iSWK49mz1/ycGKQAy4k/BStOQ
 LQDi+tQ29LyFziIQuIR/2MghDVklkyDpNRqeIvWXi939l89Q2gznmUvg0sA0FKVDIQL9
 FxmpNExaTqSu60yS+fAm0iRZDkmBHL02s91nZZYwDbdPuJy4NxeaR6xYr4Y7vjERNFTw
 i8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1pjN6fLUxD1XsdWP+1w/KmD4pD0Zb52r5YuWDljjZGs=;
 b=Aq3c3vve/c70UEqc3QRJN7DG67P7kEq7Z9KX1VN3h+q7wAd9v49bi2a1n9yPUccb14
 vcePvRAuQb5PS1PqQXll3auClQbHq1e82fr/POGpFbWoCqnMZAvISftjVdtYuhheeEUN
 tFAu2E9o6cOAp1gwqVw0Cgi2IxUxIXihp/SgE78rrRU7vOZqVGkDTgTzXOMOfKA0lqh6
 5rDsxEm818tWyEQh+yCkp6eiiy5gJmX1djtfA+b/YY4NmtlPb0gnpl/CBf3frW8FNuD6
 4+QD0YIOC2hSvq7KKccoJ7AnJhgwobX/XkWD5MdnDbi6anpa3sLKgDJjxglRWwiWJds5
 5ovw==
X-Gm-Message-State: AOAM531tYu5I2cY/BSLSEaoy5snDHexiFipCICSBIEpPGD4iD/6zXSWm
 8y3NOMGsodizY1fV551pm/cHDo4TE1E=
X-Google-Smtp-Source: ABdhPJyGf/XSPEeDVaom62ShQbyMqDVyJ4KsbtDZsTKLzYn7UsKTbGFwOOtGShGVeYQT8rr0xjhmgg==
X-Received: by 2002:a1c:8096:: with SMTP id b144mr6771010wmd.189.1631455919010; 
 Sun, 12 Sep 2021 07:11:59 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id i5sm4570062wrc.86.2021.09.12.07.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 07:11:58 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 16:11:40 +0200
Message-Id: <20210912141140.253778-14-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912141140.253778-1-romain.naour@gmail.com>
References: <20210912141140.253778-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 16/16] support/testing: test_ubi: allow to boot
 several times using the same ubi image.
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Since the ubi/ubifs test has been introduced, it's not possible to
boot the same ubi image twice [1]:

"TODO: if you boot Qemu twice on the same UBI image, it fails to
attach the image the second time, with "ubi0 error:
ubi_read_volume_table: the layout volume was not found"."

For some reason, the kernel corrupt the ubi image if the ubifs
rootfs is mounted with write access. Use a custom config file
to mount the rootfs readonly (vol_type=static). Doing so requires
to add the flash size (vol_size=64MiB).

At least it allows to boot several times the same ubi image.

[1] bf4a6490e4ee70f0a46e588602995ba34e6c872a

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/fs/test_ubi.py                     | 9 ++++-----
 .../tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg      | 8 ++++++++
 2 files changed, 12 insertions(+), 5 deletions(-)
 create mode 100644 support/testing/tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg

diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
index 7c687c1982..564a436d42 100644
--- a/support/testing/tests/fs/test_ubi.py
+++ b/support/testing/tests/fs/test_ubi.py
@@ -13,12 +13,11 @@ class TestUbi(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_UBI=y
         BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x40000
         BR2_TARGET_ROOTFS_UBI_SUBSIZE=1
-        """
+        BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG=y
+        BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE="{}"
+        """.format(
+              infra.filepath("tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg"))
 
-    # TODO: if you boot Qemu twice on the same UBI image, it fails to
-    # attach the image the second time, with "ubi0 error:
-    # ubi_read_volume_table: the layout volume was not found".
-    # To be investigated.
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.ubi")
         out = infra.run_cmd_on_host(self.builddir, ["file", img])
diff --git a/support/testing/tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg b/support/testing/tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg
new file mode 100644
index 0000000000..52dd5f0007
--- /dev/null
+++ b/support/testing/tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg
@@ -0,0 +1,8 @@
+[ubifs]
+mode=ubi
+vol_id=0
+vol_type=static
+vol_name=rootfs
+vol_alignment=1
+vol_size=64MiB
+image=BR2_ROOTFS_UBIFS_PATH
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
