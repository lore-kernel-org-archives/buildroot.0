Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01424C636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 18:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AB6C415D3;
	Sat, 11 Feb 2023 18:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AB6C415D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1CKif-sdaIE; Sat, 11 Feb 2023 18:26:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B55D415F5;
	Sat, 11 Feb 2023 18:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B55D415F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFE321BF59D
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A94B818A1
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A94B818A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1oIFZE9rdnR8 for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 18:26:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9727C8176A
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9727C8176A
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 18:26:00 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id k3so666250wrv.5
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 10:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+0XAhqOGUwJvJLdBtkF4ve6bVZUL8xfBBf25LGB0P2I=;
 b=rxPwYAzNgKnFzcQ/DbtHTbvDhzt4c6C2rBdednqIN8LOaoDlaKzBLej/zvUcY6L9mG
 RrMEsoho0G7puuV8lcaxMfBksQlRqQTk08prTbUBZHPLW7wpAcNq4sE4Elr1qBZzGu+N
 WLtkXmob4VIjiSutj8oC3f1u7wF7gCo+WnKES7UFgnzHvjYgbr8N3k0QFiK6WzCHJtuY
 HiOoASCj1AWgqDNGWtXz9t0yFLkx3X4GXaRp5IzF7GBFuvNbEQ6qmjxq16fSOkUrEq1v
 Ei0iDjHaWa5gYLSDZ0iWo6Mjo5emwEjldeD+q174faWnKfdOS+IXm8fhwuHSbts1B/es
 5n+w==
X-Gm-Message-State: AO0yUKXNdIuoQmEEwV/b4V7wYi9HGsyFnzId0CMP/U6fn6959VNmy5yX
 lBW+zR6sOkw9GxntqUXKc+iOM8veG+iTpRjE
X-Google-Smtp-Source: AK7set/Ed+sBnYZRQH8zaVWAIxFy7aRVmoJarfiZzK96tltd3kMqAR40ojam+bwvWkEiF64J6kwQkQ==
X-Received: by 2002:a5d:4c8d:0:b0:2c5:4cd0:4b86 with SMTP id
 z13-20020a5d4c8d000000b002c54cd04b86mr3559673wrs.68.1676139958503; 
 Sat, 11 Feb 2023 10:25:58 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:64de:b20e:de86:754e])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5d4c4f000000b002c54538c9bdsm5086256wrt.10.2023.02.11.10.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 10:25:58 -0800 (PST)
From: thomas@devoogdt.com
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 19:25:45 +0100
Message-Id: <20230211182546.633728-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230211182546.633728-1-thomas@devoogdt.com>
References: <20230211182546.633728-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/3] package/fluent-bit: fix builds on s390x
 architectures
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@gmail.com>

Fixes:
 - http://autobuild.buildroot.net/results/856fd250f75a696694c70e3208ffcef7470a7082
 - http://autobuild.buildroot.net/results/dceb413fb5d459338417d8dd5a42d95aa23e849b

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
---
  v2: new patch in this serie

 package/fluent-bit/fluent-bit.mk | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 4ecf813511..d618fdf1e2 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -12,6 +12,9 @@ FLUENT_BIT_CPE_ID_VENDOR = treasuredata
 FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
 FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml openssl
 
+FLUENT_BIT_CFLAGS = $(TARGET_CFLAGS)
+FLUENT_BIT_CXXFLAGS = $(TARGET_CXXFLAGS)
+
 FLUENT_BIT_CONF_OPTS += \
 	-DFLB_DEBUG=No \
 	-DFLB_RELEASE=Yes \
@@ -42,12 +45,16 @@ FLUENT_BIT_CONF_OPTS += \
 FLUENT_BIT_CONF_OPTS += \
 	-DCMAKE_INSTALL_SYSCONFDIR="/etc/"
 
+# Fix multiple definition of `mk_tls_*'.
+# https://github.com/fluent/fluent-bit/issues/5537
+FLUENT_BIT_CFLAGS += -fcommon
+FLUENT_BIT_CXXFLAGS += -fcommon
+
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 # large file support.
-# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information.
-FLUENT_BIT_CONF_OPTS += \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS"
+# https://bugzilla.redhat.com/show_bug.cgi?id=574992
+FLUENT_BIT_CFLAGS += -U_FILE_OFFSET_BITS
+FLUENT_BIT_CXXFLAGS += -U_FILE_OFFSET_BITS
 
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 FLUENT_BIT_DEPENDENCIES += musl-fts
@@ -60,7 +67,9 @@ FLUENT_BIT_LDFLAGS += -latomic
 endif
 
 FLUENT_BIT_CONF_OPTS += \
-	-DCMAKE_EXE_LINKER_FLAGS="$(FLUENT_BIT_LDFLAGS)"
+	-DCMAKE_EXE_LINKER_FLAGS="$(FLUENT_BIT_LDFLAGS)" \
+	-DCMAKE_C_FLAGS="$(FLUENT_BIT_CFLAGS)" \
+	-DCMAKE_CXX_FLAGS="$(FLUENT_BIT_CXXFLAGS)"
 
 define FLUENT_BIT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
