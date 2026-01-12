Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3D8CF45D5
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 22:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 743B060FBD;
	Mon, 12 Jan 2026 22:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kqs_wsEewrQO; Mon, 12 Jan 2026 22:19:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D364560A94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768256373;
	bh=+c9+xdxL/4ueYiTRsM3nu8P/4JB9KJwQVTPTb9bUf3k=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SGZel2wWKLQnsf5XuAbamQw4+YR7SiBTu+hPniLljPfjcY+Snh4nF+YRHbl17cpb9
	 4zOmWXXD+ZwLrrUYrV1uKUYD4O/9sITy0fMJrNk9f91FJ4QsWTyPG8akjqlKsvyKQ5
	 WrIpyogLKVW5eZIBDCic/Lv4c2HsXyN8jU+6+ZJMiAw+eIPQKPpbjetLHPXI/2JdVf
	 Bqc0aH6Cw8yp/M7i3FQ0LShxxeI1MX1wWrE3RQ7n0+ut+WrS4QtoReSRP1bCNzb+i3
	 7gSPLLdR30j/sS5SAEMICsIevAXajsC6lmmiPsY0zknGQJSQ/R5TL1pdb9JEBpI2/x
	 +aTsqhHeTvonA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D364560A94;
	Mon, 12 Jan 2026 22:19:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B028231
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 22:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D27B80A74
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 22:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSlTDrVPA9RO for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 22:19:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E753180864
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E753180864
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E753180864
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 22:19:30 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-4eda26a04bfso83914941cf.2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 14:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768256369; x=1768861169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iDaKMLH4RQaVbkrR2g297YiyOLe6CwKvmPSZ2YOAWRs=;
 b=eW7te6humcaRQ1ysOVRZFbyjdZvMknu/KQ8oclRVRhceRlpY0BsYbfQhsukvDxATdE
 UTz8Re4F9uXFkn7ZuYK7kpvpUGdmm+FdA1OaFYk8LTPdpquujYlZxnnbKDmKCUeamNr/
 ZR0vxGqOftjEO/hjFbSZa1x08Ck8Vyc1nFBLCMEu2yJ2Jt21SHAm+vMyX6507ZMjPOyU
 DLXabCR3IXCoXm/pDtMM4EkFeO5NjKdyq9aUgdpbAnlVRXAUaB/1VClzxMUoEWT3H291
 THh+dxGSvqcHJ8oyG9Jark9wm0Cr04u5w2KgLPsuiGjYzWgkGhzPa1kkufDB/97fQS9e
 jzUQ==
X-Gm-Message-State: AOJu0YwHcdw5ggjUtSWPGRa8zP0BZaXV86HxusnFhhWubIPKrZ+QORbb
 ZwPZsjkKwZSogZiJpRX7fCUK6gSt8jhorxBAuDOw8gEwitHspQK0sEjqO5yPog==
X-Gm-Gg: AY/fxX53Q3B9+ZXWIZqWg6xn/83q9XMDNZ9SRVG7kTMic/u8vNaGOD5nwcB76NgPLws
 vWuJHsYYoamlTVISVvjRYjQ6vMiqn8R0laugYfN7fzbh/49HLB0zhf7aM6/TUkC28X6MUq9yz/r
 xYyssJKOsHAbWbtrkQ1S96ILXl/I3A0TxKddvWA4StRa+EenWPdJlUoytZe2Yj+jDXHCIkd3wq8
 sYc3nps7dljXEkXVoJymB97N/H9esXESs+cax7xhd/L7GA7vOfxAruFaW8zlj38yh5ECBAXR69v
 c50f9I3kJUoVKK34iSU8T6AaKPBBPm8DqF9hLiTu/UU9s6hNoBZ9+EjAdqHKLbciJAnxGN6WA0E
 EqBlIYNEStwFo55sMVAOmrOkIs8OzkNLspf5ewUWdz4/YUPZmKvx4JwrIh5ji9anUV3MKAjz7PG
 mg4k164PAsLp/0Ky/HJ7s4Z2m++k6iO7Joc3eImTBRmJvekvvNfC2yvlBuuqrbrR5Y
X-Google-Smtp-Source: AGHT+IFmezL8cxHR7rCustAQnWB5dV5+C0cS7o2qcKHAHjOEtaB4EpzRJNta7IjMo0VuHq2gK7gEFg==
X-Received: by 2002:ac8:58cb:0:b0:4f0:153a:65ec with SMTP id
 d75a77b69052e-4ffb4a3fddemr284208021cf.40.1768256369365; 
 Mon, 12 Jan 2026 14:19:29 -0800 (PST)
Received: from jesse-desktop (pool-108-26-186-76.bstnma.fios.verizon.net.
 [108.26.186.76]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89076fa0718sm140990246d6.0.2026.01.12.14.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 14:19:29 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Taube <Mr.Bossman075@gmail.com>
Date: Mon, 12 Jan 2026 17:19:27 -0500
Message-ID: <20260112221927.3745398-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260112221927.3745398-1-Mr.Bossman075@gmail.com>
References: <20260112221927.3745398-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768256369; x=1768861169; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iDaKMLH4RQaVbkrR2g297YiyOLe6CwKvmPSZ2YOAWRs=;
 b=KGtvEl4zpq8JDgERfHPz6tob6xT/3CTQ9nDNs10THzQNbeHVgZTqa+fCcIZdBRDSqJ
 BZ2s6ZoKcgOhJY3/0Vyjy22AeIl+QFqduS1kEMwIy+enIIayooMhtHJU8KOZLbm0zkL7
 3JlWOtU3Bj1qaE1hokLAbQ9u9vCStKk9mVSyaT5pxqV/BpKtIQlCUgbYz9A5Xf35h46N
 IQV4VSka+Fp32sw6u09Aq8P02XNnpDcCPMRQQd46QBvvjHaCHyf/FubXiqKJxgvbUgCA
 OreVeSZ+2iPShm6aIqc63PY3x4BQqDQUYhf3p4sFZatPj0PcZvt1Y+v5AVpRvUNt3P//
 IpQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KGtvEl4z
Subject: [Buildroot] [PATCH v2 2/2] package/picotool: Add host-picotool
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

Add a host-picotool package to picotool.
This will allow users to build rpi pico applications on the host system.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - Drop host-cmake
 - s/pico-sdk2/pico-sdk/g
 - Reorder variables
---
 package/picotool/picotool.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/picotool/picotool.mk b/package/picotool/picotool.mk
index b27f5d8dc3..bca9489665 100644
--- a/package/picotool/picotool.mk
+++ b/package/picotool/picotool.mk
@@ -6,9 +6,14 @@
 
 PICOTOOL_VERSION = 2.2.0-a4
 PICOTOOL_SITE = $(call github,raspberrypi,picotool,$(PICOTOOL_VERSION))
-PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(STAGING_DIR)/usr/share/pico-sdk
-PICOTOOL_DEPENDENCIES = libusb pico-sdk
 PICOTOOL_LICENSE = BSD-3-Clause
 PICOTOOL_LICENSE_FILES = LICENSE.TXT
 
+PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(STAGING_DIR)/usr/share/pico-sdk
+PICOTOOL_DEPENDENCIES = libusb pico-sdk
+
+HOST_PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(HOST_DIR)/usr/share/pico-sdk
+HOST_PICOTOOL_DEPENDENCIES = host-libusb host-pico-sdk
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
