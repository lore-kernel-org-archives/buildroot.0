Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD43E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 18:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1132260725;
	Mon,  6 Jan 2025 18:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRrSXR8evZv9; Mon,  6 Jan 2025 18:20:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 137136077A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 137136077A;
	Mon,  6 Jan 2025 18:20:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58B996B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 18:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2211D81211
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 18:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbFMHHqvVIX4 for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 18:20:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1565381209
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1565381209
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1565381209
 for <buildroot@busybox.net>; Mon,  6 Jan 2025 18:20:25 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4368a293339so114117435e9.3
 for <buildroot@busybox.net>; Mon, 06 Jan 2025 10:20:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736187624; x=1736792424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VNsZLKCA4MX7OzbWgApsV6Tvq91LwXM3bfhppGF7gBk=;
 b=k8MrPR82DJdKha8QXKTPE9dqm9QnLy69s5ycy9Je9W9SYQdTVNqhgJzRcDUX3udKwu
 SfEE35HsIrqPjovBdwpFAaf4m3ciCBnAS7cBhuwGdBnb491QxbHSWEo2BfvODe+wn2s6
 XzzcU6qpVTJsixwdIGy+0sQmsm6aBCyqubdD1VaY3UQS+IoCdDxa4V2cHzUT+Pz5EQJc
 BcPV4rlLxGLGN2Jr+y7PluvbAjO7sRKh4WnQ2Nj2eavGTHBP9YaWnQul1o5PmvdZm58R
 Rw1h9tCrtkC+L14+zxst+1kb9gcSlSJEbz04jyf7bTczmUeEfoJF7ZtwzTyFBXTtfuB7
 f5Bg==
X-Gm-Message-State: AOJu0Yybk9rfNJfEXgALDxaKQQ1FGZ0gfN5M67sLZdMFNPHp+aoCHdCq
 w8Ttz9aAWOoTm7LTgh+fawfULJjcfzRzahYIpCpeySyy1QOcTD0q3xtACIDgK1l9oDXJZLpznfL
 9JQ==
X-Gm-Gg: ASbGnctdOx/AuwIGzcIxyD1LQYPPpTtmOEyxHWN0OBwluJ+G1cIsjSJ4zByXOPZVpW7
 D9i3R2eAriKNB/XRUrKU35mw3F0s3//Sv9kPDyuNUhNv63YCzwoKadJUB5J02GgYg0PxRf9msYM
 77jtW0vQ71EL+wmaYNsIQ7Zg9M8Cb9ZNrkYIF9TWL+X5Uqds8x5eGjV73/p3oSoxnCh1A/VJZGj
 wh5uKusNYr02yyicid7k7irLDJDqOCjwnptXVg1sCBhIrEHhFd8Io20xdg2510JF0SYp0HSK18I
 BJzdC+3Zur0t3rw=
X-Google-Smtp-Source: AGHT+IGMV6k0mUfrAsG51LRR2V7J4p0G0DU5Xh8+Jr8XhhwHLdrq+svxGFXnYBMbxcajuThklHN7yg==
X-Received: by 2002:a05:600c:468f:b0:434:a815:2b5d with SMTP id
 5b1f17b1804b1-43668b785ddmr462877325e9.24.1736187623655; 
 Mon, 06 Jan 2025 10:20:23 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b1143dsm606125305e9.18.2025.01.06.10.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 10:20:22 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  6 Jan 2025 19:20:15 +0100
Message-ID: <20250106182018.2006380-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1736187624; x=1736792424; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VNsZLKCA4MX7OzbWgApsV6Tvq91LwXM3bfhppGF7gBk=;
 b=c+luyBRAjnj6V5YAcnGtv31db94YbVu4BLIFabep7u+mTDGBEOZirv9lbVEAoXMFJ7
 Y3CGnoTWDXZRoCZOPH7SYK507Rt1EiPAG+VBNz4vIF6ESp1nD4/orM1nucCBjCKRRpnj
 6+ZQVFJcOdJ1nAwJfIQhx9zRUX4VdL2cl0fsZbRnB3ZuDzjgkdGC7R/c+UowQOMOd7ZI
 HjvhBjS0yY3UdTTuX4oWwgWoZZwm4mQdpua5pcs2rrjPMx7prlgellNtQXPr4/yYYnk0
 nf60Rk1zsbqqoMmDsCVxZE2S/1zQO/hBUoXAslZwe30LxpSO9ZdYFk215BDt1cEc/zMe
 pKaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=c+luyBRA
Subject: [Buildroot] [PATCH v4 0/2] lynis
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

v3 --> v4:
- bump to version 3.1.3, the first one which know Buildroot (see https://github.com/CISOfy/lynis/pull/1551)

v2 --> v3:
- allow `stat` from Busybox or coreutils
- improve runtime test
- bump to version 3.1.2

v1 --> v2:
- refactor with LYNIS_BUSYBOX_CONFIG_FIXUPS

note: the patch "package/busybox: handle LIBFOO_BUSYBOX_CONFIG_FIXUPS"
was previously submitted in another serie,
see https://patchwork.ozlabs.org/project/buildroot/patch/20240313091412.20865-2-francois.perrad@gadz.org/

Francois Perrad (2):
  package/busybox: handle LIBFOO_BUSYBOX_CONFIG_FIXUPS
  package/lynis: new package

 DEVELOPERS                                  |  1 +
 docs/manual/adding-packages-generic.adoc    |  6 +++
 package/Config.in                           |  1 +
 package/busybox/busybox.mk                  |  1 +
 package/lynis/Config.in                     | 10 +++++
 package/lynis/lynis.hash                    |  3 ++
 package/lynis/lynis.mk                      | 48 +++++++++++++++++++++
 package/pkg-generic.mk                      |  3 ++
 support/testing/tests/package/test_lynis.py | 26 +++++++++++
 9 files changed, 99 insertions(+)
 create mode 100644 package/lynis/Config.in
 create mode 100644 package/lynis/lynis.hash
 create mode 100644 package/lynis/lynis.mk
 create mode 100644 support/testing/tests/package/test_lynis.py

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
