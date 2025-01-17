Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765F5C02188
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2327341A15;
	Fri, 17 Jan 2025 10:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3V9T6NbUJmk; Fri, 17 Jan 2025 10:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F001541A25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F001541A25;
	Fri, 17 Jan 2025 10:49:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CAFAE94B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD01841A08
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uE24dJBXE2Qf for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:49:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C3AA419F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C3AA419F3
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C3AA419F3
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:40 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-54024ecc33dso1915981e87.0
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:49:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737110978; x=1737715778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D8uRxN81AAxpif9qu0gvhSOWSCdb+h6TFm0Pwax5Wjg=;
 b=KvixbmH5jH+P+gxx71Nkoz+yQ4oJN/zxNTUBHF0ph3Uq6DO/DqCdz51QfB/T5ZFXRN
 L5k6zxLA0vY1qkm51HRojMJSQpk+xnqsbGEXobeq1YiN+X5Y96X0li8lvkB8pza7OqFy
 WxuMP+rO9j8OY6xuqzVjgWW/KRJxLh/TfVPxDuOn7ivSV7AKm2wr4Mm8Z1fSby2gqNqz
 MVKlksTKjjSj6S5/TGPIXWZWr1fXGP+n5N1k7jzdKYLotHazYzUXO1jgq8EQ8PCrBhbJ
 5MNeR3zla2wfbCKEZyZOAiCDbr5EQKrVYRvaLwDTfYUdnASUMIMllt68oRm12D6jZF5W
 ZLnQ==
X-Gm-Message-State: AOJu0YzSB+iiS5EDSwZ9ac9X0HmD0t/WR8cUdUjczr68IOOW+5wIUGI7
 0qjHMtPG6eLZhk+HrV/uKAqvsJOm9JUiGRAU7C4HEkmdtrf6r8vqriENgw==
X-Gm-Gg: ASbGncsZF6PSNMQJ4cnNYnz50hqxynA9jspXPoEuoi0mNNGJJ5tlD5GrrcAfRcTV4vz
 icQfzlqTF7yAy9mtHmrV1D0f/agQktgd7YikdbwH9U1zp8c8q0au3URS1mBuqmFDnt2iYUlZuLB
 dSuvrI88vpLDiq5Kf8XQn9Vg25sZSvDhIGFx3YVLM+BM5qp4DBjsH7FRnxzTnbRO/1vSc6Ahr0E
 g0m+jg5h1TrLa1AkR6NEwmzxRUSc3U5yYsetaQ/wRDxwbbwzCHNmOUTP+gyiOui8JqnG/fO6PIQ
 dAoasmNejR4=
X-Google-Smtp-Source: AGHT+IE2rwSnv/L35+yEHv7z+NEzltqHdydXj5sPOFe5zSG0cSUVTMVGaWsGivIieakigvP9LfihvQ==
X-Received: by 2002:a05:6512:ac7:b0:53e:3ac2:9c01 with SMTP id
 2adb3069b0e04-5439c24111cmr817074e87.16.1737110977849; 
 Fri, 17 Jan 2025 02:49:37 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:49:37 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:43 +0100
Message-ID: <20250117104911.613221-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737110978; x=1737715778; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D8uRxN81AAxpif9qu0gvhSOWSCdb+h6TFm0Pwax5Wjg=;
 b=f1Zw51/tdsPpaAJDIZ1+m2pY4lcmnV/Wy1Z5E7xDL1r7Og+Yu+AFh5ogBOmXHjmxK1
 k6I2zqcp6cZP9LBOUZyOd/tVcxAAn4YAoL5H6cUA5FRFtBGEF4+UNualmC6aYJb/A4OW
 +CkyFbBH25hOxmBfL/hQ85B62C7doSUTROxqplAOuT7r+LPsnmF5yuk79RtAb9Rxiiq8
 xm9SYq/NNZTsFibY558c45buQ3+Y8M3Q4K6UekNVnk6t7sYyxQ6EouVdjz+2zr7Es/Xy
 xNIL9iGPJnDx05eLiFtv8497hwyhbBbbY8yL53KgRoH/NTL5JfsK9MrNglHWgNeVyctz
 22eg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f1Zw51/t
Subject: [Buildroot] [PATCH 03/19] package/qt6/qt6multimedia: bump version
 to 6.8.1
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
 package/qt6/qt6multimedia/qt6multimedia.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index b63aedc1d9..434a9d9700 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtmultimedia-everywhere-src-6.7.2.tar.xz.sha256
-sha256  8ef835115acb9a1d3d2c9f23cfacb43f2c537e3786a8ab822299a2a7765651d3  qtmultimedia-everywhere-src-6.7.2.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtmultimedia-everywhere-src-6.8.1.tar.xz.sha256
+sha256  75fa87134f9afab7f0a62c55a4744799ac79519560d19c8e1d4c32bdd173f953  qtmultimedia-everywhere-src-6.8.1.tar.xz
 
 # Hashes for license files
 sha256  f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec1df  LICENSES/BSD-2-Clause.txt
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
