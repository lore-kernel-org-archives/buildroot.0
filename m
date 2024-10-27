Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F019CD13585
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 20:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FA78404BF;
	Sun, 27 Oct 2024 20:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9u9_01MZc5Yq; Sun, 27 Oct 2024 20:39:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F584404D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F584404D7;
	Sun, 27 Oct 2024 20:39:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95689112A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 20:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76571400E5
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 20:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIgReusUlgwT for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 20:39:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 50D97400CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50D97400CD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50D97400CD
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 20:39:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 11967A4C10AC
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 21:38:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46816)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t5A2L-000000000oM-1Ufu
 for buildroot@buildroot.org; Sun, 27 Oct 2024 20:38:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 21:38:57 +0100
Message-Id: <20241027203857.3409990-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241027203857.3409990-1-bernd@kuhls.net>
References: <20241027203857.3409990-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730061538;
 bh=BZ6pijNng6ocbkJxZaZntgpmI15oK53W2xPVcwKKMwk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=J2/5FkkChOkmCF+sGuwjShuognAKuuAPtNCgSMvVxyMbg1wokq8dgJ9ArsdQ6dUk1
 d24kI7hlr/usS8ssIe8v/kMfnL9NgFgy75uSJAGkhvAi4BF8Y+qbcR2TYdyqFlv6Fl
 85Vlgl7T4DvmKY8azwjUDAkSRh3klEB2GHETSIRli9rnXoSZAjQMvQroauxa6n8YWa
 6Bqq/QqdSE0GMDv+r7FNouZsKVttIeb9G9SUHIu9FIdfRVESFihO73m2vsrfMcEdWy
 YGZaQxXZXeFDxo8DFGQAvMfRGcSLJLyAlvDZ7GFaE1SOLKBySWldQzTbidhg4upQKe
 0x/ThQLoU6ESw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=J2/5FkkC
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: remove Bernd Kuhls from libglfw
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

I am not using this package anymore.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8ad5540dc9..9743ae30d4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -418,7 +418,6 @@ F:	package/libfreeglut/
 F:	package/libfribidi/
 F:	package/libg7221/
 F:	package/libglew/
-F:	package/libglfw/
 F:	package/libglu/
 F:	package/libhdhomerun/
 F:	package/libheif/
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
