Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803A3C25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 20:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24A5383083;
	Sun, 12 May 2024 20:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPdXCiLXYHhn; Sun, 12 May 2024 20:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 035FD82974
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 035FD82974;
	Sun, 12 May 2024 20:35:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1F1A1BF3E0
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8D7882974
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nadLWvQNlU3u for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 20:35:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FCF782262
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FCF782262
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FCF782262
 for <buildroot@buildroot.org>; Sun, 12 May 2024 20:34:59 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-351b683f2d8so655161f8f.3
 for <buildroot@buildroot.org>; Sun, 12 May 2024 13:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715546097; x=1716150897;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qw5c4KxUVKGAQkOEnztTQMBFW0Sa4ZtLCmea7dLEBrw=;
 b=vkNBIqKZyR4mFcov+QIFvN41yC7+hytSLXzplXOYG8ri6vzp+P14204Twk7vH//Suq
 nnFntdEdFhh5tCk3A8GcHqnIJ4jbhmD2RcXL2Uu2/Kcg9G8K7We8nDxjPhQJNIail3UV
 SrbD8ggR6DWbebjoTR4Xh3+qfA40+UVNkkDoYWTSkqAhjs/KZqvC7FA5oA5DwKzj4+xY
 tLvQ5Q6p9tyrN+fU1sze47129ZeNvxeMN4sHKUSD4EhksP+9c7PEAJEhbSD0G5m+78xv
 U9/oxInKUO9YIAK2CchfV2/ilh2rXGdGK6rQps3dayyB+6e+CkkB3kmRc++wmf44QNrQ
 3MqQ==
X-Gm-Message-State: AOJu0YyA/orbiD0PEYwQHEgCqCOQCsH8Lo2jQNic0gTYZ/EYA3IlKmsj
 mac4OK+/grTeB0xnA+Y25gxPybXwKjoy4ZhcZsPVklKs9gQLe04ox0OjkQ==
X-Google-Smtp-Source: AGHT+IGB4y0xY9z0CD//70LFJcfYB1SaksvsixVgzoKR3IskA0TQkXHiAqCax8BfgNEBtpudp8BEyQ==
X-Received: by 2002:a5d:52d1:0:b0:34e:4105:b3f6 with SMTP id
 ffacd0b85a97d-3504a73ee8dmr5701357f8f.39.1715546096989; 
 Sun, 12 May 2024 13:34:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bd5asm9521878f8f.18.2024.05.12.13.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 13:34:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 22:34:52 +0200
Message-ID: <20240512203452.836377-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715546097; x=1716150897; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qw5c4KxUVKGAQkOEnztTQMBFW0Sa4ZtLCmea7dLEBrw=;
 b=UUiLAreo1DMQybWeqKK1E+dooHSx006NCRv8Tov5Y82AlfvFsROqvVcGhCzcUopw3L
 W2YNcyjiJqoRKo6GrTlszNKfF4drYh0W6bzSwnXyUtqcTugsIrbeuIdQgS74BHd6D0f8
 D789khobA9cTA316ARTD/ERN2krB9vyKkxmZgI7FlnDpUed+I4QpaGRY9Zf/QxKfhAVI
 P/4qnhC4ZaH0TOEkuIQP9dCeWeDmPmg/zGl5afHClN2IK61fheHmH+20GqDiUfjnLGd3
 WEZgahUwrW38sGDT52w+Q+YRlVsGWwTWIh8rUXkqILtmlo84rj2Cy+LsAi9QCg5dRNh5
 cysQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UUiLAreo
Subject: [Buildroot] [PATCH 1/1] package/duma: set HOST_CFLAGS
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set HOST_CFLAGS to avoid the following build failure raised since bump
to version 2.5.21 in commit af2cd694e3903131d6e2f00646adfa83a89a23e2:

/usr/bin/gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O2 -g0   -c createconf.c -o createconf.o
gcc: error: unrecognized command-line option '-mlongcalls'
gcc: error: unrecognized command-line option '-mauto-litpools'

Fixes: af2cd694e3903131d6e2f00646adfa83a89a23e2
 - http://autobuild.buildroot.org/results/28be2acc6d58754c7431df81d0b63b30e6af8554

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/duma/duma.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/duma/duma.mk b/package/duma/duma.mk
index 6bbdf41f4a..80fe8a5d64 100644
--- a/package/duma/duma.mk
+++ b/package/duma/duma.mk
@@ -20,6 +20,7 @@ define DUMA_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) \
 		OS=linux \
 		DUMA_OPTIONS="$(DUMA_OPTIONS)" \
+		HOST_CFLAGS="$(HOST_CFLAGS)" \
 		CPPFLAGS="$(TARGET_CXXFLAGS) -std=c++11" -C $(@D)
 endef
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
