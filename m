Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC77AD5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89597608C3;
	Sun, 14 Dec 2025 21:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEhmGIkw4HnO; Sun, 14 Dec 2025 21:35:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B58AF60877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765748116;
	bh=JkdAM8RrDG8XMuBsyfAnOG1191PxfGMk8WIh4osV5Kc=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NvA5DBXx7/cJUKoDJerImPxz7oERFbB/DzF9HpmJZo5ryKS8qSIKJFDzGApjavNGS
	 si1zvgqzrj4oPP+1WDsrQfwBB5xmJ0jQoNWRQZxG0jlFK6VpexD8WRgVgQnttA7rSS
	 Lh1DrD0VFkegN6O8ZvR5dbTW7eD6qgZNo8DbPFm2kzoveG8FKL3m157q8e/wzkk+dp
	 jmLxpOL+J+M3abcUM+2I5BNgA1x3LCpa+QsNaf103LylR4Xjvce3Fu+TM4AjqaOSoQ
	 vxBoYTYg8895ZORKAMJ6/u5TOXsYSptO7hW0Rdm5hMPFv/vmQrK5cU0W14nhQqw/A3
	 9Dbu5CKgepkOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B58AF60877;
	Sun, 14 Dec 2025 21:35:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90E89117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 834A9405FD
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRS6KIIGkZoY for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:35:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F370405E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F370405E6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F370405E6
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:35:13 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so20121005e9.0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 13:35:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765748111; x=1766352911;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QlE0RqF/wsmxQTlG+kyfQwm03IDoYPcuwVy7ZHZGwlc=;
 b=GAoBcschlz7sh0PxTCvnBC0vsnZiKRJ3HTtoMDfFGkaON8dmVaoHQyL+RIaa5XOq86
 BdcyDquB2NAA0ceDECU4fCf5EwuKZpvFfAz30+zbj4NuSTkqJ6lgmZOOejD/EfEwC5Ne
 4+MmbwufGvW/0gCzjFNJNQ7SkSIaLe9DCXdlXlWz1GAMQOyPkV6aAhGGLfrafX5aGTow
 Sj6Sgtn3JBvhj+Ae5Nm98NGDxY5hlRDO8hmDYanvX2Ph5P0T6i7XNCgd7+gWZeirGJPw
 mKiwjAdIFy3gTfVYv/9pb8yMha7nsCueB7VJm/patDxL+/9MoIFRsrncsA+hjPP54vVC
 tvcQ==
X-Gm-Message-State: AOJu0YxGAVu2ogL9puE8WsqkgYra1HlgyycfsLbDBcKnOfXj4a0zonl2
 ygb1j6nz1wMtLLRvDMhFG1aS/aUzB3GHh27W/ZGnWdPxStvivSZNv4eL
X-Gm-Gg: AY/fxX5iV1Qwrv/IDkpZaKL3qQxRFmS7xphBn6vjPOn60mATyDsrNf1oK83+ymyb38s
 tByWafvdqMMWTIdLO/bedmKSYCqMNNuHV72hgYrgZe51dQOZs06hn3W3oHlXQNc5BgecI06hTsw
 W6KpWF81eizUXLO/KZuYp481SYqP0IpNWyYIKu3pQmdKGDVfW4tLf6rv49M530szoSXJdgkKm+P
 zd/ns1iILKqcifHOkY09h37kgWUtZxD9grTxROTYIyx33urKPITWKp8RP4wKTwGXPxr/jsi7w2+
 Kws1qyVHHLQwDm9NapYw+TiSI/cQSlCdhlXeedP4YigAkEoo5sBDgD3l7t45veuKPaMIT7tGz7s
 enEb6539wpEe1H/1pdWrZsm1cjFUCNyfaqn+cpIQjjBfBCQL8BiYEbLWd+yol9m0jwzymzOgP/x
 +m//lBX98JstShqMAVkq/enSM/IUZ6CIWQR/Pb+/kEvEYALV7K5q6mIntmuI4/
X-Google-Smtp-Source: AGHT+IEpleTeC/blH52YVB7QHWG0eB/QsEf6qgWbUin1PyQZPXT1MJweTJ5Ao4peccu3q257EBP5XA==
X-Received: by 2002:a05:600c:444a:b0:479:3876:22a8 with SMTP id
 5b1f17b1804b1-47a8f8c2e5cmr102023915e9.16.1765748111202; 
 Sun, 14 Dec 2025 13:35:11 -0800 (PST)
Received: from localhost (host109-150-127-3.range109-150.btcentralplus.com.
 [109.150.127.3]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f768936sm153280525e9.6.2025.12.14.13.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 13:35:10 -0800 (PST)
From: Christopher Obbard <obbardc@gmail.com>
Date: Sun, 14 Dec 2025 21:35:03 +0000
MIME-Version: 1.0
Message-Id: <20251214-wip-obbardc-add-package-dtui-v1-1-88de2f7882d6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIYtP2kC/x3M3QqDMAxA4VeRXC9ggzL1VcYuYhNnELS08wek7
 76yyw8O54ak0TTBUN0Q9bBk21rgHhX4mdePokkxUE2tI9fgaQG3ceQoHlkEA/uFSybf3XAibn1
 Hz16FoCxC1Mmu//71zvkHpBY5FG4AAAA=
X-Change-ID: 20251214-wip-obbardc-add-package-dtui-f2a5c8279ed2
To: buildroot@buildroot.org
Cc: Christopher Obbard <obbardc@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2635; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=3nEnX0PKAcvGtyI8GDQ+xnzPltHHbrW6dTMsJs3r50s=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBpPy2KkIvPNh9OzZFXEJyYDHZ8WjKTn13mWo862
 6JsiYhiPy6JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaT8tigAKCRBjTcTwaHBG
 +Ay1D/97WM0TK9uxlGoNSiWZcJUjYUd/SXsJt0Q70Zg8SHyzJzVOqBUbNZ0gLSviHmtwiiBBDj2
 5PwoLKbJeNmfMT46ihi40HjG7e1TdErRajM2w6aoAApR05iI/z6cAM6JGOh4sHG1dQH23lN2z1w
 XlPwbd3kzBQfwooS9m/PzEYHTdj5R2YJ2M1cIry8+gOQ8OXhiPN0Ih/EXbz0xPY1uofa0AKwpES
 RpZqmUlQF4R+yqO3cVnoOet910b/iNmII3u5aZlB2q9+GqN12gtSel21GMcpZoUq7nV99FZjh/C
 hLticDSh6ztbi8ERlIOr8BWEpH6OtVGxLeh+uGdJOIz8t/4pB+0lr03iaSOE/03Yn8uV1EzKJxN
 /v3UMo1qWQHrAJ75jFTwdvJlqxWLP3iZ7OcJIizTuyhaScr5uKgSojDT0A4izKG8EHx4VUcwfR8
 LlTn/GdXGsfbaB4Ah8d9uJNTKi1IqnN32pNWvg1BwFfVCp5TqR5NNCEXdYKMszD31J+P787IyF9
 V05kgIjlM0o4Lod62UNGYaJWsXo2N7lZ3sy2bFhWAWj+DTqvfNuHJzqLMEyQOTHU8AY6gxWfoDh
 5xm8PpECwzfyh9QDrz+7SNcaZL8X7z9RxYE/7efF1XiWdAB4Sbuai0ybohq4oKJFDWlYOo3/+AE
 iHBtoydGSqjfI/Q==
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765748111; x=1766352911; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QlE0RqF/wsmxQTlG+kyfQwm03IDoYPcuwVy7ZHZGwlc=;
 b=aQucm1+1E6Ode3sGLAMzLMTnSbQSuUYArINwRpqaCjM1SIfNJi64mMoAgvWKZS+NW7
 lQC7YmYJB2dLb2gWp/Sw24pfAlESQtVmiq13nmasGI0JVoDJJQmS4p7wAsNDHa28vEgb
 bv1kJNqWZR3ih8MbsiYUgzHaHnQxN+fi7iwNDud5+c9LOHO8hbgI3uZX6LuiV4raxURj
 BRfA4LXK+Stu/smFQqiGjhlUFOQbR8szcwCs5JLda+8S7FYqKQDk14ZhwQ4rpy9AlhFS
 FwRXg1FpoByNQavfiP86AZ0uSkTdoes0QiNANJ5xzaHuV/Jp3MHZTTI96zOyF2fnj7F6
 P+jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aQucm1+1
Subject: [Buildroot] [PATCH] dtui: new package
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

DTUI is a small TUI for introspecting the state of the system/session
D-Bus. It shows current services and lets you introspect objects and
their interfaces.

This package is built with Rust/Cargo.

Upstream: https://github.com/Troels51/dtui
License: MIT
Signed-off-by: Christopher Obbard <obbardc@gmail.com>
---
 package/Config.in      |  1 +
 package/dtui/Config.in | 10 ++++++++++
 package/dtui/dtui.hash |  3 +++
 package/dtui/dtui.mk   | 15 +++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 83414b3e0b..ae3ecded73 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2838,6 +2838,7 @@ menu "System tools"
 	source "package/docker-credential-acr-env/Config.in"
 	source "package/docker-credential-gcr/Config.in"
 	source "package/docker-engine/Config.in"
+	source "package/dtui/Config.in"
 	source "package/earlyoom/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
diff --git a/package/dtui/Config.in b/package/dtui/Config.in
new file mode 100644
index 0000000000..fc02927709
--- /dev/null
+++ b/package/dtui/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_DTUI
+	bool "dtui"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  Small TUI for introspecting the state of the system/session
+	  D-Bus. It shows current services and lets you introspect
+	  objects and their interfaces.
+
+	  https://github.com/Troels51/dtui
diff --git a/package/dtui/dtui.hash b/package/dtui/dtui.hash
new file mode 100644
index 0000000000..7f8a991286
--- /dev/null
+++ b/package/dtui/dtui.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  581935f8f7763dd5de548583d5eb261983ee3f57c693c034856a0ac9bce2bbd8  dtui-3.0.1.tar.gz
+sha256  b7b3cd0d92fc6638f0a7bd2306d715c747d040c6d851ed821a45c5538663e57a  LICENSE
diff --git a/package/dtui/dtui.mk b/package/dtui/dtui.mk
new file mode 100644
index 0000000000..02915ba0ed
--- /dev/null
+++ b/package/dtui/dtui.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# dtui
+#
+################################################################################
+
+DTUI_VERSION = 3.0.1
+DTUI_SITE = $(call github,Troels51,dtui,v$(DTUI_VERSION))
+
+DTUI_LICENSE = MIT
+DTUI_LICENSE_FILES = LICENSE
+
+DTUI_CARGO_BIN = dtui
+
+$(eval $(cargo-package))

---
base-commit: 08d71521d3da98939ce29dc0c673a21c8dc9277f
change-id: 20251214-wip-obbardc-add-package-dtui-f2a5c8279ed2

Best regards,
-- 
Christopher Obbard <obbardc@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
