Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49540C3601A
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 14:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 628AC84474;
	Thu,  3 Apr 2025 14:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4AOcBq7R3EAa; Thu,  3 Apr 2025 14:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F4A28470D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F4A28470D;
	Thu,  3 Apr 2025 14:16:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B963117
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 14:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E71682F40
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 14:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7eSQD98mfkPR for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 14:16:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7DF2782F8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DF2782F8A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DF2782F8A
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 14:16:00 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso10514225e9.3
 for <buildroot@buildroot.org>; Thu, 03 Apr 2025 07:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743689758; x=1744294558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U9MNqHQCKRIglSBM3zTloP6/4S4NLPilJFn1ULryu5o=;
 b=cmubY3M25CDaez+3aMULBxYjm6HbziwlnWjxvcx/m84CcjuQXYask8767U9Sa64EiI
 HO2MhBhwWsOBd1PSfiv7WfAOFrg3EtvVPLPQCtRJmzRNwNeB7RGMpycT9+YhaMywubj6
 KX3P4r44glPY06iGhzDvoihi9AxJP3moDYGHK+R8xo0XT1AxFeZFKam2svhEWSkQwJMv
 uhrxqysTm6/qEXiKX8DVOhz+6qG6LD/542qRrQwDLiG0C5L6DNLYIRAWGpEmoTnaLSnF
 A6ufYywSzx/omejxU2W9/FFlmxxZoBEYvXoeXRXX5Incr5Fy4rRKE5ExlUdLO8PCcggP
 s5EA==
X-Gm-Message-State: AOJu0YzjDYmzo44rpWpD5tVR4atdLOTIs2LUfa2WNMhW3aZuUH/XPjLc
 dWCbQ+ClTd0dkaMAt8bDoMBGi/TYkVIDbqqWqwyv0+uG9aNseuGvmwN+HvNavn7gtCE08FV9FFY
 8
X-Gm-Gg: ASbGncswnYPhzfdn6dm0+MVL42RBZmwcPZSMYuQyeA+Dfb3rTjkZU7K/1SFB2Cn/8+m
 ySCprIEPwOkM1dwDrTpKW6BP6UJ3FgT0QerWEiHV13AQKIYJ4mjhTRKQaXacnJRKgW0DMiTXbjQ
 jdIBOznUlra3jjByK5tZPrFb1uQLBftpzRliozPEzN+gqer5Rm78o/Gz8iiJki+VZttEto3gOZ1
 F+SC0ypyTUpLJBNhOu1vAdFOEmwDDD6goa86K3mgol4EJ7f9j17zfnrGQ/wospjMv8QIL9dBgAP
 MFpavFGFbEJgKU2kPTrNBEJzA6nrANRBLfrkOxJkBqfxxeJlynAloH9emfM1xYEG/BEtXxqHJli
 54OS3yDr3aGBlspSc6nhonX3BO7htJBBukUsenm0=
X-Google-Smtp-Source: AGHT+IGDievDhYoCCl8VOV/qVow1Y0vBbiIrhn2VDCdL8UCoJPFCT9y4S4h4SixyHolb0hEb1WyxHg==
X-Received: by 2002:a05:600c:198b:b0:43c:ec28:d310 with SMTP id
 5b1f17b1804b1-43eb5c20f9cmr72774665e9.10.1743689757727; 
 Thu, 03 Apr 2025 07:15:57 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1660bcesm23013605e9.10.2025.04.03.07.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 07:15:57 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  3 Apr 2025 16:15:38 +0200
Message-ID: <20250403141538.3769560-4-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403141538.3769560-1-elmehdi.younes@smile.fr>
References: <20250403141538.3769560-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1743689758; x=1744294558; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U9MNqHQCKRIglSBM3zTloP6/4S4NLPilJFn1ULryu5o=;
 b=h/AAYJu21f1S70r8pZgm6wgwG1pd5qOhTOUUNnnFltqmIguwoPX+5rmWZI08Eju62b
 PuCMywkv2fHW2FaASyaUrpZ27waVizHhB66najudI2Y0g+09H3uChvBbjpaLzcC0dytV
 x0KWQQUt2aiYfX47cU9XtNtwWPQcRHJrj62a0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=h/AAYJu2
Subject: [Buildroot] [PATCH 4/4] package/rust: bump to version 1.85.1
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret <david.pierret@smile.fr>,
 Danilo Bargen <mail@dbrgn.ch>, Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Torben Voltmer <mail@t-voltmer.net>, El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bump rust from version 1.82.0 to 1.85.1.
releases:
https://github.com/rust-lang/rust/releases

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/rust-bin/rust-bin.hash | 128 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 070a0b9779..938dbb4fc2 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,70 +1,70 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rust-1.82.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  99acf175be33bd96ac82d644125d0e2acc6962d61ee64851edc7d8ba3bd23ca4  rust-1.82.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  34669e600d6ee7744e59f5d4542e2a539a9b13f099a4533f19a46e32a0868053  rust-1.82.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  a32342217fb82167fffcaf0c7e44ac6e32ce5fa63dc3beb42439ab05f561a882  rust-1.82.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  0608a560ce266e8aafecc2b9908e3094f5ef1e135460b1f88aa614e5bf65aae4  rust-1.82.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  048f637a547522ba0081c5772fd3196dfcc2d0d24f442424f168b5d55f961537  rust-1.82.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  532190c3cdbdee9249bcde648b1c61b092bdd8885266ba9edd6df6824a454958  rust-1.82.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  71428fab3cf18cfe4b4486a11d292ec157fe8b0c904fb4fae34db6539144c286  rust-1.82.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.82.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  8a6bf24ca1fee2bd861590431c7954674191a0c0dfa0af4169731bc1459cf58a  rust-1.82.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  1359ac1f3a123ae5da0ee9e47b98bb9e799578eefd9f347ff9bafd57a1d74a7f  rust-std-1.82.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-aarch64-unknown-linux-musl.tar.xz.sha256
-sha256  a364a4b506865fbd56aac67e2b540a824cd9abda621bb38a8b678166d33b8ec2  rust-std-1.82.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256  bec0b04e6e1e183fc21521e9cc2dc89be41c3ccacff3fb5ca48419b47af94fe1  rust-std-1.82.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  fa379cc69b23782cbaddf66025889bf5ca9c32ddb60766fe158b43cfe49a2b2b  rust-std-1.82.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-arm-unknown-linux-musleabi.tar.xz.sha256
-sha256  cd5e1577c1772ba309d003c49a2df2f06ccbc1cd1bf3ee9c1cfada210979f26e  rust-std-1.82.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-sha256  86f2242347c1cbae354cd0ff66c9bfe735f1b371c189aaf0157a3b55004590cb  rust-std-1.82.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-sha256  e3c74773cf6f09a3cda1b64c3058f5a88abea0a98f172de895c0ecf7b7b760b2  rust-std-1.82.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-sha256  df0a3be0e71ca8aa8be4915f7142661af32411949a75c1729a314e6ab5c78b0b  rust-std-1.82.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-sha256  4d692c1696ad49285a45bc5f636ce9c13ccb32b99ed14be428eaaf1e0cae6b33  rust-std-1.82.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  34d258a07c9051803786405731c05fb19f7980e13308acf4b16e8c836bd73ac8  rust-std-1.82.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-sha256  1e318fcff01379cf4459f02526309b1f086530004be4fb5e00988ce7b1d821f5  rust-std-1.82.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-sha256  bf93c79abc56bfcc3d48f2defcb0ca720405d01a50ba08d6d24830ae034bbc2d  rust-std-1.82.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-i586-unknown-linux-gnu.tar.xz.sha256
-sha256  f56585c55664898c7484f4b7bd139770c99d7b4da6e56e4016f71cb053b1aee2  rust-std-1.82.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-i586-unknown-linux-musl.tar.xz.sha256
-sha256  711c03ffb5bb53fcc97278b015d1ea9f503ce826ba390855f576c0e3b77c4bdb  rust-std-1.82.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  c7ebb02b6ca349999b3b7dce768efaca5e0d9060f55397523e11a64cd10a9405  rust-std-1.82.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-i686-unknown-linux-musl.tar.xz.sha256
-sha256  3c5ee32afc4b83313832c7a78175c05a5e568e6053fde7e65e2a9b19ce104c10  rust-std-1.82.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  827989a42526206199025f764d08d7cd319fee58bf2e08dcaf75df9ead6f094e  rust-std-1.82.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  cdfadb39f1325319de8152504413f34671ac09fa7ecb97f967c25ece3645bc5e  rust-std-1.82.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  4954a44305622b8f68ca088138b9a69432e350336da1a415a282ce148beb340d  rust-std-1.82.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  5649f9b4e107d6c5f72fb7f82cfe15370b80b8d983670602e02e0b615bc6dc88  rust-std-1.82.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  454b83668b57bdef28fc49aca8fd4c38e395b49011e653afdf3f9bb2dae8aa63  rust-std-1.82.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-sha256  87db52d782131a8817b76f65eefcae2c24a49b2a6f19ed9bd4699167305c22aa  rust-std-1.82.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  2eca3d36f7928f877c334909f35fe202fbcecce109ccf3b439284c2cb7849594  rust-std-1.82.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.82.0-x86_64-unknown-linux-musl.tar.xz.sha256
-sha256  1c99a4c81f51b687ba55746c7d3f19b5b860fe4eff604d3c7d803e08c9cc89bb  rust-std-1.82.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.85.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  6945d648b19f62052ee619b05e79e8ab8a2e18b5d5310c6c0899d552669ee61b  rust-1.85.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.85.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  ffb970103d4927f8f422e7356992dcbac46614cb6eb80552bea02fbe7c5e597b  rust-1.85.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.85.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  7f917326b1523a17c44c776d307b1e754d644ef25d6eec5c7ae8c7152fe2af08  rust-1.85.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.85.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  9fff27c268f09dbffdcdfb8e11cbef25ebe1060034d7c460b3d35d56efdf2a1e  rust-1.85.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.85.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  4bff68e9398e52bcf29bcb8e7c932cfec9d00ad13fc20a64828b8e383aafb4ff  rust-1.85.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.85.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  adf436ac7fa1961d7dbaf13a71d0c214dd73ac722181079a24e910731be2e742  rust-1.85.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.85.1-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  2f49ebcb84ec062ee88650780f3740487b7c5f5b98526e9fe9fd15fc0729b562  rust-1.85.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.85.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  912c76f602f5f630138fca2388b2688c2c1aabcf823d71890b2b9155f743792e  rust-1.85.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  760fa132058ed45a67d0cd7d04638fde86fd26adc563dff1a3e6d97d300446ff  rust-std-1.85.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  6c43b9165de9fd3b92ca371fd09cf725846557e2a8881b7b2557f674fa5e08ae  rust-std-1.85.1-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  b559f8fce44a6cdb0355df2ccb1942b13676ace56b18f540e451d6f5f7645c5e  rust-std-1.85.1-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  869ef7bff2e01767eccaab4d1671e36c91deacde820c6863a91c7a2db727e2bd  rust-std-1.85.1-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  bc04b3d6e5cf1d627c5d268047086ec19dfd839ed5cb0017205db0ee739e83af  rust-std-1.85.1-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  4bf2ac797355afde2b5a9adf57c95ee50b89de0042a3aba5555b77b7f1647c95  rust-std-1.85.1-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  2d1f6edae3edb51754d0cf770383c0617b1eb348295bc2b560a229d79b69c10e  rust-std-1.85.1-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  702630727b5d65f36a7b86c1c5719d2b5bc800c602cda379a753d24aedfb6517  rust-std-1.85.1-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  cc168b94f3af95d8ecf6af664c5d231fbcd36f1386525c852dd24af5807b7c01  rust-std-1.85.1-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  994c3c192dd312e422ba0008bf97b3f121692658658390882558d34d29927d45  rust-std-1.85.1-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  a324c48e2a67ec6070315e754191376be1afa19da0655c911126a79d35089144  rust-std-1.85.1-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  cbbfb908af816a089bddf626223b431c3581aff42f48d71289f616056b70719c  rust-std-1.85.1-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  902e6cb3983d6393d7f72ebb5d2dc8a019fc9567b581bdbd01cf17ff5a4725aa  rust-std-1.85.1-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-i586-unknown-linux-musl.tar.xz.sha256
+sha256  b970738b3555678a92549f83a871a6e6b7fe95843d03df45010369dc3f88a80a  rust-std-1.85.1-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  385f2b7c629fc23d85ef02f95d1d126bca33c27abeb405641baa7a9fd3af9000  rust-std-1.85.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-i686-unknown-linux-musl.tar.xz.sha256
+sha256  50367b29244a66e14d973aa4b803c0a2bd8ac04941b80d9511edb37c1ba24cfc  rust-std-1.85.1-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  b12bd14486089647fbd3ba8168412bca9119e5e09d8fc22dae2f9e2942782f5c  rust-std-1.85.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  374d85d193a1cb3161048ef70098af813c89d98b74c65125537f09c824bf2e89  rust-std-1.85.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  815687ee2f86b615ecf6d540c9a4ff06162c4977f5c4482dbd52c7f5f64de872  rust-std-1.85.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  62a4990297ee46563d9e5a42a31353b127c316dc3fe021079f4a6c4c94565d46  rust-std-1.85.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  d4de6756b622c51875dfe80fa7245fe0192069b2f42f50d14fa37c7dd2fb5f35  rust-std-1.85.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  aaf093d04a8bf4e13d8bbbbeb4f2360bbec12e6679ad621b3ce16b7145aea7c7  rust-std-1.85.1-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  0aaeffba85359503f874315cd08e0ae8490275d14b41470d36d4fa57fd085916  rust-std-1.85.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.85.1-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  a2a99b60e86214a836e53396f3a0716a48724902b9dd8c69f146897efc76691e  rust-std-1.85.1-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index c14ca7f88e..276d720fcd 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.82.0
+RUST_BIN_VERSION = 1.85.1
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 19af66e2d6..40ade06170 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.82.0-src.tar.xz.sha256
-sha256  1276a0bb8fa12288ba6fa96597d28b40e74c44257c051d3bc02c2b049bb38210  rustc-1.82.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.85.1-src.tar.xz.sha256
+sha256  b1fbf809efe9f036939401e142631c201a53bcf43ec1696bd9f5290ba236a266  rustc-1.85.1-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 6481e40561..97dfb975d1 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.82.0
+RUST_VERSION = 1.85.1
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
