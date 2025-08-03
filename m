Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A03AC87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 13:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1A3460AC7;
	Sun,  3 Aug 2025 13:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1TejmzdaBGW; Sun,  3 Aug 2025 13:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A6E16100B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A6E16100B;
	Sun,  3 Aug 2025 13:38:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24533233
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 13:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12E4780EA9
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 13:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mpKCB6DyEr_V for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 13:38:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6D5280EA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6D5280EA7
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6D5280EA7
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 13:38:49 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-458aee6e86aso13248705e9.3
 for <buildroot@buildroot.org>; Sun, 03 Aug 2025 06:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754228327; x=1754833127;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wnxRtmo1lIx/nHLnPo8iMWS42EGf7BtKus9FfNpHPPI=;
 b=eF/cJ9bKMo+M6GXyLI1dlzapZqOk6+xl4QPKqk/7u3tZ8FtYyd82ys7H2AeX36YnNB
 qairWgyGnLtvYuL3r01zALSuLzZLpg6/sR6XOvUivNmhU5D2K9I+yGZpcpXZ9bo5ieVx
 2PyoIwNDanGoy+9xZztPAICdttPLxcF74AkNOqIqtPuVyhfUY98iWF6lYJ1HG0mxfeb6
 PqtErdwpR/O2gTrY0m0gJRX4Zdn+ic2l8JYSCbQDj5/cTir3QH+6wCHIMt6wq1ZEaSmM
 cSDgTmhMehmpDYMHywKM/CFV/qersKF/jqeUVN98KrzAuCOMi+Pk9azsjw7jspsG5UUM
 tu5w==
X-Gm-Message-State: AOJu0Yzy3hg/WU4ch1DCUEI/xkKPKESA9F+v1e3EgM+L4mOnajbspPk+
 SAXd4M+SNnvbmMWu/NU3uuty4iv+wWezdo9cIOJn9K09OI0twk/KopzFh9QB8t+kft79j538IDK
 49rMW
X-Gm-Gg: ASbGnctYt3Xr7aCi6vjDtH5qi5cRnMpJ7mYYTHT/6KQ4pbw6+3wD4rmaAkLiPF7dW1O
 kwYCHheMLvjs+ZsAWGC4D+cezDySDNYKAbCkMqy7vYnZtYXhX8hex7vMrbj39RcbXs4ZKIs7NTG
 +eX0RwPrJJRxG4A6/DexZ/LeIKmbHBAQWBBAU2eH2v7JgD/lQPcWqm0d3hxvlz2F4BUo/SVuNcl
 cFKatASormDvkt8yAhk6QXih5sO+CDOxQUS+gc2UnIr4YlZRvQSaaCLIwjEf9uUQUNeXWdSo8RR
 /+ie8jgj+EcZM1ye7V4lJApAnwxS1q3DVH9mb2BqXF6Sx9C/sPFHSyz+XRd/9xHKFijY1Rdpfd7
 OcbVDD0G3iHImUw==
X-Google-Smtp-Source: AGHT+IEVpSHA2ikqnQrN9sUsVzpN536+AqTFr5VGALmRz0LeWw+22tQOIbY25AJEQhFNE5F6JcFPaA==
X-Received: by 2002:a05:600c:1554:b0:450:d37d:7c with SMTP id
 5b1f17b1804b1-458b6b2ff8amr46008255e9.21.1754228327429; 
 Sun, 03 Aug 2025 06:38:47 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453ab0sm12493421f8f.44.2025.08.03.06.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 06:38:47 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Sun,  3 Aug 2025 15:38:46 +0200
Message-ID: <20250803133846.2762327-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754228327; x=1754833127; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wnxRtmo1lIx/nHLnPo8iMWS42EGf7BtKus9FfNpHPPI=;
 b=gcE6KJC5vR3QJI/vrECv7WfrWzDxfblZDDd2iSOn1RIcrsj+x0FPuqpY9d+PF9FxpB
 c7Kr16BBzrD83d3r2xyBTFNyl40Jg77nOCKQZmDa0vrxJzTkn+UkPDaJe0wsVWFyDcyt
 ivcMDDmiEL+673dG4y+69ERok61jyACxXVwVySyavlOqXCNsDFiCkyLCOjWUGZHGnVOO
 O37cueaaZv74da+FC0bBipnbz9X6fTX6tIh1VqNmFHZZ+9dESWn6svxujj/XxtE2lP5u
 bPimcDW73elzeoig3ApQnciVwo/kTnNoIx+Xf74/6VUMf3DCsNO1qFYIcvvm3vmDZHuk
 n8mA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=gcE6KJC5
Subject: [Buildroot] [PATCH] package/sqlite: ignore CVE-2025-3277
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CVE-2025-3277 as been marked as a duplicate of CVE-2025-29087 by the
debian security tracker [1].

The CVE-2025-29087 has already been fixed in commit [2] so this patch
adds CVE-2025-3277 to the ignored CVEs.

[1] https://security-tracker.debian.org/tracker/CVE-2025-3277
[2] 835b5659ea package/sqlite: add patch to fix CVE-2025-29087

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sqlite/sqlite.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 037b89918a..4f4bc9d3af 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -14,7 +14,7 @@ SQLITE_CPE_ID_VENDOR = sqlite
 SQLITE_INSTALL_STAGING = YES
 
 # 0002-Add-a-typecast-to-avoid-32-bit-integer-overflow-in-t.patch
-SQLITE_IGNORE_CVES = CVE-2025-29087
+SQLITE_IGNORE_CVES = CVE-2025-29087 CVE-2025-3277
 
 ifeq ($(BR2_PACKAGE_SQLITE_STAT4),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT4
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
