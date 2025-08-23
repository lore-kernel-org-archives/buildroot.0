Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13638CA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 10:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABB32612F5;
	Sat, 23 Aug 2025 10:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-QMa-cYqtxq; Sat, 23 Aug 2025 10:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A85DD612FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A85DD612FA;
	Sat, 23 Aug 2025 10:38:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C633B19C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 10:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6F1F83CB1
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 10:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PB77FXS-ntj for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 10:38:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C81683BF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C81683BF8
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C81683BF8
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 10:38:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3c6df24f128so574571f8f.3
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 03:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755945530; x=1756550330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n9B1i7og5/wQ18HkttA0zNZSE3cymOe7Z1dp7zAkgpg=;
 b=QCM7xzUS/GcBuEYWq/MeHTOUUftAI38UqqXdis3dLGVo+4As+wg/O5rk6dKrmArCRD
 0huvjQSHS/UUIgA3ALgEkcoAHG58rbizZoNR9EvurcvYAX8lp3+Pgm9zaivtJPYNMLi+
 GsAmv+HGZAVgg/8lXVmlmewWoJizXjhTzMO7S9vFKeKMCYjO1ADOPFHao20k/N0vWNoJ
 njTMyRwr7c4DC7EkbvddmmcPXmo8g55gIPUdcRlq0IyqZ9mNjVbUsO2bnlayB2iwD5uh
 vmH2O9GK8hsIh7CuoFaMBq7w0I4/7EkL3W0p/iRGnRMMT2XvjZ85T7dr97rcLw/Kee0h
 1Hqg==
X-Gm-Message-State: AOJu0YxHPAcfeg7txOXmFwoPmONTlzVCmuzHwKC53MNvKtlbHpWOD8jI
 0BCh0gJrCcaVlqDkRCnIMPF3i4CuNmQ7JxVcWT+y/dneJqHWxnKzuxhuSN++8Zuc
X-Gm-Gg: ASbGncuwekS+Hj74E2sQDWQsSC1Vepo7RnKEx1IK/7wv5xr0nwYYS9MuK5cwMfAdd54
 bhSbXNeQge4IqsvNw6rQFs12CzJv8e4HkDamG5vjjD/fGzvGHw/j6Z6WGo/977EfjnuauHXEWhX
 6aRd1oQR7y0rrCNDeEhSYOGFnVxSU8mUroLQu2NBz/kl21n7fQyWFtt5KLN74+InhSYKEZRWI3G
 vLTNKbvC5tDNHy6jB0yOtX4LLnqVz3Vz5dA2ay/0jPCIuqyKn/yT5RX+DBvDymA3p60gmoj8mhA
 KTYFvBEsPI4eJO5napmMcrN/jglNtaSKQdAYTflacDKDNS/JWVMBk+64/5qfLUoZfE/6ZvWcvaK
 F202AZrD+LGASIIYITYQqHDLX+HBppAb0QI7RTdenLsXCbA==
X-Google-Smtp-Source: AGHT+IFWznnkEGXfZRLFqnrg/2xNAizeHB9pk04CvE/fkNzOwG1l+PgzsfcScuD9KAqls0yQs0aeZQ==
X-Received: by 2002:a5d:5f83:0:b0:3b7:81a6:45c1 with SMTP id
 ffacd0b85a97d-3c5dac168ddmr4141979f8f.6.1755945530041; 
 Sat, 23 Aug 2025 03:38:50 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711abd15asm3126047f8f.56.2025.08.23.03.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 03:38:49 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 23 Aug 2025 12:38:47 +0200
Message-Id: <20250823103847.3888908-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755945530; x=1756550330; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n9B1i7og5/wQ18HkttA0zNZSE3cymOe7Z1dp7zAkgpg=;
 b=J6Xcr9QWHE68G+s2Jc1xmTKRhtTfeoh7jW11O+G4QTowC8R9LMB/3x7xibUW5Uvxa/
 VudQ2UJcRGVcnBDDU+Oydxy01rf8pn2EFgP/gD2HzXDuZ9dx9tw7mGp0OCzb8GQWe0jZ
 HpReH9c+pWo/SXbzQGaB/YB5lk+hUJmCt1P2Dp9JAgZWURu+JF1XJxXA96GW9jWeHJjw
 G5kP48GVZLfrM2bbdTODyvHQC5wnCZuhUu7lBUzZPbIyryd7KBQ5ZTPwlthhyVPg27V/
 Rch6uvPmzGTsJ+FRoD6NOS6lsskfri4j9k4CfAbgzs8SWlQTo/OIIaz0lRp8CGMhUSrM
 4JdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=J6Xcr9QW
Subject: [Buildroot] [PATCH v3] package/wcurl: new package
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

wcurl is a command line tool which lets you download URLs without having to
remember any parameters.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
v1->v2:
Fix runtime dependencies (Baruch Siach)
v2->v3:
Fix select instead of depends (Baruch Siach)

 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/wcurl/Config.in  |  9 +++++++++
 package/wcurl/wcurl.hash |  3 +++
 package/wcurl/wcurl.mk   | 16 ++++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/wcurl/Config.in
 create mode 100644 package/wcurl/wcurl.hash
 create mode 100644 package/wcurl/wcurl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3efad36d70..3a3d263c8f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -242,6 +242,7 @@ F:	package/sam-ba/
 F:	package/sshguard/
 F:	package/sunwait/
 F:	package/sysdig/
+F:	package/wcurl/
 
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
diff --git a/package/Config.in b/package/Config.in
index 137f74ed82..61463e7820 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2724,6 +2724,7 @@ endif
 	source "package/vsftpd/Config.in"
 	source "package/vtun/Config.in"
 	source "package/wavemon/Config.in"
+	source "package/wcurl/Config.in"
 	source "package/wget/Config.in"
 	source "package/whois/Config.in"
 	source "package/wireguard-linux-compat/Config.in"
diff --git a/package/wcurl/Config.in b/package/wcurl/Config.in
new file mode 100644
index 0000000000..c2aca8bb71
--- /dev/null
+++ b/package/wcurl/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_WCURL
+	bool "wcurl"
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBCURL_CURL
+	help
+	  wcurl is a small command-line tool that wraps curl for easier use
+	  when downloading files from the web.
+
+	  https://curl.se/wcurl/
diff --git a/package/wcurl/wcurl.hash b/package/wcurl/wcurl.hash
new file mode 100644
index 0000000000..b747e99502
--- /dev/null
+++ b/package/wcurl/wcurl.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  a745475f3511090685c4d000a10f4155147b75a8c7781764612a7e8f67bb6d82  wcurl-2025.05.26.tar.gz
+sha256  0127bdd267b1fa65bf5a6c487c907948e0c009aa35a5949c8aed91f779d27810  LICENSE
diff --git a/package/wcurl/wcurl.mk b/package/wcurl/wcurl.mk
new file mode 100644
index 0000000000..8499bd3e1b
--- /dev/null
+++ b/package/wcurl/wcurl.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# wcurl
+#
+################################################################################
+
+WCURL_VERSION = 2025.05.26
+WCURL_SITE = $(call github,curl,wcurl,v$(WCURL_VERSION))
+WCURL_LICENSE = curl
+WCURL_LICENSE_FILES = LICENSE
+
+define FOO_INSTALL_TARGET_CMDS
+	 $(INSTALL) -D -m 0755 $(@D)/wcurl $(TARGET_DIR)/usr/bin
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
