Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F179DC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE1AE6078A;
	Mon, 21 Apr 2025 21:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08yEAdE41MFy; Mon, 21 Apr 2025 21:37:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D369360B26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D369360B26;
	Mon, 21 Apr 2025 21:37:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7E091A0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D04380C91
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgGdkaYcX-Sw for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:37:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFAB780C39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFAB780C39
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFAB780C39
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:37:12 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-736aa9d0f2aso5290840b3a.0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 14:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745271432; x=1745876232;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LQMgZHrlQKTZt5GiaLglE+MGRiXiaM0mRlZ6ekSgyLw=;
 b=wK5Pj7jyg2cumFXDFWzlEOECp1KNyFIjA+95xx0Tfc47wvl1a1iOPLJy0FtUp8wgb5
 I2G6ZyT75qL7RUM3pciP3d1dILbFV6Q7XOU0jtrq6j5DgDdXFHjMQKD/0rfZWZ4tiUjW
 UsfyqrRWsiCAy/nbwfL22bhcoxV4bstHTNXApug3XFnY5HECZRjc8C/bDDQ6o8NlDKDD
 zWEWF0gQOjmSiRVrEMsYewcmSl1OgYMYCRcDpmSW3PjCfGbffpwoG2j9/Uau/uyQUo9A
 tTK4jwh5bx+KXVROouftiuCJp+S7haMtE1zG9nXS58iH3k4kPo1ANWMw2EvNnbv1KugS
 I3Bw==
X-Gm-Message-State: AOJu0Yw9FqHyqhk/2gAgKbKJ/Vgr8UpMk4G0Vk9JXWOpQy+K6MUpS8Zy
 rZDv5aq+g6J20qHWJm094ut8MOxT+S8bG3Wp/x13yETNgQIhcGlEPp8obO5xeyg=
X-Gm-Gg: ASbGncucS02PspryniH+HZ4EQCKGBPaghJJh2FQe2+QTP1lX07MePtbj7fSBklhAYLg
 wsw8jNNUVaAw2yzjLLu9sim2RloT4Fi/1mUxe0MtlGNEIrVOMCaYo5ery7n52Oih3Xu/n5s4riJ
 gJ8Bou6TcPgrDx5Azb3OBPShbQJZyT5sK8GWB3XpMiX/ftq7lvGa07aDq1t9orKPhGXWBQQ0xtr
 s48fzh0pgGs9nDcODtJyAMypiWogTQkZ4PjIZiJZs6zLsYka7qpuaLhX8AGLJn3eZq/bk7xCovV
 EsDKDcpWDQlytdv8qRch6rdn1wkX+g33fD1u19T5uxQHeTD5Qie/SDbEBVWEcIptHi4=
X-Google-Smtp-Source: AGHT+IHf5wjObKRNpLzsHONADdq8KCI1eeC5QLa/aiJ6JoDyWk+tHHOFCbm7yjf2qmLohk+2iv+Yxw==
X-Received: by 2002:a05:6a00:3990:b0:730:99cb:7c2f with SMTP id
 d2e1a72fcca58-73dc148fabcmr17706119b3a.6.1745271432097; 
 Mon, 21 Apr 2025 14:37:12 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73dbf8e4825sm7355082b3a.54.2025.04.21.14.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 14:37:11 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 21 Apr 2025 14:37:02 -0700
Message-Id: <20250421-pixman_riscv_dependency-v2-0-7209dd6f2485@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH66BmgC/4WNQQqDMBBFryKzbkoyKJWueo8ikk6mdRYmkkhQJ
 Hdv6gW6fA/++wckjsIJ7s0BkbMkCb4CXhqgyfoPK3GVATV2ujVaLbLN1o9REuXR8cLesaddae2
 QyJrbq++hrpfIb9nO8nOoPElaQ9zPo2x+9n8zG2UUdq5tHWJniR5Rckji6UphhqGU8gVAWhIew
 QAAAA==
X-Change-ID: 20250410-pixman_riscv_dependency-00d2cca17b88
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=3wp2Xso/1SPpKyNdO4YLBOscUZnGdN53WFITTMAgfFE=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQwbbrlam5y+PG88277cofsN6hemr4e/Zm8/F6t+97/6Hl
 3Nld4l3RykLgxgXg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABORSGL4n6h2VezxHavDipW+
 T18+XrKomEGdhy/t3oTL0ZOulOR0nmL4X5xxd907vz7BhPAH2dyh61yFpvSZ3Vi1ZkqejS13bdh
 ebgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745271432; x=1745876232;
 darn=buildroot.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LQMgZHrlQKTZt5GiaLglE+MGRiXiaM0mRlZ6ekSgyLw=;
 b=Z73hLbH5lqzIdRlxOmKfvX0mEii7tDm3wUGH8PbHzYyDxZrxc5AuW+9yLHZv0afDHK
 TqmNWuHYKEbowTU5Vk6td/M+J/gd/eNmzOP04EVYYmlUB9/CMNEE11uOt5eThala/lr/
 qHCUCd8KWTm1UhMtvuxXsfOoxI5UPH8LJy5jF+9vZrTazrATFov5bbuIarVycCXfkB00
 ZjJnpREfV2ZC7HOTh3owAF4HzqmlxgT8N4gbqDMvzAdgQ7BeWC7NG6rrgGmMsyNwBP9n
 OY66ZkpVPOx2IFw8YdIOLjx4t7phSQQ1R8uJ/dLCt4ycLd2gU/TnRgXuFfTP5B5Hg+Pt
 9etw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Z73hLbH5
Subject: [Buildroot] [PATCH v2 0/2] package/pixman: Fix riscv vector support
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

Pixman 0.44.0 introduced riscv vector support. Fixup the buildroot
support by only enabling the vector support when vector is enabled in
buildroot, and add a patch to detect if the toolchain supports vector.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v2:
- Use pixman patch instead of buildroot hack
- Include new patch to only use vector when buildroot vector is enabled
- Link to v1: https://lore.kernel.org/r/20250410-pixman_riscv_dependency-v1-1-25d44d225acc@rivosinc.com

---
Charlie Jenkins (2):
      package/pixman: Only compile with riscv vector support when selected
      package/pixman: Fix pixman compilation on riscv

 ...-enable-RVV-on-linux-if-hwcap-headers-are.patch | 44 ++++++++++++++++++++++
 package/pixman/pixman.mk                           |  6 +++
 2 files changed, 50 insertions(+)
---
base-commit: f2b14baf2576b54cca43e6f2aebbb4a19fae3bd9
change-id: 20250410-pixman_riscv_dependency-00d2cca17b88
-- 
- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
