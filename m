Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A966C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 16:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7619C60616;
	Sat,  5 Sep 2026 16:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhMadTjyTbc5; Sat,  5 Sep 2026 16:19:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F40CE60603
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788625181;
	b=oMVuJd32sD/PyJKQ8a4aP4BVUm/w2vb21iR0YFj3N3coGxs9OIauZrLQ5Zdo2yQs/NkX
	 GlFIwCiYxYQ8JHZFJ9B82sM+c21MfYis/z5PrWI/06rjOFKNDvxqawjAUK2S7bf8dkgVC
	 mnsgII96qaQzXU1UNYyIMna41gITrUPdnxi5r6dDO77DogfRCJHyQV103tYp6PdBbnVda
	 wGDWu17afkawsFkSfUauDZj1p1AqSwf40z0XROhkmq5dBQCUZ9Xe998qa9iaLGV/k+Cg8
	 Rp19WsXvb2P7qT0qjw2rujkb7ItbheYoTYp2ywi1tRdmN1iiLSGhEDqqfo1UggMdpug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788625181;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=qsmXBZvPRP2FlfZjyybzslNyuFpS82SMJCuYcDrZ/1g=;
	b=WAr5Afwfz7jnS/BR23sDg6MQ7qtlNo8Fsd02x/0PeyeG3MXacv6m6uYOczpy26A/v2vA
	 9VcCTYWlYgh4J37SDnxG2J4D3VmUP8nleQbAssvAUKFSh+9Xf/xFMdS/l+XqmVpmn2hyc
	 pUwd6gZJewNw+wv4oGG2qbZI24zOHj7zmiJDQZmTUZzLHLe4QMzgfr2KkIryXoXOPtZQO
	 6Tlj0O9k8tDz2eOdAGZTA54reuZEfJ8s1ePFn9yrNWSagoYSZZPawgfpIdCfxLWDfN3HC
	 TrlyzVw95BedSVbclVpoo61VMSPCikWvYSvc+ef56/jQHlNFgUlBf53NxjL/JKvgLHQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788625181;
	bh=qsmXBZvPRP2FlfZjyybzslNyuFpS82SMJCuYcDrZ/1g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=MfVJFNKro3MEZ3E+AGVoMUWazS3aarN2f+fIGyDyAqydrVov39/vCyBCsWV0Umglb
	 ILWJvaK5OTeglgI5wijK0yjHzNSWH0eSLX0MjLx2jLJ+efTiQmfhg51poUp3oEuDZY
	 //ZxKMOafbFwwXPuhWM8iT8HGk6Xba7tXeu25OQPjMgRWLREY9ZWBzuuYeU7qqzh6F
	 A4wbraL/ZGunKDHQ4IhwBKvYC9JM5havbp4BeS3AnrzNbYnG/MuhGLkyE28aX4/shQ
	 QVApmMqO5Jt235pBKxDPTa8caUP1KIDgZy+zltHktHEXYfZ8ezd9+lnn9ek+blqdX1
	 6HAX1+RqkPiQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F40CE60603;
	Sat,  5 Sep 2026 16:19:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C01A118
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 024EB40513
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZXai0xyutmp for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 16:19:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 17D17404F5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788625179;
 b=KajOVBA3vscO2JcwxjVMZHBD8b7X1jU5cZxxfw4ACQbobjPowlW17mAd3cBPlK9o5w7n
 3vu9RyUWt9BJaAUi3PktqplfnmLlMFFwRzM5dCYYO8FfkhptaNsWbAMKan5PRJzk6FA1H
 3Es1C84xPlD1yJX5TaVJuBqXuDf4IyOcJz2w5GRhJA8/sFTZp/Fvn4xKWQg+HhWWAyj7l
 zjZkXedF2HoUlmgv3JJlk3dmHdTSc6mgexl8HyDX0NrCc+LVvb+fTCzEvejImiKioOJT2
 DXorrqv9kZxQEwfYcLpVa+3NL1IgkjTo3ucmUnyv2IdenkXEJoll4Cu4tqOLo3M9brw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788625179;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=qIED96ZDtt5HiXKxJ4HSw+eIaRkJ0gUpkLXEV9ib9L4=;
 b=agePgP0ora4KjroC2z6x8bxThNII7OoEuI1TwV8L8hgvM2e2wJ4EoKkwBDU374aMNxHP
 lyfIQCA8BLLmfM+JT6D03Dj0KQFWIciYp58FEEgp8VGoYqqS9yIOhJe9O73lmmE89g5vh
 C4joxMBmF/V/+Nz6ONfsU/pQNA6T7F7spiW70YIRgQNWyy7Q9eV7JV6OfOJqQoTnQW5o6
 2rbUpzWAhXQJ5yoasVoUB6Tb27ny/j1fCmbK9ddieHrV158SXdaxNCHalLKkTWoh3KU19
 o6AoXDKofiW13vtd8DL/5C3dQXLNofII5G3g2FmAJ17axqOSaC0t7TqiOEEK3H1b8yw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TeI0K7WJ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TeI0K7WJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17D17404F5
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 16:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788625177;
 bh=qIED96ZDtt5HiXKxJ4HSw+eIaRkJ0gUpkLXEV9ib9L4=;
 h=From:To:Cc:Subject:Date:From;
 b=TeI0K7WJNf4awxsXhh84qaVDi2WRZs+2n4sY4gVT20JLOPkTkLxTVZLJvtLM6s+nZ
 U/1KOc/iXuFUgEwW9VoJrpMrpBR5f0bAwnXC7QjBXh4loxXh2Lyrm1w2EKNtXVmQ0d
 gqZpSRvuCkUGuUt6HQ6OH+NxhswC/nUVnMB7SVn1yeVSS2OPlO9Dt5L1jYE5hnMcPs
 FaFkD3ZV29//oSCAYESCiKJb2TS5fINYkxkbDdijGam74icFdDkhMChZnjxNbxqHzR
 cYoHknViFcb+Q+8AQLBPSraRtwb0bTtJRo75MrwYFXdukLJB6dN825Hn+RdlpanaYT
 MoJRMLUE18XrA==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ED809A4C2EC8;
 Sat,  5 Sep 2026 18:19:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42882)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2t7A-000000006l8-2mXS;
 Sat, 05 Sep 2026 16:19:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Sep 2026 18:19:33 +0200
Message-ID: <20260905161936.549476-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 1/4] package/strace: bump version to 7.2
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/strace/strace/releases/tag/v7.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 8df107c948..0be750c96b 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
-# From https://github.com/strace/strace/releases/tag/v7.1
-sha256  81743ecf2a5b44186b2f5038afdc8beda7e5c70aed15b4fbfbcc6e9ece24490f  strace-7.1.tar.xz
+# From https://github.com/strace/strace/releases/tag/v7.2
+sha256  4bde6246926890dcee824f6e6ac42a06752f47d77e5097d86e3c0d6d4b709fe5  strace-7.2.tar.xz
 # Locally computed
 sha256  b897cf6bb865cdd72f49fba6ca7b66ad075b9bc51d3cf372923220ce18b5350f  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index a0688939ca..9634a6d02b 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 7.1
+STRACE_VERSION = 7.2
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
