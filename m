Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8E3CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 20:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C751B41970;
	Fri, 29 Aug 2025 20:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHmnklEZu9m9; Fri, 29 Aug 2025 20:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D388841928
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D388841928;
	Fri, 29 Aug 2025 20:19:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CF58FA
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 20:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EA6F61771
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 20:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNsMHOfeW2WX for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 20:19:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 339156176E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 339156176E
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 339156176E
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 20:19:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-3cd59c5a953so1631624f8f.0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756498782; x=1757103582;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SHINIC5NPU/eQKwyQGojAxaBauajMF0rD36DAQZhvTs=;
 b=LY0GyrDx6Jga2wqwYlNfcBsvj9D3lquuCLfWRAP/Q/ie+j+sm1vVNx1Ds0uBr08Ky0
 iu16gtk1NpGQYQilO14YjTUGNk+MG5XKk2axP+/F8NIFpAoq4FlerKUfGi1MpeL+QECl
 vk/juoHhq8CDdj9ub1O+P9Cn05M+KDQ+rZpbZjVqI64MOFmoFg3tR9ZI8PMSgbkw/DIA
 RUgqQgvRUEP6zw3mjRG0O6OoeD9D46PgSyd0K9S1wymaIbuqkSfcdETuOJxpeTFHUPR7
 n+uCbQ2DlTiCLoLIwe9O0d3I+ILEijnmqUS8VOSrYL356hqLjFpmBBF0W3To9JMXIBuW
 nkKA==
X-Gm-Message-State: AOJu0YzsbGu8N+5n6rA77/YKjljKJC+4ZAoTp7LLXbcS8d8bwN/8awxY
 ysA4KNzpPm2YG4eD/q/IWebmoPE5u+QOkYpUHu4TMbmnD3Bj2OukrAsysMO3hpF2JI5riFtz5SV
 8w5QbE7ms9DXPhEo=
X-Gm-Gg: ASbGncvuSaFZlrGrMjL1Qs+f1+iVKRuYLHdDcXNzwGfW9ATnRebgccXQQYU2JciH33K
 QTlIGBoEOLR2cou+OPXy3xHU36uuDtOF8NoEffgmPPndOFxEhQxRflnWCcX5P8LC5ok26or8KL7
 TzhEL3CHmV+BHsnf1gMbMcAUT6vfsq3C/lxF30qspvO5TvuaDAz744/J2NXXExCdGKp1RaqJwm9
 Wa9bj4rK16IxfWYk8PG7A99UpPIiWifgrzMWNO7kyWvNiqLcEzrZt6nwa83gvv4sg4OHkR9hlly
 8FKVtt5K3+bSH5d4ZcAFueiu25471f0UIEzWHSnBuS50o/njog92Dq50bApqIHATG1OH8bHDsI9
 QCKo6l6/UMRyaPivhkPizT+jdG33aDvs54lP07rJ8vSDAmwOzdfx5xshiXXs8vh2gGbQnp3GuWg
 vTM8x9840y4Lk=
X-Google-Smtp-Source: AGHT+IFAAxAuVUL1E/cN+oRVHCG0Iaj/G133+9wHH9qkVnHBA6MvXioEjkQCko0MHA5CGoqcjfozPA==
X-Received: by 2002:a05:6000:25c2:b0:3d0:205e:976b with SMTP id
 ffacd0b85a97d-3d0206de3d2mr2754552f8f.17.1756498781759; 
 Fri, 29 Aug 2025 13:19:41 -0700 (PDT)
Received: from dragon.local.ess-mail.com (ip-185-104-138-23.ptr.icomera.net.
 [185.104.138.23]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf34491a7fsm4390369f8f.57.2025.08.29.13.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 13:19:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 22:18:35 +0200
Message-ID: <20250829201835.795429-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756498782; x=1757103582; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SHINIC5NPU/eQKwyQGojAxaBauajMF0rD36DAQZhvTs=;
 b=bk2MEMOST66thUunnh/HaLrKGnBuJMp7V4m+Xeie8g9klW4g+KymU/ZRUWYi5ZvCW4
 V4kWq2oIRSUShKbA8bgye5AxNNSWLTYmKSSxODhFjQ4yffhCjt9WxXdGE+QNdQf4B0qB
 mh+El6eo2TaIKFKhXehbPOEbdx5xZ0jo5vbRYEQ4FM60yJNe0Tpw4jpmmCPDh/LDhiyR
 oHalLdZzEEPgQIQK4v0TjIWMofmnHB+8LOHhTcnp8XTP2iXDEbLqgdlhpr7b7SIfwork
 9NTaGNHBy/7La5rmHDhMQYX15e4Azxv5EpWGgFMKyXxd5h9FSVgKdJ7s/luUORY+IWTf
 iicQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bk2MEMOS
Subject: [Buildroot] [PATCH] package/mosquitto: fix build failure with
 recent glibc
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix link-time build failures because glibc>=2.34 no longer ships libanl.so
as it has been consolidated into libc.

See the inner patch message for more details.

Fixes: https://autobuild.buildroot.org/results/16223cd838876abc9b6f941f7dc20d23afa32c3b/

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...02-Add-configure-time-check-for-lanl.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/mosquitto/0002-Add-configure-time-check-for-lanl.patch

diff --git a/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch b/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
new file mode 100644
index 0000000000..b67164123a
--- /dev/null
+++ b/package/mosquitto/0002-Add-configure-time-check-for-lanl.patch
@@ -0,0 +1,47 @@
+From 447a6aa8df882a67ca3df6f5e95be42e1463eaf0 Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@mind.be>
+Date: Fri, 29 Aug 2025 19:47:34 +0200
+Subject: [PATCH] Add configure-time check for -lanl
+
+Since glibc 2.34, libanl features have been integrated directly into libc [1].
+For backward compatibility, some toolchains still provide a shim for
+libanl as a separate .so, but new toolchains (for example for new archs
+like loongarch) do not provide it anymore.
+
+In such a case, building mosquitto fails at link time with (see [2])
+    > cannot find -lanl: No such file or directory
+
+To fix this problem while maintaining compatibility with older toolchains,
+check if a simple program that uses libanl can be compiled without -lanl,
+and only add the linker flag otherwise.
+
+[1] https://sourceware.org/pipermail/libc-alpha/2021-August/129718.html
+[2] https://autobuild.buildroot.org/results/16223cd838876abc9b6f941f7dc20d23afa32c3b/build-end.log
+
+Upstream: https://github.com/eclipse-mosquitto/mosquitto/pull/3358
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ config.mk | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/config.mk b/config.mk
+index 34d5163f..cc7987c4 100644
+--- a/config.mk
++++ b/config.mk
+@@ -318,8 +318,11 @@ ifeq ($(WITH_EC),yes)
+ endif
+ 
+ ifeq ($(WITH_ADNS),yes)
+-	BROKER_LDADD:=$(BROKER_LDADD) -lanl
+ 	BROKER_CPPFLAGS:=$(BROKER_CPPFLAGS) -DWITH_ADNS
++	NEED_LIBANL := $(shell printf '#include <stdlib.h>\n#include <netdb.h>\nint main(){return getaddrinfo_a(0, NULL, 0, NULL);}'| $(CC) -D_GNU_SOURCE -o /dev/null -x c - 2>/dev/null || echo YES)
++	ifeq ($(NEED_LIBANL),YES)
++		BROKER_LDADD:=$(BROKER_LDADD) -lanl
++	endif
+ endif
+ 
+ ifeq ($(WITH_CONTROL),yes)
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
