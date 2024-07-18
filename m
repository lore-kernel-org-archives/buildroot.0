Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B65C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 18:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B075140464;
	Thu, 18 Jul 2024 18:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SxD-qyaR2njj; Thu, 18 Jul 2024 18:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7523640962
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7523640962;
	Thu, 18 Jul 2024 18:13:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 496561BF337
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 18:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34E46818CD
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 18:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3T8WG7qI3BK for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 18:13:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 352BD81839
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 352BD81839
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 352BD81839
 for <buildroot@busybox.net>; Thu, 18 Jul 2024 18:13:19 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4266f535e82so5281425e9.1
 for <buildroot@busybox.net>; Thu, 18 Jul 2024 11:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721326397; x=1721931197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XDR3cDL8ILgRX11XQ2A9w+I/5C87Z28D6KEnarTBKD0=;
 b=e1ZzoG09POy+CeKgq1lrm2YQDLU/3Kw0xFyM7ShbaRDrzRSH7WClDpgxZ7YZQFpvTZ
 sM/zp2FCn9RJOG64sPGC7qxspa6zIUR0HQVgkabaBambqDxnhqTr7NW0rlWl9JsYPXKn
 ag9wy3TvIHvQ+MHTzfgCBWmqEUaQ+X8oDSaTpv8l5uAewzrs29cCwprN5a0VOqsOWfEQ
 iV7rc4nJVd58WCQoOupZ03P9tQcGRmm8XSgMcS4c0F+r5i/qhQg+mPy+pXHUwPh1VzPh
 twLubuhnJFddkpolV2DTmalDMt8KRhb0/Kj/MLwG6QejfQTNwJynlLjYGgt7/hTFdSwb
 v7tg==
X-Gm-Message-State: AOJu0Yxk5BY1NLoxn1EZY3QBmSITW58urPJdmSfFcIQo3HEyjT9N2YZl
 l3nwJvwE0OpAzdu7fNTTxTQ/kZSjgUdUP7K/Ri6C+IOdO4HQbSltTDBj8+SJhL4zfLHAG9B6jAc
 =
X-Google-Smtp-Source: AGHT+IGEAam7qozuX51MyKZFv9uRojdo7Yzpw0xigElj92lFlTXUOlkypJUBbkm95lZvIXjiwKPpaw==
X-Received: by 2002:a05:6000:2a5:b0:368:460b:4f8e with SMTP id
 ffacd0b85a97d-368460b51b0mr3568282f8f.13.1721326396997; 
 Thu, 18 Jul 2024 11:13:16 -0700 (PDT)
Received: from vm-2404.. (140.33.66.37.rev.sfr.net. [37.66.33.140])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3687286e419sm258085f8f.104.2024.07.18.11.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 11:13:16 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu, 18 Jul 2024 20:13:09 +0200
Message-ID: <20240718181309.790311-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1721326397; x=1721931197; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XDR3cDL8ILgRX11XQ2A9w+I/5C87Z28D6KEnarTBKD0=;
 b=GpLlT/Caful5TY4iBNJSltB7xs5ULzZ6OhHiLqUJ1mxH7CbOs+c9KCCBat+UEL2Nzy
 FzZjRkDObguqc902RzHvj5xH8j3GtCv0LHEzVLnFsPsvKe9daKijtr/Y7zFWirlH+Lp9
 IFM19NDw5THHf/U+VG+XFyZo9v4ETbZCkJPWB/egupwedEYg8wylCJzQdnHrkrvom9uM
 yw9GsWxQYf/1Ts1UQERkH6C8w/CLT2+tbSiJKayDQ7FkddfUvPmhQvTeg3PZJ4j9UqQ4
 jMSMFhyT2zciMtlrxuL7UtZH5Mx+DTWZTbM4OuRWkY1cYe885rq55yuekqEp1mjpOmGE
 6R9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=GpLlT/Ca
Subject: [Buildroot] [PATCH] package/lua-lsdbus: bump to version
 ca7509b41a26b4a3c9b9d2c523be090bdbcc89fe
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-lsdbus/lua-lsdbus.hash | 2 +-
 package/lua-lsdbus/lua-lsdbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-lsdbus/lua-lsdbus.hash b/package/lua-lsdbus/lua-lsdbus.hash
index 369370d63..93a086f16 100644
--- a/package/lua-lsdbus/lua-lsdbus.hash
+++ b/package/lua-lsdbus/lua-lsdbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b515cd00c844abc80993e9552d884c71a80a680e47b90a628f1f7bd18b9b821a  lua-lsdbus-d132f8b2bd390d0b1c7d17b300190279f92bd494.tar.gz
+sha256  9a967720736b0f6ff9b3f527846de28aaf74f58775af6358c13c31c0ac37b832  lua-lsdbus-ca7509b41a26b4a3c9b9d2c523be090bdbcc89fe.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/lua-lsdbus/lua-lsdbus.mk b/package/lua-lsdbus/lua-lsdbus.mk
index cbd7ee9d4..865a5f8f3 100644
--- a/package/lua-lsdbus/lua-lsdbus.mk
+++ b/package/lua-lsdbus/lua-lsdbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LSDBUS_VERSION = d132f8b2bd390d0b1c7d17b300190279f92bd494
+LUA_LSDBUS_VERSION = ca7509b41a26b4a3c9b9d2c523be090bdbcc89fe
 LUA_LSDBUS_SITE = $(call github,kmarkus,lsdbus,$(LUA_LSDBUS_VERSION))
 LUA_LSDBUS_DEPENDENCIES = luainterpreter mxml systemd
 LUA_LSDBUS_LICENSE = LGPL-2.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
