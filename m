Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86BFCA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 19:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45D2461451;
	Sat, 16 Aug 2025 19:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEgIMLGR-NRF; Sat, 16 Aug 2025 19:33:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96B6A61255
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96B6A61255;
	Sat, 16 Aug 2025 19:33:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C2CE197
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E647660D88
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0wrqE98nCem for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 19:33:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CAF1B60665
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAF1B60665
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAF1B60665
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:33:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 46D4044367;
 Sat, 16 Aug 2025 19:32:57 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 16 Aug 2025 21:32:55 +0200
Message-ID: <20250816193255.1429450-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteejgeetgfffleehueeiueehtdeuieduueettdevffeiteeiffffudevjeevvedtnecuffhomhgrihhnpehsvghrvhhitggvrdhinhdpshhouhhrtggvfhhorhhgvgdrnhgvthenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpt
 hhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphgvthhrrdhvohhrvghlsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755372777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+oYcM2dMblGoW5wtbORMNwLF/6JWMgkpnwOCdLMbk6g=;
 b=e3Gqk6HTzc1d1a/6LDlWwJHk8/sypV8Li6TqtvvtOSkoqT+rX7GmDZpszW8Hxlus3HTdbI
 +KHS/wRmVtApEpA8xdAPbniX0EslHJvuxA8378+toZPn6kJkbdJWXa+WSw+oZkF+XxnYXB
 vaw3GTHwQk6ls/BUXBixDWDM4ehWxERyx8+RAkZlgOfHFCz9Qwhah2VMSYOKsaUe75Xg9E
 avTQhE501DUg4GseSObpHhI9UzqP4Ve+P7B0KtwFOQb6/AjsLWJ7E6QgCxaNyUnIB7jROV
 8Z+OdAe8lJjiaN+fUKqExFpTJWNk5uiz6JKqcmTlVjwUTKPQ7R8LleYoLoQ6mQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e3Gqk6HT
Subject: [Buildroot] [PATCH] package/rpcbind: bump to version 1.2.8
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

List of commits between 1.2.7..1.2.8:

f979f1b8fa202cd0d6c352de0f2b64361ce5ea33 (HEAD -> master, tag: rpcbind-1_2_8, origin/master, origin/HEAD) Release: 1.2.8
a9ecbb81940b23a4bb9814e126c1c1ae1db93b69 (tag: rpcbind-1_2_8-rc3) rpcinfo: Removed a number of "old-style function definition" warnings
8cc10d038c361f296b0a8e068c173acc33568997 rpcbind: Add -v flag to print version and config
8ef2e504df6e5ec3321c0804a8c6684d781e7a84 man/rpcbind: Update list of options
74da58dde5b1a1a7e54df1fb16315845195a69c0 (tag: rpcbind-1_2_8-rc2) Comment out ListenStream=@/run/rpcbind.sock
b78689b8f1df42eb593dc3412698aa1b8aaa3532 [nfs/nfs-utils/rpcbind] rpcbind: avoid dereferencing NULL from realloc()
fd1d5387de8078530d51eccf876afe6e6182b975 (tag: rpcbind-1_2_8-rc1) Move rpbind's default configuration to /run verses /var/run
7a6b1c58eee2e5fa74e3e4045c4950fbb4f8af0a Move rpcbind.lock to /run
be63348bd3dd9e69e151ff83f08f09e1a9df82bf systemd/rpcbind.service.in: Want/After systemd-tmpfiles-setup
626fd801a13cecd8eb79ac6e979c248d7214aad4 systemd/rpcbind.service.in: Add various hardenings options
511fc4f4bc5ca7b7c8dac877d590d0634e570e6d man/rpcbind: Add Files section to manpage
31157ba6e60b0a8c4989010df8b1cf2aa673a86c systemd/rpcbind.service.in: Add few default EnvironmentFile

So really not much.

While we're at it, let's add a sha1 hash provided directly by
Sourceforge, in addition to the locally calculated sha256.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpcbind/rpcbind.hash | 5 ++++-
 package/rpcbind/rpcbind.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/rpcbind/rpcbind.hash b/package/rpcbind/rpcbind.hash
index 45bd394199..e268a0733a 100644
--- a/package/rpcbind/rpcbind.hash
+++ b/package/rpcbind/rpcbind.hash
@@ -1,3 +1,6 @@
+# From https://sourceforge.net/projects/rpcbind/files/rpcbind/1.2.8/
+sha1  2f733aba26075ca91fda3787890232da3d07c06e  rpcbind-1.2.8.tar.bz2
+
 # Locally computed:
-sha256  f6edf8cdf562aedd5d53b8bf93962d61623292bfc4d47eedd3f427d84d06f37e  rpcbind-1.2.7.tar.bz2
+sha256  964132c389918e8964d7334936b6dd10ef025b300c6b29e693ba0f29550e3de5  rpcbind-1.2.8.tar.bz2
 sha256  2b9477d2f4ab277b29702958f0058546edc120aae4b5fb8b8d1a9652104e1ba3  COPYING
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index e553f54066..3b496ee2c6 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPCBIND_VERSION = 1.2.7
+RPCBIND_VERSION = 1.2.8
 RPCBIND_SITE = https://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
 RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
 RPCBIND_LICENSE = BSD-3-Clause
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
