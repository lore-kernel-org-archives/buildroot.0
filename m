Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D83CC25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 22:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E8D84012D;
	Sat,  1 Jun 2024 22:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejB2xGHfXPRH; Sat,  1 Jun 2024 22:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3746040144
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3746040144;
	Sat,  1 Jun 2024 22:31:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DEE081BF396
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 22:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA94560708
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 22:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0_1F26eKQmu for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 22:31:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28D31606F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28D31606F9
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28D31606F9
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 22:31:25 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42134bb9677so11467185e9.2
 for <buildroot@buildroot.org>; Sat, 01 Jun 2024 15:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717281084; x=1717885884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=athuziB1KQ/MFjIRhZEkX7CIWnRZgE4XLnlh5Aj76kg=;
 b=weaLxZ9txlnvxXglL/ew9sfosz84TUkIs4xTN3H59aZO0HdTO3LmWJi/EzBVO/xZfT
 UqV9nF+Juw/9E4anbkEnVMly347wTBwQGB0BP+EuDlrWUX0wlfv67r/2RQxZb9zipsDS
 XPwT8zboPKFfsc6yL/MR9VVRXvM6iRkZFOOG2i5Dvl0DDhNPFboZs4V+TfUhe8zmm38q
 oWCGc8pPPzDa9LR8MUwTSE2hGaips+HDvIapTpwpw7dHFQ7FyjMJaNV7Mr3QAPYnu1kk
 K5Phw5Zm4sjajZEWi60E9mDNCAa+mlo0/y5chldNlbDCW9m7fucy8S+nnHKEyBRRTzbj
 0WPQ==
X-Gm-Message-State: AOJu0Yzp9VvlozKWoU7aIi4zoOQshR5Il7Hdu+U9YAhgSL4I3RtzMpM7
 JWGehmHKRVPgDCUOuipxQzrYV9TIy1Hyra5L8OQN6cl/T+Hp2nIWFf/XC9Rmszji427jWPQ6I67
 f
X-Google-Smtp-Source: AGHT+IGDMd8Yit4QBMmaD0UFsf7/ZqRWvuah7xjStVqHCgTA8EMX4aXo82MMjWD/o0v3jqYYg+um1w==
X-Received: by 2002:adf:eb11:0:b0:35e:f0e:1ba0 with SMTP id
 ffacd0b85a97d-35e0f268722mr4742046f8f.19.1717281083868; 
 Sat, 01 Jun 2024 15:31:23 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04cac3esm4782031f8f.39.2024.06.01.15.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jun 2024 15:31:23 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 00:31:19 +0200
Message-ID: <20240601223120.2123976-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1717281084; x=1717885884; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=athuziB1KQ/MFjIRhZEkX7CIWnRZgE4XLnlh5Aj76kg=;
 b=d5hBQxQNOqv/vkEkq5f0F+873HOg27AfG30hcz2FrrXvoQRtpY+erHHE3QIdjSC1u9
 3jMgthvW9OLk0Ud4Z68wRXsyMaLbs9WyLt/HGDXT3AcipIoqB8Mps8XMC0M4BzaKlvou
 tIA8oUAUPPr3njxfALYBHxKfihC8QD3D1lUeY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=d5hBQxQN
Subject: [Buildroot] [PATCH 1/2] package/tpm2-tss: create tss user and group
 for tpm /dev nodes
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When systemd and tpm2-tss with fapi support are enabled, the fakeroot
script fail with:

    <stdin>:35: Failed to resolve user 'tss': No such process.

When fapi support is enabled, tpm2-tss package install additionnal
configuration files that are expecting tss user and group exist [1].

  /etc/sysusers.d/tpm2-tss.conf
  /etc/tmpfiles.d/tpm2-tss-fapi.conf

The build fail in the fakeroot environment while handling tmpfiles
installed by tpm2-tss with fapi by host-systemd.

tss user and group is currently created by the tpm2-abrmd package but
tpm2-tss package also provide a udev rule file tpm-udev.rules [2] that
set the ownership of dev nodes /dev/tpmX and /dev/tpmrmX to tss
user/group. So tpm2-tss package must define TPM2_TSS_USERS to create
tss user and group, not tpm2-abrmd package.

So, move TPM2_ABRMD_USERS to TPM2_TSS_USERS.

Note: tpm2-abrmd is nowadays deprecated since the in-kernel Ressource
      Manager (available since kernel 4.12) is prefered [3].

[1] https://github.com/tpm2-software/tpm2-tss/blob/4.1.3/INSTALL.md?plain=1#L184
[2] https://github.com/tpm2-software/tpm2-tss/blob/4.1.3/dist/tpm-udev.rules
[3] https://github.com/tpm2-software/tpm2-abrmd/blob/3.0.0/README.md?plain=1#L39

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/tpm2-abrmd/tpm2-abrmd.mk | 4 ----
 package/tpm2-tss/tpm2-tss.mk     | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index 8de233008e..0e62cb176a 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -29,8 +29,4 @@ define TPM2_ABRMD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S80tpm2-abrmd
 endef
 
-define TPM2_ABRMD_USERS
-	tss -1 tss -1 * - - - TPM2 Access Broker & Resource Management daemon
-endef
-
 $(eval $(autotools-package))
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 10d605fc65..b76d16e71e 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -42,4 +42,8 @@ else
 TPM2_TSS_CONF_OPTS += --disable-fapi
 endif
 
+define TPM2_TSS_USERS
+	tss -1 tss -1 * - - - tss user for tpm2
+endef
+
 $(eval $(autotools-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
