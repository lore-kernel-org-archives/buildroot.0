Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452E5C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BACE60E78;
	Sun, 18 May 2025 08:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0s63uTebz93; Sun, 18 May 2025 08:57:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA10D60E80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA10D60E80;
	Sun, 18 May 2025 08:57:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 03DFEDF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE94840FDE
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_2ewR2L8If1 for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:57:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D62EB400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D62EB400C6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D62EB400C6
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:57:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E73AE432FF;
 Sun, 18 May 2025 08:57:31 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Christian Hitz <christian.hitz@bbv.ch>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Date: Sun, 18 May 2025 10:57:03 +0200
Message-ID: <20250518085723.23020-11-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
References: <20250518085723.23020-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudektdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdufffgudduffffffehteejueejffejleegkeffgfejtdekleefvdevleehuefhnecuffhomhgrihhnpehgmhgrnhgvrdhorhhgnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhgrphhhrggvlhdrmhgvlhhothhtvgesmhhinhgurdgsvgdprhgtphhtthhopehthhhom
 hgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrohihkhholhhlvghnshhvvghnughsvghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisehthhgvohgsrhhomhgrqdhshihsthgvmhhsrdgtohhmpdhrtghpthhtoheptghhrhhishhtihgrnhdrhhhithiisegssghvrdgthhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheptghorhhjohhnrdhjsegvtggrghhrohhuphdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747558653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XydsiYPl6a+RI0tSB4ZIDlF/basEHrZBIB0MDhr7B70=;
 b=oJSw3bxm76c9UYGg5nSj2rsj1oRp1kzojaD4DA7J7bvQenmYATVSkHfyQLSgHqC5zXvOZc
 Reu9IQMICnTL8sWcq5B34Zn2NNhnKb/YbTff8/XZB3rCLog8FPm5x7ECJ/vP/j11YkNjg9
 EPpXYbrr7xpwTQPgm4pWmJP8KwHFJrW5TZyTG0soiG8kpfVS1dXd9InoZZHzU12fn0aFJd
 aZa3x9C7kFJ3tDjoPeKosIB2DCBSELH4Jk1BPP9DrcKPXxkHkBRXLpJ2RNb1hMPyK5KcrQ
 sRAmUXmku33VD6kN2WJ9X3ScdSzPsZ5LxSRDzkG4xGy66FRquGT+XxxSCw+DTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oJSw3bxm
Subject: [Buildroot] [PATCH 10/22] package/qt5/qt5base: drop stale ignore
 CVE entries, add CPE version
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

The qt5base was reported to have 2 stale ignore CVE entries, one not
stale. Turns out that because the version is a Git commit hash, the
version comparaison did not make a lot of sense.

This commit adds QT5BASE_CPE_ID_VERSION, assigned to the closest
upstream version that we package (the Git repo we fetch is 5.15.14
plus a number of fixes). With this done, all 3 ignore CVE entries are
stale because the vulnerabilities have been fixed prior to 5.15.14.

In addition, setting QT5BASE_CPE_ID_VERSION allows to reduce the
number of CVEs affecting qt5base from 20 to 8.

Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index add460c257..3ad2bdfc04 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -9,20 +9,13 @@ QT5BASE_SITE = $(QT5_SITE)/qtbase
 QT5BASE_SITE_METHOD = git
 QT5BASE_CPE_ID_VENDOR = qt
 QT5BASE_CPE_ID_PRODUCT = qt
+# Closest upstream version
+QT5BASE_CPE_ID_VERSION = 5.15.14
 
 QT5BASE_DEPENDENCIES = host-pkgconf pcre2 zlib
 QT5BASE_INSTALL_STAGING = YES
 QT5BASE_SYNC_QT_HEADERS = YES
 
-# From commits:
-# 4ce7053a59 "Avoid processing-intensive painting of high number of tiny dashes"
-# e7ea2ed27c "Improve fix for avoiding huge number of tiny dashes"
-QT5BASE_IGNORE_CVES += CVE-2021-38593
-# From commit 2766b2cba6ca4b1c430304df5437e2a6c874b107 "QProcess/Unix: ensure we don't accidentally execute something from CWD"
-QT5BASE_IGNORE_CVES += CVE-2022-25255
-# From commit e68ca8e51375d963b2391715f70b42707992dbd8 "Windows: use QSystemLibrary instead of LoadLibrary directly"
-QT5BASE_IGNORE_CVES += CVE-2022-25634
-
 # A few comments:
 #  * -no-pch to workaround the issue described at
 #     http://comments.gmane.org/gmane.comp.lib.qt.devel/5933.
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
