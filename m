Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D53CCF9F8
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 10:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A27F74224C;
	Sat,  1 Nov 2025 10:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEjaIMi4RL6H; Sat,  1 Nov 2025 10:23:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 768594228A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 768594228A;
	Sat,  1 Nov 2025 10:23:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D45A113C
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 10:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 838BF84EC8
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 10:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HH2ECdvrHCvQ for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 10:23:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D62D84EC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D62D84EC6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D62D84EC6
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 10:23:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b624.dip0.t-ipconnect.de [84.161.182.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3A74FA4C5610
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 11:23:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35332)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vF8lv-000000007RO-0slX
 for buildroot@buildroot.org; Sat, 01 Nov 2025 10:23:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  1 Nov 2025 11:23:46 +0100
Message-ID: <20251101102346.109307-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761992627;
 bh=ZgrQARtoArQcNu/Pf022QnJ88F3BsRn7mDuRdgB5gYM=;
 h=From:To:Subject:Date:From;
 b=ZftTAgWZoWGDu/m/rkGox4fsicPbZ1hGkFcKV3Nfa2TUfTilBC63CusSf6yw0lVc8
 4doSxCt7WKVGTCQdy/f9S5qFFlTsC6ccHCBWS1gVKFDO3VvE+twePg54ASTh7ZWSVe
 HFXVbxGlFAYxWm+bg1+pOGneUM75EieYyh7SOI/rxCtZmfONXI7T6wFbAWr4BR/7j5
 2dQFDrBMPhOi8avJiaGpjJxbS9qnS5anFFxSDhqFhvuBWH/nY2MA9CiztrYHkXAER6
 HjKJ1cTlVEE9YPzjpw/7PuxALw0ydjTWzeTW1R5lYzd4EtyRVGFpgU1GIwJWzjwK2x
 8V10j4dcfAokw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=ZftTAgWZ
Subject: [Buildroot] [PATCH 1/1] linux: enable
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL for CIP kernels and all archs
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

Fixes build errors with CIP kernels:
scripts/extract-cert.c:21:10: fatal error: openssl/bio.h: No such file or directory
   21 | #include <openssl/bio.h>

and similar build errors with vanilla kernel on other archs.

Instead of adding more and more archs we select host-openssl for all
archs.

Fixes:
- linux:
arm: https://autobuild.buildroot.net/results/dd5/dd5581dd2861d5ca86746a5aadb34d1dad9a5c0a/
armeb: https://autobuild.buildroot.net/results/0f6/0f6280e872310a27c0cf04f9a9b98d858992fbe7/
i686: https://autobuild.buildroot.net/results/aa7/aa78ca7062ea70e52e0ca0e480ef2fe218911334/
loongarch64: https://autobuild.buildroot.net/results/713/7133be874ae90b3e1649764be8e5ee70d3fd35d1/
mips: https://autobuild.buildroot.net/results/f3c/f3c9060777f8df03dca5594de8700833fafcb712/
mipsel: https://autobuild.buildroot.net/results/f36/f36aecce3c91979e1151429cfe158d3398fe7062/
mips64: https://autobuild.buildroot.net/results/293/293081c0f8ae45a9fa42d275208e3efe5c39e2b8/
mips64el: https://autobuild.buildroot.net/results/3c6/3c637b7a806640e940537f856ba7163b894077f9/
powerpc: https://autobuild.buildroot.net/results/20e/20ee38453a23fdb23f8db8af1ab9685c045f38b5/
powerpc64: https://autobuild.buildroot.net/results/044/044237b8cf8382892388bb224edfb0125ec38d42/
s390x: https://autobuild.buildroot.net/results/228/228b83c72d87fc6f0357f0b77db4230c56dd45f9/
sparc64: https://autobuild.buildroot.net/results/8d1/8d112fcba1c914b3db70d4a39f223bdc8ce9788a/

- linux-cip:
aarch64: https://autobuild.buildroot.net/results/f91/f910c1e0e864055120e2deaf4d56b127cabb89bd/
aarch64_be: https://autobuild.buildroot.net/results/6e6/6e651c586f9b2a1c9b39cafaf5bebc8b501e8369/
arceb: https://autobuild.buildroot.net/results/ddb/ddb5d967822c127c61a1b0311d6a0a81dcfa9f5a/
arcle: (not found on autobuilders)
arcbe: https://autobuild.buildroot.net/results/9fe/9fe7b4c66ac139926e9a3686bc951af703e78b29/
arm: https://autobuild.buildroot.net/results/288/2888b0b6f5473e9c7ec7c443b02b42e1f5d4c814/
armeb: https://autobuild.buildroot.net/results/d6c/d6cbbfdcbebe985d743232070824779e790aa5a8/
microblazeel: https://autobuild.buildroot.net/results/bf3/bf3b4c61cdaf3527e9e315050bf21456bbb24a48/
mips: https://autobuild.buildroot.net/results/c6b/c6b9c82352be01dd4bab2021a223e72dfaf1f522/
or1k: https://autobuild.buildroot.net/results/231/23144a8108c5837e3a9cf26ad6ac73fa16dc740f/
riscv: https://autobuild.buildroot.net/results/31c/31c3abdb23bfe16e248e094e9b0feafbbb0d6a94/
s390x: https://autobuild.buildroot.net/results/bda/bdaaf6767f8c239bbf22e4619b2d6944ef951b2e/
sparc: https://autobuild.buildroot.net/results/426/42614f77be9fa1b3a596cdcb40cfb81f5496b41b/
sparc64: https://autobuild.buildroot.net/results/1f2/1f226d028d85c085d82f3890e804b39bccd2c2dc/
x86_64: https://autobuild.buildroot.net/results/7be/7be86c261a42e1a16c3d38a640be226b5f51bccb/

and maybe more...

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7f1426c991..ede1275411 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -179,9 +179,8 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	# requires host-openssl, so select it for the latest kernel
 	# version. This is mainly needed to fix autobuilder testing.
 	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
-	       BR2_LINUX_KERNEL_LATEST_VERSION && \
-	       (BR2_aarch64 || BR2_aarch64_be || BR2_arcle || BR2_arceb || \
-	        BR2_or1k || BR2_riscv || BR2_sparc || BR2_x86_64)
+	       BR2_LINUX_KERNEL_LATEST_VERSION || \
+	       BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	help
 	  This option will use the default configuration for the
 	  selected architecture. I.e, it is equivalent to running
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
