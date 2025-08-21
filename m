Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DB6CA0EFC
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 16:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E7BC418DD;
	Thu, 21 Aug 2025 16:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMhgPmrksHCa; Thu, 21 Aug 2025 16:48:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AEE6418C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AEE6418C6;
	Thu, 21 Aug 2025 16:48:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E27F1C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 16:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FF5D84482
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 16:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1tYu3ejJnxN for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 16:48:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 306978445C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 306978445C
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 306978445C
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 16:48:34 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45b49f7aaf5so7606695e9.2
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 09:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755794912; x=1756399712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s+VbmeUOwnfXMslZ/No63RHLCvJiV4NERDCRGIGyX6I=;
 b=HR4wOfTmSNJMj2sEVVdkupYOMtSbii7efTCQAtdsS2MEfBdfOLixyEOsohjUU5d5h/
 s3HOjF6O32qvAVCDvatq6oIt86vrPD9//mgbdKCjNhOl7cS4aBCAlGu0WpeAuiGOLzao
 s74a+09Gm1FpDoMZ0AJ1XSxD6Qz3Fcj8Wg6hpjSTSdvZMmWi2UVdeK2huPUzgtgGXoUh
 KCwWG+rsmSZ/DUaoaqkp7GoZKU/hyKVDn+1tKb5I0PiNRkrP6By8VffWxONAZF6Jived
 0ryc2CQ5Ofp744v/2Oc7xa5DGnpX0joxakEGdoeciBwwprN0IyAtRlRAXsdG5nOdpFH4
 wtOQ==
X-Gm-Message-State: AOJu0YzpDY3CiDHfCeCmNyDHmKmpGx2QbZQZqStOMnN4X6tiVDBzbDku
 JUrbgLTBZbrBQf0MnS1UB6CdslSQmMyR7s54Uj6Dp0ylHWg0baT2Ponj3xqf5GKU
X-Gm-Gg: ASbGncsa3L/vG0NGJUy9TmkU9VEAfKTWE95X92pAMDsvFo4XOWEtojYbBLue5xo0JzA
 Dxq1p02xBJ2HuFOdQR+dMIPTunzAo9ibX/2s/nc9GcPEjiRy44/UFF0tx/XdAkiQU319BHgFafy
 /+fkCR8fpXrmrZ002Yoh1IskVjU+F6IFPDfkDlz5WesMjAaNLKFWFAn/pTFkrfaGXopf9qt0SO+
 Qr9B31Hso0zCvzuncLXy60XxkH4wwEgnDSc0fcULL67HCeOE0KySToVaN+z4FpaY4pTMgchTJkb
 H0SLjGusl17X7C1pllxRfdjr4YfUSgDrEuxyp6/wQS+2Po68pT2A4SVDamFqhhgckxWqTToVS4J
 6HzEmBJbwna4Ul9wlUu5AC17/UgjLVWgeLH8M5qw2BPvv9A==
X-Google-Smtp-Source: AGHT+IEyk6lLUQt74mHn6nBhUsDFLAQ95GJ3bkm4to1X/ZuS5omhC+CTY4lfW1swYXbfDR/peUkyzw==
X-Received: by 2002:a05:600c:198e:b0:456:475b:7af6 with SMTP id
 5b1f17b1804b1-45b4d7cc917mr30244085e9.7.1755794911783; 
 Thu, 21 Aug 2025 09:48:31 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50dd02ebsm3718285e9.9.2025.08.21.09.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 09:48:31 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 21 Aug 2025 18:48:28 +0200
Message-Id: <20250821164828.3540002-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755794912; x=1756399712; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s+VbmeUOwnfXMslZ/No63RHLCvJiV4NERDCRGIGyX6I=;
 b=fn4hmPwEhZBZ3+xKWng0XOHhuQ51aSv3yMnqQAX2TQGrlVyG5zH8tlMzlhY27B8o2I
 YlSW/Qrl6aOmH59mmmujVcism+nQM3A6+fSRCqY0UzEgxaA5blEvhJLzTaK2LoI1eLRq
 Klio9LM8/kfH5k7fEzQolS5I7aZLKkZGo/0zF4nwTkzB91mr5ifFDgyPho1fQ+fIdtNZ
 oUvW/bz9SgsQk3NsMp8wACG4ZOENdaN4kiwW6wjSuitW2QDpD8Eb3NXPdaUdvzYGl7Jj
 qwyTyaBUOaUo4VUdFE7tGCFbfsGCtKgO/+q9q6g9aL1GfzLNFjUhxUpn+CFNH0Ldbaoq
 UG8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fn4hmPwE
Subject: [Buildroot] [PATCH] package/wcurl: new package
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
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/wcurl/Config.in  |  8 ++++++++
 package/wcurl/wcurl.hash |  3 +++
 package/wcurl/wcurl.mk   | 17 +++++++++++++++++
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
index 0000000000..da7a3922f5
--- /dev/null
+++ b/package/wcurl/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_WCURL
+	bool "wcurl"
+	depends on BR2_PACKAGE_LIBCURL_CURL
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
index 0000000000..98d15a1a6b
--- /dev/null
+++ b/package/wcurl/wcurl.mk
@@ -0,0 +1,17 @@
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
+WCURL_DEPENDENCIES = libcurl
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
