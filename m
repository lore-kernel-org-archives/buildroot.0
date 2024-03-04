Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1127C48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84E52414C3;
	Mon,  4 Mar 2024 15:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQ8Sr2X33aeq; Mon,  4 Mar 2024 15:34:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 185FD414A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 185FD414A4;
	Mon,  4 Mar 2024 15:34:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B28001BF3B0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F650821BF
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4rIP5qnRZrm1 for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:34:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F574821F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F574821F9
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F574821F9
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:34:11 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a4417fa396fso578896466b.1
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566449; x=1710171249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YgYiCkyWSz9+UM98pKugQP9FQ92RtBJP5LG6O8oNnAc=;
 b=VD11axk1zL4nvRwZLiaEM1x8X7YhTSO4nJ3K5b2yHLWkNWNYbfABIXXWNfNJoQDWXy
 QjSQwU7xB7yRP1b095jlBa3J3aeJ6yuHT169U7AvN5vngVH0fmrb22EZKPxKfc6ZBEQE
 juq4V6ZoZvhOX5d40mcGUVeBqQtLoub95ZjKI1s0jE3wvZ4hyXWsRwx61zbewPm+m0ys
 B518LGTtNwJXPhH7FU/b2FxHE1Ej/6taUxys0a9dyyuFQYcDHBY7rRJAua2Kgy2MqngF
 oh7/PmMjM17XZVFJnqeMfvdUT5mFk0S1wK6WMoCGtNyxYWvRnZbBJdmVm3IFdE6elbi9
 VLhQ==
X-Gm-Message-State: AOJu0YxBGK3IXb8Z9cD+tNyngfAOCOWGO/oJ0aUM1ISXgEtY+ChwGMnu
 ZCmrGFS3z4A7T6LE+H91Ceh7ArJT+qN5o4RKi35I+nQBcZ6pZWN1E6SIMko6r620kSnDRLRg21m
 XlG8=
X-Google-Smtp-Source: AGHT+IEzemF8Hy/5w2yqVr24pgFBp8XS/8vvEdl9+OcS9DpVKrVxLJb+aBuoOczXZm64E5BFdktR5Q==
X-Received: by 2002:a17:906:8d6:b0:a44:3056:1ed0 with SMTP id
 o22-20020a17090608d600b00a4430561ed0mr6183859eje.62.1709566449438; 
 Mon, 04 Mar 2024 07:34:09 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:72fe:558f:d55e:d423])
 by smtp.gmail.com with ESMTPSA id
 sa20-20020a1709076d1400b00a4432543b21sm4936082ejc.198.2024.03.04.07.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:34:09 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:32:32 +0100
Message-ID: <20240304153253.732708-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709566449; x=1710171249;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YgYiCkyWSz9+UM98pKugQP9FQ92RtBJP5LG6O8oNnAc=;
 b=ZgAcrGRGcGpestC7GLz6CeBdwRUxZkAnYtgzlITSDw5wTyWCsFiJnURJIdmWoBrpIA
 X0kbpB5AtAKlA/qqW0a3Tmq5VgJBIFtVCCog1n7Of+bhsA9m3IAhFrCtvtbu4zAjHZBr
 2GAdUmmstu1M1cUikHILJu/4HxTVqlCOjLuEY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ZgAcrGRG
Subject: [Buildroot] [PATCH v9 01/22] configs/ti_am62x_sk_defconfig: fix
 BR2_TARGET_OPTEE_OS_PLATFORM setting
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

Using PLATFORM=k3 can leads to a runtime boot crash on some K3 SoC (e.g.
j721e) because the optee flavor is missing.

We could use BR2_TARGET_OPTEE_OS_PLATFORM=k3 and
BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR=am62x but we actually can use
BR2_TARGET_OPTEE_OS_PLATFORM=k3-am62x as explained in the optee-os
Makefile [1]:

  # If $(PLATFORM) is defined and contains a hyphen, parse it as
  # $(PLATFORM)-$(PLATFORM_FLAVOR) for convenience

This is how meta-ti set the optee-os platform:

  meta-ti]$ git grep OPTEEMACHINE
  meta-ti-bsp/conf/machine/am437x-hs-evm.conf:OPTEEMACHINE = "ti-am43xx"
  meta-ti-bsp/conf/machine/am57xx-hs-evm.conf:OPTEEMACHINE = "ti-am57xx"
  meta-ti-bsp/conf/machine/beagleplay.conf:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf:OPTEEMACHINE = "ti-dra7xx"
  meta-ti-bsp/conf/machine/include/am62axx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am62pxx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am62xx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am64xx.inc:OPTEEMACHINE = "k3-am64x"
  meta-ti-bsp/conf/machine/include/am65xx.inc:OPTEEMACHINE = "k3-am65x"
  meta-ti-bsp/conf/machine/include/j7200.inc:OPTEEMACHINE = "k3-j721e"
  meta-ti-bsp/conf/machine/include/j721e.inc:OPTEEMACHINE = "k3-j721e"
  meta-ti-bsp/conf/machine/include/j721s2.inc:OPTEEMACHINE = "k3-j784s4"
  meta-ti-bsp/conf/machine/include/j722s.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/j784s4.inc:OPTEEMACHINE = "k3-j784s4"

  meta-ti uses the OPTEEMACHINE to set optee-os platform [2].

[1] https://github.com/OP-TEE/optee_os/blob/4.0.0/Makefile#L37
[2] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-security/optee/optee-os.inc?h=4.0.3#n23

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- Update commit message

Changes in v5
- Drop BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR option

Added in v4

 configs/ti_am62x_sk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index f88252a89c68..c3ad555a8184 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -21,7 +21,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
-BR2_TARGET_OPTEE_OS_PLATFORM="k3"
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
