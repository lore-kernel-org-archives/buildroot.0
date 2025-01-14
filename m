Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B99C02183
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 07:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97FA781DCB;
	Tue, 14 Jan 2025 07:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0DLKKlNxWGk; Tue, 14 Jan 2025 07:30:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A606381DF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A606381DF9;
	Tue, 14 Jan 2025 07:30:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 896EEB89
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6604C40A1D
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPNDm0-AsdZx for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 07:30:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 48E894017B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48E894017B
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48E894017B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 07:30:25 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d7e527becaso8580538a12.3
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 23:30:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736839823; x=1737444623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2xpaBbuKu6NPm0g8YmjffAvnCCEG1wMcg69S0TwF2o0=;
 b=pDxC5W0MBJzrt4lVs2JVq4OTiMzFTY0lvYgQQBBtAo9y7hsnR7zVihCK0OnIlnxJcv
 TKuSiwgxqcPnYYf40UiQoVqZv449Xw7OLJWuBoBBZhSOmDC4QYjkl1uaKwu3QjKf0VAV
 eUpBpgCgiTAJcEIVZpsnyycu3y8jz9ycAQL4ko6riwcJ/HTN7QeMjOTUl8s9zrETaT85
 3mQStYv0o8QK8u2UKqNqk99M6MmGQKQevr/4SAk7h3x3EDXDenKK+ZwV7vTKtwJYwCyT
 sPGM+aEzxOzhAgo76VsTKW7xhw4K+KrsI/cwS6/pSc+tvk7f9GlM6uRAvv7tfigLCBIJ
 WCiA==
X-Gm-Message-State: AOJu0Yyr+uiyKMFSAwCfjOV3ry0mWNuFuWhJoj/e5ejmPdt4e9LIaa+t
 DNXVL7PTUZnbnQDovnwX8ZDdpHbL8DYOkIDIP30G0iCNrC2IcTgJuFbaAQ==
X-Gm-Gg: ASbGncssNhqMvpIP9HGBJJ8zoUZm/6U0bk0qiETVVPV16ASxzls8iBRzzAFWzZF6DKD
 8xpVlUtORKkVDjMrMpQNX75WAU4QB4on8n09Aq8wEzyHnYnUuPnZ5c9kmDnKEyGYPBkAonMzalS
 EBveIWFHKDQoHZ5ZgP10led4oIMy4Qxb2alJzXEKQ5CTEXmI2xZT9mw5bs1WDb/U54tknI0+3VY
 LH2FX9IJlZQACvN3udHKS2gQdTyObE2OpDNui7lwofcW30vQLyZ3L6YpP3wFspD1eiEs8HX3Q==
X-Google-Smtp-Source: AGHT+IEKDnlXnVUd2GR5EzFWH+xL1DtMldiel+xltApKn1C73faaRxnEtvf+9b/H8VDP3Ou4jukHbA==
X-Received: by 2002:a05:6402:26cf:b0:5d4:55e:f99e with SMTP id
 4fb4d7f45d1cf-5d972e1d7dfmr59122495a12.18.1736839822803; 
 Mon, 13 Jan 2025 23:30:22 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99046d822sm5618777a12.56.2025.01.13.23.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 23:30:22 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jan 2025 08:29:46 +0100
Message-Id: <20250114072947.284965-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250114072947.284965-1-heiko.thiery@gmail.com>
References: <20250114072947.284965-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736839823; x=1737444623; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2xpaBbuKu6NPm0g8YmjffAvnCCEG1wMcg69S0TwF2o0=;
 b=jgo1Hy/VLFormNUKWJvzASs9GhS+mwm0qkIEZ5brqK4pd+RvmdUeAecPVKgGn0xrBV
 tIGp6SxlRY8in7+k+3bZ5sXHKtqTfS32iOBdpDHLtR7IVhQQJFsazmGp0oKaBtngLwDD
 92qwH/PPZH/bAK5BcajW5xpRgrR6q1wfovAZN07Tg/aBfh1l/rsmGWP/kGViOAQNTAKF
 VXxz8ADsEAMiQS5CZhNVKONnxrklWlD9AoclTfoQUvQpBboA5SlMBhWf42C83y63j1TN
 +q3F4/6dg2SyMiyqoCvSu0YsGJ8K4DNhZca+/Qo58YCtXSeLszc5do8HjJKu1xi5+UOe
 sK9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jgo1Hy/V
Subject: [Buildroot] [PATCH v5 3/9] package/sysrepo: fix shellcheck warnings
 of init script
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

Remove entry from .checkpackageignore

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

v4:
    - new commit that only contains sysv init shellcheck warning fixes

 .checkpackageignore                | 1 -
 package/sysrepo/S51sysrepo-plugind | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0dcca5ebc7..6b6fa4689d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1213,7 +1213,6 @@ package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
 package/suricata/S99suricata Shellcheck
 package/swupdate/swupdate.sh Shellcheck
 package/sylpheed/0001-harden-link-checker-before-accepting-click.patch lib_patch.Upstream
-package/sysrepo/S51sysrepo-plugind Shellcheck lib_sysv.Indent
 package/sysvinit/0001-Makefile-disable-stack-protector-strong.patch lib_patch.Upstream
 package/tar/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch lib_patch.Upstream
 package/targetcli-fb/S50target Shellcheck lib_sysv.Variables
diff --git a/package/sysrepo/S51sysrepo-plugind b/package/sysrepo/S51sysrepo-plugind
index 60ea3ba7a9..4bee6c1705 100644
--- a/package/sysrepo/S51sysrepo-plugind
+++ b/package/sysrepo/S51sysrepo-plugind
@@ -10,6 +10,7 @@ SYSREPO_PLUGIND_ARGS=""
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -x "$EXECUTABLE" \
 		-- $SYSREPO_PLUGIND_ARGS
 	status=$?
@@ -45,7 +46,7 @@ reload() {
 }
 
 case "$1" in
-    start|stop|restart|reload)
+	start|stop|restart|reload)
 		"$1";;
 	*)
 		echo "Usage: $0 {start|stop|restart|reload}"
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
