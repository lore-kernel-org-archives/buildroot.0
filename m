Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B2DC3ABBF
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 13:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C1A580F1E;
	Tue,  6 May 2025 13:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LxYU6196lqs; Tue,  6 May 2025 13:13:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F3A9817BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F3A9817BA;
	Tue,  6 May 2025 13:13:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F3EE12E
 for <buildroot@buildroot.org>; Tue,  6 May 2025 13:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60205817BA
 for <buildroot@buildroot.org>; Tue,  6 May 2025 13:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5pu_u0cmM7M for <buildroot@buildroot.org>;
 Tue,  6 May 2025 13:13:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=alexander.i.mukhin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9291680F1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9291680F1E
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9291680F1E
 for <buildroot@buildroot.org>; Tue,  6 May 2025 13:13:18 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-30effbfaf4aso56823321fa.3
 for <buildroot@buildroot.org>; Tue, 06 May 2025 06:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746537196; x=1747141996;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5dTmEL3LfWMbjuSVvr+ANoL6KYM0Lq+bzBxZWEvK6fc=;
 b=BkGNe/QO0IiW7mMHqLbEFym/M//CNtOgVCDAQLLoyC9PA31GYY1oYERNu8NIvlhCOT
 r9ciZ14wsjifUaExXeVCIpA+4vFXgudPX9mXT6iARTPtfwHdZMZKB/01lA2fcBF63Qu/
 tNEsBRGirjfuzCOGT46uY1WYYlNWcJesCf4QsTHdPrq8njXCLrN3UeeTREOxMujsQu9i
 /7zGkUJyzhSZk8t+pwm+d1co420Aodmyo3c2ZTJ1wz8xovtFknyie/RScW9BJRtkbN9f
 bRi1qw1NNPx4LkocB/OW1fSccRv27tx484COdx3j9T1qh3Rz+psTtS5PQ2+GWnDYuf2H
 LaWQ==
X-Gm-Message-State: AOJu0YyyWZNF673UH2WSFWOukb+7+pq9VOvRjF8yS1C19CHdQQ93Mjq+
 1pRJMaqLuR97AKilpG8GSlE3DMgj3iFQN6GTk8+KkDiTV4Aq6knNBRltxw==
X-Gm-Gg: ASbGncvIqisIPXiPtoVpKNZvA+1nUhO4bBJsV0RYS+/tB/0+eXJxRQBzGkbXP56nKNY
 Wgurj9qzIPqc1cOEm112Et1a1genxxo73EEU2tHRSTSktP1R7bSiP2h6Pd5Xlq0mmH6EDim0xTN
 DdTKgol0Bh7T9ujwO/GFsz9PKIC8OILI8FtyDzLK3ykjCddKXFoKUSSO6/kd/eu4RN6253Te+xr
 7LJIT/aKdz0xFtYgniNruDFf6NFf5/rk7FG4PvhFFnc57ckTttPp/TnLSNePgNigRA91mzLfwdZ
 dZlDfzwx4wCpxcIhsuy1WiN1T/uRdzGoFwT5BbMgtBQkAlYKs2r7
X-Google-Smtp-Source: AGHT+IG4Uo8Va+0zDGu8xH+Q/2j9bESnydvdbQRdjB+ilfgG7TttrijzQF8FQCMcVhrKDxe/3RTHoQ==
X-Received: by 2002:a2e:a58a:0:b0:30c:50fd:925e with SMTP id
 38308e7fff4ca-32348750573mr38953501fa.3.1746537196084; 
 Tue, 06 May 2025 06:13:16 -0700 (PDT)
Received: from hs.. ([213.87.156.191]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32029305754sm19456761fa.49.2025.05.06.06.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 06:13:15 -0700 (PDT)
From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Tue,  6 May 2025 16:12:52 +0300
Message-ID: <20250506131252.4170-1-alexander.i.mukhin@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746537196; x=1747141996; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5dTmEL3LfWMbjuSVvr+ANoL6KYM0Lq+bzBxZWEvK6fc=;
 b=LH1KqiJS+aDQE381oyUV4NDLoQPhr7aCvIpqy6ENx+fNngjbGYRxraO1jYsCp2Grlm
 g3m2xphR/QQ5CxbfX3gV5IBRtf3lJWUmrxevqjuiXVvQrlVbRmRCnmA8Vj4U30MJJsn5
 fZtBDl3yUPDUndtMefs8pyxnDiWGbM9jB17J+IVtL11QlZLgJbJbMTChVhKpBpY/3z7D
 qob5eJqHxDYh6AUBWWyapT8J5AQOZQsn1hmBzkCxMxcXrzbVb02JNsl0ldASOd61yDY6
 jf8Y+knioFxwBQnZvkmzDnEt3Z5YENI3A011bcksjR2sZ7KsAt1ZFzx+E6m+9TQ+Ytg0
 YNpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LH1KqiJS
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Alexander Mukhin from
 tinyproxy and zfs
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

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5bb81ad1..d314be79 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -131,10 +131,6 @@ F:	package/openpgm/
 N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/libest/
 
-N:	Alexander Mukhin <alexander.i.mukhin@gmail.com>
-F:	package/tinyproxy/
-F:	package/zfs/
-
 N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
 F:	package/mini-snmpd/
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
