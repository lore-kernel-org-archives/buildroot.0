Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A9EF45A0D
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 22:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06A0441276;
	Fri, 10 Apr 2026 22:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vzn_e9bOuvqF; Fri, 10 Apr 2026 22:42:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDD4641246
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775860958;
	bh=aJb1u/foNx1/XjpDEH090B3WQzrql0K0dbo4M2WUCX0=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=si3djajnvs2/oP+8dqGPA8fswbAcLw51C4j7lKiZ0UhW0hr0toYfwazy3O2TLfAM2
	 IApKbOGv8W+znxy1CtcNkYg5Yz/d+e4ugy/xIbJ/0AICJkWna/Hk+aA7HOjkMSA8EB
	 vsqXb1zAakOU1iHRWvjqW2OMj5oXZVjDmotMASh8FLOt0OxVldt4QnVomS4qqC7Pe+
	 F4ZlihTqGBwbJgT0UquVoEWRgic5VSezpjwN3eNcQmhzA0yIbJIyahbYwrwORL2lEk
	 0VQtg8hHELKnqD9q+XlrFv2G3GegDbQbL8YKJd3VY0PPqv5VxeEJo01FfTnFV9kb7C
	 654HUo4dRBA+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDD4641246;
	Fri, 10 Apr 2026 22:42:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA47A194
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BFCD83CE7
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fnMw3styWwI4 for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 22:42:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=nicolas.serafini@flyability.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0C9B83CE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0C9B83CE8
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0C9B83CE8
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:42:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso37283625e9.3
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 15:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775860949; x=1776465749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tQ6HFUksYDTu7pZrw0yTsuN5tLvprdJTSD6JXNe+36A=;
 b=i2fDxSmlkLSwe3P/VVPWmDMZie9D71qGKxw6RmJw/tcrR2xFNe+CggM1InH9Oww5Wc
 XYD0zv0gknmy4SfTHzd0Fa8KHBT6CqheW4qV/nIOQ+OD5dM9PG6syfVZPDlbI3EP+OSM
 GISwL6oz3PIIkbFtXZ/+W3y6Oq2gZ23iYm5AhaQ2jaY+8AIt93216S2zlfVugXajyyiR
 JnEqbQ5loXsgVIldLHKD+aT7Sp0urZJ4JlII2goKDGuLl6xacEUEQUcit4rOj9+Urdfm
 WcYrVksD25QAQbsv2CBuCt9qmaAoDP2IS5py0gWUlExa9XX2mlLOwO/ReWAMn8Hgwa3I
 71Aw==
X-Gm-Message-State: AOJu0Yx0X+TMj7awFRtl0Lt6GNOJ/mhnjxKvhnQsmP/8xOo+rnG8+h9Q
 KErjq0WW6rS/z/ZwxTvtrw030wMNk4hjvD6qEKsEQz/O9mRrae1LqrD4xWiXn7x+Voiqe2l/UYY
 +ma7w5Spk4w==
X-Gm-Gg: AeBDieupJ0gWBShxV8ZEpNJoAf7uS1dYP+73aJvzhDQOJ7DjJ9pevk5Y1nQsw1qThq/
 zo0wYGLtrU1gqmkS6Cwyxbv+EPOEUL9J5Ga5XuKnj8Bz1j6TGCSTXUlIGPm4+ilXPogq0Y3PpwV
 YM8EHKb6P0r7VaYgchLJR63ryZBgiToIR6R42irU3voTPS8ZMwectddtD5SQct6qIZHlfpFP41x
 3bZVZm1S+cOYdJbnaRLE0dysHxajKjI2Vx7qab85CSbOgElSiGwYfcRffKqPc4rofn7Kq1K3LDh
 oFaHZzR1UOOZDpatypTGZmzWEJQFEAn8eBRnk5sM7rH/dEEK4iF8QU607IO5uEVr2Jr54+cVqC/
 dnsX45HTHJkfOMt1i08CSGqahHzmrSbstVz3AvAbsLkkgBw/vu5RBrkvg3EId+P/WTdr4L1fh1N
 4W848K0kUkjfP0K121mtvA+020E8JDm/Av2K7hGNj9FxUxIrKVPuPvRs+CmReKQQ==
X-Received: by 2002:a05:600c:c0cc:b0:488:8840:e5ae with SMTP id
 5b1f17b1804b1-488d686dab1mr45256185e9.24.1775860949513; 
 Fri, 10 Apr 2026 15:42:29 -0700 (PDT)
Received: from nse-t16 (adsl-84-227-54-58.adslplus.ch. [84.227.54.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e50015sm11668479f8f.27.2026.04.10.15.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 15:42:29 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 11 Apr 2026 00:42:21 +0200
Message-ID: <20260410224221.1185631-5-nicolas.serafini@flyability.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410224221.1185631-1-nicolas.serafini@flyability.com>
References: <20260410224221.1185631-1-nicolas.serafini@flyability.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flyability.com; s=google; t=1775860949; x=1776465749; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tQ6HFUksYDTu7pZrw0yTsuN5tLvprdJTSD6JXNe+36A=;
 b=RpFYDVj+L0cgeOCFktHfP4KM3hxKIjTYNIz9pKmfcCCdciA0M1eCuu84XM5idOHxd4
 +FtCMZEo8uScJgtZA/mH9ic6a2cdz23aDikKvqtJjvQee9LCmkKP6hJIAaZt8S8pCQIO
 7WJF09gmSdj89w+RoLX3EBlf0kn6WU8RaYXgGhB2zPBvkelyOLQ4kJfVeNNLJDIQ9KCK
 Qs0YS5/z4Cb0yNMkGOzUG+cw1CHNvTLoIFx4Bh/Z0++ZuJEeu5qWKqwUM8Kv7fr28Lea
 39cO+rxu3H+9doMH31bGUrm4Bxq/SpLqkvHeNLcHbd8ZDJaOXeyTxtn1pkBg7BRa1gjC
 jS6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=flyability.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=flyability.com header.i=@flyability.com
 header.a=rsa-sha256 header.s=google header.b=RpFYDVj+
Subject: [Buildroot] [PATCH 4/4] rust: add support for
 riscv64gc-unknown-linux-musl target
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
From: Nicolas Serafini via buildroot <buildroot@buildroot.org>
Reply-To: Nicolas Serafini <nicolas.serafini@flyability.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, Simon Richter <simon@sinic.eu>,
 David Pierret <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>,
 Bernd Kuhls <bernd@kuhls.net>, Graeme Smecher <gsmecher@threespeedlogic.com>,
 Julien Olivain <ju.o@free.fr>, Torben Voltmer <mail@t-voltmer.net>,
 Nicolas Serafini <nicolas.serafini@flyability.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>,
 Alexander Shirokov <shirokovalexs@gmail.com>,
 Mariusz Bialonczyk <manio@skyboo.net>, Sam Voss <sam.voss@gmail.com>,
 Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Mariusz Bialonczyk <manio@skyboo.net>

Signed-off-by: Mariusz Bialonczyk <manio@skyboo.net>
[rebased for rust 1.94.1]
Signed-off-by: Nicolas Serafini <nicolas.serafini@flyability.com>
---
 package/rust-bin/rust-bin.hash | 2 ++
 package/rustc/Config.in.host   | 5 +++++
 utils/update-rust              | 1 +
 3 files changed, 8 insertions(+)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index b1e4ef67a2..00621d01f9 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -57,6 +57,8 @@ sha256  1ffe28904e888f7884124f08f940a330b314a1c42b502c6458604dd7cd852e82  rust-s
 sha256  68060c6b0716eb9ab9aa0f570b508414362f509e29155b796a531c7e1c9543cc  rust-std-1.94.1-powerpc64le-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.94.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
 sha256  8e223e480e8bb25aa8fec3bca936cb6343098b0af5b59a2c40abd5cca51aa3ab  rust-std-1.94.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-riscv64gc-unknown-linux-musl.tar.xz.sha256
+sha256  de9fcd9fc4e710ec74108dc3237a78f24fb4c1c6fdbc3a70682e73589933e5e5  rust-std-1.94.1-riscv64gc-unknown-linux-musl.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.94.1-s390x-unknown-linux-gnu.tar.xz.sha256
 sha256  391a713446c2ef5bccc3f90058b4eff4df42f8c996c399bb760a1565adfeb193  rust-std-1.94.1-s390x-unknown-linux-gnu.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.94.1-sparc64-unknown-linux-gnu.tar.xz.sha256
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index c3e9a13f39..9cd912fc74 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -58,6 +58,11 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
 			BR2_RISCV_ISA_RVA && BR2_RISCV_ISA_RVF && \
 			BR2_RISCV_ISA_RVD && BR2_RISCV_ISA_RVC && \
 			BR2_TOOLCHAIN_USES_GLIBC
+	# riscv64gc-unknown-linux-musl
+	default y if BR2_RISCV_64 && BR2_RISCV_ISA_RVI && BR2_RISCV_ISA_RVM && \
+			BR2_RISCV_ISA_RVA && BR2_RISCV_ISA_RVF && \
+			BR2_RISCV_ISA_RVD && \
+			BR2_TOOLCHAIN_USES_MUSL
 	# s390x-unknown-linux-gnu
 	default y if BR2_s390x && BR2_TOOLCHAIN_USES_GLIBC
 	# x86_64-unknown-linux-musl
diff --git a/utils/update-rust b/utils/update-rust
index 7db3feff9c..18d7b1d1f8 100755
--- a/utils/update-rust
+++ b/utils/update-rust
@@ -52,6 +52,7 @@ RUST_TARGETS = [
     "powerpc64-unknown-linux-gnu",
     "powerpc64le-unknown-linux-gnu",
     "riscv64gc-unknown-linux-gnu",
+    "riscv64gc-unknown-linux-musl",
     "s390x-unknown-linux-gnu",
     "sparc64-unknown-linux-gnu",
     "x86_64-unknown-linux-gnu",
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
