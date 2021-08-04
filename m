Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E86FC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:57:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D53DE60F25
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D53DE60F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6789403D8;
	Wed,  4 Aug 2021 21:57:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tf4_BWWfapfH; Wed,  4 Aug 2021 21:57:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E94F240403;
	Wed,  4 Aug 2021 21:57:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E24DE1BF5DB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC27B40435
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:57:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8EUfIUFsZztC for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:57:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C24740403
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:57:07 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h14so3798477wrx.10
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 14:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fJYQPqwFPcY3EVFXoLU4rtBUTytnlt+W59rjEaLaoIQ=;
 b=MHq3IYLC/2ziTDao4Y2v24hVdeArq3Cnj0J9rOKn1gD2MUcZIQ0O8IqasmG07E2QEm
 mjXkci0FqpZtiMJT2iQzi02xbWK7qyYm6aP5w84zUY4cbjGzcTamvFc+lnecmTrdIJTh
 mXfaf1yZH9+8GJg71dzMdv+8DFeNdUp4nJVQ+1CCBVfj1bDHBFl2GSP5NsndtjuiTQ9q
 MWh0/QbJGiia7q4xOuLg+WBLWAS/n9GCq9Q/EVHc2fYrVoXYPgikCvDhEVlxbOoSAl6+
 cxe6YCcaUv0zSw+XSGwAXi4P6+CgG5bDGvCpxJKSLO9VmsClieSFcDkJUJ6Ady5OkNVr
 uWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fJYQPqwFPcY3EVFXoLU4rtBUTytnlt+W59rjEaLaoIQ=;
 b=hWknGmpMBmBB5VTIg5E8K9EVxzI65uLVSLvVj4kR3QVvjDEFqZi7r8a8bzzvNrZpab
 oDqQMIa9bvbFePb3WSceKBpJKtfTGjGHL6pNue14tBA1I5TD/p3SP47oEQBJowu3xsYD
 82flUJLQzCuN1y2Fst8zaaTFGBcFT+fK7vSWvqn1gncvDseFA32n7De821NvRjYF0lHW
 ptdXE27qRLcke8XqiO68PBW8RllnQ+eu2/NXf/LQ+Z9T/vmPi5Wr+L+8dcGWFZk+tJBj
 oJ2I2iGq1AI/A08WYUJJjjMrSvRuvKya/wZdtQaW2sTcR+peRBwQugo4JqZ9dMmhce0S
 QWOw==
X-Gm-Message-State: AOAM530IwxLjDLSwwK7AiCrHvoNHVapgoSYwUBNtgKnHJr4+tBlhbWUV
 e2tOD+L5ZPdsdexEdnoHuQ7etKqCcXlSlw==
X-Google-Smtp-Source: ABdhPJzTTUl5VpZZxLx+jVEa88U7CAOvl4gIQZ2ka/FgeEkkJ77qgj/qCwu6n+L5abGNyB+Lpp+Www==
X-Received: by 2002:adf:eec9:: with SMTP id a9mr1410449wrp.157.1628114225410; 
 Wed, 04 Aug 2021 14:57:05 -0700 (PDT)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id h8sm7049154wmb.35.2021.08.04.14.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 14:57:05 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 23:56:51 +0200
Message-Id: <20210804215652.14775-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804215652.14775-1-nolange79@gmail.com>
References: <20210804215652.14775-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 2/2] package/zstd: Prefer dynamically linked
 tool
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

If the libzstd DSO is available, then link the tool
against it.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v3->v5:
*   Rebase
v2->v3:
*   Drop config options, just use zstd-dll if possible

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/zstd/zstd.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index d7a0320df4..58dd0dd9d4 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -49,6 +49,13 @@ ZSTD_BUILD_LIBS = lib
 ZSTD_INSTALL_LIBS = install-static install-shared
 endif
 
+# prefer zstd-dll unless no library is available
+ifeq ($(BR2_STATIC_LIBS),y)
+ZSTD_BUILD_PROG_TARGET = zstd-release
+else
+ZSTD_BUILD_PROG_TARGET = zstd-dll
+endif
+
 # The HAVE_THREAD flag is read by the 'programs' makefile but not by  the 'lib'
 # one. Building a multi-threaded binary with a static library (which defaults
 # to single-threaded) gives a runtime error when compressing files.
@@ -67,7 +74,7 @@ define ZSTD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
 		-C $(@D)/lib $(ZSTD_BUILD_LIBS) libzstd.pc
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
-		-C $(@D) zstd-release
+		-C $(@D)/programs $(ZSTD_BUILD_PROG_TARGET)
 endef
 
 define ZSTD_INSTALL_STAGING_CMDS
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
