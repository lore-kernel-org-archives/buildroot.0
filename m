Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36CBC02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7FF340833;
	Fri, 17 Jan 2025 10:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQ-JvKJmLa3p; Fri, 17 Jan 2025 10:54:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B1F40B3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9B1F40B3F;
	Fri, 17 Jan 2025 10:54:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 168001EDA
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E69D40173
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5BM_fYzzSle for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:54:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 362594013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 362594013C
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 362594013C
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:54:22 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so17545991fa.1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111260; x=1737716060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwyFKca97uYalQbLjtD0EvE8GkvGk25bq0RH/MvgZsM=;
 b=aCzTNti0rElURK8Vqv1soD6QGQIbpt6auAfA/B9ayXyqLe30yViChweiT0xFKGwLc/
 lyQJoWx/2IXlRR7U9Q6rI3Pg0jzD4w+wZ5Uuaf/OABdM1wBkKKJBgixtQmIx2/vnbyDq
 0NtOtoTl7R7t+YAa+sMD9KVMZSrd7ltsHItO09H0NPCmuWCzrKgCTJmMlMAKvXE0kCJE
 ZK31+8+1SPkAZSD+miYJFGnm3zFvoD1jLUL78RodDuoOceAlFgWNihwiJ6g0pALBB26D
 RPp2Obz245iBi+XPBex++JH5LjFxb1Do8TbTq9/DGRxs9598cs3JEf7h/9f8Ggp66eB/
 xO4g==
X-Gm-Message-State: AOJu0YybgHuS+8cKTK8nYB/vOWsTXUffasaCONtm/tfZsIyPrzWx2z7L
 sBLRQifY2NxyovYdFqPLqvrGfImNh1uwEEidm9u+El8YUl6FNM0X/llcGg==
X-Gm-Gg: ASbGnct+8g+ykDBPIPErA7iUzI+P/r1gBstF1YVhP5t21iyQynybazEOI29/pPr7ze9
 g/JCyhHuHq4L280mn/T6bFnOHhThLPcbNmrdINcJO3NAhvKM/rkl0to3Kltr2FpaXB6IolXvvS8
 /aLvtcoOV4YQvjAGGBAZSwRL0QBuPAaAw4TwFzVEXR79rBulWuDZIoHgmKmA5YlS9T/Gzdz18wb
 +DFvczaxqjZug3WomNGXoiiECil8Ao6SGfnGwAm+FYzSmrpn0EVCsGnkCuSQy9R3Dv2DOOlvwZt
 Fdw3yzsM+1o=
X-Google-Smtp-Source: AGHT+IGCuuJd+zUHxtJVJVVMZrLfJp5JSkZQTsp9pqsjZWNa9YFaSQptN3Rzk4FD9Mhej4vcCq08/w==
X-Received: by 2002:ac2:494f:0:b0:542:28e3:2155 with SMTP id
 2adb3069b0e04-5439c22a9aemr496954e87.6.1737111259861; 
 Fri, 17 Jan 2025 02:54:19 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d91sm307474e87.237.2025.01.17.02.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:54:18 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:53:31 +0100
Message-ID: <20250117105354.618220-8-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117105354.618220-1-roykollensvendsen@gmail.com>
References: <20250117105354.618220-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111260; x=1737716060; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwyFKca97uYalQbLjtD0EvE8GkvGk25bq0RH/MvgZsM=;
 b=FyDyGXHMmzAG0rJUWvIsibclDqzdTuROPG+Gpi4hMbW8vv2zgGlbikl5sPIxvnh7lr
 nUR4Bk4s/Ouh0TDSAQe/bKwcLM353MqAFBjX016rsh/cNBHDlgET+q9pVcuK5vZGhe9o
 gsJQP46map3sZjNMrhuRXowqOBoe5imvHo6At3Xp+9s6vy3dA4Usk9fz6k9qYzWHzY5R
 nPV+8R+GJIKwqMezLFSP5QIE6sBKcwe3BWVGfUHI6eYK3UhCqwRkjNFX6z+Nl0ppCp66
 LlLnRFuA5HTZEMvROvsdvS36nTaJWpnp3HbBp5KDo6Bq+e8vNQeOMblBIDiGbFyHsfGM
 mN1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FyDyGXHM
Subject: [Buildroot] [PATCH 08/19] package/qt6/qt6multimedia: sort conf-opts
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/qt6multimedia.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 31c3405b5b..919b6990cb 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -35,9 +35,9 @@ QT6MULTIMEDIA_LICENSE_FILES = \
 	src/3rdparty/pffft/LICENSE
 
 QT6MULTIMEDIA_CONF_OPTS = \
-	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF \
+	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DFEATURE_alsa=OFF \
 	-DFEATURE_ffmpeg=OFF \
 	-DFEATURE_gstreamer=OFF \
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
