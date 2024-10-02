Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB132CF6D2D
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 15:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95DF2400D6;
	Wed,  2 Oct 2024 15:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iuqWO0eoMn8j; Wed,  2 Oct 2024 15:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6858240148
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6858240148;
	Wed,  2 Oct 2024 15:08:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DE6D1BF29D
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 15:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D1AC606BF
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 15:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1J1lH2yxTy2 for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 15:08:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.102;
 helo=smtpcmd02102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3D2560B17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3D2560B17
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3D2560B17
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 15:08:22 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id w0xfswz0dNKTWw0xfsfDBf; Wed, 02 Oct 2024 17:08:19 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  2 Oct 2024 17:08:18 +0200
Message-ID: <20241002150818.2471574-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDyEh/IUp/qUN4LjnbXHThLuaAx4TUE2S8gJfkXtK2SEjiyzX9pdbB30NDbApab5DebJORJIwMxkyUX21GLYEOC8TXfO4G5AsH6HleWqlzEZtuj213Pl
 1FvB3qBqMMVoRKUPK3WChVtzzcoFZQpmo4f1j+o15XX/aSfFk+ve02LvzyjM9Kv6EXgCkJOMpCU9d4cTR2juDmfDdYD93nZoD68c7GULBY6WVm15kEF4lOvc
 bmqHzc4VeoVuKbT287h/UC4bm6cwO3aJoPn25sPR6rU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1727881699; bh=2usMKWSZQaMcIqXHqfKQQa7MUnCS1Vd4knbpCtKp6Zg=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ipkshotf4+VCJtNzjuJpyGJ7jzxBBL3T4VyviPMA3nJt9XH7BDtXMtREKG+zXyX2f
 5uEjsA31DJXVe02LyXMvN6eOz8SRRVJn8nw+Za3qu7BpDWYwqOIKoPBcQ2ptUm08Gm
 LBy3asgigH/YePR0IKlnxYoBGlCbWuCkKP0GV750RfIc1ylexPjO2obSEQBVY6KxbT
 E3EIh9/xLyTC+WiphxqZ+JcsScKwXfvW+W8aVBDXxkS0ZNBT+JDWHaLlLpSMMQzJbJ
 mBQt3uj/VW6NvjvBqKxap3QMWN2ILNg5HLwpMwluF+uyt0bWP6+aVDxq5+OLYIiMFY
 Mn+9+m+JCE5jA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Ipkshotf
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 10.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index fa4ee16a9f..562727d3df 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a41b272ceeb920c57263ec851604542d9ec85ee3030506d94662067c7b6ab89e  harfbuzz-9.0.0.tar.xz
+sha256  b2cb13bd351904cb9038f907dc0dee0ae07127061242fe3556b2795c4e9748fc  harfbuzz-10.0.1.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 946b2b0f70..510c0a946c 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 9.0.0
+HARFBUZZ_VERSION = 10.0.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
