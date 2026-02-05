Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB90ECD99B
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 19:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 568F46110E;
	Thu,  5 Feb 2026 19:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jC7wftJdQ93k; Thu,  5 Feb 2026 19:53:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 389DD61183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770321197;
	bh=PBbYplWSR4V/S5aOo/GPWddYZ1gx9nc1i2K4/3K33sk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lRWqDpzMTKHkKjtt/KLpOBS7jhDFuZfszQUeFyIZ/nWopRF/roBKTda/nF3J+GB8x
	 hKSqPUMeg4WWnjPaEICb2sAs2B7t3bNkJIrTW03aempu5rkAFbwSwN96HkUAVtmSQk
	 wLTs8XEcxg4+5oC5FftDHRz2LLV4OuYbKHQP+MgFA4BfUT1QoBz0EbEjbBsEs+lQZI
	 69L0v63ynjgDQbi6R1pjrJFUa4ZS4peDbGzSI2qK4d6IWdGdmSBWQXHz/c9aTwQEZY
	 7phc8DorU4JTITnuT5UytHlKeX75T4kWClhVw/nnbgkGIVRlRrPCOpWir35LdwK0FI
	 8NQSkxz18cEvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 389DD61183;
	Thu,  5 Feb 2026 19:53:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E950E17A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA32A4026B
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgkFTuNhWB-1 for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 19:53:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BEAE04018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEAE04018D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEAE04018D
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:53:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 69DAAA4C5882;
 Thu,  5 Feb 2026 20:52:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57288)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vo5PP-000000006Rf-12fr;
 Thu, 05 Feb 2026 19:52:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Guillaume Chaye <guillaume.chaye@zeetim.com>
Date: Thu,  5 Feb 2026 20:52:57 +0100
Message-ID: <20260205195259.2348677-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770321179;
 bh=+iGPELZiie73aDAjoFjDiUislhrUphwuO9mCQc8d9SU=;
 h=From:To:Cc:Subject:Date:From;
 b=E940V9U0pk1sC7SisVsMEowoiR6R8CWwHTvW7bTDIrPy4OQum4UUOAksrUqGBonAw
 KOu0yMn7ZsLXiKV7wnKj+GOLBn+qMZbSnPrYjDQH4lqxlgjfdbvhuCvA/4rul9kWj8
 iYzskDd1v0CnvTZfRp4zICT354SPDmdrD7zd9ikGV8MOBHyyGPfTFfx7IixduPCtdF
 KdCJwm9jTVQNNn51ndljIAdX1NQjCQ6F1wzRw42W8vGv6/uUoYklEp62IN2Opxb33x
 U672S9Rmo3izuzwb1H40gBajLR8SOg6c8rgUBZWHQs/NbWbyFamAyLM0rWmO91zJ6x
 4RQLXCAgcocvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=E940V9U0
Subject: [Buildroot] [PATCH 1/2] package/sane-airscan: needs C++
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

When the sane-airscan package was introduced in
f78280bf262ceb1c1abbdade9de77fcc4add74ae the dependency to c++ was not
added to the package.

The source directory fuzzer/ contains c++ files:
https://github.com/alexpevzner/sane-airscan/tree/master/fuzzer

meson.build requires c++:
https://github.com/alexpevzner/sane-airscan/blob/0.99.33/meson.build#L1

Fixes:
https://autobuild.buildroot.net/results/830/830374dcce8f29ad336cf8060bda552119c8377a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sane-airscan/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/sane-airscan/Config.in b/package/sane-airscan/Config.in
index b7cf224741..2324a3f661 100644
--- a/package/sane-airscan/Config.in
+++ b/package/sane-airscan/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SANE_AIRSCAN
 	bool "sane-airscan"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # avahi, gnutls, sane-backends
 	depends on BR2_TOOLCHAIN_HAS_THREADS # avahi, dbus
 	depends on BR2_USE_WCHAR # avahi, gnutls
@@ -23,7 +24,7 @@ config BR2_PACKAGE_SANE_AIRSCAN
 
 	  https://github.com/alexpevzner/sane-airscan
 
-comment "sane-airscan needs a toolchain w/ wchar, dynamic library, threads"
+comment "sane-airscan needs a toolchain w/ wchar, dynamic library, threads, C++"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
