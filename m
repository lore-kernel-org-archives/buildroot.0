Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED9ED37E51
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 16:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0E5A4EC15;
	Wed, 14 Jan 2026 16:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMKes5y_VAFh; Wed, 14 Jan 2026 16:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E26274EC13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768406420;
	bh=Hh/O0svCRhXU7r6awnW9LA/+2dKaKrmfAZj+NAZE0QA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JzoyfgDnoz8ZfM9pAHz9egd3mHvVXYwT7yJpzWqmr/vGuM3FXqNqembi2epc1T9Zz
	 0Xk1C0ZpY+fF28pAQiQKlZ0JAq+RpLledNHExy/6AN5YAyrPBniUsMn2YjMC4FNJA6
	 WhqsXI25l+mx3CVPnLW+rAlFo7fZnZQN5eRh0kvyjaduhtWSbkKmwq9VuTHtBMyp6f
	 7TZshlSq3f0GesIZZgV5mer4Za5xUgCITDpun+r9l9s5PNOoI3UjOnPHO72EULls6P
	 Mhm+MLkklf8hzGsBRBq1LkzppSVmFuRsAMCYXHoaCYjqvD7gs3dMWLfo5Rbf5z3aLw
	 0xoFS1VJbOVaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E26274EC13;
	Wed, 14 Jan 2026 16:00:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 115D2232
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 16:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 028EF60067
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 16:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DrzAXvJDoJy for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 16:00:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e32; helo=mail-vs1-xe32.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1793B600C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1793B600C9
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1793B600C9
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 16:00:17 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-5ec96028b32so5480342137.2
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 08:00:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768406416; x=1769011216;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vM0fAAbP7T7eafX5Qq9Je8CCJndmMtByxsYw2IY9bMA=;
 b=paFobIMQWVTnbGWsqRPBHrZMSf7DCsOw/yze+dsyw8lauZ6DtlpuG1QUDn8ihGAOVQ
 BgTd5A8RhHEgf3Dqd1fkowCZo/Rq3IqB8mgC59gNFeJv+77sfk3LuUzyxaoTZ2WD2lST
 /+KjMXmi3kE1OrA/MVpqI3GSfxcpROwQldvPPT1K2vfWQC26kSHfUsuLsrO8KzfkJhJ9
 guERQ18Z0W9RBrtKuhRV3Byty52GV6JSF7Sp/3oyv0izqIaD2TQFa0q0pOoUoMptK2E7
 RQz/eRWbnZ4/iYIyLk/kn9neoqWvfbh6LIQho0gs68Gxboaw/FC2oRrVHto5oHb35XOZ
 1PpQ==
X-Gm-Message-State: AOJu0YwOoeeGPo7O/KFVxPQwARjHtIWvPmUiX9etRUJtzTiTnmVwiPmU
 MxDlElizUFeplD480+l9Pv7rGjvZ/kN80VVe+Z/02tNdbY0aYt/Bti2Nzz9fO1RV
X-Gm-Gg: AY/fxX4/UrY3zLZ8jM5V2N8B6PoaEkkUcMnwNvojlghUY2hZ/LcHq7d3YqeFc29RXVb
 zFoU3tp3aynNSLzMkYjJLeN/gNMoI9rPgDZpuuMp0dMHFONZ7cqYcpdMmtGHwlBexFbaD3CjW4e
 4shLUZbkNwKfPUbgHtoT86Lu7adNSEt4BaWepKMyCenEGVZmzArD/6SRSGJ9uAdEFaRHOUSC85B
 ipT9P7eMjT5AG2YcyFVX0Zgyu424gchPRkLlPIzUV1gLdi+XTk3BRFEjyZcrPXwAbKW0bkq6tuP
 kUzsP+aoQ2E7lsCw/g+tQDNde5iqXKzHr1Our/rYf3KgDpcbiIvlzeiJsWGU/MkfG6+8rrNj0ST
 0i1v8VBTYfvQlt5CfGHVMCxNMj3rX79ehNdWK3qOTVVgi5rVGmdSWqrtIvli5hJpnRPm3w/Ryj6
 rt8kM3BMxX63OeeFujp8a9yL0wCgx9Kfk=
X-Received: by 2002:a05:6102:6448:b0:5ef:a6bd:c89d with SMTP id
 ada2fe7eead31-5f17f4021edmr1310553137.4.1768406415087; 
 Wed, 14 Jan 2026 08:00:15 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:1498:1d08:895e:f475:13ca:a6cc])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ef15be79c6sm16622411137.12.2026.01.14.08.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 08:00:14 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 14 Jan 2026 11:59:44 -0400
Message-ID: <20260114155946.70930-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768406416; x=1769011216; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vM0fAAbP7T7eafX5Qq9Je8CCJndmMtByxsYw2IY9bMA=;
 b=GP5SdiYYX0mliMGiCtp6RNNafQAGybzEmrETsAICuqVJb2KS1lJbAqQ5pUJcqU8WrT
 scYKK+4O+nfjMU7wF57rrtbfWxIcoCM7lUycVgpE8jYpNNfKDMcT+Hn9XhWU51Y9xRH/
 S7+adMJGHwTYM0H+1xaFvpS2Cn4Q3hDav330S21l083BFA29B3MdgAFUJRtoYZIqdavR
 03m/k8BczMz2e8Gp4Z/BdBrws3S33Dr/MuqkzIzUcT/bECC4Da7gC1woSG85WFZ0msnd
 FSSaUoAE5VRY4Gu4gdX/ukddb745464LpkeeWWAVtdayf5IUWLZWaaDPUIMJPZJuw03c
 /6gQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GP5SdiYY
Subject: [Buildroot] [PATCH] package/leptonica: bump to version 1.87.0
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

Release notes:
http://www.leptonica.org/source/version-notes.html

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/leptonica/leptonica.hash | 2 +-
 package/leptonica/leptonica.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
index 293eef4741..6cd3ed3459 100644
--- a/package/leptonica/leptonica.hash
+++ b/package/leptonica/leptonica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  1fa08e40bb37fd45802d5e6e7b43927449a5c47d4608ef99d3bd3f0fa76baedc  leptonica-1.86.0.tar.gz
+sha256  c73363397f96eb1295602bf44d708a994ad42046c791bf03ea0505d829bdb6a7  leptonica-1.87.0.tar.gz
 sha256  87829abb5bbb00b55a107365da89e9a33f86c4250169e5a1e5588505be7d5806  leptonica-license.txt
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index a957e05616..88467c1b14 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEPTONICA_VERSION = 1.86.0
+LEPTONICA_VERSION = 1.87.0
 LEPTONICA_SITE = https://github.com/DanBloomberg/leptonica/releases/download/$(LEPTONICA_VERSION)
 LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
