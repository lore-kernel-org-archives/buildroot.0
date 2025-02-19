Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F71C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 18:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A817F84F8A;
	Wed, 19 Feb 2025 18:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uV_o8xEaZYI; Wed, 19 Feb 2025 18:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B7C84806
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9B7C84806;
	Wed, 19 Feb 2025 18:02:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31E34127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 17:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 479E650D2C
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 14:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEoRtXhqfged for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 14:55:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D09295459C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D09295459C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D09295459C
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 14:46:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF99144443;
 Wed, 19 Feb 2025 14:46:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tklLi-005qVM-0r;
 Wed, 19 Feb 2025 15:46:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 15:46:36 +0100
Message-Id: <20250219144640.1393365-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeigeehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheptefftdfgleehieekvddvfeekhfduhfefiedtieegkeehgeeuleekfedvfeeguefgnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghdpughotghkvghrrdgtohhmnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvrdhfrhdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 1/4] support/docker/Dockerfile: unbreak 32bit
 support for x86-64
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
Cc: romain.naour@smile.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes ttps://gitlab.com/buildroot.org/buildroot/-/jobs/9153298207

Commit 3bc94471ca8a ("support/docker: prepare for Aarch64 Docker images")
reworked the Dockerfile to only add the 32bit support when building for
x86-64, but it forgot to add a TARGETPLATFORM argument so the conditionals
never triggers.

Fix it by adding a TARGETPLATFORM argument as explained here:
https://forums.docker.com/t/build-multi-arch-images-with-different-commands-per-architecture-in-docker-file/134795

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index d0bdc73bbf..12d3fe024c 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -14,6 +14,9 @@ LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
       vendor="Buildroot" \
 description="Container with everything needed to run Buildroot"
 
+# Architecture to build for
+ARG TARGETPLATFORM
+
 # We need tar >= 1.35
 ARG TAR_VERSION="1.35"
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
