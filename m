Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E48C02185
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B018C6FB9C;
	Fri, 17 Jan 2025 10:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVauHBKlPtCx; Fri, 17 Jan 2025 10:50:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2F646FBB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2F646FBB0;
	Fri, 17 Jan 2025 10:50:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F7A894B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C3B16FB8C
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICmWDEQE1d-L for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:50:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B862F6FB9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B862F6FB9C
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B862F6FB9C
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:25 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-540215984f0so2118678e87.1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:50:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111023; x=1737715823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e3Z6+o01USfPg9Ugu2N1k+5xeedMQj+ot4wXvlOaLVE=;
 b=olClW8/HRvXhCfVhoGm8SYoKlpw8usIMFSdqxvJkeSEsO/v3KT0DxF4nJ9kLoAVYkP
 BQQy/Gt6RcxJfgYFZbLA7u4ZkJ50fvT3KkTacl6W0WHB3L8twdML9m32XZ2D73ssSKe4
 7hRFMtQk36oP2whSK+0QqQfFOhIx9sdF6TR+ofbT1ghDuyEpi95dKdC4s3xBg7VqL4r4
 nehHgOULIO05b4eLR9NEt7N9vGe89CufJ60gSLfN89vrShcsraXbzOURSd8c8xHBi5wx
 cuk0bWMDhmD+za1dRscOMwIH1SpntBAYRrKcUL6U7ifWzP+GhG6XX0hTMiAIgjmiAGhJ
 qFaw==
X-Gm-Message-State: AOJu0YwdpYl1oU6Q4GpcaHTdc68aclbfRkHQnk0zUdFQHCrzSymBrHVX
 AkHvls58gwSxK5MbcVkgduepfmeDAtvQ+ouxYA2f1l6qxuI6D+W7peZxYg==
X-Gm-Gg: ASbGncvgZqCkYIU6U5dLS5vk5NOFpPCo5P0lAgd2p2eA3gJmpBAAzAOwAMmQmD1W3gA
 9gAwq7NX+tYXWpRI6BHG4q/bm2zKmqOtO/NUkeVbUjd9wVc/D1oztHrJ6fVBxAbSFkGIF19aGYq
 4YApdIcNZHv1clBi6m5wfY2ATswyNYTlOyukrEhRTCtUl+V8i8fP9RcdtFnL2ulZIUgeVtlKpYR
 0CjGL1xth9+SAX7UK5Ohzt1mChfRvtTKNDDs2hMTDUvQjySLnA83PMexial2xwjjDXJD+qoTfUM
 hUAHHv+mGbU=
X-Google-Smtp-Source: AGHT+IG/96HUsOVHRa9Q/q4mh2q5ExEw9oL0ygG5Xu0F3f01wgd+0nbZ43ObjeyXU0DZU1rTjbeZ0A==
X-Received: by 2002:a19:550b:0:b0:542:8ca3:13f3 with SMTP id
 2adb3069b0e04-5439c283368mr492599e87.42.1737111023299; 
 Fri, 17 Jan 2025 02:50:23 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:50:22 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:59 +0100
Message-ID: <20250117104911.613221-19-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111023; x=1737715823; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e3Z6+o01USfPg9Ugu2N1k+5xeedMQj+ot4wXvlOaLVE=;
 b=O3MQenWfXD6q72bhhmwMqf1PUB7OJhteLCeUvLvbaM+IBJ6+1Vkzd8R49y7ivPILql
 b5Qgar/8Eg4PgcBQkFI+cXCxRlvdB89yoWmrajnIKbNFcpBhW98Lrch5874nrV/LzBwn
 0WsqqZDO0vv5+W7aswm/RJ7QAOLsh+k/jFutJ2kSBiofPPphe1cCxYXQpp26v3aNRa8/
 tOY+ynp9SXdqVeWcnPJCDBubk8dRWLCUDpGdPq0HOiytM28MljObO94py12nLjapzt5N
 Hkn7r/h1ltdf7BF5V8OK7sTj6dVrPNkZuqGBGQN1yfzwJ8DBwg3qgu3mSCW4L2LkN5nw
 DlBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O3MQenWf
Subject: [Buildroot] [PATCH 19/19] package/qt6/qt6multimedia: improve
 'spatial audio module' help text
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
 package/qt6/qt6multimedia/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index 70acbca8e6..0eddfa644e 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -106,6 +106,8 @@ config BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
 config BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO
 	bool "spatial audio module"
 	help
-	  This option enables the Qt6SpatialAudio library.
+	  This option enables the Qt6 Spatial Audio module.
+
+	  https://doc.qt.io/qt-6/qtspatialaudio-index.html
 
 endif
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
