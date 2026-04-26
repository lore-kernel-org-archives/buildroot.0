Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1CFFF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 08:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04A0D61739;
	Sun, 26 Apr 2026 08:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCTxiC2lKQNK; Sun, 26 Apr 2026 08:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD292616FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777190421;
	bh=0HWavFsCWX2n5X/Ct6eWWINSWMr6/0ib0RKQFjdedws=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F6mAfX1fSXvjv1zjzRVwrGzWoP7XFualHEmgC5HVwkCml0+p1WREb3dF8FElb7iy3
	 lmkHZW2UFwEP4Vomz9nQ+sdQnLiHv1FsusfDPkPtKl23dqFXp0jeBZAXSs22h8E+vD
	 pHVPHJBm83VslOj8cLSm0CXEkmRUAXAbRRSzNT8WK4/Xv5yR+iMSiqIm5uz71kjEL4
	 83/3ECAsKqancVmsCHB81ArnUDutUXkigL3rQrHjmhLH2HCUU2R6Y0+iRtGBGxB9EI
	 fIQ8q70zvJa31LGBYJVqA0/QZIYjwyXWat3gVRgsFNq5HMyOmjh0uWgYfnNx378CA3
	 WiI3GXraesdEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD292616FF;
	Sun, 26 Apr 2026 08:00:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 107F82DF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 08:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F29EA4032B
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 08:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myVOHr-CUeAd for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 08:00:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4462040058
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4462040058
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4462040058
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 08:00:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5117FA4C0E5A;
 Sun, 26 Apr 2026 10:00:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60920)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGuPV-000000003T2-1OrQ;
 Sun, 26 Apr 2026 08:00:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 26 Apr 2026 10:00:13 +0200
Message-ID: <20260426080013.607198-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777190414;
 bh=3ucdpi6U1Br9bM+R5QrP1tji6bSaIROdjy0L8H+1VDc=;
 h=From:To:Cc:Subject:Date:From;
 b=pf6CJuxmist2chAtAyhwftqSLm3W+00w04p3FajVuvZtJw0lXTuTRD/znAIr4BrRC
 pWIODF3t5IsSmp9VhXZ2jqESGOveYnwCyGueZvf8enhpHvhdcg0e929WBh3FYtSOx6
 BXSS9qq/amYwnLpz60sbF1ZuYiY1pQsxqMWG2YKoqIvMIAhA4OwwLf5MzjYNSOgne3
 NKLRSKZA5RYoVJFbcvK6AGPpPqBH+OOwYUqP+8ySW5xtxdI9pbuQH244IqOHBSCOX9
 IjTS5hZFhKieEQ8YWl7y6C7PaS+FtR/Fo7nhWBb1Fe+diooDTJw2+x2JDjT/GGY0NM
 KJBatRV9eIm/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pf6CJuxm
Subject: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.95.0
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

https://blog.rust-lang.org/2026/04/16/Rust-1.95.0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/rust-bin/rust-bin.hash | 132 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 70 insertions(+), 70 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 00621d01f9..c63f74a754 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,72 +1,72 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rust-1.94.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  bb1267e956ef7887049236d26b37e987da383e190c7d95c80731a302af01b650  rust-1.94.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.94.1-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  9d9145650255966678abe278eb114995fee01226c9929fd5cf90ff9298c41e93  rust-1.94.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.94.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  2d259911e14c0841f60e3c408a5a8e0e784cb0ef08697307262a5ec39e156271  rust-1.94.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.94.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  81e21bef0527f16a836fd4c95f3572d0cf7f32747086bf1ca33be31c10ada3e1  rust-1.94.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.94.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  d85412273df35f667f4e634a957c3e1c909dacd95901e1a488b4334035e1c422  rust-1.94.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.94.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  e89ba1767d1ad0ec5873a8cbd13d18c149d5c3462946db9d6ca402abe1eaab4d  rust-1.94.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.94.1-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  0214b912f36fd72c769aa67f7cd844d500bdf2f9dcd1955e5e8bcea6b8cce955  rust-1.94.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.94.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  294b3d81fa72e62581276290c60c81eb8b58498d333d422ca1dfc432877d0c40  rust-1.94.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  2be613d5525a4ce8b7e2a1a55beeb64198314507be0d2da5aea4fd166cdde21f  rust-std-1.94.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-aarch64-unknown-linux-musl.tar.xz.sha256
-sha256  f9192506a2bef2d2b79a1865200c9df3d4da598ba6b72af978fe0dbe8a2dbfac  rust-std-1.94.1-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256  522b0617cd306831b0d3f48cc9df8ac7eca24270fa88fba6f10e5a2b430336a8  rust-std-1.94.1-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  386964a6b9e85aef7b93a0b5c682339ec5628947c29076b7459c934fbf8fcfda  rust-std-1.94.1-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-arm-unknown-linux-musleabi.tar.xz.sha256
-sha256  7b49c52a1b98fe17a13cca927bce2be164aec8cddee7641fef1f51e68a6d23e4  rust-std-1.94.1-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-arm-unknown-linux-musleabihf.tar.xz.sha256
-sha256  9039316c3ca3556cf9ac9c708b72de33104a63480ab7f2113b508d2bd3acc744  rust-std-1.94.1-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-sha256  e51557389b834a60b9d65ad7041969293a25d92706f4ff1251246b4a45ffe3bf  rust-std-1.94.1-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
-sha256  1e3906a6ee17703bf6d710340c20d2a90c2204b2b93ae97fded37ac2e9744894  rust-std-1.94.1-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
-sha256  a322d260868c8417c54d6fcc688e9e2ab96f9099ae3234e83e092cb3a152b531  rust-std-1.94.1-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  9771f445dbfb98e5c541620ab9f132f1014b36a75cc3fe02a2ddb127648fda0b  rust-std-1.94.1-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-armv7-unknown-linux-musleabi.tar.xz.sha256
-sha256  46d13262e587b1dccaba86cb3a746d236c46dae6122a350426a1b6ed8e3e8421  rust-std-1.94.1-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
-sha256  c45faf161e256b8f0d0e38c7049c2de9d18504a6ce46649c4c42997c5d83150c  rust-std-1.94.1-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-i586-unknown-linux-gnu.tar.xz.sha256
-sha256  025015d2be08032e7cdd3b8549130cd6fd6beec8d7ecff192eea8aa7fc1453e5  rust-std-1.94.1-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-i586-unknown-linux-musl.tar.xz.sha256
-sha256  e4089c17915dc45139bd2f85a4fe3f1eff7a4db6ff197a4d8de87b2d8505d865  rust-std-1.94.1-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  566a17a8b28ada847bd3dd16224ee2d079886695a7acfb1bd15a3c605c9e3492  rust-std-1.94.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-i686-unknown-linux-musl.tar.xz.sha256
-sha256  6c6cb3cc0fb10989233c3a67b6a46cf7a8438211e524c79fd7868e5b844d3d4a  rust-std-1.94.1-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  66f4079ae62e34d62e82fab05cb1e3038cd85311e6e5cf5a476254ef278fe72b  rust-std-1.94.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  1ffe28904e888f7884124f08f940a330b314a1c42b502c6458604dd7cd852e82  rust-std-1.94.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  68060c6b0716eb9ab9aa0f570b508414362f509e29155b796a531c7e1c9543cc  rust-std-1.94.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  8e223e480e8bb25aa8fec3bca936cb6343098b0af5b59a2c40abd5cca51aa3ab  rust-std-1.94.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-riscv64gc-unknown-linux-musl.tar.xz.sha256
-sha256  de9fcd9fc4e710ec74108dc3237a78f24fb4c1c6fdbc3a70682e73589933e5e5  rust-std-1.94.1-riscv64gc-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  391a713446c2ef5bccc3f90058b4eff4df42f8c996c399bb760a1565adfeb193  rust-std-1.94.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-sparc64-unknown-linux-gnu.tar.xz.sha256
-sha256  028e4a8125a3d996c72d85488dcfe4ab1e84b8d45f16478cc757bdd1d06748ca  rust-std-1.94.1-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  74109ee2c19098f1d7122087dd338a8f643203b3ce678c9d58169db733e17a03  rust-std-1.94.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.94.1-x86_64-unknown-linux-musl.tar.xz.sha256
-sha256  5a233ab503d58a3fb65bf7ecaa1b82f821f799dfd94a2613215317097ad43547  rust-std-1.94.1-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.95.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  094c9c36531911c5cc7dd6ab2d3069ab8dcd744d6239b0bda1387b243dfc391e  rust-1.95.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.95.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  49954c2ea9d36fea90169b350734b0eb4f53237f62274a73c68f315dcceb8fcd  rust-1.95.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.95.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  5a0332509dae5f6a25f7b6d8dbaf7ff8389a091b5fcfa5248521f6f80c0bb3a2  rust-1.95.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.95.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  8ec8f0ce92eadf6e9f3388165de23e3752cf260073ab46e89ee197e287f8a9f4  rust-1.95.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.95.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  d301b5064ae68180ec1218b533ef0b26aaf83bba20720a0cbfdd1ad09f295133  rust-1.95.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.95.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  172b80cc2c600c2681f2a2199cee9f490427c2ba548ee9bd449483a0c34cd691  rust-1.95.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.95.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  0f313ee40d8b94e7b86b9d0c02bddbae895cb8198e2cad4000e1e943452db1d0  rust-1.95.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.95.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  2e0338f18ecbaa4a0f631b9e80e8b8e26bb6fe77dd5454fba8a70cf96c1e84a1  rust-1.95.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  3a21b271b1ff973b94d69b25e7a39992f9fbcae1ab6d9475844a23e6ad3908ac  rust-std-1.95.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  f6710416ed9a7d5cf2a15efa761eb79a1deeb43f9961bbe05cc97bec4ef9064a  rust-std-1.95.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  f6cd592dacdf41f724ee90a2f34db028e37ca2a7fb26fa86e93e8fd68e24d066  rust-std-1.95.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  fda8408ea17881c6529e27e58672d6c628f786cad557fac92856077e7a610239  rust-std-1.95.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  62f21fabc209fd0de53156764fc426da74c59525bb60cb4c1c3ffd1be0bbe00b  rust-std-1.95.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  2842ce67f7a4c68c6e8b30ad3bb36484fb745edcc2694b2a36bf0609cf758044  rust-std-1.95.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  5b2c1ba1e35f7ecac1ab7d7a6ffbe6da466d244bba747e64547eeb57c3b07715  rust-std-1.95.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  4c23aa73d76c0c5f52283c739f197a4f757926079983ab10d914544de47a5dea  rust-std-1.95.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  e23454d6ca7fc3f5eb7cf9241572765176d86e9f45d4f394de31a5fd794e523f  rust-std-1.95.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  bd319e18ca2dad0450f76277874d56356330da536be8cf271509f8e6f28ac6de  rust-std-1.95.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  a49bc987e0531800f92825ce61402b5734ea747caa8970d3373506742ed7daa6  rust-std-1.95.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  77f9aaff4669c076edc96cdb99dc21749d2c692c862232b52176572c289fe671  rust-std-1.95.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  dc5187f4062d617561e0d7885ecd4d4d3f995435b38d8c53d6451b56808946b8  rust-std-1.95.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-i586-unknown-linux-musl.tar.xz.sha256
+sha256  acbdc18dea9bc942a1872cf8c85b0ed353323f6a9c6757e04f837dd9cefb6094  rust-std-1.95.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  527c5d5249a7f77b48d3c9da3ac512d27b47f43d08dbe3c6f82a3d5b35d8aa27  rust-std-1.95.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-i686-unknown-linux-musl.tar.xz.sha256
+sha256  af4d3e7aabb63d39a7a2ff5435cc993b65ff38a2d2e23f1967e519037a1b0455  rust-std-1.95.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  59e0abbaa246502521e37c55b8d6cf88d5b8a697b0c70c61ec189937308f7246  rust-std-1.95.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  cc7fb9aa289ff1756502ae16a05e2885289165f01ed94a7c2db6576b3dae74a6  rust-std-1.95.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  2370d9266051a0b23346d42e43a00f91b2daff22a963fb03e28ae50cb0b76c50  rust-std-1.95.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  50fe7869e166bb4c990a0e1664366b1ffdbe669664b7663cd03c079bd0efdcac  rust-std-1.95.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-riscv64gc-unknown-linux-musl.tar.xz.sha256
+sha256  e01bdbf5d6fa3e529671d49e87ba81dc9612101144f3ee5a0e1de3c48f27b47c  rust-std-1.95.0-riscv64gc-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  31978c1286afff9a0bb7f01c2ae4a39f40727b6100a82b6d934f146b06cde510  rust-std-1.95.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  88619b2413d218c119a2060e583a9e835fa5f9cf6ac038070eec10b02c191056  rust-std-1.95.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  047ea7098803d3500fa1072e9cee5392697e21525559e4458128a2bf874aa382  rust-std-1.95.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.95.0-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  aee540abf132920f791ef781489851a078d69dff493fb628d49c1d573f92bb3a  rust-std-1.95.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 150b01aa64..a1be5f964e 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.94.1
+RUST_BIN_VERSION = 1.95.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index fa07d6cc92..039ce7071d 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.94.1-src.tar.xz.sha256
-sha256  174fce10ce012317ca995810296d8af199318838180b03d68a853e0f02d4b571  rustc-1.94.1-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.95.0-src.tar.xz.sha256
+sha256  62b67230754da642a264ca0cb9fc08820c54e2ed7b3baba0289876d4cdb48c08  rustc-1.95.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 62a757e465..8fb6d8d272 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.94.1
+RUST_VERSION = 1.95.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
