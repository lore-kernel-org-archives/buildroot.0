Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707E6C88E66
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 13:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 041D180DE3;
	Sun, 13 Sep 2026 13:35:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUpK4iWjT0HC; Sun, 13 Sep 2026 13:35:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ECEC480DE4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789306537;
	b=NxKzqdJThGTLlWO10sNlN3GIpf7vTcu+i/MPNjeSSzqrf68dcZCAd/JOvAlDue49heqg
	 w9gKKFlp4vyuItc4VsRcrCrbLHS2lYRAgewYe9Y5187rD0q7WdGGqBD7vhVvz7itnVVtq
	 99H9UyYWdnhZ9oKOUixcynblCs0+XHMUrfcqRoXX0cB3E9WT2Fpii1wciwoNP1qSM2VcJ
	 IyknBb+rkYKmHG1hkv8dBIYMlzE8GR7eJTmotyMVQj3FxSaodvZVFToLkol4EhIfTTCg/
	 F0tfZt5LPQArKtzwdV4wkmO6fzfoSrb/0wxpzxXI2jhb8SO/HkUEUGIleHWpLIUw8rA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789306537;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aYByYlOqq0OSD0NIaPN/wou8CSiHZrt5VPKUMsVILuk=;
	b=QnPHREtrIxc7ApnpKGKhBVgojZYbTTrWm+XDLSFGv3ZImo7EGnmTyobnOpOl036MXRi5
	 VzMtIUSPQkVo0GwaQUSmzQUf4Rf9VWp2MQAoasIRylv3FRhQfTsWjFjlnH7ra2l/xvrfa
	 al7XUcfiXPsDBApDhqX4fETfYyItCTZEvnJWBXfXdVb13TQKQCmu436gaZ53nFVfu4edc
	 usGfo30FuAXvowRD4nAhYThxBJghV3dLCELWpzpI4DfcX/N+FQBv/BzM5gSD0zwyk2ESx
	 Fs0r6Xsdg0zepETinmDb2MnIVZop63Nuix3KagI8Zm8pL6WX5JAiBMiJ6pxpFrK9O3w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MTXz9qJ0;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789306537;
	bh=aYByYlOqq0OSD0NIaPN/wou8CSiHZrt5VPKUMsVILuk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mLeCZFbKFEaaE2S82ITSY+e4IvcrTijre+GC7SDyWYJNeN5nol/w/ImosW3ATYBQU
	 4K5RLuE6edyMjlPhukPAiOTy9MkQB9MdKlV27nsd8PpD+xaRpPwArx6grkm61xFcXT
	 fz9sByUqfr5JC499NVjo9ES53WaVWnesdTM3Bk0n3LzecmSB48PsqSZoW2OcqUNc/K
	 YOScARU9n8V45VgsW63cGP55Jodq5ivtEbljiXDgbz7Gktn067eTy805zrICDMkhfp
	 uhUhuAMtCWjJl4COXNIWS+ZMwD4lt5gZex/wvi52RRbwuAs5+0O64qXHD8A5Gbriqx
	 lFFV4G4ArgDPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECEC480DE4;
	Sun, 13 Sep 2026 13:35:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E07B73AF
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 13:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1E9A80DE4
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 13:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIagfZZKek3l for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 13:35:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9903C80DE3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789306535;
 b=U3XwVmtNlHLvnHlRHwaYE65UqjvrnMlLqPX2o+WQRMTJA4bsdrvxxvfwQip0SDzFjhEG
 W7aVE8DX2BkmnVf1NYYF9i3f6DXYj7k8oH7wrZ2KtrJ32E2mUIDHCD+ZjGB+NOcdb/2q3
 8iMWUnimu2leECX4fMHXceBTZtqN6TfJyBfgTAfcRN3ZAgfQ3GUyzlo3wQb+8xv5zBMRG
 sLG/wXsk+k1rv1EVU4DOyZTBS1L8Mj5wj4D3VKGQNbHmVZ2BS7sDFddz8LdGq/XvO7HDk
 PQjXPKRd0Pb0ZamOfc99QLacGwTnlB4r6ObGG9a+QFgFoe4XsdzlfRwvyZ8Rum3J7zA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789306535;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Vpo4Kgtm7cShGFdpQV5PmaMgU6x7B3UrMUjDFjF+uK4=;
 b=EmHPGuE2b/1thttKMHIb9FIcGOPuOUBv32eFyDs8W2FDGASYTLqB80vh91icG5dCYWy2
 60YPA6uO9LUzX0bVnBkDB9CzzknZ1e6o+ZoRqtFmrzkgzan7HVRHk9RPbHrNJ00lvzeu+
 iPKCWW5HJ60hmV77B24RUP8gkH/GKszqBDiPBk2Rcm+YVrY01qs2SCCms0cXuUPEF0SJd
 zIcJOuYb4q2pO55M1peQPYe6gsDiFRHFHdOnc8kDwQlp7iqYNb8RYlk47K2QdjAVg+0II
 V+IWhW5exF/ktNpujfnoakmY1+SbNCDitycoCKEmKOJayag6u6zVN9dEDGIy4tg72dw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=MTXz9qJ0; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=MTXz9qJ0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9903C80DE3
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 13:35:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-49b965570d7so32111775e9.0
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 06:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789306531; x=1789911331; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Vpo4Kgtm7cShGFdpQV5PmaMgU6x7B3UrMUjDFjF+uK4=;
 b=MTXz9qJ0DhSv6QAqxCTGuoILxl2FN3LpJ2Da7ltpEMvDVJGZC8FH93sPAmIok/e0Lr
 LspHaZVPyY9w5mUI7FFAqjFJuvJ1t8mygsRd4d7rLgv7SI4QZ1TSoagdcSpzqQSRPC8Z
 suKWOCNVH8WaYRCQxG7RPclOy28vrf8DRbzHiWMRdC3X7PZ8/NAaBFmDyYe4G6aaE57E
 Ov3wHII6MXInPGv77/r5H41WS85K8Ml2D5uUM24+aK9wgt11xXsQMpzXNaPH1kenKSlJ
 /BfciqUlJ0oA0aluMBLyO9dea0ybyZzPJ4vjpl5ISaOh2ITr/aHQ56mcNdmTQEw5thFd
 qSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789306531; x=1789911331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Vpo4Kgtm7cShGFdpQV5PmaMgU6x7B3UrMUjDFjF+uK4=;
 b=OK/xxO0p0MUjqz15C9tlTho9EuPFAv7d/mNJuK8JTzJ/1pLcIyrc+xs3LX+Phxl8uK
 fBPJH2QkxYx7t7Z561SkNLIkajW8WKPmRWkQNZ6tqW6TjLozsWcwGq02/c3cgDcp6ME/
 7O6iVd3bMW3MCrHaI1VZ8uggMo6lLJaXvlYny4VSiM1KUqx2rB8qCvGALzalTV3Ik0W5
 DCSZCmeG6ANt09Fbkm7e/ngbn4rQuWexM61jSfe/5eSvrFegGykj/9AwWJONuswgMnMf
 ysVqUk4cJm7B8sMuYHYzoeYaLy3K4FZozcj0ZwS/qy/qVrDUic0gE2ls/PX59yJ/6UR5
 nBHQ==
X-Gm-Message-State: AFuF++kaWNqmOlyBVleoWDgZh3xAy4ie3hdmMtlwy9vdSY0aS6G/KYd+
 c9EDWVPPvJcHPOM+RwW+RrJ1BR1UAjsB6RIb49ZsFnOdIZoM5gP1qpd4r3ZzKA==
X-Gm-Gg: AYBFou1B2V02kh/hyhL0HhkJI+tuelDXk+mO6V7OyITympPtRvPzS9hkxiHQAHqYsHK
 34r0FPXVTOtRIF2Ac5hSsTDe5YL6dPOm1NYESKK1mYMxKwurIj0pkndZbl+5lhaknurNVeT9lNI
 qaUPkHc36I+5htobG+BoNAN+jaT8hNZwvz0Uso53VwLJ4qaN0XH8UbF0YrNz9XSCxiQGHUcW+ig
 GvyexWN4a+lBRN37F4hDBDK3Q6Gzj9/noZEjvCtClh+Whjo3Hwp8AoI+F3ajBnL9/U1k/KmEPUg
 LE/shvnllrI6VjAmy+hEAxmVAPV0q7ghTZhe8B4cTWFsPDz/4/vv4evcXgKxXueq2owZohuK926
 tILsBWpZl6HMlrqitCUV9mQ70Nb7RmmBjVn3u5INZsYJX/Rmo54Al8XrbbCqahfgXdH46DlBpmf
 oo+x2lLf1fnOlhzUoeapA4RDj49IBAgWCcNreNYKbUcUHp1Dui9sXCjrYaus+HdDKwZpzAvQjRU
 I0IgBIs2mNQn6wVUH2pBDNfsuI=
X-Received: by 2002:a05:600c:1d08:b0:49c:fc6e:8cb4 with SMTP id
 5b1f17b1804b1-49e619c4d64mr157369975e9.24.1789306530948; 
 Sun, 13 Sep 2026 06:35:30 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e60adaee4sm352997005e9.14.2026.09.13.06.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2026 06:35:30 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Romain Naour <romain.naour@smile.fr>
Date: Sun, 13 Sep 2026 15:35:15 +0200
Message-ID: <20260913133520.3423773-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] boot/uboot: support custom DTS with
 CONFIG_OF_UPSTREAM
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

Since U-Boot 2024.07, boards with CONFIG_OF_UPSTREAM build their device
trees from dts/upstream/src/<arch>/<vendor>/ instead of arch/<arch>/dts/,
so the files copied by BR2_TARGET_UBOOT_CUSTOM_DTS_PATH were ignored and
the build failed with "No rule to make target".

Derive the destination from the U-Boot configuration, including the vendor
sub-directory taken from CONFIG_DEFAULT_DEVICE_TREE. That tree keeps the
Linux architecture naming, so aarch64 has to be mapped back from
UBOOT_ARCH ("arm") to "arm64".

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2:
- handle *u-boot.dtsi separately
- document the new behaviour with OF_UPSTREAM-enabled U-Boot builds
v1:
https://lore.kernel.org/all/20260901145225.579733-1-alexander.sverdlin@gmail.com/

 boot/uboot/Config.in | 13 +++++++++++--
 boot/uboot/uboot.mk  | 30 +++++++++++++++++++++++++++---
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 1eabd10407..1795f22b20 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -803,8 +803,17 @@ config BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
 	string "Device Tree Source file paths"
 	help
 	  Space-separated list of paths to device tree source files
-	  that will be copied to arch/ARCH/dts/ before starting the
-	  build.
+	  that will be copied before starting the build.
+
+	  They are copied to arch/ARCH/dts/, except that a configuration
+	  with CONFIG_OF_UPSTREAM (U-Boot 2024.07 and later) builds its
+	  device trees from the vendor directory below dts/upstream/src/
+	  that CONFIG_DEFAULT_DEVICE_TREE names, so they are copied
+	  there instead.
+
+	  The *u-boot.dtsi fragments U-Boot includes on its own are
+	  copied to arch/ARCH/dts/ in either case, as that is the only
+	  place it looks for them.
 
 	  To use this device tree source file, the U-Boot configuration
 	  file must refer to it.
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 5b3f46ac74..1453308c17 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -426,10 +426,34 @@ endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
 UBOOT_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
 
+# With CONFIG_OF_UPSTREAM the device trees are built from dts/upstream/src/
+# instead of arch/<arch>/dts/, in the vendor sub-directory encoded in the
+# device tree name. That tree keeps the Linux architecture naming, so aarch64
+# has to be mapped back from UBOOT_ARCH ("arm") to "arm64". The fragments
+# U-Boot includes on its own are searched for in arch/<arch>/dts/ only, so
+# they stay there whatever the device trees do.
+define UBOOT_INSTALL_CUSTOM_DTS
+	arch_dir="arch/$(UBOOT_ARCH)/dts"; \
+	dts_dir="$$arch_dir"; \
+	if grep -q "^CONFIG_OF_UPSTREAM=y" $(@D)/.config; then \
+		if grep -q "^CONFIG_ARM64=y" $(@D)/.config; then \
+			dts_dir="dts/upstream/src/arm64"; \
+		else \
+			dts_dir="dts/upstream/src/$(UBOOT_ARCH)"; \
+		fi; \
+		dt=$$(sed -n 's/^CONFIG_DEFAULT_DEVICE_TREE="\(.*\)"$$/\1/p' $(@D)/.config); \
+		case "$$dt" in */*) dts_dir="$$dts_dir/$${dt%/*}";; esac; \
+	fi; \
+	for dts in $(UBOOT_CUSTOM_DTS_PATH); do \
+		case "$$dts" in \
+		*u-boot.dtsi) cp -f "$$dts" $(@D)/$$arch_dir/;; \
+		*) cp -f "$$dts" $(@D)/$$dts_dir/;; \
+		esac; \
+	done
+endef
+
 define UBOOT_BUILD_CMDS
-	$(if $(UBOOT_CUSTOM_DTS_PATH),
-		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
-	)
+	$(if $(UBOOT_CUSTOM_DTS_PATH),$(UBOOT_INSTALL_CUSTOM_DTS))
 	$(TARGET_CONFIGURE_OPTS) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
