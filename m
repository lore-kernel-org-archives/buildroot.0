Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9115C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 05:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A2BF81EF2;
	Tue,  2 Jul 2024 05:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqvrM9UmbTlZ; Tue,  2 Jul 2024 05:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F03881EF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F03881EF3;
	Tue,  2 Jul 2024 05:18:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64A451BF31C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 05:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 520F76080A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 05:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJ0lIY_3rw4W for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 05:18:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FCC6607A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FCC6607A5
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FCC6607A5
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 05:18:10 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7f3d59ff826so136787339f.3
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 22:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719897489; x=1720502289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w2nMlW52V1IAHiuackrtavDqvran/KiU5AtkNsV8TaU=;
 b=S5Il4GRO/EfdLyR4KALl4Q+LvlFoCP6HskPSDeHefH2AagGTmEvb9xIj63t2IndnF7
 dVkwYaLNZRNHll0MC/JKkbuq2Te2yZbjLhu3u1dk4EwmBQon0+7ZdVlfauzFaiRX9Ugw
 wda0f8/9A5QpyiNlv7VW6X0T/SHlL4IRix3xMiHh5zEFcGTwe35wvrBOc2KXITYpISjW
 hzvnGmYlsqacNgZY+9RgG99mscQCN/TGUFExVQZDNKaQCjxqWkNVL4KfNsVYsGJIIJLV
 Teo4aRE3tq3937j9q0FV32zz499HlEpuRRyejWlTv8nM9uPEkb2AmQEfyRjg4lZMceRI
 xLsQ==
X-Gm-Message-State: AOJu0YxK58H9HgeTCkYDcdPcATM1F9cdXRgsv3t3xEYAZGgwIja+GJXA
 pULrQmRcAFhXRjMNxnc4KM+4GDme+QExzDcxt+PoRX7cqhRy50SYPLCm7Q==
X-Google-Smtp-Source: AGHT+IGcyYhj7EvgY2Tfyh8XBjY79jiQ9qJwneFz/qKOZsPm5jfbvg+Moxkmci50jYUkb6QvUs9ogg==
X-Received: by 2002:a5e:d606:0:b0:7eb:d640:274 with SMTP id
 ca18e2360f4ac-7f62ee622b1mr779062139f.10.1719897488705; 
 Mon, 01 Jul 2024 22:18:08 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb742f1cdasm2627046173.172.2024.07.01.22.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 22:18:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 23:18:05 -0600
Message-Id: <20240702051805.830216-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719897489; x=1720502289; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w2nMlW52V1IAHiuackrtavDqvran/KiU5AtkNsV8TaU=;
 b=ccAwm6v2g8EYTfgoUMIjzeMhPW2UztmgwZbEyK4b2l8QiPWL/oKQI5wfmB0TZQ1+RF
 bPt6p1C/lPZ5F/A2GA+8ApmkI7fYBReVX2JXKp41ci06UlfbOq28Ns+SV3Rd7tZrVrZD
 WLNUjnoFfgsBZ8rQN3LKaJO9crKVORhV/GMru6ldQtSh3/o6zgwjQaa0G1sN/2TFY0lG
 vFEGEylEzuvnxUYXzetvg+hrslzJA61Sjcw9XF9Mk2j1BKwx1UAx+dDsYOqSYrvV+I6N
 fXU9rj+/5mAFw7bkii1ktLkoIDStzZZBpcUyWuMN3y4p/2fn4gSzFfDQV3A82PttYBNa
 iyZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ccAwm6v2
Subject: [Buildroot] [PATCH 1/1] package/libsoup: fix set c_std to gnu99
 patch
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, libsoup fails to build with output:

    Applying 0001-meson.build-set-c_std-to-gnu99.patch using patch:
    patching file meson.build
    Hunk #1 FAILED at 2.

This commit fixes the set c_std to gnu99 patch so that it applies.

Fixes:
http://autobuild.buildroot.net/results/4ee/4ee68145143df02c46034b4ca291fea469a6f58a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
index f2e8f7701d..a999f5964e 100644
--- a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
+++ b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
@@ -26,9 +26,9 @@ diff --git a/meson.build b/meson.build
 index 4dfd8c15..a5ebc63a 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2,6 +2,6 @@ project('libsoup', 'c',
-         version: '2.74.0',
-         meson_version : '>= 0.50',
+@@ -2,7 +2,7 @@ project('libsoup', 'c',
+         version: '2.74.3',
+         meson_version : '>=0.50',
          license : 'LGPL2',
 -        default_options : 'c_std=c99')
 +        default_options : 'c_std=gnu99')
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
