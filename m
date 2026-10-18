Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DEFCCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9963F6062C;
	Sun, 18 Oct 2026 14:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73_nnYI-OVZl; Sun, 18 Oct 2026 14:38:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2E5D66060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792334312;
	b=eQfA6mTX3GeZO7yIRNAq4pV9jngknUI/o6SeajN6g50Cq6KeS05qShseettN3LJAou2I
	 Dl91W/ohc22c7QXu35q4a2nvce2TVYk5lSPkdWH0NyaXH7TInENiOk1qQ7XhigND5YYpL
	 WXjYcAbEShoJWQPgKYUq3P4drtWYJ61t3Xj+Pjt1M7RxTQGd3DrhJJnTQ1tidENzJEm0u
	 ew0T7LMIEoJWPThl/iySStW4rRg4b0rlmAybO90gA56Ft3twaK6nhAAIDVNzwWMFqvhKA
	 KTluMdcd7rJd4nND4id8RZQT9RTDBMJpgW59L2n18FikyqhXcogYmyz1QX+9sic0qGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792334312;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jm4KoWBZ4GDj8jgKWc7LVqB3utj0Zgu1ooeIFfZ3q5M=;
	b=LvBOZ41yjcRvUeoXAdCZPlOan4E2u9qk+crbpT8BiHH8WtywbLnbS6UIY2WdUnTmt/K8
	 yV6KTttGGMzA95S96T09qV7Sxz1OKQaLmRkOXJQyegHaKviiIqSfPy0esDKywRqOIgHWP
	 2Q0PjeprZQBaeRk0I5NYWg0OMOkrYl8DTXkdmqY2S6k3sy0WLViwSEQnSpPLXXELP/qKp
	 gHP3Ry2vuPCSCE7F0W5f4Ced4i5JRuCCBLpGjr7mN+85DlGxjbbAIQ5jJ8w3SPizo3PLY
	 iOYbej54K4Cl+jO1q4kFug4tk4/E5NN2BhZBjnpVh8SkEEQsBLgnMP0tv6sDIg+1v9g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792334312;
	bh=jm4KoWBZ4GDj8jgKWc7LVqB3utj0Zgu1ooeIFfZ3q5M=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Jo4FFS7rn3Wor3FYoxyJ6wKQHPLLU2tXNg3YRn/2kx7v26ZSvF5ww4eemSDU8aq+G
	 rw5LS87Zyh01h0GQ4RQ2gKHTarA6GUaZUt6n59qLWvqHMpmUCFpzhkcRjYs7f4Q4GK
	 o4cQXzGXMmphtUw57GvTjI9EJDIa18JUgK+OC8h9Jhh5bCrPyPXvgDaZyt/USTjMIW
	 3Bnqkrqrl6t/cyRfGUci3be/Zm/nb+b+P+0qNIpIG5Qgw+MbpZBx7+hqIHAkdaexSq
	 W8xG7di2m2LzOaMaIE96Ea7KZIGqT0Ghed4Bj521EAtyue2YWHU6m42kdDjYkybpgh
	 beyb64RPkiR5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E5D66060D;
	Sun, 18 Oct 2026 14:38:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 620902A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53BD380FB4
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9OvPpSg0LuR for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:38:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 83C1C80FB0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792334307;
 b=ftmt15uqtKn9TxHkXnYfjdfXIfPGq8ACfgdfWGX5DZP4Whow+Z1RS/1PEQvWMsWfHra1
 0yoKwSxXUOxchogRjC8DDyWmr98Ud+fzb51wQYfHSPdHAc/Hufgc0G68LSwtoQNRTPxTl
 DcH1maAiEOMf86jYuQ/w5OXDQT62FkPPNRH8Op0H3aLGz1MFsdaktlBA2Ad0HjmdjYujt
 zJ2tsM+vMgN+lL/A4qi9xLtAJZaVYKShIZKIpAwqzd5AzogJEV+vg3DrF9U6jxk3CZT+g
 GKzGFBWcSDtnBdkgzJ6nNaXqejpypVOio5HjXoLbGex91+4DRVFDTTPAC0NxtpICRog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792334307;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=Qb2M8jiNl1gWe3/ZsKmi+nOa2asyi6/UwV6W7mXfGCI=;
 b=q1MkU6X6XMXa9/L9kQVHzyWrHn65+FGGX99MThiCQ8UmY4H69HspT/cEfVuXC6zyryeM
 cw4PpM89kEspkdZJkKTZw4hOJHt0DpPpZ6O/sK3NbrSK3PdOzy5tDx7P03TU/rCNhVC/1
 UISvImgiqQOrO/9TgD0BF+HKvRQuh6HyhEGTR6K9472lXT2wA4jbPREpKswTvlGVEuIDz
 XssWz4kKfnujDJk4tLr2R+XLEaRbyUN8FkbIZTQG13R9wlzuwQCCrOy0O1+QB0Asb1DaK
 X22dMgXPCti3/EBw5u12PIoHXHlATBlwWcR8AuYDWwQF3CCJf8niw2TNQHPDjz0zjNw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=KdDxpf3W; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83C1C80FB0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:38:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYvcA-1x5CTH3Uw4-00NDwn; Sun, 18
 Oct 2026 16:38:23 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 18 Oct 2026 16:38:14 +0200
Message-ID: <20261018143816.1780525-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:nn0SJ5jEF4Kp88SoTfImjzsROieI6buC/qL4ppVANQuUoDir7oj
 A42+xv94ozzWKEk7fjUjQ9GyUZZ5klcancrSJJ6FPgRVcfV7ZoRp23chghX7PAj7Qi8ddrn
 NLBSP6MllxxjpfPRg4rYv3wohobjWmq/exaF/QM09Pc475aVZvPN9Yh7ITESFVfrW9PaSIS
 htHcIdGJcd/FAEDWg/I6g==
UI-OutboundReport: notjunk:1;M01:P0:d/TJDKWSSr0=;dTsBPWRFlR5aiAm51lZXC9LQrHY
 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
Subject: [Buildroot] [PATCH 1/2] support/config-fragments/autobuild: use
 HTTPS for custom toolchain downloads
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Both autobuild.buildroot.org and toolchains.bootlin.com support HTTPS,
and even redirect from HTTP to HTTPS. Use HTTPS directly to prevent
manipulation along the way.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
This isn't as good as setting BR2_DOWNLOAD_FORCE_CHECK_HASHES=y, but at
least a good first step.

 .../config-fragments/autobuild/bootlin-aarch64-glibc-old.config | 2 +-
 support/config-fragments/autobuild/br-arm-basic.config          | 2 +-
 support/config-fragments/autobuild/br-arm-full-nothread.config  | 2 +-
 support/config-fragments/autobuild/br-arm-full-static.config    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config b/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
index 1b811f267a..7637a99cc8 100644
--- a/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
+++ b/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/aarch64--glibc--bleeding-edge-2017.05-toolchains-1-2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64--glibc--bleeding-edge-2017.05-toolchains-1-2.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
diff --git a/support/config-fragments/autobuild/br-arm-basic.config b/support/config-fragments/autobuild/br-arm-basic.config
index fbbeaaa773..3212cd5a66 100644
--- a/support/config-fragments/autobuild/br-arm-basic.config
+++ b/support/config-fragments/autobuild/br-arm-basic.config
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2020.11.2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2020.11.2.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/support/config-fragments/autobuild/br-arm-full-nothread.config b/support/config-fragments/autobuild/br-arm-full-nothread.config
index 71592d688a..855a24f969 100644
--- a/support/config-fragments/autobuild/br-arm-full-nothread.config
+++ b/support/config-fragments/autobuild/br-arm-full-nothread.config
@@ -3,7 +3,7 @@ BR2_arm1176jzf_s=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2020.11.2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2020.11.2.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
diff --git a/support/config-fragments/autobuild/br-arm-full-static.config b/support/config-fragments/autobuild/br-arm-full-static.config
index f3a4d91fd1..33c7cffc72 100644
--- a/support/config-fragments/autobuild/br-arm-full-static.config
+++ b/support/config-fragments/autobuild/br-arm-full-static.config
@@ -3,7 +3,7 @@ BR2_STATIC_LIBS=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2020.11.2.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2020.11.2.tar.bz2"
 BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
