Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04A1E77198
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 13:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C59E80A98;
	Mon,  6 Jan 2025 13:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4CNpcPOrYuP; Mon,  6 Jan 2025 13:42:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61729808A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61729808A2;
	Mon,  6 Jan 2025 13:42:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CFDD9DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB2BF6072C
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FX23fDVK4I0y for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 13:42:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0461960093
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0461960093
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0461960093
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:49 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso2676406466b.0
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 05:42:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736170967; x=1736775767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=thUJ7FXWsrGl3QH//i8zGckbEzhMHdwCSfel/Zi0anM=;
 b=Pxe89kS/T7hFsRWBmNbGXfmJJpjZWjnas6+fXGPejdkG2gYD6lwbIcZmF9rFftnEAz
 81M1+sRCryvvM5LNfv6tRRQf/MEamx7SGAwlraTJVtwCfEqUHhCwSz3dJ65Wks4m5gYD
 U/V1sHG6l5muYYRm/Qa9LiPC5JS0gyRanC1Mz+k/ExmKxAaDQrDYkbKi6V5kj10eTeHF
 AUhv4WeO2K54ZDBp+5EkPZnhOCSUzzqVUENmpVDOzheWX5DuRN2OePjLAKtDeoyxB1vR
 htSkB37aEnSXSBU8pBetkXY+TwsEJvIDtFfkLuz20m0b8eOA8XyiIw92DRkX9gIzoJqi
 z5NA==
X-Gm-Message-State: AOJu0YwdVNEmWr1dWzykIUk5Ml+O4tRnZxeazVPMo+3riUhLmvL110EO
 CfEYBs4Huv0xH5fV7NOevlYQCqSbNPQJFmfXnDLy6Kh6ulmi9XSn7uNBrQ==
X-Gm-Gg: ASbGncsvCElldgp2v8edCoptVcauy2se9yd+Ph4PViu66J1+IJu3HRYMO4fjf1xr+Ab
 MxRUaptMHYhgLjiulcoH4ATuGFV1v4Lo3zoAMgRTJN8MKqKJCYsra1Aar9MqwL/IVcs3wH20pq0
 zxIW9WyY1o1rCk06Z9MbdA+rhsK9PqGhVf4rE1mmfPZ6HiuL/4KjykiBmev2LluqSKzPCEko8rF
 edqIiEz4lU84J3UAIloGgkwpztN6VUN+h7f5WtJ/Hgs3mr+VGz4xGBDu2esKhQnVDBho8eBBQ==
X-Google-Smtp-Source: AGHT+IGwTy2LT7Bi3sCeWZesXGGNJ69S3QcKRJ8EYWVOOpOjwywzFHU/o6VbyQ1HstgVPWHm1X7wZQ==
X-Received: by 2002:a17:906:f5a6:b0:aae:b259:ef6c with SMTP id
 a640c23a62f3a-aaeb259f285mr4785102566b.0.1736170966834; 
 Mon, 06 Jan 2025 05:42:46 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae74e4sm2243847766b.91.2025.01.06.05.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 05:42:45 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  6 Jan 2025 14:42:16 +0100
Message-Id: <20250106134219.1914954-5-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250106134219.1914954-1-heiko.thiery@gmail.com>
References: <20250106134219.1914954-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736170967; x=1736775767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=thUJ7FXWsrGl3QH//i8zGckbEzhMHdwCSfel/Zi0anM=;
 b=hbVU4qGDWFZcH/DoiA5IlBG3n9/7PwSNijcZXFGUekY0eltTUWBI45AxNgNH7VsuM/
 OkEA8VKztisQgnjtKJwCrQrVDaiSI0ncvWgRregckWx0duWVOITIHk9JxezNw/L6xpkN
 KlUUs/kqn8la3sbzGaD78/d6j0gGLP0wBzxS/a3+JtZmQqK6eHH709ir5S48YeUMYClW
 1lKyZOMh+OYNHwOETV+NIxrjbGRMwrrfqLKpt5eakCgJYZ28oIOam8vLjw+3LHMJGg75
 fbB6qd0l+fNW2S27smmK6OUr7B0yvMq1RhGSphL5nM/RD/G6ez5zy2Gb/ODEjwavLx1P
 0L1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hbVU4qGD
Subject: [Buildroot] [PATCH v4 4/9] package/sysrepo: fix shellcheck warnings
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
