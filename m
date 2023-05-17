Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AA3C77B7A
	for <buildroot@archiver.kernel.org>; Wed, 17 May 2023 13:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 307CF408FC;
	Wed, 17 May 2023 13:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 307CF408FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DStYaSxVqY8L; Wed, 17 May 2023 13:04:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65F464026E;
	Wed, 17 May 2023 13:04:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65F464026E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2E361BF487
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 13:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA54283C20
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 13:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA54283C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 29Fvx-ooO-5d for <buildroot@lists.busybox.net>;
 Wed, 17 May 2023 13:04:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4EBE821AC
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4EBE821AC
 for <buildroot@buildroot.org>; Wed, 17 May 2023 13:04:38 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-510d1972d5aso891034a12.0
 for <buildroot@buildroot.org>; Wed, 17 May 2023 06:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684328676; x=1686920676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4og/GwDmnNtyznmedM/DxVkbQ4Pxf+FdJkFNwOOBkDg=;
 b=MjL5218pPridVg9fvYmXywBwuksXqW/LN4nekYva7WOj01EX295eBLXmzaDDBVAmbz
 Op4nxb9v7clecTTqA1VLciLhbd2PiFF/ozHvl3AZW4louqjaDDMtTtN9EH3GMWNYUWSR
 mNQ1QhQeNoFGx5GhSfZLBaeg3RMGrdtXRN5oPpNOCQubaJ57ZEdZiGPp6lWg8PrUvYsC
 95znaP20QBPFka/sI29f6EWj6kuTqp/lUDm2Ul8i119CrGKzG9ncvpzDT6Na7+tN3dKy
 /y4tiPkbAoRpJwyMPJTopJB0LG85cf9WW7pufrgrQnN9/SLA7KZcgOXdT0bk/N0/9orK
 krDg==
X-Gm-Message-State: AC+VfDzsLpsT19YxsGt8AliUBRnYQgHYIEzyayNi/hPlXT9xcO44u3O7
 Z+uPzUsgCwBBtN24dwzPBrwf1nJWEEHNDQ==
X-Google-Smtp-Source: ACHHUZ4No6A6DcFVXCA/p5aurTLDFFlL936twb6JztxvTmGPvVx/hUZGf8MFIRcX3YH25eth1FheUg==
X-Received: by 2002:a17:907:72d6:b0:94e:43ce:95f6 with SMTP id
 du22-20020a17090772d600b0094e43ce95f6mr39807273ejc.47.1684328676192; 
 Wed, 17 May 2023 06:04:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:d0d:f903:7c5:c782])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a17090632d200b009661f07db93sm12206929ejk.223.2023.05.17.06.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 06:04:35 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed, 17 May 2023 15:04:28 +0200
Message-Id: <20230517130430.2868648-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517130430.2868648-1-thomas@devoogdt.com>
References: <20230517130430.2868648-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/fluent-bit: drop cxx handling
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fluent-bit is written in pure c, so drop any cxx handling. Only the wasm
part needs c++, but that one doesn't need the fixes which are now dropped.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/fluent-bit/fluent-bit.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 60a1d06dbf..d470e26b5e 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -13,7 +13,6 @@ FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
 FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml openssl
 
 FLUENT_BIT_CFLAGS = $(TARGET_CFLAGS)
-FLUENT_BIT_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 FLUENT_BIT_CONF_OPTS += \
 	-DFLB_DEBUG=No \
@@ -49,13 +48,11 @@ FLUENT_BIT_CONF_OPTS += \
 # Fix multiple definition of `mk_tls_*'.
 # https://github.com/fluent/fluent-bit/issues/5537
 FLUENT_BIT_CFLAGS += -fcommon
-FLUENT_BIT_CXXFLAGS += -fcommon
 
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 # large file support.
 # https://bugzilla.redhat.com/show_bug.cgi?id=574992
 FLUENT_BIT_CFLAGS += -U_FILE_OFFSET_BITS
-FLUENT_BIT_CXXFLAGS += -U_FILE_OFFSET_BITS
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 FLUENT_BIT_DEPENDENCIES += libexecinfo
@@ -74,8 +71,7 @@ endif
 
 FLUENT_BIT_CONF_OPTS += \
 	-DCMAKE_EXE_LINKER_FLAGS="$(FLUENT_BIT_LDFLAGS)" \
-	-DCMAKE_C_FLAGS="$(FLUENT_BIT_CFLAGS)" \
-	-DCMAKE_CXX_FLAGS="$(FLUENT_BIT_CXXFLAGS)"
+	-DCMAKE_C_FLAGS="$(FLUENT_BIT_CFLAGS)"
 
 define FLUENT_BIT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
