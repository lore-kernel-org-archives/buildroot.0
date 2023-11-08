Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB15C4167B
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 23:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 709984004A;
	Wed,  8 Nov 2023 23:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 709984004A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VB2xeEmwWcYj; Wed,  8 Nov 2023 23:17:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F39940114;
	Wed,  8 Nov 2023 23:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F39940114
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 682A81BF3BA
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48BA940114
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48BA940114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ggTzXbzH1ec0 for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 23:17:22 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 085F54004A
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 23:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 085F54004A
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7ad1236c419so9575839f.0
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 15:17:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699485440; x=1700090240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nM4Taogk5Y6u3SY5b5A7IbOaQlAq9h7O//96zZW4Xes=;
 b=xNBpUUWjQr+9Xf1oazie3DLuI1WpmlMMTryFucCEqpOB1QpAJ50XvuCOZwIr9wn5+C
 ZmJKDgsFSZxmRnlWerDlf+0HT9yacHKv3tBnSG4fzC4LNXx6jSdyV7TXsiS+Ox0DuvxK
 ZC5w+l+finR5h+8MZz2lGfHhUtWAh/vHcsCsqKUxe7iMf5ZXBuDJGsE7wv80jvcAEabI
 Mwabjh+wOjSzSlSlJ4/O6eeAAeUFckN6ud94PnGkdsBu0pwLxaHhZ7G+eIuOTU3iXDoq
 MaAxtlSQ9DLFvZ90EMjhpK4s392Y0Yfd8/g1BfxJOwysFVFc6rKjgeuTxlD1JHyUcjK/
 Dw5Q==
X-Gm-Message-State: AOJu0YwbheDAPjkajaTP0n5G6tn3u4jDQPqRgDzseGIZ6cC0TDuEkE10
 +pyZ7wPqr7QupQi52fsaW5PEEyAhC3U=
X-Google-Smtp-Source: AGHT+IH/VdmmHByFMzIPgIy8yPsDY+/Plbeg6ubchMZOKIWkF04+X81eioblH9gPvO7+0ZZQfUpt0Q==
X-Received: by 2002:a5d:8408:0:b0:7ac:7cbf:972 with SMTP id
 i8-20020a5d8408000000b007ac7cbf0972mr53887ion.12.1699485440534; 
 Wed, 08 Nov 2023 15:17:20 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 v3-20020a5d9483000000b0079fcb62c5dcsm3662002ioj.45.2023.11.08.15.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 15:17:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 16:17:18 -0700
Message-Id: <20231108231718.3648375-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699485440; x=1700090240; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nM4Taogk5Y6u3SY5b5A7IbOaQlAq9h7O//96zZW4Xes=;
 b=iiegV8t1EOe6uv1wt/yDUrQFRCW4sTFNVBrqhPWmF6ej0nHRvZi3X5WF03v0NKoV7s
 tOrXD0eJWHvnJ1ThOY2FcYZsuyTOYjyWvQ0vlVoA3u/gXWzIupmcQgFs6Hsa+wwUF/Ru
 CF13rO4iVWpaM2l9csWR2HZLf/Xtmvhwvh0JwG9U06rVLw6xBy5jiLObSxSe6PvfZYhO
 WO84xWR3zwhdjqz5PDmYh3UBiYlMH+647piyEECy+0dP+t4YqLqRCEoAlfQD8yfkEcdi
 07GBIjRlVeiSnWFFAWOHUY+YGIpG7/OyLPM2+JG0oV5SsRAnjU1SN4yChsghjMe9RH5a
 GqIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iiegV8t1
Subject: [Buildroot] [PATCH 1/1] package/python-markdown: bump to version
 3.5.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index 66208067cc..21f0c28bac 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5  597656cf4feadf1998b0511201620202  Markdown-3.4.1.tar.gz
-sha256  3b809086bb6efad416156e00a0da66fe47618a5d6918dd688f53f40c8e4cfeff  Markdown-3.4.1.tar.gz
+md5  1bd2746a8f32643f151991719fe7faf9  Markdown-3.5.1.tar.gz
+sha256  b65d7beb248dc22f2e8a31fb706d93798093c308dc1aba295aedeb9d41a813bd  Markdown-3.5.1.tar.gz
 # Locally computed sha256
 sha256  6f1193cb634718e65c3a537d6e25ebd614820ec0ef693cfc12248112638d64da  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index 1b9b556201..b491660f24 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.4.1
+PYTHON_MARKDOWN_VERSION = 3.5.1
 PYTHON_MARKDOWN_SOURCE = Markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/85/7e/133e943e97a943d2f1d8bae0c5060f8ac50e6691754eb9dbe036b047a9bb
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/35/14/1ec9742e151f3b06a723a20d9af7201a389ebd3aae8b7d93b521819489dc
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
