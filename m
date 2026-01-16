Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D4AD47CDE
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 12:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90C36402A7;
	Fri, 16 Jan 2026 12:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lvo4dyF90DPt; Fri, 16 Jan 2026 12:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2C9C406B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768566679;
	bh=kTZOnRyKLmQ4NcffnAe7tLDIcnFIQ/U9RylUhgqfdNc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GyZsXRjyE/2fby/coaUuQNu3/uXgb6V0avKYhaK2/gCA6aTgAnuvntX9pO3D7u7L3
	 qpJBClgpZ7WDAhYVv2Mnaiy24HkT96JLEJJ/E18+acxpdQEBeuN1bRriGKlNYM/o0G
	 xCqGo3FimQg0GZWJ8iRVNE2InIJka4C6gHoQpa9YhifQPqjCtCBK26uI+XhDqtjUvS
	 paMscTOvD0/MGIVzrNKMgBUU58DGDHjH14JKwrbkkEkr6pcl+mGioPaubjMWuo5QU6
	 cdIg1cZPo3eUPXdPYPcqfcN3KGXw7upzfzCp6I119NpnF233N72LpV3ZXrHsyijH4w
	 k9aSZxTfoDZ3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2C9C406B7;
	Fri, 16 Jan 2026 12:31:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7526A223
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 12:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6559140413
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 12:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wL8UXlIXZ3wt for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 12:31:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 10247401D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10247401D0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10247401D0
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 12:31:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9C3F41814B9; Fri, 16 Jan 2026 13:31:12 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 13:30:25 +0100
Message-ID: <20260116123039.879487-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1768566673; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=UuSZJKoA/rB5Aa3Dpc+wtWKPvqPfDlQDuOhRkoC8O08=;
 b=jGpzpNVckbWhAhxUn4DOXHqG6sAhLvjOljiPt7rIY1Bi7liWXzZuERJFwAP3q6fp7a3xUB
 nioOuqjm928tNYz9oQ4lWDhJCyYIzB+b9AYCfca0sdLN9pIu3dwALHFtznoMJKvH0SXL22
 j5rFo0vhmRN0izvXTKS3Jdlt9VeNpPY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=jGpzpNVc
Subject: [Buildroot] [PATCH] DEVELOPERS: update packages for Michael Nosthoff
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- i don't use grpc anymore and updates seem complicate to review,
  so drop me from it and its dependency re2
- add packages i'm currently using

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c150ab8fc5..4fd9add287 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2427,13 +2427,13 @@ N:	Michael Nosthoff <buildroot@heine.tech>
 F:	package/boost/
 F:	package/catch2/
 F:	package/fmt/
-F:	package/grpc/
 F:	package/gtest/
 F:	package/json-for-modern-cpp/
 F:	package/libabseil-cpp/
+F:	package/libgpiod2/
 F:	package/networkd-dispatcher/
 F:	package/protobuf/
-F:	package/re2/
+F:	package/sdbus-cpp/
 F:	package/spdlog/
 F:	package/sqlitecpp/
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
