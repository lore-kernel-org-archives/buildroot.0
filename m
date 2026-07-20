Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46FCC44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 21:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A47A60749;
	Mon, 20 Jul 2026 21:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tU6d-fK-pjba; Mon, 20 Jul 2026 21:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 165EB60625
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784582558;
	bh=KHcbu5TUANcdyxKB9m65vQiPzoTtx8FzFVhYIPlez/w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PiJ4hi8/qz7mIeVtAqe2JkpVW7bCJxMlx+FHT+qZ1bHklP3JLkuSLw1+SdOf4CPTB
	 Cp6vOZqtGB+iEpg6p364swV5B6xnGnuVQrfTcxkjqnQ0YjeBrAGiZ3mvPAM7Sxlfic
	 1IgR/JYevaC8C2a7jMYD9rrJqSKmTAeYesv5scAD14MRNZFd6AKSi2DHCwTjLnWoey
	 QB4bIndxhAzpfDAN+lJuVeqCscHD5qa4thxSdSi47ZFCNczkiT4Vr/HrgxTU7p7I1f
	 qPBnRicKEKGytdu8z1z8C80n1ntG2YZywuNcghBbzT40Giq6Dj8uYCwms5hm4iCOs2
	 ndLfjr7MqT/Nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 165EB60625;
	Mon, 20 Jul 2026 21:22:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2747786
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 21:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F390404F5
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 21:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-aHIcz_jBLX for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 21:22:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:33::2;
 helo=mail-ed2-x02.google.com; envelope-from=thi.zirnstein@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A3BC404EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A3BC404EE
Received: from mail-ed2-x02.google.com (mail-ed2-x02.google.com
 [IPv6:2a00:1450:4864:33::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A3BC404EE
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 21:22:35 +0000 (UTC)
Received: by mail-ed2-x02.google.com with SMTP id
 4fb4d7f45d1cf-698af52db66so6379947a12.0
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 14:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784582553; x=1785187353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JCosLU+zMEr6cwb7xaOI6IhKVQivLytadL/Vld6ONrU=;
 b=OITk8xOVntuDJFPL0shLSI7AgXcujH+0CnwEOdSZwIBhNBij44/Fr6MlwyNbup1cuz
 3Hh8e+MZR99ZKR7qcJuwABc8Q8DmkDeHpDp2t3JVp4w8OB9RT15HRse3K8VPxTrEmk7a
 U8JLNAoxpzQ2BqpbJTIeEZbw3ulv62YwqYx2bqNKI7DhMvawHmW2x+6ihWgrd4sS3F+M
 fmS7akXhwejoGV/vLV+Oe+naEho+WALTBj811+zWu763RjqbuBnOK3iuc1CdRoNpa4Km
 JfEgtynI6NsL2eKtnas5KWI/rTtjpaGaFOqA4oPk1ExtgOMwWDGwX1WIsSquLuNZWL+4
 U9/A==
X-Gm-Message-State: AOJu0YwTyfBm8kRYkffhzB07Nw4EGfp2uBg619jkMFMCEblwtFUjCjwh
 PpAdVAwK4IBRvuuAtgqdAI2ghAb23Fjf5A7fKtuW3bbG0XhzETZw+jQjNT29twhU
X-Gm-Gg: AR+sD12ZTAOZBL6E/vEDLTLkixDDrHCLx4dZJMDHNo2XnBqH/OskScBH48TsRd8vy9b
 tXHkW73DJizcA3jIzIB42VFpbWEm1rnqN/3E90+Nwq4dW+KEYlXYmMxdMjNwesyr8DXt4YEZw8K
 Fqf1Co2TQ4vvrDdYrGJI/G0Eo08PMl3s+rolU4Zy/6CBhkuZCcceazAUMoNJorzxpNswiGATWDi
 mUfDrHs5j1lf1bk4t4HYaEtQgyJo7dfsweXhDogKStRqBadfihg/CREo+vop8v9Gigc/anTn/Wj
 A3q0l4Xu4fTMpIYhVLQqJhd7Uik5euixYshgP0ctczMeIj+3tzcXf1qpLwbKi31ZJnlkSgP6Tq4
 FWyAzkp4NROqqLdF7k9WXGLVrRRbcmckdZJ8qCkg7gjyVEKhqET1/KnCLQDlll4gszJGrJrfWnC
 NYJYe2GKVXuyZrFwlTSCWydcwdf6u/7kY5YH2TW8NMJEVTxaJAlfJoyKHiEn0bkl5EKGOOeMBt1
 Fw=
X-Received: by 2002:a05:6402:42c4:b0:69a:50f9:6048 with SMTP id
 4fb4d7f45d1cf-69e652ee9eamr5879363a12.28.1784582553022; 
 Mon, 20 Jul 2026 14:22:33 -0700 (PDT)
Received: from thi-server.fritz.box
 (dslb-092-074-131-218.092.074.pools.vodafone-ip.de. [92.74.131.218])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69e6fff71d7sm5071405a12.27.2026.07.20.14.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 14:22:31 -0700 (PDT)
From: thilo zirnstein <thi.zirnstein@gmail.com>
To: buildroot@buildroot.org
Cc: thilo zirnstein <thi.zirnstein@gmail.com>
Date: Mon, 20 Jul 2026 23:22:22 +0200
Message-ID: <20260720212223.551236-1-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784582553; x=1785187353; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JCosLU+zMEr6cwb7xaOI6IhKVQivLytadL/Vld6ONrU=;
 b=TLfnTGykpO5Mdt/WqK5UaH8DJR5wwg9wO+TzTN0yoTJI12QsWr3pGiI6Y1GCW0PjB9
 sTrAkRtFkBm4rDhPm4hyQ4AfJFjYiYcbA2eEnY+4DKcG/sFDpRTll0Af1jAv0b7zYyqu
 8Ab6uLeQF3ToJfxz4LOBVyNkfiRC2IUpoFKTjB3i1N1QBn+xSOBoLR0h/XJvM50RwYWe
 hLm59dHDpkFThaZHkXga8JOYsZeFbQ2fI7Ufl+X7cG0zSe19XL9X+CuC2qzAYnQdmOK/
 7X47HTRvQlsLirv3nzn+NJWbJ/sv4ZLXvyp+4HhlbO9s4u9XDKh1khIhUmT3kJDxivg5
 GHaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TLfnTGyk
Subject: [Buildroot] [PATCH v1 0/1] pahole for kconfig
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

Hi all, 

I recently noticed that I could not enable the CONFIG_DEBUG_INFO_BTF option, 
even if I enable the BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE option. 

The pahole was built prior to linux but not recognized when running make linux-menuconfig. 
I dug a bit and the problem seems to be: 

The environment for building the configuration editor is quite limited. 
Refer $(2)_CONFIGURATOR_MAKE_ENV
It explicitly clears the PATH variable.
The same environment is used to run the configuration editor. 

In this environment the pahole version cannot be determined (It does not exist)
The PAHOLE_VERSION is set to 0. 
The pahole is a dependence of some configurations (CONFIG_DEBUG_INFO_BTF), which cannot be enabled :/ 

Now the fun part :) 
If you read back the .config file after running menuconfig the pahole version is resolved. 
This is due to the fact that the pkg-kconfig.mk does some magic after calling $$($(2)_DIR)/.kconfig_editor_%. 
It runs a bunch of fixups, defined as $$($(2)_FIXUP_DOT_CONFIG), these fixups will run kconfig-package-regen-dot-config, 
which creates a oldconfig with a different environment. 
Now the path to host/bin/pahole is set and the pahole version is resolved.

Nevertheless, it is an issue that the pahole version is not correct when running menuconfig.
A user never can enable the CONFIG_DEBUG_INFO_BTF option, even if he enabled the BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE option.

My fix: 

I resolved the issue by adding the pahole path explicitly to the linux make flags.

Thank you for maintaining buildroot and best regards,

thilo zirnstein (1):
  linux: add host-pahole to linux make flags

 linux/linux.mk | 1 +
 1 file changed, 1 insertion(+)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
