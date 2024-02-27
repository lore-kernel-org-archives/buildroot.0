Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368C0C5478C
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 16:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0897C4157A;
	Tue, 27 Feb 2024 16:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ib_CT6ey1c_I; Tue, 27 Feb 2024 16:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D68341577
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D68341577;
	Tue, 27 Feb 2024 16:31:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F335B1BF30A
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1E24605D5
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mng9Fe9ebRE8 for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 16:30:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F07D605BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F07D605BD
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F07D605BD
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 16:30:46 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-512ff385589so2754123e87.1
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 08:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709051445; x=1709656245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N9SAmdmIR4MoGN2pS9yfOSfj9+6rsKrN20r4g7qbMkA=;
 b=oNHWBLsDM+O6Eneoh/YzT649iBX+qq7P4xl0yf5QiGGjgCN1euWmDQtq+k6/gudhAn
 Lt5mSVnIMG63CeVCBfHDsw1uzpTqXjnWBr6+VfK/UZfnBgKd7cYyKij49vuVbSId01QO
 yCEfP4NXpuw75/xD/nxFxQSgzQXfuiUZ5p+aXEMf5q1NPcOPo25T3W/CwwZmZmBa7SAV
 uTBkueoHTAM9MVKbg4OPFye34tajZVFtpTFOcAobHkP9Enh5hnT9EPdDRUlOoaRnXQnY
 adxQLQWpJ7Nzw9RrCOcaU+JBLTtwDKPXIvZ9XbUWgAjpl52HSy6QkyHv+4ebKvrHGT3p
 HeoQ==
X-Gm-Message-State: AOJu0YyBcBwKW9WjWaEYjGtd2H99tC9/FRJv/vU9tfw1v9HoUHXCpJ7H
 v2sQ7oyNngHO9Fdpd6Wu3XgdvZP43NWtlv/OaYC22MVS5eqMpLZcpAxt/xrsZBL8bT+EBMAv/QS
 VuRE=
X-Google-Smtp-Source: AGHT+IFuT1IN8xh9KdL4N2EGDXsGLTZRy18XyUrkwlVhkb41h0SoQekNEMFdZcRsRDcMDlbj/0Bp0Q==
X-Received: by 2002:a05:6512:b88:b0:512:fd87:8141 with SMTP id
 b8-20020a0565120b8800b00512fd878141mr4945410lfv.41.1709051444868; 
 Tue, 27 Feb 2024 08:30:44 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 ([2001:b07:6474:ebbf:e567:9129:29c8:388f])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056402045000b0055edfb81384sm898404edw.60.2024.02.27.08.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 08:30:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 17:30:16 +0100
Message-ID: <20240227163019.2876942-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709051445; x=1709656245;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N9SAmdmIR4MoGN2pS9yfOSfj9+6rsKrN20r4g7qbMkA=;
 b=Jx0N1yVeX7aC6YEXVpwckBWkYrj5/gu31OBxJMVly04hLfK+eD3bM+gV/Hmm+NyJ7d
 9ZqUxV2jzBI6hfRnIVlG2XNHeJ7i3yCHqOXsHUsnrkYTMHhKllRra+36gys17fGzYc3l
 4mm2xar5hMdVrAdK2a8GDsy0XMNHvD8ypEDDA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Jx0N1yVe
Subject: [Buildroot] [PATCH v7 14/17] package/ti-k3: disable HS-FS for AM65
 SOC
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It seems that some TI K3 SoC variant doesn't provide all SECTYPE.

For example: AM65 provide only GP or HS, there is no HS-FS.

This can be checked in meta-ti:

meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES +=
"tiboot3-am65x_sr2-gp-evm.bin"
meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES +=
"tiboot3-am65x_sr2-hs-evm.bin"

So BR2_PACKAGE_TI_K3_SECTYPE_HS_FS must not be selected if
BR2_PACKAGE_TI_K3_SOC_AM65X is used.

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v7

 package/ti-k3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ti-k3/Config.in b/package/ti-k3/Config.in
index 2a51b1531487..b8545b7bca62 100644
--- a/package/ti-k3/Config.in
+++ b/package/ti-k3/Config.in
@@ -32,6 +32,7 @@ config BR2_PACKAGE_TI_K3_SECTYPE_GP
 
 config BR2_PACKAGE_TI_K3_SECTYPE_HS_FS
 	bool "hs-fs"
+	depends on !BR2_PACKAGE_TI_K3_SOC_AM65X
 
 config BR2_PACKAGE_TI_K3_SECTYPE_HS
 	bool "hs"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
