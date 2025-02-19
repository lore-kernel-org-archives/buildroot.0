Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69376C021B1
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 22:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 275B483670;
	Wed, 19 Feb 2025 22:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkiWb2B5RokA; Wed, 19 Feb 2025 22:10:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41BFD838AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41BFD838AF;
	Wed, 19 Feb 2025 22:10:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 649B6CF
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50D5E40D95
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ykQw6f7-BE1I for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 22:10:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 34A9340D9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34A9340D9A
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34A9340D9A
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:10:36 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4394a823036so2478545e9.0
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 14:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740003035; x=1740607835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i6HusbP/fVMF4LMydJYFQleMlt48rU/73Ce+g90F9pc=;
 b=mq0u0vaxMOKpBqBbyh7DIP9A7JxunkkJE+O0HgmK4YTh/EJxm0VUKYIhZ+0VwuhAMA
 tRObVEf44zxY/krYEXRjzdHCdtKhG6k/QzCP9Ba754cYBRIMT98jg5MsLgOWytsWiCZD
 uLr/yB3XLTpN5GCnFuZZIg5nDCtZY215d7eI5JeBgFwQ5EQkLmrYC8AAy6CbrUgfunl2
 PYQLcBPtpfq55kMQ2+NDG2N75tTF+I2d4AwSqc3QPbuCSH7UfwHaBecHN0mfsNlMKnrb
 3/+6ex8w8zCUX2u4xk5mbZMz/UMAftoJTm36F1GllYCUy11+oClrSdLNKBrZYDJ8a9t3
 n8mg==
X-Gm-Message-State: AOJu0YxpgxirX/eA0iokwlmuZLwg1ox5K3Fq0fGH5qAKatwpsMgXvDRe
 9kMXdj4JG6R64YEhDtprHC90JLthWu6oMHqfhp0lDXP6jB+PycEunsGw2A==
X-Gm-Gg: ASbGncsXvmck0q5/yu7Ayzl9m/c/8ShVquL07Zs8XrgYh6uyoBAdyKCGqQpThiXDCI4
 HbdyPCJ/LEhIZ66lKU1kcTRfw0Em4mxqoUFwJZMQr9j+CKdWwsRpme73VTFCR9HZxU1HiGuibJ2
 mgiLTFW3XUMxOoE4BHz54uSwYH/Mk1Dsddb0GXf9A4dBQNeAo2F0jrz9Wa9Dzr2oOA9N2udDVkT
 hR94z+6MKfRNIAZE31zhwRwkhXWzagSTsqV0A5yOPkebN2BSXtXBgQyqPtaN2ykq0kBJF+NxTtA
 oobecilW/1kbGvNchiFvSipD0Q==
X-Google-Smtp-Source: AGHT+IEoO+JKP1+iLsrm8czj/J7YY6ALbWkTs1UC/D1Im9TZlzrl7W64Axo9H/+HOUOnfdRT6iD7dA==
X-Received: by 2002:a05:600c:1547:b0:439:94ef:3780 with SMTP id
 5b1f17b1804b1-43994ef3997mr87838715e9.30.1740003034526; 
 Wed, 19 Feb 2025 14:10:34 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8443sm224799365e9.35.2025.02.19.14.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 14:10:34 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Scott Fan <fancp2007@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Wed, 19 Feb 2025 23:10:31 +0100
Message-ID: <2784191c03b023080f8aab9bcae7782ba4118d38.1740003029.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740003029.git.yann.morin.1998@free.fr>
References: <cover.1740003029.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740003035; x=1740607835; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6HusbP/fVMF4LMydJYFQleMlt48rU/73Ce+g90F9pc=;
 b=DZNsJNUN4FHEl+8OO0USI1VvhuQRNyKihR2JniFkU71VDQGX+1rHqswfV5ch8ChTVl
 0s+N/L15FpZ8epE/nwEsb14/ElnDaYbFAQM3hAoVxrNzzHgvcsqpyGX1vYETf9tiHEHj
 nznq/GwbvmIUfXJXOa2msG/bG9iFad/+2aHNH7Y3afnj47FNY2L9yBomH61QXvp2rxlv
 fdtQ93gPp5oCQuwORowANUlRF1jFl3kdigBxsmPC1jv71RrB43tft/jS2YngzBUESAce
 j954h2EWymfXwNmtoUYaGw6D1kayrri2ja9DYnFp30Xoo+FcxYnE9GYpzeVvE6Kv/67T
 pu/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DZNsJNUN
Subject: [Buildroot] [PATCH 2/4] Revert "package/sqlite: fix configure
 options for readline/editline support"
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

This reverts commit 004db1f5f3adaab7264b84e0896f9761cd9a2657.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Scott Fan <fancp2007@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
---
 package/sqlite/sqlite.mk | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 255ddc937b..5a8b033ce0 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -44,12 +44,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
 SQLITE_DEPENDENCIES += ncurses readline
-SQLITE_CFLAGS  += -DHAVE_READLINE=1
-SQLITE_LDFLAGS += -lreadline -lncurses
-else ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_LIBEDIT),yy)
-SQLITE_DEPENDENCIES += ncurses libedit
-SQLITE_CFLAGS  += -DHAVE_EDITLINE=1
-SQLITE_LDFLAGS += -ledit -lncurses
+else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+SQLITE_DEPENDENCIES += libedit
+SQLITE_CONF_OPTS += --disable-readline --editline
 else
 SQLITE_CONF_OPTS += --disable-readline
 endif
@@ -62,7 +59,7 @@ ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),)
 SQLITE_CONF_OPTS += --disable-json
 endif
 
-SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)" LDFLAGS="$(SQLITE_LDFLAGS)"
+SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
 
 define SQLITE_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
