Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147B2C02183
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 07:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BDAE41251;
	Tue, 14 Jan 2025 07:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZkJIRH3aNuw; Tue, 14 Jan 2025 07:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 504E741231
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 504E741231;
	Tue, 14 Jan 2025 07:30:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BB4CB8B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A4FF41224
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkTV6pxIxu2E for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 07:30:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66B86411EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66B86411EC
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66B86411EC
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:33 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d3bdccba49so8774961a12.1
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 23:30:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736839831; x=1737444631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0e9EOCjsFxwDCfyoVTdgMK9843uTyb6eKhE8NUQCQ+g=;
 b=GKdvo5xx3hCqkclFPDzEMp0mqWoxCUe1FZ0gMvpo68hRx12PKCufrDbq+rkPiVVmuV
 vYx0W8gKJOGeEckO1CZZPkGr68HApmvzrwL3kUsB+dIGYpx121G/faFfgWdDB+rrX/PE
 +mlVddaMsLNf/PsK5OwAZHIV6j7L8fKDYTySS0uHRHdJQwl1pPS/g681sbz+Uoc/bw1j
 VMasGnCvFxvRxJZap8SxmOtgr+TRvDlZLh6P+wRY1fOXRqxDiZvKsrsUXoNHyoOxkvz+
 yCXdLPJuztB3XQB6Y6y+i3HioIwFCnJSvxjYMudyBzdR/qDUkpBwNInRgLaB/bG75w1o
 05xg==
X-Gm-Message-State: AOJu0Yx0CT6au5n+NrA/jLBYDoY6OvOYgoO2ivRCZM+25O9ltWJqIDrQ
 iGqHt1fDfbeF2AB4Ky0LMPRFHbmJN/EJaDBD8i6q3IleXxwG4QtnksHR2A==
X-Gm-Gg: ASbGncvd5m50jpj3MaB3ecaQHym6NkW9SHj0BlqOzbtQzGWFg8V0VmYtJEQEN/ryOCf
 4R0yejRE5wj+vBjz/dq9sAOn/8/dONtqE9OzStZOnPFYkprEZi0Ir1Sio5zYgwjV//b0T8Lc3QN
 +gu6vA7JOzQNS5J7UGO1pSUpbjEjgZNizt0Yu/M0TKmiCtHAtvPPPDXZ9YlQuT5OrXSvjZcqCEK
 Mh+Xln5xA7ZtxkD+jjoLN53+BY+lWmKfMeW030ppfIFBerE0DvOe7H1yDfc78DNLhY2alPlZg==
X-Google-Smtp-Source: AGHT+IF9aA5iDGXe+A7JeuX2JrC5SOn8x8njONYfd+W2dNKTt3ll4qD7CELC9/ZZK0FW8pCkQxw3zw==
X-Received: by 2002:a05:6402:27cb:b0:5d9:f362:1686 with SMTP id
 4fb4d7f45d1cf-5d9f3621959mr2159811a12.21.1736839830611; 
 Mon, 13 Jan 2025 23:30:30 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99046d822sm5618777a12.56.2025.01.13.23.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 23:30:29 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2025 08:29:50 +0100
Message-Id: <20250114072947.284965-6-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250114072947.284965-1-heiko.thiery@gmail.com>
References: <20250114072947.284965-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736839831; x=1737444631; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0e9EOCjsFxwDCfyoVTdgMK9843uTyb6eKhE8NUQCQ+g=;
 b=Scs7jHzpNwlVwpQARIlBack+uDvobIFoNrRc5D3Q1nUQaZ0/U2Kdt7veHITY0X4vYX
 dWQdWLah5rp3/tpY7o9KUJve6J/3P8P9r+c3f7hf0EYFfe5Rp3WTkKww++52d4CPCoac
 Inz4sqYCgHF+Vs3nTt4VlHnDVsfc75AD+z8xyW7FeZLLOr77Jgnu65rG9JOODrgCn/8p
 okEc+S0fK7K+9ZTVBJuW+FSi852Wf3xJS/oxJa7GAOgvbX6cZhl+CH3giLF7J9IlkUlw
 crs6lwVThaIPSg9jNU9h58UYeSz9Nzx3/V3V9CSpjShuNx3WwQ/0L7XybZ4HfSmge/Ei
 LlzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Scs7jHzp
Subject: [Buildroot] [PATCH v5 5/9] package/netopeer2: fix shellcheck
 warnings
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

The init script S52netopeer2 has to be renamed to S52netopeer2-server to
match the daemon name. The step to install the init script now uses the
NETOPEER2_PKGDIR variable to reference the directory instead of
explicitly using the "package/netopeer2/" path.

The init script now is removed from the .checkpackageignore file.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v4:
    - new commit that only contains sysv init shellcheck warning fixes

 .checkpackageignore                                     | 1 -
 package/netopeer2/{S52netopeer2 => S52netopeer2-server} | 2 +-
 package/netopeer2/netopeer2.mk                          | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename package/netopeer2/{S52netopeer2 => S52netopeer2-server} (92%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 6b6fa4689d..d2e012d70f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -896,7 +896,6 @@ package/neard/S53neard Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/neardal/0001-lib-neardal.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/netatalk/S50netatalk lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
 package/netcat/0001-signed-bit-counting.patch lib_patch.Sob lib_patch.Upstream
-package/netopeer2/S52netopeer2 Shellcheck lib_sysv.Variables
 package/netperf/0001-src-nettest_omni.c-fix-compilation-with-GCC10.patch lib_patch.Upstream
 package/netplug/0001-makefile-flags.patch lib_patch.Sob lib_patch.Upstream
 package/netplug/0002-add-missing-time-include.patch lib_patch.Upstream
diff --git a/package/netopeer2/S52netopeer2 b/package/netopeer2/S52netopeer2-server
similarity index 92%
rename from package/netopeer2/S52netopeer2
rename to package/netopeer2/S52netopeer2-server
index cadd6b9feb..3fd993b578 100644
--- a/package/netopeer2/S52netopeer2
+++ b/package/netopeer2/S52netopeer2-server
@@ -7,7 +7,7 @@ NETOPEER2_SERVER_ARGS=""
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
-
+	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -p $PIDFILE -x "/usr/sbin/$DAEMON" \
 		-- $NETOPEER2_SERVER_ARGS
 	status=$?
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 47fcd31acd..4853e5d176 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -29,8 +29,8 @@ NETOPEER2_MAKE_ENV = \
 	SYSREPO_SHM_PREFIX=$(NETOPEER2_SYSREPO_SHM_PREFIX)
 
 define NETOPEER2_INSTALL_INIT_SYSV
-	$(INSTALL) -m 755 -D package/netopeer2/S52netopeer2 \
-		$(TARGET_DIR)/etc/init.d/S52netopeer2
+	$(INSTALL) -m 755 -D $(NETOPEER2_PKGDIR)/S52netopeer2-server \
+		$(TARGET_DIR)/etc/init.d/S52netopeer2-server
 endef
 
 # The host sysrepo used to install the netopeer2 modules will leave
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
