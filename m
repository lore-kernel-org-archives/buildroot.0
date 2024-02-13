Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD678C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAF6D415EC;
	Tue, 13 Feb 2024 17:28:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tgtt4HnWC-Vv; Tue, 13 Feb 2024 17:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAAA14159A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAAA14159A;
	Tue, 13 Feb 2024 17:28:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A2F11BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17F4E81AEF
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lsMRfp9PHe5p for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D51FD817ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D51FD817ED
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D51FD817ED
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:22 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33b1d7f736bso807958f8f.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845301; x=1708450101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b3QOCWSUk4ch3ILYDwMNi9i46yA8G7BQuQyn9eRqohM=;
 b=rYAS+0ECI1VUjiyEJaqbGMh/Ooc7nbzqQEH6Pl0SY4ULYhfDRBlF1V03U9LoWg77m1
 UKZ6zABZWSZFyLJY/WOHeaGCG/diiNyn2zjNPS7WfeYAWXTHsyA8sWlcefF1JcFNqcUt
 vz8KaPoVDnlyf6xPj+G+wEjjMWz83gygy6VOZzLoujb1AJ0RY5S921ejLWT2n58fDYy4
 wPmpgH8gvo4MrHTaLXt57PZIrIsjlpy9JA1YjUzPyowIrRQ0KA1KmfmcI9TZ02/2Qdc1
 fcwBF714gFAUpwzPbPhtZIGwADjG7khK2DBWrLpz7+iR+4LRje3T1BHCdV+m7idorNgZ
 6New==
X-Gm-Message-State: AOJu0Ywxc/Cily7MjRlrQzAkDkadONfIhxB6SnhO94Cuw9VMjoTsnfYY
 MEY4J1YI/YQ2d9Icc6E9YaAuI2hVypqIU+81tQ5Elset6V/Wj12r0q4o7V285lw0OCXqa43/Gd+
 6
X-Google-Smtp-Source: AGHT+IGBwyccRbgpWmVMYChYkdQLc8OfdTGNWD6jfQ9A1kHpivL2wvoDdppw7Ey5MHFC+NOxDzwvvA==
X-Received: by 2002:a5d:6688:0:b0:33b:697c:1fc6 with SMTP id
 l8-20020a5d6688000000b0033b697c1fc6mr6753246wru.20.1707845301018; 
 Tue, 13 Feb 2024 09:28:21 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:20 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:27:58 +0100
Message-ID: <20240213172817.2872849-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845301; x=1708450101;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b3QOCWSUk4ch3ILYDwMNi9i46yA8G7BQuQyn9eRqohM=;
 b=zNfc2Mtq+2tHzyUByZIn5ILFue8z5zvbWLIm4ZyrcfdQEavahJWW193sSsRpNScgtk
 gvPFEJwXEkysZSuFepwe0aP2AMFRjjIMf+0BBWOWRx16MUsZU2qMdaqKUpH0sCjADgYZ
 puY7I09XNIJuwe08POduybkM7Pd3wRlOymxxVjeirDupiKvFFssS0OvX1xcSCmFDhBtS
 3TzxVKJhevF6WNfvpsEYSNI9nNZMMFvVCTDin13KpKx2by5IwZ9Y4qQ5h9B99qH5T93u
 h87SdejW9saydJPNJuRy6YPcpoxC4IgqOgKbpn20CBvUCvuE7kgCNn+ae73fB6BWBljc
 IHgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=zNfc2Mtq
Subject: [Buildroot] [PATCH 02/21] configs/ti_am62x_sk_defconfig: fix
 optee-os plateform
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to meta-ti, the optee-os plateform must be
"k3-am62x" not "k3".

  meta-ti uses the OPTEEMACHINE to set optee-os platform [1].
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

[1] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-security/optee/optee-os.inc?h=4.0.3#n23

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
On SK-TDA4VM, such error leads to a runtime boot crash.
---
 configs/ti_am62x_sk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index f88252a89c..c3ad555a81 100644
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
