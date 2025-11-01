Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246B8CCF9F0
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 09:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2AB64224D;
	Sat,  1 Nov 2025 09:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEQZNjU_KWqT; Sat,  1 Nov 2025 09:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E2E74224F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E2E74224F;
	Sat,  1 Nov 2025 09:02:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BACA964
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 09:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4206484E4C
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 09:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-eyovtv5AHe for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 09:02:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64EA284E4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64EA284E4B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64EA284E4B
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 09:02:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b624.dip0.t-ipconnect.de [84.161.182.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D8392A4C5D2C;
 Sat,  1 Nov 2025 10:02:21 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46440)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vF7V7-000000001gV-1HRx;
 Sat, 01 Nov 2025 09:02:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  1 Nov 2025 10:02:19 +0100
Message-ID: <20251101090219.3697797-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761987741;
 bh=3BqY3r2Io4BSt4WCYkIFh6HCqEd9jm3vYj1SW41buSY=;
 h=From:To:Cc:Subject:Date:From;
 b=jRqhJH3P2gMNXcruaIADL61kDZhDc1slDPtKnOFMUX55buPuGTuv54jw02BvJbFp3
 TroCCSymV4Bo7OFlgkQar1D8ffrfY75JRQYGB7pVDudEydsytj+en9/G3fwJcRMN1o
 m1B6JuAER0PaUWnUfaWiqYsYnJRywauCV/mGaYp3+yMbQEvvcInCNn3aOP89rubKkr
 9LF7jPStTHZC+4wu3NapiGBNPb7jS7XHFmlZn0ONgxX5hT08Whnts8Kd484F9/lEQ6
 l0k0B1DvJ3Sb8GSH4qOy3qMEZ6jDaIflq/b1G0ucS9WkjKmwhrJ4UbcAXN+nqNoYIe
 AfXg1odl5H34A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=jRqhJH3P
Subject: [Buildroot] [PATCH v2 1/1] package/graphene: needs a toolchain with
 threads
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

From: Francois Perrad <francois.perrad@gadz.org>

Building without threads support fails:
/home/autobuild/autobuild/instance-9/output-1/host/aarch64-buildroot-linux-uclibc/sysroot/usr/include/features.h:220:5: warning: #warning requested reentrant code, but thread support was disabled [-Wcpp]

Added dependency to threads as suggested by upstream:
https://github.com/ebassi/graphene/pull/268#issuecomment-2283737538

Fixes:
http://autobuild.buildroot.org/results/9b3/9b357b1ef2eccd3110d0ecaaff1ae4883dff9280

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Bernd:
 - added comment to libgtk4
 - added upstream response to our bug report]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: updated patch description

 package/graphene/Config.in | 4 ++++
 package/libgtk4/Config.in  | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/graphene/Config.in b/package/graphene/Config.in
index 60f6073a10..085efb301f 100644
--- a/package/graphene/Config.in
+++ b/package/graphene/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_GRAPHENE
 	bool "graphene"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  A thin layer of types for graphic libraries.
 
 	  https://ebassi.github.io/graphene/
+
+comment "graphene needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index 259226e0e4..404eac06fe 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_LIBGTK4
 	bool "libgtk4"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
