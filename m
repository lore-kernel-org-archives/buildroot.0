Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AE3C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 20:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B56A160B22;
	Sat, 17 May 2025 20:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oABueu6I_BfN; Sat, 17 May 2025 20:24:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA83F608B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA83F608B9;
	Sat, 17 May 2025 20:24:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF2DE201
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 956EC834D3
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id csxYaBIDCQUB for <buildroot@buildroot.org>;
 Sat, 17 May 2025 20:24:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D94BF834B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D94BF834B9
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D94BF834B9
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:24:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7672D440EC;
 Sat, 17 May 2025 20:24:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uGO4x-00Ektl-03;
 Sat, 17 May 2025 22:24:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 22:24:17 +0200
Message-Id: <20250517202418.3516858-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeiheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepjeegtdevgfffffegvdfgjeehteejieevueeigffhffeukeelfeeivdevgfevvdelnecuffhomhgrihhnpeifvggskhhithhgthhkrdhorhhgnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggshedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopegrphgvrhgviiesihhgrghlihgrrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/webkitgtk: security bump to version
 2.48.2
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

CVE-2025-24223
    Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
    Credit to rheza (@ginggilBesel) and an anonymous researcher.
    Impact: Processing maliciously crafted web content may lead to
    memory corruption. Description: The issue was addressed with
    improved memory handling.
    WebKit Bugzilla: 287577

CVE-2025-31204
    Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
    Credit to Nan Wang (@eternalsakura13).
    Impact: Processing maliciously crafted web content may lead to
    memory corruption. Description: The issue was addressed with
    improved memory handling.
    WebKit Bugzilla: 291506

CVE-2025-31205
    Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
    Credit to Ivan Fratric of Google Project Zero.
    Impact: A malicious website may exfiltrate data cross-origin.
    Description: The issue was addressed with improved checks.
    WebKit Bugzilla: 290992

CVE-2025-31206
    Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
    Credit to an anonymous researcher.
    Impact: Processing maliciously crafted web content may lead to an
    unexpected Safari crash. Description: A type confusion issue was
    addressed with improved state handling.
    WebKit Bugzilla: 290834

CVE-2025-31215
    Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
    Credit to Jiming Wang and Jikai Ren.
    Impact: Processing maliciously crafted web content may lead to an
    unexpected process crash. Description: The issue was addressed with
    improved checks.
    WebKit Bugzilla: 288814

CVE-2025-31257
    Versions affected: WebKitGTK and WPE WebKit before 2.48.2.
    Credit to Juergen Schmied of Lynck GmbH.
    Impact: Processing maliciously crafted web content may lead to an
    unexpected Safari crash. Description: This issue was addressed with
    improved memory handling.
    WebKit Bugzilla: 290985

https://webkitgtk.org/security/WSA-2025-0004.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 6 +++---
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index fd9420bad9..82b5cb4651 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://www.webkitgtk.org/releases/webkitgtk-2.48.1.tar.xz.sums
-sha1  f7939f920f92f6b1395b8573f069d3fb9c085b3f  webkitgtk-2.48.1.tar.xz
-sha256  98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f  webkitgtk-2.48.1.tar.xz
+# From https://www.webkitgtk.org/releases/webkitgtk-2.48.2.tar.xz.sums
+sha1  e1a216588ad5eaf71b548b035699319f74cbd8da  webkitgtk-2.48.2.tar.xz
+sha256  ec58f6dfc25d3b360388e192f865068d69aab09b4d7df021f90e314d2fa54f37  webkitgtk-2.48.2.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 2c22bfb607..246afad3cf 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.48.1
+WEBKITGTK_VERSION = 2.48.2
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
