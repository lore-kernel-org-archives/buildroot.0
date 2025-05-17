Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2348AC3ABDD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 16:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C784F82261;
	Sat, 17 May 2025 16:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWy4a9-rStDD; Sat, 17 May 2025 16:03:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04F6882230
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04F6882230;
	Sat, 17 May 2025 16:03:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EA9A201
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34425408F1
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69W2tEEV4T_z for <buildroot@buildroot.org>;
 Sat, 17 May 2025 16:03:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3842E408EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3842E408EC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3842E408EC
 for <buildroot@buildroot.org>; Sat, 17 May 2025 16:03:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 696A31FCED;
 Sat, 17 May 2025 16:03:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uGK0R-00DoEC-34;
 Sat, 17 May 2025 18:03:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 18:03:20 +0200
Message-Id: <20250517160320.3291319-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeitdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepheetteefudevuefgieejtdetueefleelhefhleejieejkeegjeetueefudffkeeinecuffhomhgrihhnpehnohguvghjshdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggshedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopegurghnihgvlhdrphhri
 hgtvgesghhmrghilhdrtghomhdprhgtphhtthhopehmrghrthhinhessggrrhhkhihnvghtrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/nodejs: security bump to version 22.15.1
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

- CVE-2025-23166: Improper error handling in async cryptographic operations
  crashes process

- CVE-2025-23165: Corrupted pointer in node::fs::ReadFileUtf8(const
  FunctionCallbackInfo<Value>& args) when args[0] is a string

https://nodejs.org/en/blog/vulnerability/may-2025-security-releases

Update the license hash for the addition of zstd 1.5.6 (BSD-3-Clause):
https://github.com/nodejs/node/commit/f9f611fb584ca2ace35df2669204e7de6a92ea26

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 14 +++++++-------
 package/nodejs/nodejs.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 6d2bdfb704..e087d8a7f9 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,8 +1,8 @@
-# From https://nodejs.org/dist/v22.13.1/SHASUMS256.txt.asc
-sha256  0a237c413ccbab920640438bf6e1a32edb19845bdc21f0e1cd5b91545ce1c126  node-v22.13.1-linux-arm64.tar.xz
-sha256  f2be8dca2a7a518f6d187aa4b18abbeeafd71096a6d95f73f4d8bc0f8d2394ea  node-v22.13.1-linux-armv7l.tar.xz
-sha256  377a7a1ea66f39251e1657f419e9404d526fcca9910620d0ecf0a870c6308f6b  node-v22.13.1-linux-ppc64le.tar.xz
-sha256  0d2a5af33c7deab5555c8309cd3f373446fe1526c1b95833935ab3f019733b3b  node-v22.13.1-linux-x64.tar.xz
-sha256  cfce282119390f7e0c2220410924428e90dadcb2df1744c0c4a0e7baae387cc2  node-v22.13.1.tar.xz
+# From https://nodejs.org/dist/v22.15.1/SHASUMS256.txt.asc
+sha256  f4ae8ddf7487dfaf7da92fef463ee55cc29d8772d62891361dc3fc8b8e469205  node-v22.15.1-linux-arm64.tar.xz
+sha256  6947386b4c8373b625c6a49b5571bf2226dac7c7b560a9a561a1f81bf71a25ef  node-v22.15.1-linux-armv7l.tar.xz
+sha256  da07858c6404dbe7c627bd7baea33c7825640652ad24468a6feb23c770cf7ce4  node-v22.15.1-linux-ppc64le.tar.xz
+sha256  7dca2ab34ec817aa4781e2e99dfd34d349eff9be86e5d5fbaa7e96cae8ee3179  node-v22.15.1-linux-x64.tar.xz
+sha256  c19f0177d21c621746625e5f37590bd0d79a72043b77b53784cba5f145e7263e  node-v22.15.1.tar.xz
 # Locally calculated
-sha256  9d72cce9b104ecb67feb8af38618511685190ae5a119cc0488ecae66b221000d  LICENSE
+sha256  1ae62e2015784ba438db7b04ebd33f3c4ff3efdb824c111c4ececd99945fd52d  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 752971c4a6..310face2d2 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 22.13.1
+NODEJS_COMMON_VERSION = 22.15.1
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
