Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2855E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 13:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9653140343;
	Mon, 23 Dec 2024 13:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tV5C3FttLBTt; Mon, 23 Dec 2024 13:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E3F34123E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E3F34123E;
	Mon, 23 Dec 2024 13:09:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4F32D8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 13:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADC0C6068A
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 13:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id du3RvZLahzHN for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 13:09:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=sergiolindo.empresa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B50CA606A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B50CA606A6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B50CA606A6
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 13:09:10 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fc01so7867618a12.2
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 05:09:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734959348; x=1735564148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GJ0vvcCjqFl3PGQ4A+aHDCOsqZtckao00i5CfjfOhU8=;
 b=b6BANrPNaLOOryj6QGpq3+0IqVV8hH/6jMDsr2XuJLxe47CZ1hy1FYrcWrmkT0YSlY
 JOn7wIoQx8hgfvJdEzEzvSHJGWxstSkQFDPmjQoCNapS6JILLAS/9dUEVySvoTM7q2Xq
 qWvDlYw9F4GsDpwflHAnZjqA2Vsd51EBEoBbbkOKiFjBYhgdoGfeg3Ftyblp1YBtnv0d
 Lw2GB4H6Rj6l9x36I//2x3OcavCcFWJERLtmz49ba3WX8Ev4tR4H/KXefhRWrYQ+jTjQ
 EWUw5qXCkVgU/Hz1HIA0lKwufZuLoeDS8yth7WsU2uT69h9D6RwHI702jrtomdrtN7mQ
 heNw==
X-Gm-Message-State: AOJu0YxSgTRfGU36spa1sP/lTYDXD50vB0aFXcosVX2YR2htrvdbRfgX
 rPv/7+yvGArhwNhT2PMco3frAxfGndnyRCInOsGpo09dinGK/MTsryPxf6Y0OgI=
X-Gm-Gg: ASbGncvncbyygenn95/Brrs5nQySgxH1CcVtWeGQD9Wa2+cjfY70zrcR66miowJHat1
 ipN6Z0Njsphu744E/SUHb8+cF3aHXa10PcfLw+CRfby+S2XnO4jry//dmuWCffTPtsFCkrHlY9o
 N059YiANVDrkTTYx0IhZwfd2233qOu7MkfZDWxsytgMwDaZ1MY1I9wdMO8iVUL1M+doH2JWzROV
 N2hcTl/71vra0U72vyHPBySk3hBPZ5xy331KvVNrhPWJK1m/FIbWTUlvWcQSlhfZTz5nCS8yFiL
 rnGG9zAV8nWS8Xny
X-Google-Smtp-Source: AGHT+IFxpGDSsT8Bv3P6Q3dZZge2XI41B/dTJY3rXycEIg3j4jwYOixWNgfZ67JFnKGyl1tOhZPyiA==
X-Received: by 2002:a05:6402:50d2:b0:5d3:d917:dd90 with SMTP id
 4fb4d7f45d1cf-5d81dd642e4mr10770575a12.6.1734959348315; 
 Mon, 23 Dec 2024 05:09:08 -0800 (PST)
Received: from localhost.localdomain ([51.154.20.203])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80675a735sm4816157a12.10.2024.12.23.05.09.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 23 Dec 2024 05:09:07 -0800 (PST)
From: Sergio Lindo Mansilla <sergiolindo.empresa@gmail.com>
To: buildroot@buildroot.org
Cc: Sergio Lindo Mansilla <sergiolindo.empresa@gmail.com>
Date: Mon, 23 Dec 2024 14:08:56 +0100
Message-Id: <20241223130856.74283-1-sergiolindo.empresa@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734959348; x=1735564148; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GJ0vvcCjqFl3PGQ4A+aHDCOsqZtckao00i5CfjfOhU8=;
 b=fbU7KuOEI1mffm67jgLAB1fgX/VZLNRnwn0IYnqvDJ1jHTpokLZhgl7lW9W64Xfj9Q
 G3McXBHYDHSF07hl7o0P44QgfcodODSFtPLhTGyJ5t1eMsfH5K/rmw0J3+tswt4Iy7+o
 wvnKD/Y9N5oAX6d8WZOueXLzNBw/0w1Nrn9vbninSMMZN5XCAN7dKU+17ZvHxspHup/a
 IOukbD9O5aWq3rCR3DakVUC/qucqPw8+92AVdJMDxZuVGPrfdt7Z5J2nq/vL65XJAmEC
 CSTncf7zBNV4TiFfw5di7vPLUFBDrIJvCZ6GkycyXCFXty/YgPE8+GAC7AFPQ6nrcbXZ
 k48g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fbU7KuOE
Subject: [Buildroot] [PATCH 1/1] .gitignore: ignore vscode and mac finder
 files
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

This helps having a cleaner git status/diff list when developing on MacOS.

Signed-off-by: Sergio Lindo Mansilla <sergiolindo.empresa@gmail.com>
---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitignore b/.gitignore
index ec5768d053..f023d4769f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -13,3 +13,5 @@
 *.rej
 *~
 *.pyc
+.DS_Store
+.vscode
-- 
2.39.5 (Apple Git-154)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
