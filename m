Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AF6D3B7EA
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 12:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CC1F40D36;
	Tue,  9 Dec 2025 12:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZzXsgYW_e9gz; Tue,  9 Dec 2025 12:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA8BF40D19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765283616;
	bh=u9HwBC6OotNj4GtJDSWOfJhVxNetc0BiIN74fjPPJZ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=NA1XjIwWIBk8vCZTHL6CFMMycaaxKqF2XRZZbarcI95Wer8kd3xwohr0/QG9YeTKY
	 /IWMKul6aq3SKQTmYKPDISGSXmd65fhAs0piKIyb2V0khbL/YYp3W5en7nTGGVu/i0
	 6+Zo2V43/hftl8SdgKDEIwQICu7jyfUBGrv7Aq2tnma+DmGbbDKnO3jJYrawh1YCr9
	 1SBaoaQMpyLw9rqDvcxK2vkEgg4sqKqfmM03mqVPMBTdV+u7mfw4GQGxR6Ev5UkxsU
	 ALUAsq1/ZZ4O8MjJIfpxcSWPtRvdkToywH05xqoHgzmRDJHDVUn53JXmsu80xfhz8b
	 RDayiEpZT8U/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA8BF40D19;
	Tue,  9 Dec 2025 12:33:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32641E7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 12:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23AF260DB8
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 12:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEd331XlFZ6i for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 12:33:34 +0000 (UTC)
X-Greylist: delayed 461 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 09 Dec 2025 12:33:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A65E60A81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A65E60A81
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A65E60A81
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 12:33:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 515DA1814B9; Tue,  9 Dec 2025 13:25:47 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 13:25:26 +0100
Message-ID: <20251209122541.849522-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1765283149; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=WCvRG9zz4IoMdpP50++c8hpt9mCcatXTF/VL0EN710s=;
 b=uwX49PirxERrKEMeAtxXF7QDg5J7XEs3A0HeVETu0UG0pX7FNGCFwWuDWtMctf4znmkhnK
 0quhi/RqVBKFYBqmJuAm4vJdKYsGvoAwBKw3lRjRf22X6dzCLh5tV9vH1Mcsw4Kt306o7b
 SoWHL3YlZuuoOJJpCS3Ny/F4XZFoFis=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=uwX49Pir
Subject: [Buildroot] [PATCH] package/grpc: remove BUILD_CSHARP_EXT option
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

the CSharp Extension was removed in grcp 1.47.0 [0]
and the option in the CMakeLists was dropped in 1.58.0 [1].
So remove this option for host-grpc as well.

Fixes:
  CMake Warning:
    Manually-specified variables were not used by the project:

      gRPC_BUILD_CSHARP_EXT

[0] https://github.com/grpc/grpc/releases/tag/v1.47.0
[1] https://github.com/grpc/grpc/commit/3a2bd221ef1166ae7d7bba3f700ff92ce3df5e86

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/grpc/grpc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 39be4f583f..d8681f33ce 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -75,7 +75,6 @@ HOST_GRPC_CONF_OPTS = \
 	-DgRPC_SSL_PROVIDER=none \
 	-DgRPC_ZLIB_PROVIDER=none \
 	-DgRPC_BUILD_CODEGEN=OFF \
-	-DgRPC_BUILD_CSHARP_EXT=OFF \
 	-DgRPC_BUILD_PLUGIN_SUPPORT_ONLY=ON \
 	-DgRPC_BUILD_GRPC_CSHARP_PLUGIN=OFF \
 	-DgRPC_BUILD_GRPC_NODE_PLUGIN=OFF \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
