Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35708C4345F
	for <buildroot@archiver.kernel.org>; Fri, 19 Apr 2024 21:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F131940B9A;
	Fri, 19 Apr 2024 21:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5M4ljKTtS-F; Fri, 19 Apr 2024 21:27:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 021A141A52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 021A141A52;
	Fri, 19 Apr 2024 21:27:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 35F781BF977
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21A5141E56
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h56orG2ILzjw for <buildroot@lists.busybox.net>;
 Fri, 19 Apr 2024 21:27:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8EE7341E55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EE7341E55
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EE7341E55
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 21:27:51 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a526d381d2fso623771566b.0
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 14:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713562069; x=1714166869;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C5gS+DwiHt5B3Xx2/cixTHYNFD5nw+gBTlPt19lzPTU=;
 b=n0U6DYGNuiuU62GHmuSHjk4EpTOxr5Erl0/5Mhy6hKnPCXMnbRuG572wm8bQtH6d92
 R1bv+k6GPuJrZmCFIe9bgsYNi+IDLo2ZhsCdJc10AmnrWaGJS0liNPJyHtPRpT9qNL4W
 QXnYouklKy61BIuhz7M6S+31iCSgHRhxtR83nNE+mB34cOVbqXqAxs/bkUmiZQhJIZSH
 kqQOPS3ISKwpswezE6KnXv8VMF649LYc2svmI8khissLBDfq38b1X4wlvzx7OoxIojLR
 bVf2rwNlx/M8HX0OeTxWTfr6majyypY3LtU96Py/rMUYJTIX8gxUPBv1ivgbJ/7QLcHs
 sd5A==
X-Gm-Message-State: AOJu0YzUHjVg+83af+5XT/qu3Kmai1pwAD7Nye6wuVgTxLFZBJMOYPyI
 4ByPFg6GHpOYCBKqKZlRwj+eyQt9a4rgtBQ4dcxQ1iSj0Ev7ryz183zNWA==
X-Google-Smtp-Source: AGHT+IGRZYuau8tXq9ZW55a+qk7dJOCR27kD6Kr29E7srNzKSwbehgL79ZMti19rT553TusH8ci53Q==
X-Received: by 2002:a17:907:7e9a:b0:a55:92f2:5cae with SMTP id
 qb26-20020a1709077e9a00b00a5592f25caemr1033733ejc.21.1713562068758; 
 Fri, 19 Apr 2024 14:27:48 -0700 (PDT)
Received: from localhost.localdomain ([212.22.152.70])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a170906500800b00a4e24d259edsm2596766ejj.167.2024.04.19.14.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 14:27:47 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Apr 2024 23:27:43 +0200
Message-Id: <20240419212745.512436-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713562069; x=1714166869; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C5gS+DwiHt5B3Xx2/cixTHYNFD5nw+gBTlPt19lzPTU=;
 b=JhbW9tVzLhlgXjkdX2K6Kdy7rDlIaw7A4ofhBw3t2pp9vydp/H4gT/5fTFNbGJwwj8
 xQqPqpUKwqtG4p5RmvSi/79BnOofwjMiS3ijmPNjmQuBSeawYo2elY4QPc+e6NeWTPth
 clroXIPI/8Qy9qJ+2UhXhZyVq76XX6vpt1/MX44ntbYFf26JsyXMnF36cRwWh6+Bc6bp
 75zNAs7Bhm9acDHSKq0UrlVWIhsPwDAZN4E0puO/hC5IbyCeY8rIC6Y9OsC5qLFf4T42
 sY7d1IU4Sb0Oyo0fvf8ImHi7z8vzCV4eDvVmrcLknKeS9UbrxpgkVwR/OWDWPpvlqJmF
 Vq/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JhbW9tVz
Subject: [Buildroot] [PATCH 0/2] Fix fail2ban
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Angelo Compagnucci <angelo@amarulasolutions.com>

This series fixes fail2ban not installing configuration files in /etc anymore.
While fixing the problem, I discovered a bug in the way we invoke the
pyinstaller.py in pep517 compatibility.
Basically, pyinstaller.py will install data_files defined in setup.py
and tarballed in the wheel inside the directory pointed by the --data parameter,
which is nowadays pointing to /usr of TARGET/STAGING directory.

I consider this wrong, because the data folder shall point to the
TARGET_DIR/STAGING_DIR to be correct and we shall trust the destination path
expressed in the setup.py.

In the case of fail2ban, configuration files end up being installed in
/usr/etc/fail2ban instead of /etc/fail2ban.

v1 -> v2:
Fix signed off with correct email.

Angelo Compagnucci (2):
  package/fail2ban: fix data_files installation path
  package/pkg-python: fix pep517 data files installation

 ...001-setup.py-fix-data-relative-paths.patch | 73 +++++++++++++++++++
 package/pkg-python.mk                         |  4 +-
 2 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 package/fail2ban/0001-setup.py-fix-data-relative-paths.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
