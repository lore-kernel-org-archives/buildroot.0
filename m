Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0119EFCE4B
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C4098174C;
	Wed,  4 Mar 2026 21:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsaSGUB81dkX; Wed,  4 Mar 2026 21:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4A1C81799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772660147;
	bh=zOBjZE7ELm/9Y8tqRA//5vK3GCVK1VdbMjczEYNk9ts=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZdsEZsiPpzTfxL3Bd7FRFISuB7VEM9DGmGn/jwhed7sMMqZWLACzv9LwYFZo2OvLm
	 VEFrJubnet1e9xZoc9evgOpGODjvjXicDIF3r4gJr5aEiWEDx9N3+sr56qlaeXrYll
	 p6taihusHXGcVZTX6JvO3NQYtHHew/4WtAQhJUzd47b2baXMGGt5AjCeOQRYjVRFf9
	 Upo6zhXe/4i5anrrdvUQj6NiNn7f0NSxP5QSOuBC2DL4T6ZuGQl7a3I+m4jk6lNDmS
	 URqpZKlpe9amY2HI0fRs6zL0IILpjJouZcduo+cjbVvbibKHlOvbIsFlILw85tdHrp
	 /CBZX59FzCuBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4A1C81799;
	Wed,  4 Mar 2026 21:35:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C96C25B
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42D7E810F3
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id br1pbxUatX7S for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:35:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5CF218174C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CF218174C
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CF218174C
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:35:43 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439c9bdc1eeso1070363f8f.3
 for <buildroot@buildroot.org>; Wed, 04 Mar 2026 13:35:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772660141; x=1773264941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=POCdG2l+L1y7X371fiXvU3562DntpOFSLU9LK4s89+E=;
 b=Fs4RrUl61DCIizRchYrxCsuhTl6G+4+nnoiV+9FHOMJVd8jmx5bMxPvicWTaaqAyms
 K6I4qKpFOUx+oZOI8ZJr1+5POdg7CZC/pXgp5AlPz8AYWncwdEGIcis2zu03So59mocK
 z6QJ1Eql2MQEy+qdSDxQO/4dMLzm3xpjfZbOsC6BQmb6i/VY/F3FEvS++ei3cDpth81G
 ugl1RmIXIHAyPc75TwjCdmuChxjtVeQUJB5C4bu2H0lknWvt702YTZL0x0sxRp1J+yJ/
 yZqM3ExBDgoO+R4Cm0Q7oCWJ1uMbIgqezIT8NYQO0lDd9A/MzGAo6MQPQtE7NkVXnpAo
 RnBw==
X-Gm-Message-State: AOJu0YypkkP5PArIZvSFXjTtBO46J/ml3evdEe+bIRKNA/laTqDRW7gt
 BUxJv1xmiGCe13ILDRuIdbsHy0tf9r+BytJAGt86r6DRdr/20TO6Bbphmj2rgKreQEWOnLvZG1p
 oZWlg
X-Gm-Gg: ATEYQzwB7N3b8KfKEyC+bM3QFJpGZqfwzCZwuaIlPRnpc4oD+PZUov8ip88apr0M0iC
 tM2nRnKGPebJML3a1gyyeva4QXICZe3AShzzEy/qt1JBK1XxIPcuHkJozI8MaWgCVcDQhrNv81H
 acxEQ342eBHCFoad3JTwItJYkiguSWaX/28M1bf7MOGN/pn0HOQuprhzVdMWFmIj7l6GOxNZQE2
 6whpevzSjLjtrAK8Hu2CpDuuhphnk4FX3ldk6dqNFAmxwxigkjHkJA2A7lVWCq4jQf+CkN2MI3o
 0SYyBicAJS+S/q3LZ7ryXsDISmzgmco8TsoSbzBoe3V19gB3fiqBccW9vkNz0QeBf0W1e/xFyqz
 uHgHiRvnp0o82j9vVxB3TYW+fgrCtTflzQNwJCHjGJteIVTa1BAkvfyab05Ff2Hfd/WMVjUPyEz
 wSLSQaPEeKgmM7J2qMTAkSuJyd9Ns1qL5KzDEDpv3XAsGvgH7BpgnB7zD48v4NI7U3XStqeH/ZI
 lp9s6U2VswXXzU4Ntt5+Sr3Zw==
X-Received: by 2002:a05:6000:26ca:b0:439:c356:9f5d with SMTP id
 ffacd0b85a97d-439c7f6a2bamr6808747f8f.5.1772660141290; 
 Wed, 04 Mar 2026 13:35:41 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b59723fesm27668606f8f.38.2026.03.04.13.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 13:35:40 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed,  4 Mar 2026 22:35:28 +0100
Message-ID: <20260304213528.1380898-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304213528.1380898-1-romain.naour@smile.fr>
References: <20260304213528.1380898-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1772660141; x=1773264941; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=POCdG2l+L1y7X371fiXvU3562DntpOFSLU9LK4s89+E=;
 b=E/VyzHZmictBsCU4PqbhGuOnmbTXWEMy6EK2TkQWn+sphsf1dmiqV812inn9nwV5qF
 VAuXE0pCd50e2tOVa08w0oyLkA1CVYjt10O/fBEnh0cSGvPq0POIggFCmNvyUWaAdTyc
 0+6UASnD1MXeRojH1ma21yOsFQG2JfCjcDK84=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=E/VyzHZm
Subject: [Buildroot] [PATCH 3/3] configs/beagleboneai64_defconfig: use
 BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This defconfig use BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS to provide the path
to the TEE in raw binary format but use the legacy file name
"tee-pager_v2.bin" rather than the recommended "tee-raw.bin" [1][2].

Instead of just replacing the file name, use the newly introduced
BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN option. Since this option
needs BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE, we now have an explicit
dependency between u-boot and optee-os package.

Previously we had an indirect dependency: optee-os <- ATF <- u-boot
with both BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE and
BR2_TARGET_UBOOT_NEEDS_ATF_BL31 options enabled at the same time.

[1] https://github.com/OP-TEE/optee_os/commit/376cb124dd8d4f0a8737359211fa6883bdb4c77c
[2] https://source.denx.de/u-boot/u-boot/-/commit/4e0b8238eea83b71713230e67e781111ea897035

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
The same change can be done on other defconfig:

  beagleplay_defconfig
  beagley_ai_defconfig
  ti_am62ax_sk_defconfig
  ti_am62px_sk_defconfig
  ti_am62x_sk_defconfig
  ti_am64x_sk_defconfig
---
 configs/beagleboneai64_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/beagleboneai64_defconfig b/configs/beagleboneai64_defconfig
index db5837fe36..5e0adc0dc2 100644
--- a/configs/beagleboneai64_defconfig
+++ b/configs/beagleboneai64_defconfig
@@ -38,12 +38,13 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="j721e_beagleboneai64_a72"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="tispl.bin_unsigned"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
