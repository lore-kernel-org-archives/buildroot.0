Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CBDC5B572
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 15:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C44C04073D;
	Mon, 17 Aug 2026 15:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b9oZLjINyrxB; Mon, 17 Aug 2026 15:54:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E97BB40741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786982079;
	bh=2rqdOn4UPNn0vUcrPm+cqK0xaF0CN/VHtXr48Pg2uZk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vbrr8uG9CgQ+Q6pjZq+sfwAuXxjdVrach7s9NS6qWb7zpJoCkxn7tceh72IR5V8nR
	 3LjLKYfHtClIkoAa2pURkzBS5uXUKo7ESQCjQtQO/2cT2ejDGXUlZ2CIft6A4iSYZi
	 QG/uiEgZWoAZRbmGGH/NVjGmoL6zQP0+ku+0Yh9Qouv5dlYpH2anjx6IYhWUSpzSJC
	 bV3YHEfvlfazChCWDmP8+xp6N5i7uTZa+rXQv76oGxeKA5oKBRsH5onaa8JG9sEveG
	 d6xO5Bjnn19kT2iMbV04eP+eAuFvi/NVDJQAiAbHSq9zNccvxdIBOttHHTmEoSUXe0
	 UOWZypZKzpc3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E97BB40741;
	Mon, 17 Aug 2026 15:54:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ACB8194
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 15:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1847380A70
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 15:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDHfZ0BuDsTt for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 15:54:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41EF2809B1
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41EF2809B1
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=XvpqSdwn
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41EF2809B1
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 15:54:36 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-84f38f3b36eso2306215b3a.1
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 08:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786982075; x=1787586875; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oYbE2fXmhoJwoD81e+b2a7+mdS1y4sgPUIhbCwNHRoY=;
 b=XvpqSdwnRWoK3pyqZ7wfvyZDkkIhdcS+Kv/svzqFESoLfHKS2IVNujxcevO2kKAzcq
 r4/7jQ1muZqCBv8fxYtcbPIy707Ry/EVF4xK0dDTD9I5FmsCipl7guqVIVL4dlN02AgT
 IIzBg6qPJmJMgxDKePKzjgXTUMntflyo77bpBy1CYdernS6GyrDElD1brez2mMFRFXGH
 YV5Abd3KXYiZhniYSdnfQ7Rfw1thMo0n0CD2G3ZSRdUASJr5AVhF9RYCSuBqoFyNQ/hB
 SVTd93kJZc7ChA1YJHoDUwa4j9yVZ63yozDvSWPOFD2fwwkaa/oj5qWuSPjVVZ2nTd/U
 6dUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786982075; x=1787586875;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oYbE2fXmhoJwoD81e+b2a7+mdS1y4sgPUIhbCwNHRoY=;
 b=Mdquwjg7v/v4vptSKUpo0IFqA3F+K9lSBkSpgaAiKRpoY6pcMsotV+O7AMTSgWDepP
 jIKO/TvMFHZK6Cmp/vEq68FTgUVMo/SoVVguAHrQZpZtWBJ9CiV8EIWFHxKyWf1t02KM
 30ZeaKtFcBGbLMhW2/hqgbfvXBQT+hfG6bxE4hgmMCskaZAPw5GBK4dKEv6OdXSWcUmY
 nQVvgkl/jeWDHQyE4atncLGdT8DncC8W0mxdQfm88Xp4FZRjn+QDL0KywJxNI1I74LkR
 FgJAzyj/0LnzdItSBGw1vRc4mBowzLnhU5ajrx2bQ/1nH3gJf+dnXh/gZFUrmt/obNzl
 hHHQ==
X-Gm-Message-State: AOJu0YybFnUrmlT6dl4H3d5/z61YGUnuXzkDrh+d9KI4ub8O5uVC+11o
 ZJOJRnxjnjb7TbYfokkAC8Wa0g6Ws9YfgVdPbtg4F0zgrXkViQhmJkYFrp9rug==
X-Gm-Gg: AR+sD10bi4iZwImoQFl9QtmF/Vpg2/wmYm7LYAFBeissGPwRTonFvJ3LLEsP//NAxmS
 GsNLr8i44NCPFUWjRza9Bfq20605nCrTmUSrut/Nd5Jiaj6dEK+MniScAKiiC1wXvsjYWUADq6O
 q64OCebnI71QWoD5gPB6sEWvvdH+tvv7uqr8PNqod5Q+cniambpuel51RKOjwz0CXuBpwRbTFSc
 jdqtDPl0uu4S7/baEKFj5qEaHNJ1cWHqBJSXx9hDwNVxTx8s/zVsY5e+mUmTxLhkhqxMu8FM8W6
 JLY/t7L4GO+vE+UZ176R0QRRXijB8S5l6hgzox7n/G9wXwAN2NmeHoQFsmXtHNqDJNdZ6zXUGWU
 bHKZ5j6JOQUil73J1ztmU3jhU9F293dbu99f7CftXrDYwfRwiDbWeMOdwszVGF3a/FOjvi909UO
 THUp6rmvb/DXKLlXc6CAY/83s8yoDpHqlC9sLDRdDBHNzXJ6n4GohdayaIfUsbjgUJKNOJlULck
 lzvxQ==
X-Received: by 2002:a05:6a00:1793:b0:847:9c3a:b77f with SMTP id
 d2e1a72fcca58-84fde314673mr25596513b3a.35.1786982075264; 
 Mon, 17 Aug 2026 08:54:35 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2a09:bac5:3cea:a82::10c:6d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851b401ddd9sm825184b3a.3.2026.08.17.08.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 08:54:34 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 17 Aug 2026 21:24:11 +0530
Message-ID: <20260817155413.2644351-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/vorbis-tools: fix build with GCC 15
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

vorbis-tools fails to build with GCC 15 because its bundled legacy
getopt implementation uses unprototyped K&R C function declarations
(such as `extern char *getenv();`). GCC 15 defaults to -std=gnu23
(C23), where unprototyped functions are strictly treated as (void),
causing compilation to fail with:

getopt.c:399:21: error: too many arguments to function 'getenv'; expected 0, have 1

Fix this by preserving Buildroot's TARGET_CFLAGS and appending -std=gnu17
for toolchains that support it (GCC >= 8).

Tested with `./utils/test-pkg -p vorbis-tools -a`:
32 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Fixes:
 - https://autobuild.buildroot.org/results/dda/dda9e20f43368898b913bf2b00a8491ba089643f/

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/vorbis-tools/vorbis-tools.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vorbis-tools/vorbis-tools.mk b/package/vorbis-tools/vorbis-tools.mk
index d64fe0b1ee..869224c4df 100644
--- a/package/vorbis-tools/vorbis-tools.mk
+++ b/package/vorbis-tools/vorbis-tools.mk
@@ -15,6 +15,13 @@ VORBIS_TOOLS_CONF_OPTS = --program-transform-name=''
 # ogg123 calls math functions but forgets to link with libm
 VORBIS_TOOLS_CONF_ENV = LIBS=-lm
 
+# GCC 15 and newer default to -std=gnu23, which breaks the legacy
+# K&R-style function declarations used by vorbis-tools.
+# Use GNU C17 for toolchains that support it.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+VORBIS_TOOLS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
+endif
+
 ifeq ($(BR2_PACKAGE_FLAC),y)
 VORBIS_TOOLS_DEPENDENCIES += flac
 endif
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
