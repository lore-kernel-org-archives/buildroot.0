Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D56AC4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 10:57:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F9A160EE5
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 10:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F9A160EE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEBA240745;
	Fri, 13 Aug 2021 10:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v5McmawkmbvH; Fri, 13 Aug 2021 10:57:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E92EB4074A;
	Fri, 13 Aug 2021 10:57:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF5771BF2CC
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 10:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDF174074A
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 10:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABzIL12N7Xfy for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 10:57:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5089440745
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 10:57:17 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4GmL9Q2Q6mzQjbk
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 12:57:14 +0200 (CEST)
Authentication-Results: spamfilter05.heinlein-hosting.de (amavisd-new);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1628852232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+ihq8xvFeDBMux7zkp+dQsGl7q/eB7aDYNeItMXnnGg=;
 b=XiDDwAErZt83SHv0v7vHzHYdV8mFHeOnJc2jVDUraamPyECJgxaNvjKwzJUm9yWMzXkJTA
 qvSlB0bAjsYKXQ+nQ2a3jts2zoK5lBOPf+wKxvH+72vFve7CUupaVo9Scs0EtDLUEGPNrn
 fURLoGedwaPFw3/2RGhc0h4YWsIbaPLpgZ8vFOKvjL/EYR/EiuEk4SUBZ1NXU01D8s0KHY
 v/nMbG+h1gYvdwMPR71w5e1GAGZqOKWCQ4Lmdq4sxklU9dgLnMqvLFuTUuKJztYEaeC4U5
 EBZbJUdr3DUr8QD1MDqrYFQ7XEMp4GRFsGwwXGLlfbFkVU1WevS8yJMo7kb+yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received; s=mail20150812; t=
 1628852227; bh=ndcW4j+ny+ZghAO2DKPrbIn3LKdmrwFSVWsAdYpsKpM=; b=k
 S73YTbkDZ5uCVzbstAy88uO7KXds/ke/MyEeeWAMR/zXNDZuf+BI3Jli1SkE/9Gr
 8a4/FIeiJFsPxcSucu5kfrrC1eLj6UETe8XHGvNsmTr+8Nz84ccEcSxflQvcknW1
 QoVZFIHMMM2aJko8OfGpumzFuCbXMTMiYdN7ts2kXthzi4KUKGwn9U/yWQkLSbWP
 inuefg4NMWo8Aux21XxqaqvnlUCZf0cB3kDY1qah7gXGxU2SQUYuNVcgyqs7Jw2c
 9lRxXLruAZYLEt0SmN6HYB0Nnsqt4WUPr2hy94hPLUcfaPZhkS3bqqX/2kDA89A2
 D51vvJwy2QvBy5azILWQA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id pmMoXznMtAvx; Fri, 13 Aug 2021 12:57:07 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 12:56:18 +0200
Message-Id: <20210813105618.1020693-1-zeno.endemann@mailbox.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 881B4183A
X-Rspamd-UID: d0b9cc
Subject: [Buildroot] [PATCH 1/1] package/mpv: add staging install
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Zeno Endemann via buildroot <buildroot@busybox.net>
Reply-To: Zeno Endemann <zeno.endemann@mailbox.org>
Cc: Zeno Endemann <zeno.endemann@mailbox.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

MPV is not only an application, but also a library, which should be avaliable in staging.

Signed-off-by: Zeno Endemann <zeno.endemann@mailbox.org>
---
 package/mpv/mpv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index d4d4d4811d..98a7328c83 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -12,6 +12,7 @@ MPV_DEPENDENCIES = \
 MPV_LICENSE = GPL-2.0+
 MPV_LICENSE_FILES = LICENSE.GPL
 MPV_CPE_ID_VENDOR = mpv
+MPV_INSTALL_STAGING = YES
 
 MPV_NEEDS_EXTERNAL_WAF = YES
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
