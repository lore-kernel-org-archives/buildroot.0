Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1872EA8531
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 16:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DAEC83D5E;
	Sun,  8 Mar 2026 16:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N451M0PviM4M; Sun,  8 Mar 2026 16:04:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9FB483D67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772985841;
	bh=yIzoe7AtzbuX5qG+sMmcwJ5jUvMflhY7ETBb3yIij34=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DlEV9/SxPIdlSF5uYRODF5c+C47LLwqGhoFNDF/SrT/vjdEqs866f7+BT36XUfD8M
	 PxuDNY9+0wtM6pz3oH1SoS36rj/jih+CcDRDwJ9CwDqh2qfSuqD5yktXnzSwdhToMs
	 oDy2OU4PcK83eSfrRL91G1aBVRRqkNCrszkE+Jrz6ce1HH4Rws9IyXxSjFGvA1n3hs
	 nF1IFlvKgPcY+at4SUnmhD069pwi7/RUUu2LfXBkfZm+R6BkYsFAdKbHs9nXSV7usH
	 PUDNBsQTxWzUUpYuZh84IbNQl1zsWGxnyG1wYygwcosBiZXH7LMsbtthnZbcd0/89i
	 AAwI/rsBi5k/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9FB483D67;
	Sun,  8 Mar 2026 16:04:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FCB7223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 659FC60EE0
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0Orm8Q0ngss for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 16:03:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5AD8A60ECB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AD8A60ECB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AD8A60ECB
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:03:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c66e.dip0.t-ipconnect.de [79.214.198.110])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F2213A4C3947;
 Sun,  8 Mar 2026 17:03:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39460)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vzGbY-0000000022x-16hg;
 Sun, 08 Mar 2026 16:03:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Michael Vetter <jubalh@iodoru.org>
Date: Sun,  8 Mar 2026 17:03:43 +0100
Message-ID: <20260308160344.2593517-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772985824;
 bh=SXUXt4zmeC2Tz/2K84nCNWd7Bni/XtLKS4nod5JjL7s=;
 h=From:To:Cc:Subject:Date:From;
 b=oJ8Ffy6IXxCA7eHIalgWUGkmgCV+p8pfIqKyoxD2hsoMtvt+6MbTtIpIyaI4WKWya
 fdC9gOIpa84ztPWasruFVyqs0l5N4q5AMI+gFQo04d+Mtkg99wc4gNetAF2n/IKlSm
 2nXTc33ZoS7bkPR5bKLIxc8Mnh1nuISrkqQY2kZLygMonlingXtXeicbR5CaZvRhtS
 cpl0a1mY4vbHmciAAHtXaOkyOrSoFVlI3jGsOzw7Qwir9qC5/SfNPPLVbTnsapHdoM
 kgj/Si+1jpogzu4pyEEiX6p0IRVSXuKkbq5HYRnX7+b2BYrTVoFKhJvhWfM61V+VJm
 FAfHDgwSDZ4NA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=oJ8Ffy6I
Subject: [Buildroot] [PATCH 1/2] package/jasper: fix build without threads
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

Buildroot commit 03a1732dea67e088ec85f92853ca14f5a3c0f7b7 bumped the
package from 2.0.33 to 4.2.8. This bump includes upstream commit
https://github.com/jasper-software/jasper/commit/91fca092098396938830fe458f57109f0dd58a54
which was added to version 3.0.0 and causes build errors when threads
are not available:

    message(FATAL_ERROR "Threading support is not available.")

because JAS_ENABLE_MULTITHREADING_SUPPORT defaults to ON:
https://github.com/jasper-software/jasper/blob/version-4.2.8/CMakeLists.txt#L124

Add configure options to disable thread support when needed.

Fixes:
https://autobuild.buildroot.net/results/870/870d6adbac166b22cce217628d477b1bce538320/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/jasper/jasper.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 88633c9661..9ed54989e2 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -32,6 +32,12 @@ ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+JASPER_CONF_OPTS += -DJAS_ENABLE_MULTITHREADING_SUPPORT=ON
+else
+JASPER_CONF_OPTS += -DJAS_ENABLE_MULTITHREADING_SUPPORT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_JPEG),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_LIBJPEG=ON
 JASPER_DEPENDENCIES += jpeg
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
