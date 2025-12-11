Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9364ED3E79C
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 08:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69C4540216;
	Thu, 11 Dec 2025 08:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sO0NczI4A8TA; Thu, 11 Dec 2025 08:31:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BFF8402B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765441865;
	bh=zSnIS1eTk5+dhaQjlBNcwffzkmf5pUa/x+1JVWPMQMo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ZasYETx5H2OnunyVhsAAeJ8xs0fARj0LhSmrmRzW2d2AJXvxEgmpGEtxB1nj0rlZd
	 9MK/fTBQlDa5QXk+jrA2PGoBfWaNF8H33gg9bKfbmonPDj+Qg5eEE/jBnOvnTL+G+I
	 Vv+l8ZBPRp35jmKuk+YehyEeQepQ/Xzsq1QUIEdPPWuG0bhKtX9z6Mokxdi6fumtsf
	 bmrvxmWXD8KDhCQqdKtfFPG1Km67BsZqb8fd3VUL2azpU4CyubEqO5qq/0TOw3DHJy
	 OwqH5zRGdtYy026ZLanGr134gtq4yBn8wXtF/K6cD8jpGYXiwjiMfeQOlUcojNDMJj
	 N43gZnYiZCEiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BFF8402B3;
	Thu, 11 Dec 2025 08:31:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B79872C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3FFF608D9
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DK5WNlmaJHnv for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 08:31:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A058F6175B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A058F6175B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A058F6175B
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:31:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5C93B4E41B70
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:30:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3155F6068C
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 08:30:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9FA76103C8C1E; Thu, 11 Dec 2025 09:30:58 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Dec 2025 09:30:51 +0100
Message-ID: <20251211083052.432926-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765441858; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=WKaoOhgV8a0VmjIR7aPT+uXu5VXtuWRuZHUmoqwYNuM=;
 b=A1I/owgFkspEldTYIs2vSe/2oAnLglPtmKJvFUFwqCZ4+ZrSh++csD6Mk0Jzn89CgF3+KS
 oOnoeH7ad0d1GhUPEKivL8cXZrQc3yLuglQesOi8RFVxVjdRYXHAXoW6IvfEyBMp952rJs
 nf0xV+MGgFciaWDrPxfaNunBpiairJcZ9k/OqIstvudDEA8lsE0PjLk6TzmxW1I8AY9kZB
 X/+HtszCJq9PI0UL/IhNCJyZDwmUFSkdJOfDs5ZEycy5eo5wsx7wBbSugsuT9Hd1Wpj9o8
 CGv0edBIlUjCRHI+fr3kOIivLPatk1m8ETpdp9xdvmwntIQSshVX3b//qIjawA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=A1I/owgF
Subject: [Buildroot] [PATCH] support/dependencies: improve error message
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

"Fix you PATH" not only has a typo, but isn't very clear. Turn it into
"Fix your PATH environment variable".

Fixes: https://gitlab.com/buildroot.org/buildroot/-/issues/151
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/dependencies/dependencies.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 2843e3c5d5..9c2aeaf23f 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -41,7 +41,7 @@ case ":${PATH:-unset}:" in
 (*" "*|*"${TAB}"*|*"${NL}"*)
 	printf "\n"
 	printf "Your PATH contains spaces, TABs, and/or newline (\\\n) characters.\n"
-	printf "This doesn't work. Fix you PATH.\n"
+	printf "This doesn't work. Fix your PATH environment variable.\n"
 	exit 1
 	;;
 esac
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
