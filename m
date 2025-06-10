Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155F1C5B543
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 15:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C8160FE5;
	Tue, 10 Jun 2025 15:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKeYeoL-DFkc; Tue, 10 Jun 2025 15:05:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0D7460F97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0D7460F97;
	Tue, 10 Jun 2025 15:05:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CA6F183
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 15:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EBAC4099E
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 15:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nc3tiZTgnkIn for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 15:05:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07D1B408FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07D1B408FB
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07D1B408FB
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 15:05:31 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 8F0DE2C84477;
 Tue, 10 Jun 2025 17:05:29 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 10 Jun 2025 17:05:25 +0200
Message-ID: <20250610150527.96508-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610150527.96508-1-buildroot@bubu1.eu>
References: <20250610150527.96508-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1749567929; bh=wKdEjWGRGEM+hIsTphwwYbvB2/yDraQqYphllv2LI/w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=b94hINIMxtg8JBUFIqBkmcSa+up0rs4ZqOdU2U5gj0VE4Q6rV0Je/FnCQhH7AZdhA
 uNhXxgM6RQdraS/0SvZNoGwCDLlAvmfccZFWXJh6Bw46WPc31Qq1DAK3N200V98Uwt
 dpHiYtwVE/pMM39bRqWqYV2PsXCzdt/SRUTGUvP9+UNLSu7LIRf3+KzUIVWu5GoRMi
 yVqjYKtP8zN9UYJipWcuB1daYrE25dkQhwB/Q5O/e2XNTz0JgTDhSkir66+XLkawCC
 dBZw2M1g6n13RVSjyT3hIj/Yd5BCcfuEXTGziZc83QIvs3rqmizFjCHrwT6SEnmH5C
 5bSJYAZP5LbsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=b94hINIM
Subject: [Buildroot] [PATCH 2/2] package/python-requests: update project
 homepage
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

http://www.python-requests.org/ is dead, the project lives on
https://requests.readthedocs.io/ now.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-requests/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-requests/Config.in b/package/python-requests/Config.in
index 94a44682f4..929b99657c 100644
--- a/package/python-requests/Config.in
+++ b/package/python-requests/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_PYTHON_REQUESTS
 	  Requests is an Apache2 Licensed HTTP library, written in
 	  Python, for human beings.
 
-	  http://www.python-requests.org/
+	  https://requests.readthedocs.io
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
