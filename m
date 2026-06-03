Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE550CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 07:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F08F84170;
	Wed,  3 Jun 2026 07:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9BUJ3APxhX8; Wed,  3 Jun 2026 07:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EA9784171
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780471977;
	bh=yI/oXJ5dT6NNvHBHrXdqoNUKkuq9x+PSOCxTFX1CWJk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=norEd2FbvJD6OadQBtbypisylHdlsH6XKL3cu0xSmGWjxPHGMy5niOvqDWqPvLGEE
	 U7iUPNzuAqCodV933bU4llLQ83UrQa2oBH5dXjTXYS0NzvZbMWKEjebqkBm5ryNMVI
	 gERV/hjBTkbyxbgpsQ088Xf5AiGm3q0dLhbpjRTVZxcnOVDTmCsPk1v5dSzNku+vhx
	 3ngtGqx6dVRzk43rWO2AVNRvzV7Wc39GGSC57BWlm2OoBh27bz+o9aiRMsjFXcrN5K
	 /DOp2BkAZhUQMvlqv4F3amMnxXJkQvd/D6S7ZR5eCbtHm8WavzmWNCmFYG1C710PQ2
	 O/PWc0Mu5fJGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EA9784171;
	Wed,  3 Jun 2026 07:32:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1479AE8
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B31E584171
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUDcIlpZyJWd for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 07:32:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 498A584170
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 498A584170
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 498A584170
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:32:53 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 852078327; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 07:32:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wUg5p-0000000CFK3-3ufY;
 Wed, 03 Jun 2026 09:32:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jun 2026 09:32:43 +0200
Message-ID: <20260603073245.2918813-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603073245.2918813-1-peter@korsgaard.com>
References: <20260603073245.2918813-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AIk9mx0jo74V0TdUkElu4/GD47avlb5LiVvXlqfirUIwx4qQG4MrEELRXFo4ogy3VbrjswDfVg1lqvBegCMQ426YFjwPTKPpJpXavMwdAPWKK+yQFI/F5gba0VKV7kpLKdQyA9FoWrdRn5Ml0BmUFicb83qeanABxcaVbycdow8EzzlPwytGZIrfHQpLfZ54RyZOkSuYqGLbgEMhhle38DDT1Slm5l6SsfH0+FJ1+FwCOFa9s95H67EucBs9zhcqvDg/KZs9g0IadriQY/qy3ukRS9ll+FndVx1UUfHnd204D7ZtbDwT2fpk0af4zturdHei3C+DFdHvx31Uwt1AWg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=2vsr5riqexYXXwBMeasZHcy6wfKZR/OPbKxkmyRcaa8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=AIk9mx0j
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 2/2] package/docker-cli: bump version to 28.3.3
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For consistency with docker-engine. Release notes:

https://github.com/docker/cli/issues?q=is%3Aclosed+milestone%3A28.3.3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 34d77bb137..1424f95752 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b65cd415e63be23fcaa63107bc47a762173a06c84fb78b1575edc5443bb39867  docker-cli-28.3.2-go2.tar.gz
+sha256  172dca437abb36485275a8d43550db90b6878bcc676fc0b73a67a57a15026cff  docker-cli-28.3.3-go2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index abe0aac348..8d1b8f1bbe 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 28.3.2
+DOCKER_CLI_VERSION = 28.3.3
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
