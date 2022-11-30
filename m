Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B1FC46467
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 02:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA9FB40184;
	Wed, 30 Nov 2022 02:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA9FB40184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id amEFoQUAAxik; Wed, 30 Nov 2022 02:19:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10B324013E;
	Wed, 30 Nov 2022 02:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10B324013E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 186701BF397
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 02:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7E7660A80
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 02:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7E7660A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2KIj96lP7_sU for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 02:19:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E18160A7A
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E18160A7A
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 02:19:00 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id q1so14756936pgl.11
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 18:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DB888eN/FI9bKhNNet6fBpWB0hYakesbDRW26xR2vQI=;
 b=sUJM8rNTrTbtnSLFWSS1L8iijojG4epFM8lWDsTh1S1jWPj3xgWgV1AKOX5dcOEXd4
 EYSOABmZpn8waTiExyEZ6C8Mb3Rl7JcRmGY1ubafB/rDofCridRp5xxp0OpOY/uNrzyF
 iysJXyBiwAzz6fGNAFtZYjnnle1pPPJNt/QaVCqdzQJQsMX+9SqOeDB0PDoiwY2uOME8
 Upk2gX27I8zTV9ZbN8c9RQ6ojJ3TXrz7jyXTS+YZpYBuZNycoOfwtAgQubR+iizGfYig
 AlR7VlXoCwBWwKafYwG8SP25hBnYr1st2k3KllBrDTpt/HNYMH6xaV0WhIEKcfNbWqfW
 HLcg==
X-Gm-Message-State: ANoB5pl+um1J48QjgNK5xdGpg50wfZ1Ciseef6tmTASdKLUGGfJA1u9S
 38A3+LA4quVLxyal3QgZ9irrrmJKF+4=
X-Google-Smtp-Source: AA0mqf7ux/JsFUUFSCddY7Nemcz1GsGoCEy2APHxXlnpiUDxLeY3z7i/LGozFF8659j0c2U/Ew0Lkg==
X-Received: by 2002:a62:b501:0:b0:563:771d:417f with SMTP id
 y1-20020a62b501000000b00563771d417fmr41600773pfe.45.1669774739449; 
 Tue, 29 Nov 2022 18:18:59 -0800 (PST)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:8d82:35c7:dc48:dfae])
 by smtp.gmail.com with ESMTPSA id
 z32-20020a17090a6d2300b002190eabb890sm1985538pjj.25.2022.11.29.18.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 18:18:58 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Nov 2022 18:18:21 -0800
Message-Id: <20221130021821.2660112-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DB888eN/FI9bKhNNet6fBpWB0hYakesbDRW26xR2vQI=;
 b=pAhjdWNjZepEfw6DDNF/No18NHHBVjwBdbR+sA3PYVg4T5vGUG8ME6D8tw8LRGzk8b
 aIGg2qHRx81ifu0PsCkICMaRyOtl7eD+m65jfjew+aKzQRNSEVWJJXwL0boOGlflEnp2
 g8WBXvIw/xbDwn0LBn9ZWI/XxMrB7hYlqLsNvkXsxs4VIZIMYcqHU6hQzQkeNgsAVql1
 QqeKHwAhmixzwttu5NkMRxpxyTLR5ZpzeJypRwCF9kpMBSAHnG0pkwYWCXJyul3TNAi4
 uXgS/C7tsxraM7HrATZa15eYp8BIz/qDQ7iD1LlHyUlMLTTwwGE5dLXZKwIpaxvWt+lz
 CF1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pAhjdWNj
Subject: [Buildroot] [PATCH] package/elf2flt: fix text relocations on xtensa
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel <niklas.cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

elf2flt 2021.08 has changed endianness swapping logic for relocated
entries in the text segment. This broke little-endian xtensa FLAT images
which now fail to start with the following message:

  binfmt_flat: reloc outside program 0x24c80100 (0 - 0x6e430/0x56a20)

Fix it by restoring old endianness swapping logic for relocated entries
in the text segment when building for xtensa.

Reported-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
I've tested a couple other prominent candidates, but it looks like
only xtensa has this issue. I've submitted pull request to elf2flt
with the patch below.

 ...-elf2flt-xtensa-fix-text-relocations.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch

diff --git a/package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch b/package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch
new file mode 100644
index 000000000000..3664775906ea
--- /dev/null
+++ b/package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch
@@ -0,0 +1,51 @@
+From e248d9774506fdd8698b14a7edead113f19ecdb0 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 29 Nov 2022 17:47:54 -0800
+Subject: [PATCH] xtensa: fix text relocations
+
+The commit 5e08f1968316 ("Don't always update text in !pic_with_got case")
+changed good_32bit_resolved_reloc to not do endianness swapping for
+relocated entries in the text segment. This broke little-endian xtensa
+FLAT images which after this change fail to start with the following
+message:
+
+  binfmt_flat: reloc outside program 0x24c80100 (0 - 0x6e430/0x56a20)
+
+Fix it by preserving 'update_text' when building for xtensa.
+
+Fixes: 5e08f1968316 ("Don't always update text in !pic_with_got case")
+Reported-by: Niklas Cassel <niklas.cassel@wdc.com>
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ elf2flt.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index b93aecdaced3..cec3f4a22239 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -808,7 +808,20 @@ output_relocs (
+ 					continue;
+ 				case R_XTENSA_32:
+ 				case R_XTENSA_PLT:
+-					goto good_32bit_resolved_reloc;
++					if (bfd_big_endian (abs_bfd))
++						sym_addr =
++							(r_mem[0] << 24)
++							+ (r_mem[1] << 16)
++							+ (r_mem[2] << 8)
++							+ r_mem[3];
++					else
++						sym_addr =
++							r_mem[0]
++							+ (r_mem[1] << 8)
++							+ (r_mem[2] << 16)
++							+ (r_mem[3] << 24);
++					relocation_needed = 1;
++					break;
+ 				default:
+ 					goto bad_resolved_reloc;
+ #else
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
