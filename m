Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E56AF45A0D
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 22:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAB174125E;
	Fri, 10 Apr 2026 22:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BQgrEAjpauhP; Fri, 10 Apr 2026 22:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D186740BDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775860952;
	bh=DdlMSAdr3vVNYeQ7Mr1P16dlghHUEsIa1bbyu4qeUFY=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=A9KgofXneaViQwQ4x/S7ZUHecx3t29Owbb1miiI1TSalSgho2WMP8eYP0Xg3aDI/l
	 9WzQTPOcgJz7Mzx/q7yUGaL2KIxS6HVf9YXr1IoqW1rpFgP+aKWvZCofktawemY0Kt
	 9CI9pU3V1zRkYkd6oD+oN4CMUdps/6LhVnPP0A/8GC5/Xr1z181JIRsaunu/nQc5du
	 X2JqljAoq09pA0sQyOuoebFOmYYdKBZG1w9lEjY5b31E/75SdVGYmPT0AV6BcqMnu5
	 ZGsb+AOwDQgxQIC9IX9OR03vpU03gMYgWeoaxo4qz42B3hdK5m1hHHRFF54T6w3mlK
	 XUsViNa8DCwIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D186740BDD;
	Fri, 10 Apr 2026 22:42:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0AC8EC
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92D8083CE9
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7Pnp__nP7hE for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 22:42:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=nicolas.serafini@flyability.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1A3983CE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1A3983CE7
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1A3983CE7
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 22:42:28 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4888375f735so24568455e9.3
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 15:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775860947; x=1776465747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rQiLClSHIo0dQQCKVVSmYGxAyNa2tTWYlEPaU11tsu0=;
 b=Qxp9tPUh9LZORKakqynaOZ/4J2TexLqMss6CqR+ytnlMo5CbG88tkGmajIcCUgCxhG
 TPB3PLZvI8r5DwHScPsFs9BOOI4MdX41I+zEv6sQ+GdC+eScOJVf6TNYCj0UyjGO3cxA
 kDFRbaeIMWXZHiADWCmzeSbhOmjtXJDk3yraKX9Con4gfFkrnAzbK8X6G2GR7Hj6jgvp
 zFkezBeEQtgrLVrvG6dhGZbWTud4VmrFyQ/BcY/Y16SIlcbvfwABO/Q0K5UF4ScTYBQB
 oi4CvsAIlbDVz9P/f53mXBZOwOLTGF6jj+msyyn+aR2zeOmwzsM0mjBI5bumEh4/aOAi
 lZNQ==
X-Gm-Message-State: AOJu0YwWiYiPjid/o8Vr5ilr7zYzaHd8jxWUkNEd0s2c07t0l0KRzKad
 BHmfZnJBIB8Uc7NDzgtzwHGwuElNijP4VPLjhB/E7Fk4kYzgADB2IdUiNE5XmfLIKDAzV7fM5er
 +ZWmXlPZazg==
X-Gm-Gg: AeBDieufnve3FLA6LinJxeV8NRURhEYBh8FkxmN/CdgtGDB0tevrgMhb8ZB2eTqRxiq
 cbvSpvkkN/SOTV9EPTVa6rgEx/P3a/IV/XG+lfFrkuk/c4cqEAFQRqnlFEq6s1dFQDG3ZmBdzGt
 N1Buq1qV8Za5DOJZ0hf7aqRkKdsxqpJ+81zCJDA9y73frx40ul2uoHsQ/D7lE124z+qlzOESHej
 f2HviW7vRl0W2XxfoGR/fxYy1KKoprM0BRigdwy3lZQsDmo8jIwfRn5776VJ/TNKoStHpZZ3JV5
 q4jc6XHoR5E4dli+OXLr0J8EM2m5eOIKdIb0PL6OtZbvP42wWYkxEJABQav374sigJbmKNc8XKc
 XZv7ZvnXyJGScCW7gYmSB3Q//PRG746br83lhye4y9IcPoJMazjIhaHwF6sdsdQvrezlv12MIgF
 vUWwHAC3Jo34hsSMCWEclxfx+TTRRsk28k9KSQjGwQ+2igWyJcJei+RtU4FEeejA==
X-Received: by 2002:a05:600d:d:b0:488:d243:8da9 with SMTP id
 5b1f17b1804b1-488d67b8cf3mr50008475e9.1.1775860946520; 
 Fri, 10 Apr 2026 15:42:26 -0700 (PDT)
Received: from nse-t16 (adsl-84-227-54-58.adslplus.ch. [84.227.54.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e50015sm11668479f8f.27.2026.04.10.15.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 15:42:26 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 11 Apr 2026 00:42:18 +0200
Message-ID: <20260410224221.1185631-2-nicolas.serafini@flyability.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410224221.1185631-1-nicolas.serafini@flyability.com>
References: <20260410224221.1185631-1-nicolas.serafini@flyability.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flyability.com; s=google; t=1775860947; x=1776465747; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rQiLClSHIo0dQQCKVVSmYGxAyNa2tTWYlEPaU11tsu0=;
 b=kVEdtgrw7nFimHrHg839jkZER8UM1spA95IQmlh0PtC5mnOTfd4rl/cm8gOjotpSB4
 apUxHgd+KjCjS2bilYeHYY4ojAdFFNQuRJtZJU4bMfltz+P6KJP7N3UM8OFd1A6QChR6
 WuRCGREbNKrjbm4MWnamIRy5fsLfN23WoIVZ0OlKqV+xoinEw8Xq24QdVc8qrhBCUHD5
 wpeG9muMwAPCMLJhCQeF+BUlLHJS9ulQqGG5QsACw3XcfWm25IGn65bs7CXpbzqcwSH0
 zeo6xYFjD+kzsYnO/oCw21rmVnJdzlGbzfUqCAcW0d9bDmub414SefHq0sojh2Ymkwqp
 fQuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=flyability.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=flyability.com header.i=@flyability.com
 header.a=rsa-sha256 header.s=google header.b=kVEdtgrw
Subject: [Buildroot] [PATCH 1/4] package/rust: bump version to 1.94.1
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
 Alexander Shirokov <shirokovalexs@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://blog.rust-lang.org/2026/03/26/1.94.1-release/
https://blog.rust-lang.org/2026/03/05/Rust-1.94.0/
https://blog.rust-lang.org/2026/02/12/Rust-1.93.1/
https://blog.rust-lang.org/2026/01/22/Rust-1.93.0/
https://blog.rust-lang.org/2025/12/11/Rust-1.92.0/
https://blog.rust-lang.org/2025/11/10/Rust-1.91.1/
https://blog.rust-lang.org/2025/10/30/Rust-1.91.0/
https://blog.rust-lang.org/2025/09/18/Rust-1.90.0/
https://blog.rust-lang.org/2025/08/07/Rust-1.89.0/
Signed-off-by: Nicolas Serafini <nicolas.serafini@flyability.com>
---
 package/rust-bin/rust-bin.hash | 128 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 7f9d2f6339..b1e4ef67a2 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,70 +1,70 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rust-1.88.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  d5decc46123eb888f809f2ee3b118d13586a37ffad38afaefe56aa7139481d34  rust-1.88.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.88.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  1f28a28b025ab2637f479f7f239c391a83319dcb89c53819c5a828fe4f92616a  rust-1.88.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.88.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  e685d4a1d4d616fbf2accf13f29f3dfa431e62b49125499677a7c0954afd216e  rust-1.88.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.88.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  a06706c8e76dcdd652b74d8737d4d99c20991068520bca86712d3e6d94d141e5  rust-1.88.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.88.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  4e429d0c390032e556cea9a5729b8abc035aa421a1ad3ac232b63308705c14bb  rust-1.88.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.88.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  3021ad1c6f5c5d177546f9890acaac105fbfc211bfd4b11fc06156f85112df09  rust-1.88.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.88.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  96f49ff456bd5649f19f2165864f5588d1bb1f533b9da8b4e3c7b65d61b28a7f  rust-1.88.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.88.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  7b5437c1d18a174faae253a18eac22c32288dccfc09ff78d5ee99b7467e21bca  rust-1.88.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  e9ac4ff3c87247a2195fcceddbf1bdeee5c4fd337f014d8f4c4e3ac99002021f  rust-std-1.88.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-aarch64-unknown-linux-musl.tar.xz.sha256
-sha256  b1562ce0836d5071abbbeaf52e3db9ce0d37fa432f5202b8f661aa4881b4c3e4  rust-std-1.88.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256  598e389223ebef13efe6ef8d4dc11da3427c3716f21fd089b9ec5afbec1bb900  rust-std-1.88.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  b5e1f168fa02ad57e1ace9ac3d379a9c95f816a26f12156216521a22e192f123  rust-std-1.88.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-arm-unknown-linux-musleabi.tar.xz.sha256
-sha256  89190b0de686052ff76418f67efa25ca83430f112737c2625d2911d0839cf9fc  rust-std-1.88.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-sha256  5aa9d94539b8e5dc02454ca5605c420d7e96c74e62ec53889cc27d2744edef95  rust-std-1.88.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-sha256  37b77f0e226f291f42d02c4d3011d53a4bde67fc4b49ae205fde80cd50b55d8a  rust-std-1.88.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-sha256  fe75a39a140e5ab430d17d6aed2b93b5c17735ece4c578629f5210d43512d6b6  rust-std-1.88.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-sha256  60ee3766f67d6404f8c9e77090c57c21fef7eca540ec0ab2f2cd2b28a21dca37  rust-std-1.88.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  f9e13ca81872019186a67c44919c017b1bfa80c1e2784caee81ab1f65f548b5b  rust-std-1.88.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-sha256  822c8dc77c50eaf4786c42b9004daf3aa05472b3247d11c02caf8bc1d408d67f  rust-std-1.88.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-sha256  fd6684c2454c2859209e1f9791d4f7bd5be4e75f599276220ba8814f94f331cb  rust-std-1.88.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-i586-unknown-linux-gnu.tar.xz.sha256
-sha256  7c9016ce85e24dde9d76c0a34061fa0fd6f742ea495dd1784804b60061b39627  rust-std-1.88.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-i586-unknown-linux-musl.tar.xz.sha256
-sha256  ab409bb848d7109005857e14cd200f5a07479b3c6b8c7fdda9325af61672a273  rust-std-1.88.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  ced56f7ab86496f6eb42d356841f9d0b625159eba65afd1913f232bb66d4b7e0  rust-std-1.88.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-i686-unknown-linux-musl.tar.xz.sha256
-sha256  dcd1ef607728bcc73bcd70341094a6fcaa1dbbfb01cfc48505c0e93b62394eb8  rust-std-1.88.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  891fe38736ca637bcd776f6d2b1822d761bd92305188482e45d26ab0dd84344b  rust-std-1.88.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  89cf8b30e0fae601e0603e41d5eaf58881729208cac83636eff89b94724b7112  rust-std-1.88.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  1030e71f755692c3429bb16829cca776c1ac372abbce3001b04d4e46b1e4f32f  rust-std-1.88.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  d446fc0d8e4ce985c2d21aa2adb6ec9fce8f7ebde85655200abd71e142b9a981  rust-std-1.88.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  df3144f87a22d606abea4dcfe88369fcd499ef2fc748724b47941308ae259a5d  rust-std-1.88.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-sha256  95be6d0dec8be07fa13313a10dd177e72df9737660c235a3e673bffcdd2e9068  rust-std-1.88.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  36d7eacf46bd5199cb433e49a9ed9c9b380d82f8a0ebc05e89b43b51c070c955  rust-std-1.88.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.88.0-x86_64-unknown-linux-musl.tar.xz.sha256
-sha256  0c42b63c18a6343851e0f27aeb5cff73146c86fc95bc4e2bf51b726c4311249e  rust-std-1.88.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.94.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  bb1267e956ef7887049236d26b37e987da383e190c7d95c80731a302af01b650  rust-1.94.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.94.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  9d9145650255966678abe278eb114995fee01226c9929fd5cf90ff9298c41e93  rust-1.94.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.94.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  2d259911e14c0841f60e3c408a5a8e0e784cb0ef08697307262a5ec39e156271  rust-1.94.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.94.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  81e21bef0527f16a836fd4c95f3572d0cf7f32747086bf1ca33be31c10ada3e1  rust-1.94.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.94.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  d85412273df35f667f4e634a957c3e1c909dacd95901e1a488b4334035e1c422  rust-1.94.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.94.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  e89ba1767d1ad0ec5873a8cbd13d18c149d5c3462946db9d6ca402abe1eaab4d  rust-1.94.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.94.1-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  0214b912f36fd72c769aa67f7cd844d500bdf2f9dcd1955e5e8bcea6b8cce955  rust-1.94.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.94.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  294b3d81fa72e62581276290c60c81eb8b58498d333d422ca1dfc432877d0c40  rust-1.94.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  2be613d5525a4ce8b7e2a1a55beeb64198314507be0d2da5aea4fd166cdde21f  rust-std-1.94.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  f9192506a2bef2d2b79a1865200c9df3d4da598ba6b72af978fe0dbe8a2dbfac  rust-std-1.94.1-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  522b0617cd306831b0d3f48cc9df8ac7eca24270fa88fba6f10e5a2b430336a8  rust-std-1.94.1-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  386964a6b9e85aef7b93a0b5c682339ec5628947c29076b7459c934fbf8fcfda  rust-std-1.94.1-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  7b49c52a1b98fe17a13cca927bce2be164aec8cddee7641fef1f51e68a6d23e4  rust-std-1.94.1-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  9039316c3ca3556cf9ac9c708b72de33104a63480ab7f2113b508d2bd3acc744  rust-std-1.94.1-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  e51557389b834a60b9d65ad7041969293a25d92706f4ff1251246b4a45ffe3bf  rust-std-1.94.1-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  1e3906a6ee17703bf6d710340c20d2a90c2204b2b93ae97fded37ac2e9744894  rust-std-1.94.1-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  a322d260868c8417c54d6fcc688e9e2ab96f9099ae3234e83e092cb3a152b531  rust-std-1.94.1-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  9771f445dbfb98e5c541620ab9f132f1014b36a75cc3fe02a2ddb127648fda0b  rust-std-1.94.1-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  46d13262e587b1dccaba86cb3a746d236c46dae6122a350426a1b6ed8e3e8421  rust-std-1.94.1-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  c45faf161e256b8f0d0e38c7049c2de9d18504a6ce46649c4c42997c5d83150c  rust-std-1.94.1-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  025015d2be08032e7cdd3b8549130cd6fd6beec8d7ecff192eea8aa7fc1453e5  rust-std-1.94.1-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-i586-unknown-linux-musl.tar.xz.sha256
+sha256  e4089c17915dc45139bd2f85a4fe3f1eff7a4db6ff197a4d8de87b2d8505d865  rust-std-1.94.1-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  566a17a8b28ada847bd3dd16224ee2d079886695a7acfb1bd15a3c605c9e3492  rust-std-1.94.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-i686-unknown-linux-musl.tar.xz.sha256
+sha256  6c6cb3cc0fb10989233c3a67b6a46cf7a8438211e524c79fd7868e5b844d3d4a  rust-std-1.94.1-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  66f4079ae62e34d62e82fab05cb1e3038cd85311e6e5cf5a476254ef278fe72b  rust-std-1.94.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  1ffe28904e888f7884124f08f940a330b314a1c42b502c6458604dd7cd852e82  rust-std-1.94.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  68060c6b0716eb9ab9aa0f570b508414362f509e29155b796a531c7e1c9543cc  rust-std-1.94.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  8e223e480e8bb25aa8fec3bca936cb6343098b0af5b59a2c40abd5cca51aa3ab  rust-std-1.94.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  391a713446c2ef5bccc3f90058b4eff4df42f8c996c399bb760a1565adfeb193  rust-std-1.94.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  028e4a8125a3d996c72d85488dcfe4ab1e84b8d45f16478cc757bdd1d06748ca  rust-std-1.94.1-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  74109ee2c19098f1d7122087dd338a8f643203b3ce678c9d58169db733e17a03  rust-std-1.94.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.94.1-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  5a233ab503d58a3fb65bf7ecaa1b82f821f799dfd94a2613215317097ad43547  rust-std-1.94.1-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 215bd84ad3..aef132562c 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.88.0
+RUST_BIN_VERSION = 1.94.1
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 7b22bb8c94..fa07d6cc92 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.88.0-src.tar.xz.sha256
-sha256  0c1dcbb4f762513d021e1a282c0ac58c0a423642b3a6bf581cafb5414df4193e  rustc-1.88.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.94.1-src.tar.xz.sha256
+sha256  174fce10ce012317ca995810296d8af199318838180b03d68a853e0f02d4b571  rustc-1.94.1-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 9999475c35..27b3c49db3 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.88.0
+RUST_VERSION = 1.94.1
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
