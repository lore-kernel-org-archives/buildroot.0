Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA468C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8347E40630;
	Tue, 15 Apr 2025 19:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1KGBkrio8vF; Tue, 15 Apr 2025 19:15:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B24C340875
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B24C340875;
	Tue, 15 Apr 2025 19:15:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71BFF109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5764A82023
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKjshrV2UpR9 for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:15:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7EED81EE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7EED81EE3
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7EED81EE3
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:15:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 5DE8D43ADC;
 Tue, 15 Apr 2025 19:15:49 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Apr 2025 21:15:47 +0200
Message-ID: <20250415191548.2122362-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdegfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtffdttdelvdegfeevgeeftdejvdevledtveekfffgjeegieevieejuedvveegueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744744549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=lO4RvSKhevAeOSDtUiIEhHHW6ueSVC6DG/45rWUt+fw=;
 b=RE03UJ9rjaJEcKPn7bBG5N7qFp6rPFNJ6DC/cs1uO6k1UHDQp4shOfdmhZ4qdItOGQBSdt
 0G47p4HvIzEe7V6OpKvZJoL3K8cmx8DEHJCG6LiImZBxVciuZJkErDKxu1DdXOATOPD7Kd
 29CQPSSrnLIayKW3eUeTRH2+uDBrRQmo5PjDB2T2LOKE+djdL96e/JgXM5s5yJO/cSC8ui
 YBP89QyNs06BwYmKfH+LMVmWAzxb/MlvggwTKPrIB0IBcOEfZyDpxepwFqlI2/ZWdkpPAQ
 1CE0pvFuaLv+PldhTMx7xIHtI6UgZFxEQz8XtF30Lu9T/c2HXgB2klTP5pgcuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RE03UJ9r
Subject: [Buildroot] [PATCH] package/double-conversion: bump to version 3.3.1
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

Upstream changelog from
https://github.com/google/double-conversion/releases/tag/v3.3.1:

    Hash pin Github workflows by @joycebrum in #198
    Create dependabot.yml by @joycebrum in #199
    Add _ITERATOR_DEBUG_LEVEL=2 and _DEBUG defines by @ffa-csturdy in #202
    Add bzlmod MODULE.bazel file by @jsharpe in #205
    Add CIFuzz Github Action by @DavidKorczynski in #203
    Update MODULE.bazel and README.md. by @BYVoid in #234
    Remove the explicit dependency on rules_cc. by @BYVoid in #235
    Add missing headers by @BhavikaSharma in #239

Tested with the following configuration, which includes the only two
reverse dependencies of double-conversion.

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_QT6=y
 BR2_PACKAGE_PYTHON3=y
 BR2_PACKAGE_PYTHON_UJSON=y
 # BR2_TARGET_ROOTFS_TAR is not set

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/double-conversion/double-conversion.hash | 2 +-
 package/double-conversion/double-conversion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/double-conversion/double-conversion.hash b/package/double-conversion/double-conversion.hash
index e3a5754933..a10da6d75d 100644
--- a/package/double-conversion/double-conversion.hash
+++ b/package/double-conversion/double-conversion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  04ec44461850abbf33824da84978043b22554896b552c5fd11a9c5ae4b4d296e  double-conversion-3.3.0.tar.gz
+sha256  fe54901055c71302dcdc5c3ccbe265a6c191978f3761ce1414d0895d6b0ea90e  double-conversion-3.3.1.tar.gz
 sha256  4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  COPYING
diff --git a/package/double-conversion/double-conversion.mk b/package/double-conversion/double-conversion.mk
index 74e90d30d7..a4760236ca 100644
--- a/package/double-conversion/double-conversion.mk
+++ b/package/double-conversion/double-conversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOUBLE_CONVERSION_VERSION = 3.3.0
+DOUBLE_CONVERSION_VERSION = 3.3.1
 DOUBLE_CONVERSION_SITE = $(call github,google,double-conversion,v$(DOUBLE_CONVERSION_VERSION))
 DOUBLE_CONVERSION_LICENSE = BSD-3-Clause
 DOUBLE_CONVERSION_LICENSE_FILES = COPYING
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
