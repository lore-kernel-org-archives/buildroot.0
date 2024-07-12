Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28D6C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FACB412C8;
	Fri, 12 Jul 2024 15:18:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zyv5cg34NF9m; Fri, 12 Jul 2024 15:18:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F52441108
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F52441108;
	Fri, 12 Jul 2024 15:18:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21BBA1BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F78982071
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V40ANZwqBwQP for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:18:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 44FA38203F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44FA38203F
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44FA38203F
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:18:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 756031814B9; Fri, 12 Jul 2024 17:18:21 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 17:17:44 +0200
Message-Id: <20240712151744.831475-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1720797501; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=wkVLDD0f5dNCbxpvgO9cmXlWNhMbfHMjXepXgqH6XqA=;
 b=pewAQ2lg7isljcGk0LHYqQ17eF+a75Tad3nBCfZMBWxFYhQfp3Bg4H4qw4949yq5cJ/ut+
 8HRjGJVX3Mf8Zb0c4m2ZEsVRKPxWWd09yNMRD2VaLX4g7JiKqOiSZlkFbrTArIBNuXqRXz
 xLQ+qPGKjoz3Kbt/IBe6t6lCXsxtwg4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=pewAQ2lg
Subject: [Buildroot] [PATCH v2] package/boost: cleanup HOST_BOOST_FLAGS
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- fix alphabetical ordering
- put one module per line
- add comment explaining why options are enabled

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

v2: break the wall of text into one module per line

remark:
writing it this way leads to the generated list starting and ending with a ','.
It's working fine but looks a bit weird in the output. Is this okay?

>> --without-libraries=,atomic,chrono,container,context,contract,coroutine,date_time,exception,fiber,filesystem,graph,graph_parallel,iostreams,json,locale,log,math,mpi,nowide,program_options,python,random,serialization,stacktrace,test,thread,timer,type_erasure,url,wave,
---
 package/boost/boost.mk | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 9b1baec5bf..bb73edfda6 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -13,12 +13,39 @@ BOOST_LICENSE_FILES = LICENSE_1_0.txt
 BOOST_CPE_ID_VENDOR = boost
 
 # keep host variant as minimal as possible
+# regex & system are needed by host-riscv-isa-sim
 HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
-	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
-	contract container coroutine date_time exception fiber filesystem graph \
-	graph_parallel iostreams json locale log math mpi nowide program_options \
-	python random serialization stacktrace test thread timer \
-	type_erasure url wave)
+	--without-libraries=$(subst $(space),$(comma),\
+	atomic \
+	chrono container \
+	context \
+	contract \
+	coroutine \
+	date_time \
+	exception \
+	fiber \
+	filesystem \
+	graph \
+	graph_parallel \
+	iostreams \
+	json \
+	locale \
+	log \
+	math \
+	mpi \
+	nowide \
+	program_options \
+	python \
+	random \
+	serialization \
+	stacktrace \
+	test \
+	thread \
+	timer \
+	type_erasure \
+	url \
+	wave\
+	)
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
