Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30531C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 17:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 016EC400CF;
	Wed, 19 Feb 2025 17:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oil8-jgG4Mdo; Wed, 19 Feb 2025 17:25:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB47B42E47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB47B42E47;
	Wed, 19 Feb 2025 17:20:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9A1A127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 16:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7582754262
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 16:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id si6Fep2Oxgcd for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 16:10:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A78F539BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A78F539BF
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A78F539BF
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 14:47:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B94F4442A5;
 Wed, 19 Feb 2025 14:47:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tklLs-005qWJ-0C;
 Wed, 19 Feb 2025 15:47:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 15:46:38 +0100
Message-Id: <20250219144640.1393365-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250219144640.1393365-1-peter@korsgaard.com>
References: <20250219144640.1393365-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeigeehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepvedtheehgeeiudettedugfetueegffelkeffhfelieejkeegleetgfelheehjefgnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvkhhosehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 3/4] support/docker/apt-sources.list: move to
 20250218 snapshot
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

With the TARGETPLATFORM fix we need to rebuild the container so move to the
latest snapshot to get updated (security) fixes.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/apt-sources.list | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
index ddbe15eed8..d6fbf85270 100644
--- a/support/docker/apt-sources.list
+++ b/support/docker/apt-sources.list
@@ -1,4 +1,4 @@
-# Latest just before 20250205151400Z:
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250205T145632Z/ bookworm main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20250205T145632Z/ bookworm-security main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250205T145632Z/ bookworm-updates main
+# Latest just before 20250218211000Z:
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250218T144938Z/ bookworm main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20250218T144938Z/ bookworm-security main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250218T144938Z/ bookworm-updates main
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
