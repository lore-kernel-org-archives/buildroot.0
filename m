Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1432DCF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 15:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAF64606EB;
	Sun, 22 Sep 2024 15:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkZRy1VW0-cd; Sun, 22 Sep 2024 15:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5DD3606F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5DD3606F0;
	Sun, 22 Sep 2024 15:06:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 523F31BF3E8
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 15:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 409D7400D7
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 15:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wf0VExTf9uHa for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 15:06:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F447400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F447400B5
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F447400B5
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 15:06:13 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4280ca0791bso33896865e9.1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 08:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727017571; x=1727622371;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=osqD/9YV2TBa2scIkuwtJqJpzM1iKDZ9ACjC3pqA7rY=;
 b=aLLmAIAwaz54yFjyfotNuhnTbfJFG2OgGegVdM3zk7nW3ek/COYRL05UjDvEQb5PbK
 gFLzScScHY0g4LnIOKonsZUA1sHDfFXng1OvL6SViUZBHFwBd8G5rvktSV/5ihSvchlZ
 BGWUJx/ILbntB2TEICIRJ7L18yrmxINgVQIv+uVJQSzv9EVJUYYFIiFTNx1vHEN8NnHN
 c0DPhRftuXsh7hT/K2ikkgUBjIuWV4HJ/nCgk+posPspZMPLhf/GvUnpQGON8U4PQilV
 OeFKikK2wSPLoocyVEbThBcgLbIf/fBTsKMIiqxWDyy/okWYHZ+Q5h741mBkdrzt+Lt/
 tAbQ==
X-Gm-Message-State: AOJu0Yy9c/OG1WYpWpYzifn5K5CEqZEMZQ/eB0FeLq6HO7uJKaXdm0j2
 j+0aqYa8inUJ3UnPFtV3kcebhmbAE+8sJazOay0KoPSqRI7PjZgIHBi7qTg8OEpOtIyuPcETayn
 QOY0=
X-Google-Smtp-Source: AGHT+IEXJ4Ys9qpk8/JfS0LyiI4DH0Sb9dMoHvRMD7bd/SZid5HdehPst//ntJ7yN6MqFEZGGGQp6g==
X-Received: by 2002:a05:600c:358e:b0:42c:b45d:4a7b with SMTP id
 5b1f17b1804b1-42e7c1a2ffbmr67208695e9.25.1727017571422; 
 Sun, 22 Sep 2024 08:06:11 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e754a6638sm102542065e9.38.2024.09.22.08.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 08:06:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 17:05:54 +0200
Message-ID: <20240922150554.1348962-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1727017571; x=1727622371; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=osqD/9YV2TBa2scIkuwtJqJpzM1iKDZ9ACjC3pqA7rY=;
 b=XTJMBlKPBe81Uzc6XLms3p8lwxu4oxKwdq4dF0jZGyIomh455j9Rhz7cw5iDP3ufqt
 ITEbn7dRZEBuvgLFZUm75XGib0hZ1tqu953KKKDv9mVr5E7kTSghJ00qABYiYwuwlAV8
 vTHVenV94dXfivDnMHJe8352S4oWj9cNamwv2bcGO4/Yf0r+5HG3u3BcgaZkMnkH13dE
 hh0dI8vX6k8B92qZefw4IEdRe4UMYpRPwxa0eoU85+EBpBY/tCerus0eex20DkQWgRD9
 GS1UHn1xdZ+GllOMY/6uHV4nMT/DQD1by3ui/8QXvJw5lodQF+B90+6yHxiMkCnC62i2
 aUXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XTJMBlKP
Subject: [Buildroot] [PATCH 1/1] package/aubio: fix build on big endian arch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following error happening on builds with
big endian architecture target and libflac enabled.

```
[ 75/243] Linking build/tests/test-pitchshift
/home/autobuild/autobuild/instance-16/output-1/per-package/aubio/host/bin/../lib/gcc/mips64-buildroot-linux-gnu/13.3.0/../../../../mips64-buildroot-linux-gnu/bin/ld: src/libaubio.so: undefined reference to `SWAPS'
collect2: error: ld returned 1 exit status

Waf: Leaving directory `/home/autobuild/autobuild/instance-16/output-1/build/aubio-152d6819b360c2e7b379ee3f373d444ab3df0895/build'
Build failed
```

There is a missing definition of the `SWAPS` macro in
`/src/io/sink_flac.c` file.
This patch adds an out of tree patch that copy the `SWAPS` definition from the
`/src/io/sink_wavwrite.c` file in `sink_flac.c` to fix this issue.

Fixes:
  - https://autobuild.buildroot.org/results/b88/b8895a81411dc7622b0aba9f2f0eaa0aef5a1a10/
  - https://autobuild.buildroot.org/results/bc7/bc733f5192b354cb960b6a4726efb597be4bb06c/
  - https://autobuild.buildroot.org/results/ea5/ea52dbcc14c2bab300277053f0b9599a8e82294a/
  - ...

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...1-sink_flac-missing-SWAPS-definition.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/aubio/0001-sink_flac-missing-SWAPS-definition.patch

diff --git a/package/aubio/0001-sink_flac-missing-SWAPS-definition.patch b/package/aubio/0001-sink_flac-missing-SWAPS-definition.patch
new file mode 100644
index 0000000000..5f321b5363
--- /dev/null
+++ b/package/aubio/0001-sink_flac-missing-SWAPS-definition.patch
@@ -0,0 +1,45 @@
+From aebf4fb23df2c4ec8857aef05a468991054a58c1 Mon Sep 17 00:00:00 2001
+From: Thomas Perale <thomas.perale@mind.be>
+Date: Thu, 19 Sep 2024 18:57:16 +0200
+Subject: [PATCH] [sink_flac] missing SWAPS definition
+
+On big endian architecture with libflac enabled the following error
+would happen when cross-compiling aubio with buildroot.
+
+```
+[ 75/243] Linking build/tests/test-pitchshift
+/home/autobuild/autobuild/instance-16/output-1/per-package/aubio/host/bin/../lib/gcc/mips64-buildroot-linux-gnu/13.3.0/../../../../mips64-buildroot-linux-gnu/bin/ld: src/libaubio.so: undefined reference to `SWAPS'
+collect2: error: ld returned 1 exit status
+
+Waf: Leaving directory `/home/autobuild/autobuild/instance-16/output-1/build/aubio-152d6819b360c2e7b379ee3f373d444ab3df0895/build'
+Build failed
+```
+
+Indeed there is a missing definition of the `SWAPS` macro in
+`/src/io/sink_flac.c` file.
+This commit copy the `SWAPS` definition from the
+`/src/io/sink_wavwrite.c` file in `sink_flac.c` to fix this issue.
+
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+Upstream: https://github.com/aubio/aubio/pull/407
+---
+ src/io/sink_flac.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/io/sink_flac.c b/src/io/sink_flac.c
+index 04144793..0a1cbc26 100644
+--- a/src/io/sink_flac.c
++++ b/src/io/sink_flac.c
+@@ -36,6 +36,9 @@
+ 
+ #define MAX_WRITE_SIZE 4096
+ 
++// swap endian of a short
++#define SWAPS(x) ((x & 0xff) << 8) | ((x & 0xff00) >> 8)
++
+ // swap host to little endian
+ #if defined(__BYTE_ORDER__) && (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)
+ #define HTOLES(x) SWAPS(x)
+-- 
+2.46.0
+
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
