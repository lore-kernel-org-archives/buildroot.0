Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A698ECD98DA
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 08:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA7785352;
	Tue, 16 Jun 2026 08:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HeLi_oDf8I2o; Tue, 16 Jun 2026 08:39:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DE58853CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781599188;
	bh=Zn9LTxf5WMpdqHEnufkeladLa1BK6YiGeuMYhYQ9HQc=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TldSghqg2c3UE0QtgBxzZCpIuBlsBiQdu8ckrsaXCd2Jt0XnlqjNTTDyM5BdYHryx
	 4wt2bS3PPxLIQkniyXtnM+vq4Os+SPRVNm1XUvsL7DhdRDVZSJatXJ6hOf3KDc8WpV
	 OjH4HAkiWC1+KnoDKETbncwKa1TugV3phcmJ/Ib6z7iU/Efb2u1XYdHfUFQV4nUThQ
	 jc+mCRnQa52PVz6YIxLzRd4oZVepfBjYXO+2q3iVkx8k4a1RkIFN4yrbIMLApmjw2N
	 y0fyJoRH7QFP5oSSdM7kvah1WhaD3P8DP8bdC9qFkM/6sVZrOUm4IHRVcFCKKlI1tn
	 YJsgwD0r+I0VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DE58853CF;
	Tue, 16 Jun 2026 08:39:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FFA8169
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 08:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D9B76F499
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 08:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDTemvXAEuB6 for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 08:39:46 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::643; helo=mail-ej1-x643.google.com;
 envelope-from=bram.vlerick@openpixelsystems.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9ED346F498
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ED346F498
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9ED346F498
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 08:39:45 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-bf1cdcfd6deso503671166b.3
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 01:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781599183; x=1782203983;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JtL7yXgSLP3vWmTmt0sPH9Cd80nCn0kKwVnkMybdr1M=;
 b=fwJTZu6i5VE4j82nVtEyenpdZXO1Z7yFnFlVRSa9zOctPiAozUTr+SxK6mofvsjKmd
 flRqMhszhzyrN//XrpJzkynrpqvgkbgxqcdSYXYyP/14Ix1IoKjZBzlXh5ZrhAfYw3+2
 BrlkoecMjs5FN0BosoUzgDxRnVHVgil8NKUbwPMq7iG6P0elpjDowGmXxlLfT1CRO/la
 +w3IDUadHqJwoX4EVBAOGxRJQsHuqhIgJrCM2WmTutmcmx9Qo2bKcwnpdLDtSZ4E3ho6
 AguEmRhPY6ZqcyMxH/JN1vsPbCvkttMR2hCVUN0ow3RYcsJk6LG+o41aK6S3hDH9xtXL
 rxnQ==
X-Gm-Message-State: AOJu0YxBxdXYduvfpVm+hShI2OoJRzKd/6kfQ6wx53FiTqNeIdG1anmM
 8t9bQVaaZLRIwFNJot5c2PfY6tpwZwMebNLLqZJixFjhI7XE81L3bruKgoTajz/iHDUhqo/xdwZ
 gJyIK/kyedTiS
X-Gm-Gg: Acq92OFyeJNHFmhRkq5iTi/c6KG2rpf4gewK7pmiK0yC6QQ/buDO6SpQWb/ZZwhKt2g
 ijrF9pc9fp0MuLD0Ot23QMCM2NijoXNt7gyvYvpDlDhuz6BHnIM7dSCdP7wlynRpd1hV+Ot332E
 n0z0OBbIWZbad/+in2RNNYqdnMij9Kd1F64jkdBUtofc6mmhDHZ8Ei6n1GIZIrERKho6TsVyqv1
 JEenLeLF53GjE6xPPAzwvDtsf6iBf3Ojtvv0Y5FNmE+rvJh6gKIDwK3UcWXSXuVGyjgTyPbdBOT
 vFMI4vU3pJpQ30O5Qq6lDEvU112XXwLT8CCG/4cSuU0HeQ22ckiOMa/Ph5Xkl7xRepgenpjjXB1
 VbLxY0pLGX1n3WhMZZMOlUeTsolxNYUuRI0R6wUqhQir552bg5zegSChlQ1H/mXVkFNeTFYwCgF
 gszf5qqonVcHJ6X5yoGO6y4ytC8hQyXSkK0Z66bnrUlTZlQTTkwEWATxrUMxzQkz6QXTMWYS/uC
 AH7sepjFJx3/vAciJkG99kJp85ZcFTC8n0yBrcrUWudXTg5un47PIG5lW9bs7rOX0MMmZAdpODa
 ktCyZwaqLCC4aCaUl7Gw7LV2BT2Nlej1VzkUYRiuYG8sGjl/8tLfWB9iwg7sDqncwg7liMxk0+d
 nsVXLypjFVTX9QMogpBM=
X-Received: by 2002:a17:907:25cb:b0:bed:441a:b26a with SMTP id
 a640c23a62f3a-c043ad41599mr109749166b.20.1781599182521; 
 Tue, 16 Jun 2026 01:39:42 -0700 (PDT)
Received: from argon.opsys.be (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfdb844060csm593608566b.46.2026.06.16.01.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 01:39:42 -0700 (PDT)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Date: Tue, 16 Jun 2026 10:39:39 +0200
MIME-Version: 1.0
Message-Id: <20260616-package-kernel-hardening-checker-v1-1-f12e90749b0f@openpixelsystems.org>
X-B4-Tracking: v=1; b=H4sIAMoLMWoC/yWNMQ7CMAwAv1J5xlJShQ58BTE4rtuYIlMlgJCq/
 h0D491wt0GTqtLg1G1Q5aVN7+YQDx1wIZsFdXSGPvRDGGLAlXgh14tUkxsWqqOY2oxchF1iTlM
 6ckyZYgbPrFUmff8W58uf2zNfhR/fLuz7B/5teP+EAAAA
X-Change-ID: 20260610-package-kernel-hardening-checker-b4f45c14ba1b
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bram Vlerick <bram.vlerick@openpixelsystems.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2673;
 i=bram.vlerick@openpixelsystems.org; h=from:subject:message-id;
 bh=oo7cM+UFFEcoAB3JhH4OMPSr+ASz44LJeJZtrW4GKiI=;
 b=owEBiQJ2/ZANAwAIAd6tmkew/Z03AcsmYgBqMQvMcqM5W3EBgzPRum1DYRfB0zF3u0BmkiCSh
 avAdHU0uBWJAk8EAAEIADkWIQTzNzLrMhPFwtdXzrPerZpHsP2dNwUCajELzBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQ3q2aR7D9nTfKDxAAmfucdaTvIwOsg+rpgkq03jTnepDWiRm
 bKDjGtU5JdaDq2EqD5L85cIe82l7165uIPATe1PHFefYgQczZ3fjVVs8ji3Z6mTdEWM8fXTkIGv
 fRclMxAOAJidLrGcRPxsKW7JRSDDctgs0ma/IrQxuVNFzs7wU0ExftofwIJwRnzsexv3F2fPkzl
 E/8/Y6N1vlsOc23aokJr01lU66+hkjCHL6MsjyOtpM/wgXSmquiLPabp3zKhH4GnAvu+6AyTdw2
 aoYzf2ve3I+n6P+nEWZ09vM2dbPMkQB88Fh5vk1gXKve3AvCXLf2bZH5OPPDQMOGiswi18An9pz
 6UGJ1huQosw4T6ufLsTut1CJFWcdviaTrhbBnWU7lCY2buSRFnK3tDX1fnA4F+pG6dZ0QIiImJl
 Li5a3KantCC+UItp9WlLA7gnKFkIX2xV8I06EBTsIc5rJoYE0KJs7C7MNE/V0jqCORR/zbp21J5
 UvEhDD8MiML9V6+EHa+PZtV1QhYGwgiKfLaNhZnL/Ru2fZINnDs3/PCtiGBbffNa0W/PErHzXuH
 fdJVCdmTi18H+llhDFZmNNqWa7q9QK6u7G0ieKr7ve+rhkWmX/hTFZ79x0OpzO2Yijki4036kNP
 v83oGYMMAvnuV6OHmkVTjlQwHR73Ag2ztHlCd7wZ7i+vpeS38CfA=
X-Developer-Key: i=bram.vlerick@openpixelsystems.org; a=openpgp;
 fpr=F33732EB3213C5C2D757CEB3DEAD9A47B0FD9D37
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems-org.20251104.gappssmtp.com; s=20251104; t=1781599183;
 x=1782203983; darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JtL7yXgSLP3vWmTmt0sPH9Cd80nCn0kKwVnkMybdr1M=;
 b=moZcLyJtt5gY0X1LFRXBu7IkgFR5jZdQyUteb93HTRS0Ku8c+EkwyuJu4PKP5/bleM
 ME+ifiPG8svlXmk/vzYyysuVJzqgGR6V6h4nXeuN+OTf9m6OmLHxcX+G+IT1qMbWc2pY
 0oMaYEtWHrE6kxd55U9eiEpHKPi5k/ZX7t8LBt/WQUQ1EZA5T6qNLyk4ItXDDdX8yU0q
 9UHt85xJAtUxoy6zhi2XVfFk/ZTyznqJf/sUKZ+wEScm1xtG29hiZBdjytW+Zd4v3nw4
 h/b2AKgRy+mlEYv/3cB44UfSutPkon1/WPiEG2cA30ZPfkh8z6XaV49QQg2Lx+GhAZM4
 hlGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openpixelsystems-org.20251104.gappssmtp.com
 header.i=@openpixelsystems-org.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=moZcLyJt
Subject: [Buildroot] [PATCH] package/kernel-hardening-checker: new package
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

kernel-hardening-checker (formerly kconfig-hardened-check) is a
tool for checking the security hardening options of the Linux kernel.

https://github.com/a13xp0p0v/kernel-hardening-checker

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
 package/Config.in.host                                      |  1 +
 package/kernel-hardening-checker/Config.in.host             |  8 ++++++++
 .../kernel-hardening-checker/kernel-hardening-checker.mk    | 13 +++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index df57cc0c17..d8d295a5d8 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -59,6 +59,7 @@ menu "Host utilities"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jh71xx-tools/Config.in.host"
 	source "package/jq/Config.in.host"
+	source "package/kernel-hardening-checker/Config.in.host"
 	source "package/kmod/Config.in.host"
 	source "package/libp11/Config.in.host"
 	source "package/llvm-project/lld/Config.in.host"
diff --git a/package/kernel-hardening-checker/Config.in.host b/package/kernel-hardening-checker/Config.in.host
new file mode 100644
index 0000000000..37d2775335
--- /dev/null
+++ b/package/kernel-hardening-checker/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_KERNEL_HARDENING_CHECKER
+	bool "host kernel-hardening-checker"
+	help
+	  kernel-hardening-checker (formerly kconfig-hardened-check)
+	  is a tool for checking the security hardening options of the
+	  Linux kernel.
+
+	  https://github.com/a13xp0p0v/kernel-hardening-checker
diff --git a/package/kernel-hardening-checker/kernel-hardening-checker.mk b/package/kernel-hardening-checker/kernel-hardening-checker.mk
new file mode 100644
index 0000000000..3fdf72f471
--- /dev/null
+++ b/package/kernel-hardening-checker/kernel-hardening-checker.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kernel-hardening-checker
+#
+################################################################################
+
+KERNEL_HARDENING_CHECKER_VERSION = 0.6.17.1
+KERNEL_HARDENING_CHECKER_SITE = $(call github,a13xp0p0v,kernel-hardening-checker,v$(KERNEL_HARDENING_CHECKER_VERSION))
+KERNEL_HARDENING_CHECKER_LICENSE = GPL-3.0
+KERNEL_HARDENING_CHECKER_LICENSE_FILES = LICENSE.txt
+KERNEL_HARDENING_CHECKER_SETUP_TYPE = setuptools
+
+$(eval $(host-python-package))

---
base-commit: cbe867b895d19861cd809c953f88c576f2073223
change-id: 20260610-package-kernel-hardening-checker-b4f45c14ba1b

Best regards,
--  
Bram Vlerick <bram.vlerick@openpixelsystems.org>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
