Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ABBD0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90782605C6;
	Sat, 26 Oct 2024 21:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3VO0owti6Ez; Sat, 26 Oct 2024 21:02:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99E22605DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99E22605DA;
	Sat, 26 Oct 2024 21:02:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E9495C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BFE4402E9
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ne-udf2r5HJu for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:02:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D8BE402CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D8BE402CA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D8BE402CA
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:02:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b313.dip0.t-ipconnect.de [84.161.179.19])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 72C0BA4C0CE0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 23:02:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45808)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t4nvd-00000000548-2wfI
 for buildroot@buildroot.org; Sat, 26 Oct 2024 21:02:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 23:02:34 +0200
Message-Id: <20241026210234.2668381-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729976554;
 bh=jsQnIVENslxbQnrTSzWjNxPmkrAlOxKXut/N78+yqJE=;
 h=From:To:Subject:Date:From;
 b=JXsqv4An9oa0wF6K3kEL3KY9H6JgVAij19RFOr6FosrN2PlvcrKtrHtKKx/0EFHt0
 +3FyOVjjJYM5iA+ORdUr7rLZOdajZHSufQkRfG8u55oxCrCSlpCg6lQyKz3GlzAhhG
 2qEr/C+cDCKt678tDQpC4YlhyC7z2UFWYcwFgdDanuMw9qv+S8JwOlNhj0Bz7kkbVT
 qFqF2M67hqeYzcA3vbu0MLQwg7w3YSJlMLAvLV9XTpPws6UGAmyON8KIc3Dufn9Il4
 UuMkdy3ysJFeGZ3dbogxL1cFhMV6nQbHSKGJCK0demb1Mk1QSsJgsypyHgnjVtyI4u
 U2EmpQpI6T47A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=JXsqv4An
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: bump version to 1.9.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/jsoncpp/jsoncpp.hash | 2 +-
 package/jsoncpp/jsoncpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jsoncpp/jsoncpp.hash b/package/jsoncpp/jsoncpp.hash
index 99266ae42d..0fa9b89422 100644
--- a/package/jsoncpp/jsoncpp.hash
+++ b/package/jsoncpp/jsoncpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f409856e5920c18d0c2fb85276e24ee607d2a09b5e7d5f0a371368903c275da2  jsoncpp-1.9.5.tar.gz
+sha256  f93b6dd7ce796b13d02c108bc9f79812245a82e577581c4c9aabe57075c90ea2  jsoncpp-1.9.6.tar.gz
 sha256  cec0db5f6d7ed6b3a72647bd50aed02e13c3377fd44382b96dc2915534c042ad  LICENSE
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 5ef62befbc..9915907ea8 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.9.5
+JSONCPP_VERSION = 1.9.6
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
