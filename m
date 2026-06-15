Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C94BCD98DE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 12:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B028260AC6;
	Mon, 15 Jun 2026 12:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ltdvgPLVu-kN; Mon, 15 Jun 2026 12:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A73FE60B8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781527183;
	bh=kLvEbK89w6FYP5tmbDLdwcQcEJMpT8aiJgmAw9Acac8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=MTEmpTe/dV895y/wjtHxASRRG1emodiV0ipiPuFxoJ0hlWSl451HeZ8bs6QQiOBR0
	 pBVdv2Gbh9XjJ8UJwKXQUoF+aTU0X22cu/vkQdhg/mn1w4KEzIZ6yQbM/cXzGZfL2A
	 Srr0ttFO/qtrP96Cr3uZoS/LwiSNM8uBkqnGkaaye+Eo7f7WCUKcZykgTLKmv7Dngd
	 pqfoSuWCpVxSFNKbuUUvUTcB4876KC9sPKCjhzqH6Sipr3Mrlz43ZEgGXKWzfk72kw
	 gIr4j3yH/qZl/7MvsOZHAStg/eysTQUBN7bP/T9+lnG+qZJp22/Cm2FXvkiMaXfQS9
	 btAp958ero/Rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A73FE60B8B;
	Mon, 15 Jun 2026 12:39:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB932DE
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 12:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD58E40E66
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 12:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fOpYXne0wY8 for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 12:39:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E1CC540E44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1CC540E44
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1CC540E44
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 12:39:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9EB994E42F04;
 Mon, 15 Jun 2026 12:39:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 73E8E60015;
 Mon, 15 Jun 2026 12:39:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34F59106C927C; 
 Mon, 15 Jun 2026 14:39:34 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Mon, 15 Jun 2026 12:39:29 +0000
Message-ID: <20260615123930.447-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1781527177; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=u/yxNybJJ4/SEaJMaCQJc2fdcAsSNuZ6nm/zLwGNSjQ=;
 b=r89YqN7Vb2GDnUNzlopPYGnoy4ibijOfxcVIhqGINu/N19sM6LLlegemifbMaH+cUw3iFS
 Wwc8HNIsA5YcF8vX7bcJp8yWiW6KM8eIQYD9lzGY5li6lOOd2RScvDmfnpdhule4XJrtUZ
 tFvFJeYiiVGPg/twqmdoKjj82PzkpelPaLeeDUE4rD6tP0PsxjBb+nN4HVy+FhvaMlGEnl
 XLTZA7Qp/+7fsl18RYq++DRYfKFJqTkaRkZ/EkmG7dIp09FXLCjBPK9DEWRVHL7vMAx+xO
 iwaVLn5hsS8mRqGVbHHzl7btBXIhQ6ultXLxdVkZXD38HF5emXZHhQ8yuFa/fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=r89YqN7V
Subject: [Buildroot] [PATCH] utils/docker-run: Support BR2_EXTERNAL with
 relative paths
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The docker-run script did not handle the BR2_EXTERNAL environment variable,
preventing use of external trees in Docker builds.

Add support by converting relative paths to absolute, mounting the directory
into the container, and passing the variable to the Docker environment.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 utils/docker-run | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index 27c169db72..6e9693edd6 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -97,6 +97,12 @@ if [ "${BR2_DL_DIR}" ]; then
     docker_opts+=( --env BR2_DL_DIR )
 fi
 
+if [ "${BR2_EXTERNAL}" ]; then
+    BR2_EXTERNAL_DIR="$(cd "${MAIN_DIR}"; readlink -e "${BR2_EXTERNAL}")"
+    mountpoints+=( "${BR2_EXTERNAL_DIR}" )
+    docker_opts+=( --env BR2_EXTERNAL )
+fi
+
 # shellcheck disable=SC2013 # can't use while-read because of the assignment
 for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
     docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
