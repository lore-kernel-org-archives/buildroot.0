Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6F4D1D482
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 17:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6217960A7F;
	Thu,  8 Jan 2026 17:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbjH73NY6UfN; Thu,  8 Jan 2026 17:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 791DB60DC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767892794;
	bh=2tqdSm0F1AEM7UJvHhvTKoTfxWD1JnXgXhUJheOyals=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Pu9vJhc/4eSp0Sr/tSuAwz5SEn/hW9NIKA4Rwu6Ni/zF6SA/Wi5bP97iYkda7uRZV
	 s/n4NdYp7NSTAVP4YGOV7jBcL3XiVkvMJfBq80ujRDy/W7Z1n+vb0qnbV0wOZ0R6q9
	 +es8nYrDvaTVbxrqQqUgVO3LR+r2h0nI3/Kdup35MC/jhMdM6wNY9Uh+r8ZBSkAStl
	 HnVWLjUkCtUXxxKOkfRqtCXWLhg4YR2sECCbdJV67O5q3N7TuSWLaRGtgww0BOyloh
	 YlCP7B7dVfPX70xtWJ2sPxQlX4zlTuhQf1qvQwSfYIWbBJpEPt1BlDYzlHMP7WZ6Da
	 n/r9OUEwYJh9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 791DB60DC7;
	Thu,  8 Jan 2026 17:19:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01D7D237
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 17:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B327C828A9
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 17:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l38_X4jxLFp1 for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 17:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A5F18289B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A5F18289B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A5F18289B
 for <buildroot@busybox.net>; Thu,  8 Jan 2026 17:19:50 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47d3ffa5f33so16765245e9.2
 for <buildroot@busybox.net>; Thu, 08 Jan 2026 09:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767892788; x=1768497588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dreMKWY/yq32yG17NCJ3zNyOxHG1wJ+a7jcqJGEdfZ8=;
 b=PAzr/yzt/85mWoDT4+R8xU0fenM518VHVWXbh1PADQXIuhy9VgldkS1TpGUNG3d+G0
 ZCw3roy3tuERLslGpMpnHnXL0T2fDGEtl14KXajWk5jN0qAsq6hj2VKNWwvUGvBAFqHe
 Mmhb1FQNnBtg9P49sG6CGaLOdF10PTaudc/r0bgJz9T5SBWTRaAwH/565Tk0LYGTE6Np
 qPRKAP1BmyvH3k3ezNEtZ5QISHzsZrM2lNTIVXzwXBeke9sH7ucf9i6NAvuPeQovS6oP
 nw2YZdKvH2cVuQ7GmjGcGJj/1CsqjOb+cZYs+i748yZZ1yMIx+SMjcTIpqYupiAIUeWN
 nstQ==
X-Gm-Message-State: AOJu0YxJ9IFK04E1Aotr8en0cJsV5gp8UTsKdev7y0OUSBnJbaNCVfBO
 abDS5NPoH+BWnTSJW9gpyrGZPVuewXaYX7tiA787zqkLKvPBM7mHDmEY7TJpA2kT9iEMDzAbD+9
 bqZDjNg==
X-Gm-Gg: AY/fxX5GvSvXuUsSQHuq7bCjCBUfH9br0JGusW9W5RLX9jcqeefvWwu6/mhWtxWyf8G
 +QbCwXAWS1jdSmtY4h4zS/NrCZbq5qeOmfX+6f/58Bp7mA08mlIF71SdxtbeDNXX9i2BxsXvp7n
 qc1hJxiK9XiM3+ngUDmj2bGnwlNJ/nWRXqRM+vbMD0PC0Ynv45BJauRoe3BoxIsQkMfoxkqd3CO
 YhAtcax7rm7KdLQawhJYJr+ZoiCgguMjJzhT4h1hyTGV0aPKDZYWm7FNgnv9EZ84VefPk+l5hYr
 rF2rgY4SPHX/Lq+byYfaW0wjGxww8jr1lh5RBL/szDCo/gavjCSF0WWHw9ryXZJAfSyvZ0Y1T37
 VYN2bUdQc+ARRpe+HPvfPCrjLvLJVxgMZoCVqbuDhBuRhsw8yxO7u4pfx/09YthHy2Tt07ioD9W
 H48fj1q9NZH4YXAfkY6wC4zWg5mBDl3nAJR2Y=
X-Google-Smtp-Source: AGHT+IGcb0lcV67lxQtO2m8ap0GNe/meEDAqHZlS4RoHUX5VNVe75kQl+jYIthS6uUd1ilbOF0s+1g==
X-Received: by 2002:a05:600c:a314:b0:479:3876:22a8 with SMTP id
 5b1f17b1804b1-47d84b2d285mr79402415e9.16.1767892788371; 
 Thu, 08 Jan 2026 09:19:48 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f653c78sm172329995e9.11.2026.01.08.09.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 09:19:48 -0800 (PST)
To: buildroot@busybox.net
Date: Thu,  8 Jan 2026 18:19:27 +0100
Message-ID: <20260108171928.669166-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108171928.669166-1-francois.perrad@gadz.org>
References: <20260108171928.669166-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767892788; x=1768497588; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dreMKWY/yq32yG17NCJ3zNyOxHG1wJ+a7jcqJGEdfZ8=;
 b=ecFtOsGBOAAaDJZlGDDFtxmj5BszFZ/6qVcrL0koGJvXZT1oJvsiscX0Ku1U8CC/rY
 KLsijuq0HrNRmIwD/4xkAQB2veiGSgQw6GlhTU1zpsqVmeS3kXP9go90UTMb58Z1xi64
 IICsHw9BKc8//kgyYQwY+bySJJdmoGVKBKjCAjTP+rTv/QynkupYUonBXjzQR/EsCDRX
 9g1AKpdUnPuioXPv1a2dBAnPsG9ORXp86J9SZrMZS0DJ7TEjpcvhVJ3KJIHy8rGv2AdM
 1wNr8996Km/9Wh/n/iv9wQv6jEQsT6iENQIeUJMFVeBJDvNxadUTt4c6DJWBpxJB6NgX
 fPhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=ecFtOsGB
Subject: [Buildroot] [PATCH v2 2/3] package/jmp: new host package
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                                    |  1 +
 package/Config.in.host                        |  1 +
 ...er-command-with-BR-toolchain-wrapper.patch | 27 +++++++++++++++++++
 package/jpm/Config.in.host                    |  7 +++++
 package/jpm/jpm.hash                          |  3 +++
 package/jpm/jpm.mk                            | 23 ++++++++++++++++
 6 files changed, 62 insertions(+)
 create mode 100644 package/jpm/0001-fix-linker-command-with-BR-toolchain-wrapper.patch
 create mode 100644 package/jpm/Config.in.host
 create mode 100644 package/jpm/jpm.hash
 create mode 100644 package/jpm/jpm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a4b205231..b538465f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1167,6 +1167,7 @@ F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
 F:	package/janet/
+F:	package/jpm/
 F:	package/libtomcrypt/
 F:	package/libtommath/
 F:	package/linenoise/
diff --git a/package/Config.in.host b/package/Config.in.host
index f76d0ce36..c5a7ea4b2 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -56,6 +56,7 @@ menu "Host utilities"
 	source "package/imx-mkimage/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jh71xx-tools/Config.in.host"
+	source "package/jpm/Config.in.host"
 	source "package/jq/Config.in.host"
 	source "package/jsmin/Config.in.host"
 	source "package/kmod/Config.in.host"
diff --git a/package/jpm/0001-fix-linker-command-with-BR-toolchain-wrapper.patch b/package/jpm/0001-fix-linker-command-with-BR-toolchain-wrapper.patch
new file mode 100644
index 000000000..4569a469d
--- /dev/null
+++ b/package/jpm/0001-fix-linker-command-with-BR-toolchain-wrapper.patch
@@ -0,0 +1,27 @@
+From 33982bbf739a3a4eb70cf18a0575d5106324873a Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Mon, 20 Oct 2025 14:57:25 +0200
+Subject: [PATCH] fix linker command with BR toolchain-wrapper
+
+Upstream: N/A specific for Buildroot build
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ jpm/cc.janet | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/jpm/cc.janet b/jpm/cc.janet
+index c5abdac..4ebb25c 100644
+--- a/jpm/cc.janet
++++ b/jpm/cc.janet
+@@ -110,7 +110,7 @@
+         (if (dyn :is-msvc)
+           (clexe-shell linker ;ldflags (string "/OUT:" target) ;objects
+                  (string (dyn:headerpath) "/janet.lib") ;dep-importlibs ;lflags)
+-          (shell linker ;cflags ;ldflags `-o` target ;objects ;lflags))))
++          (shell linker ;lflags `-o` target ;objects))))
+ 
+ (defn archive-c
+   "Link object files together to make a static library."
+-- 
+2.43.0
+
diff --git a/package/jpm/Config.in.host b/package/jpm/Config.in.host
new file mode 100644
index 000000000..357224522
--- /dev/null
+++ b/package/jpm/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_JPM
+	bool "host jpm"
+	help
+	  JPM is the Janet Project Manager tool. It is a companion of
+	  the Janet language (a Dynamic Lisp dialect).
+
+	  https://github.com/janet-lang/jpm
diff --git a/package/jpm/jpm.hash b/package/jpm/jpm.hash
new file mode 100644
index 000000000..c8259737f
--- /dev/null
+++ b/package/jpm/jpm.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  337c40d9b8c087b920202287b375c2962447218e8e127ce3a5a12e6e47ac6f16  jpm-1.1.0.tar.gz
+sha256  e2d2ae8360d95386af751ac7d1a3da36ea8ceb230e5f0eba7eb762547b1c58c9  LICENSE
diff --git a/package/jpm/jpm.mk b/package/jpm/jpm.mk
new file mode 100644
index 000000000..ca54be637
--- /dev/null
+++ b/package/jpm/jpm.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# jpm
+#
+################################################################################
+
+JPM_VERSION = 1.1.0
+JPM_SITE = $(call github,janet-lang,jpm,v$(JPM_VERSION))
+JPM_LICENSE = MIT
+JPM_LICENSE_FILES = LICENSE
+
+HOST_JPM_DEPENDENCIES = host-janet
+
+define HOST_JPM_INSTALL_CMDS
+	(cd $(@D); \
+		PREFIX=$(HOST_DIR) \
+		JANET_BINPATH=$(HOST_DIR)/bin \
+		JANET_MODPATH=$(HOST_DIR)/lib/janet \
+		JANET_MANPATH=$(HOST_DIR)/share/man/man1 \
+		$(HOST_DIR)/bin/janet bootstrap.janet);
+endef
+
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
