Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6936CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 09:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 703D14049F;
	Sun, 22 Sep 2024 09:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qej_LlXxJtWq; Sun, 22 Sep 2024 09:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A670404A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A670404A3;
	Sun, 22 Sep 2024 09:28:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C19721BF4D6
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 888A540635
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQIwDy1cwZPF for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 09:28:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B3194049F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B3194049F
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B3194049F
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 09:28:01 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a0cce338fcso5564135ab.0
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726997280; x=1727602080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mh8kaFjXBw+3RltdUNzJx+q7WT8N3FuEUQKhu2/q7wA=;
 b=qGUxRW9CYfNPN+1jm5WzIltVRAS1++Jo87DHDIcMLc5VNN/rmYi9u/74QGYnaK4DY7
 s6NgzhiksqpILRaJggLdjan+bHExKR0kFO9dGFe5apjXWGOTSLJA4W6rB8Lg09ihREtT
 WeJUSKZ0KjCWsiNs774KoswMj8cEo9PCCdokyq3ps8GjuRKgKJ+RI+jKRAXPJXmrGyBG
 8WmUPZWOYR1n213BuiBImHTFMzNjQvM5M1b/HEXVHjTd36dqzkXa5GzolVKrMZGE3UBW
 38LbbHKrVXYCLcitZKoUxn0ifuFanSBZw7uPmIZgmNUNlGOc55yRE/nIkb3pexKARI+l
 qfAg==
X-Gm-Message-State: AOJu0YxREHaQpZSL0gXen7HcWgmZA1K5gXtavOMywVAuzjC3nO+O/+kw
 ySyE4QtUkb3lDIkZ3GyDZV/ABMlu9AUwhYR2DeIbWWF4ZmRNKE/CLRAYtw==
X-Google-Smtp-Source: AGHT+IEke8K/dp18N4e/CKuWwz2BlSvmLSt2c5w7NHTUIGr2WRQf4gTNBhNQhZLfqiyRIAmpTcG5hw==
X-Received: by 2002:a05:6e02:19cb:b0:3a0:97df:997e with SMTP id
 e9e14a558f8ab-3a0c8cbb7fdmr80647165ab.14.1726997279982; 
 Sun, 22 Sep 2024 02:27:59 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec17eb1sm4565720173.51.2024.09.22.02.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 02:27:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 03:27:58 -0600
Message-Id: <20240922092758.1129708-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726997280; x=1727602080; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mh8kaFjXBw+3RltdUNzJx+q7WT8N3FuEUQKhu2/q7wA=;
 b=dNAg132dBLCQmGYRwMY5XhsmxSvL0Cv9umvzGyCXA8m/gkNqwTwKg+Hi/FvFP9beZa
 ivkogDdirkmefCuuwUxe1cFae/goeHu7C7jM7L02zVwOVvCWAU0MSqqMnH1shEZ385mN
 HETEJndzpD0PRKl70Utdiur6XWQWekijcgF8JfEEj+24vh/ml/PUSphMe5DuAlKiESkG
 BOzfgTLcRIk3EPFfYhVSoca3r1P0Iz3G3XQFECAovl2rII+vPyksBBAsT0zexcZGhS3I
 VUZ2c63HC3/kj2njeUshffdYCuvzjPqTXjzjuUsCJcOfbAp4KeKfrRXXaEMPacHLh0D4
 gIHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dNAg132d
Subject: [Buildroot] [PATCH 1/1] package/rust: bump to version 1.81.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/rust-bin/rust-bin.hash | 128 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 143bcd6de0..d3ed02513c 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,70 +1,70 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rust-1.80.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  2e89bad7857711a1c11d017ea28fbfeec54076317763901194f8f5decbac1850  rust-1.80.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.80.1-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  9af695dd4eacb397c2169abdfae35c6342f210d04632571d5faf924fa2cc6d39  rust-1.80.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.80.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  52706cabf6b9fc504d5b1f8f1605787bb7950d79f157f913b7cf38a59e138b22  rust-1.80.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.80.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  9a67bbade030cdf2ffbd3765d1c937586837b4265a90a97e2378e9f5687a4ed0  rust-1.80.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.80.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  97d5bfcd8a4f2787030bfbdccb4866c993b681dd9964651f080e91ba71e9f26b  rust-1.80.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.80.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  a6845a414b0fc199f3193a202ed5e00bc8244bcbdfc5dec5e02f7d7ebf5ce5a8  rust-1.80.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.80.1-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  a51fed0090f31fba0998bb0f2822cbf9e1ee513f6a1e58a936afc9e758d6ed8b  rust-1.80.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.80.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  85e936d5d36970afb80756fa122edcc99bd72a88155f6bdd514f5d27e778e00a  rust-1.80.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  8fc4bfc3a5fe64f8530964a5ea3bda95e39357eff14d6a8bb24f010ecc912923  rust-std-1.80.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-aarch64-unknown-linux-musl.tar.xz.sha256
-sha256  1ac3c0ba6d3afec73bfeeac8ed8d812eb3c00c5202f2c24e57951a510d183882  rust-std-1.80.1-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256  106567c06b8b240fe20071f8b0184b404e629c43ee54511b4f81f7fdbb5e7247  rust-std-1.80.1-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  f0dd131f05e0801fcff35a23015fe83027865b936bccd402c8a9164400d27769  rust-std-1.80.1-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-arm-unknown-linux-musleabi.tar.xz.sha256
-sha256  1460617746d7e1792005f5378450d47d13db2d08cbc6c1102750ac7f49fc148f  rust-std-1.80.1-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-arm-unknown-linux-musleabihf.tar.xz.sha256
-sha256  a144f885daeacb67df4adb524cc0ca43dfb1f18725407dde598064ab5bf9325d  rust-std-1.80.1-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-sha256  f45cdd02b0f45e7350e5eef929e55393134f11cbba32ab9eff1f3ae0891d7660  rust-std-1.80.1-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
-sha256  89b9a9e0ccd4b1540ea7664acd4269f54314dc6b3df748f78bcd2736b6c3b793  rust-std-1.80.1-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
-sha256  36f5d0e3a3036c48d9199e836ee3ed3161a8127b930cce7ec5e997e219c71f45  rust-std-1.80.1-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  a69873dedf9e1d156aa105f5f85aa3b47816bd52bf233573d2f04721014eec68  rust-std-1.80.1-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-armv7-unknown-linux-musleabi.tar.xz.sha256
-sha256  99fa7e5ef4098735d09bd9a08987e4c74efe04081b09aa209568946e2fe21a8e  rust-std-1.80.1-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
-sha256  40aa0b576216284d5f9aa74e45ea99e44ae207e817a76ff4ade8b64b21d391e1  rust-std-1.80.1-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-i586-unknown-linux-gnu.tar.xz.sha256
-sha256  94927cdfa7cad391700b1a77730bb17aa364831ff6a6c40ce6500a14c1314647  rust-std-1.80.1-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-i586-unknown-linux-musl.tar.xz.sha256
-sha256  abefa57c02dbc1c04d1f5130714d64370245b251636d34b54bf9ee0875bca835  rust-std-1.80.1-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  6547876dcf243aeeeadaa38dbdce02c316b6f83305a5337520e02eaffc90834b  rust-std-1.80.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-i686-unknown-linux-musl.tar.xz.sha256
-sha256  329f1bd3a0543822038d55219c74b1168eaab2c5fbcf6baa8a8768cfa133c625  rust-std-1.80.1-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  88e8144c25ef8347471dd53eea7af62e5b31eadf0788f4a82be7560f5a0be255  rust-std-1.80.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  cb5ad871a0a7efe7c270cbf319d006a84e8f8526acb22ce941f2840fd0e368c2  rust-std-1.80.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  06633b26384cba594424ec02acf0d64d4724033a856a2e039a18a518cacf1d3e  rust-std-1.80.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  1fbbe8df7596682466ae2fca534d5f6bae8b3f32577450e2632955268a786a06  rust-std-1.80.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  e732ce690fd63e3c2576bfe83a556031c4805c17b35b8a1c1a0ddde5cee31d46  rust-std-1.80.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-sparc64-unknown-linux-gnu.tar.xz.sha256
-sha256  ee7fa0104b019eec22750ac635e699d21dbb5430fc6982c495533900ec568d5b  rust-std-1.80.1-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  b793405538d8b6ec1632779efa8835b07b8987db2008c5c9c809bc4b17dcb121  rust-std-1.80.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.80.1-x86_64-unknown-linux-musl.tar.xz.sha256
-sha256  c5b9d3914a129cfc7618a3e9c5d282821da2fb402a6305833d43674c41d303b2  rust-std-1.80.1-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.81.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  5cd65b0a2724e4193a5c4ba79f0687f8c11d52c2d58ee35bc7ce5958a3cc8dc2  rust-1.81.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.81.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  b8e1a2889c574d235b210ae7ac8dd0696ea845fdc3707d67955d53ad4c0de027  rust-1.81.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.81.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  0d5febf28380b9c25f08e6f9b834778ace9ecb54b892481985e1e8692080c617  rust-1.81.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.81.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  1ff9c458f882b19050083c1f4cdd1a639dd8014b6c9c658e08506c7f3449af33  rust-1.81.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.81.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  aca2ff839c6ac288ee037926ec15d78315977a5945f515505db0b248d7c3094c  rust-1.81.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.81.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  bc4c50240344882e1c192038cc04daea760792c6aaafa928ae1058f6f4cda437  rust-1.81.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.81.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  5d66614297fb01e66310f6842ab9ac0813ea4d340d88c0205880729b99362dcb  rust-1.81.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.81.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  1a9ee8caaa18a3e433fef93cea8a55dc1ebd478ed761b2fef69d4565f9d00e7f  rust-1.81.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  85567f037cee338f8ec8f9b6287a7f200d221658a996cba254abc91606ece6f4  rust-std-1.81.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  e31d375a512aa1bbb533ff53cab47559468e5c1bf047fd9f4040446dfa9cd9df  rust-std-1.81.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  4220431ef39ea5383f987ac00a80acbe150aa116178513d619a8dd10a643da22  rust-std-1.81.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  bb146097d9e5f2173cdd7afa4e813f5e68688da371171427d60778e7220e6ec5  rust-std-1.81.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  2e78458b9ea32f25b7277c8e94dfc19453ba00520588b165f5d55ef0da801939  rust-std-1.81.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  92d4160b5fb5a16ae0f2be18f1e25ce201e0c80801cdf261d0f416157cc4182d  rust-std-1.81.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  d7855f721070a6fb283993a13f0120508636c516d05614024fc1ed5576cfbfc0  rust-std-1.81.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  e06c5b4d942f139f5ee824612b639a6212fff05d182ddb4a895a5767ed22ce20  rust-std-1.81.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  6501025d22ddd9909d5819867e1fb2026f6fa9510334eaac51b8b4e566aea23a  rust-std-1.81.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  ffd915504e7f52384123957d1a2d7044061d21c8927cf0d2a2222723d8250535  rust-std-1.81.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  9c182129b3079d6763f3f8ba693a51919dc7d994d8713ba3f5207e557aefa153  rust-std-1.81.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  700628d3b47d8f65753cc255eedf8627dab5c3f39e82b2e5743607cf6d51084e  rust-std-1.81.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  91ebf62a1f95047b93d4a4fec280fb4897cc7921633fd55f5c5a3aeb2b140bd6  rust-std-1.81.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-i586-unknown-linux-musl.tar.xz.sha256
+sha256  373c4c1cfe8c5e9b029fc555b678c0947220d021f1456cb9176b41013c2e9b21  rust-std-1.81.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  4ed9085460e444de9dee246080126f5e73062802b99aaff620d2aa827f60d972  rust-std-1.81.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-i686-unknown-linux-musl.tar.xz.sha256
+sha256  45b8fa18f0cdba725120ce2879f3e5d8218f0fc6c66594e347cf2c6453763eb5  rust-std-1.81.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  3b3473de46f7ea268130d8c72140dacab9118b2e8611fc0e23ed99091f25eb45  rust-std-1.81.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  665f3c0a8752f8e5d973cf9b94e5c1be94954178ca8378a318b6e21e7a7b370c  rust-std-1.81.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  5ba237cfbd18806bf77fbe8bc31b14a17f3d14acb30a022955cf047eb8d41056  rust-std-1.81.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  9882cda0a5547405e64357a4964d525f46d1395f85b7e7b6e69cbd4dbcd46ec3  rust-std-1.81.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  5549622876714df21235aa6d26731f31c37a7e1629a3f6c5262dbb0b1f10038c  rust-std-1.81.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  194a3c04a2390b1e07fdb114eb2c48e962219f0a1b710e2120a9806963a2520b  rust-std-1.81.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  6ddf80f254e8eea9956308ba89fd68e1ac7885853df9239b07bbc9f047b7562f  rust-std-1.81.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.81.0-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  3f2e47fff9320888993139fbd98f4bb44faf9355b25904f36a24a9808ff80240  rust-std-1.81.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 84a696f747..31c7ac50b8 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.80.1
+RUST_BIN_VERSION = 1.81.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 121676ea24..5dd32d432e 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.80.1-src.tar.xz.sha256
-sha256  6ab79b70dc57737a1de378f212fcf8852d67fe6cf272d122a15b3ea13be77947  rustc-1.80.1-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.81.0-src.tar.xz.sha256
+sha256  36217ef7e32f40a180e3d79bd666b4dfdaed49dd381023a5fb765fd12d0092ce  rustc-1.81.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 3159916623..adb0a65580 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.80.1
+RUST_VERSION = 1.81.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
