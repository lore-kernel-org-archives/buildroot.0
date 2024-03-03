Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133CDC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 15:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A573040533;
	Sun,  3 Mar 2024 15:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vxfc2z8jSU3n; Sun,  3 Mar 2024 15:19:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73F6540A80
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73F6540A80;
	Sun,  3 Mar 2024 15:19:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECAE01BF593
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 15:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8FA340A80
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 15:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRZ224a01Oho for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 15:19:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A0F6640533
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0F6640533
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0F6640533
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 15:19:28 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-dc6dcd9124bso3768236276.1
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 07:19:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709479166; x=1710083966;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dV3Bly5/tyCZedzDzFSPKU/Q9nTX+A1MNOXF08cGNHQ=;
 b=QZzLF2GXQ4SXIDpA51P3KV9NpgDskSNQfCPuvmnnE0GpNnvh5UDuwOIE1ugIuVDKFv
 FhKiKCxDfFGv5IKKy5BzkfVAYT8uIY/4r739Kmznxn6wWN+0FrC0HZqUrRuVyJlSbTPf
 XQfhb4bJ9l4+A+WE29YWQYwxuzgP8KXzGcPPvWts0tKGvcpUj7SHnZLXN7X434VnbMwk
 mnZPhMM84bsBj6ZRWjOv89jHc6HqOAf/OOaSGdC5XD6fvXB69+dH9g+75pr70NlVbKHc
 1k34L3p6SMSyFuwdTtCWsUfIPq1cCyoHTLTw+Vfq2rEPkQe6jmwMNFR4FlHZXpVQStu+
 MwFA==
X-Gm-Message-State: AOJu0YwG7yUSdli+7Fwo8rMZkeDG46QmbGLdXTEc1kn6NPJnmMuQhgZl
 6dzg7nWYaYEA+5BCN+cd3vvlO1R25agt8R4BUIwSMjNVzeCL950pHRdQsR5aE4Y=
X-Google-Smtp-Source: AGHT+IFFKusdg3X85MPz0Hrxtv7OuYgCuHN14hFwX1KP0IdPjzw/akigZ+20vc0j0QTfs4rjrrIVQg==
X-Received: by 2002:a25:b21a:0:b0:dcd:98bd:7cc8 with SMTP id
 i26-20020a25b21a000000b00dcd98bd7cc8mr4776792ybj.48.1709479166564; 
 Sun, 03 Mar 2024 07:19:26 -0800 (PST)
Received: from gilles-Precision-3571.lan
 ([2605:59c8:6662:b310:c876:ff9c:9c4e:a7ac])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a25ce0b000000b00dc7622402b9sm1792282ybe.43.2024.03.03.07.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Mar 2024 07:19:26 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 11:19:13 -0400
Message-Id: <20240303151913.286560-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709479166; x=1710083966; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dV3Bly5/tyCZedzDzFSPKU/Q9nTX+A1MNOXF08cGNHQ=;
 b=KL93FjOJv9/DD/bIuDZ0KMJk3jc1wLqaSlFAdDljjjNOQ7SMqNSb4Ex5BSWUbrEaFF
 HSzBiTui9S7KWK62HeQAtbnHNhgn2erbrriInkCZHJPuZV4GWzaIxC9PQx0P3Wofl4Y/
 CZ0eajIc5OzSNv3x+YPgH1MEJ2pRxXS92qxvnlDdZvqeMeY009lYGoaEgAg5ZQfIq7QC
 ELsRWzK+FvlDaxfBNOloXbrkY2PJaL9Vy3f5d9bKSmZsdVZ4bfFO+11Vb3ahnLE/zMd3
 CUzsPsVPTJmzb4j/cXMbKNXYHQE2R/jT8M8uELFJcZiebv/9e1Fkr+tBeUngyA7va8Mw
 zqgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KL93FjOJ
Subject: [Buildroot] [PATCH v2] package/iozone: bump to version 3.506
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Upstream archive moved back to tar from tgz
- For change log, see end of file:
https://www.iozone.org/src/current/Changes.txt

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
Changes v1->v2 (review from Julien Olivain):
- Added license information (file and hash)
- Updated commit log with archive format and change log
---
 package/iozone/iozone.hash | 3 ++-
 package/iozone/iozone.mk   | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index 9ecf1d1af8..936ab5a646 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  5a52f5017e022e737f5b55f320cc6ada0f2a8c831a5f996cce2a44e03e91c038  iozone3_493.tgz
+sha256  114ce5c071873b9a2c7ba6e73d05d5ef7e66564392acbfcdc0b3261db10fcbe7  iozone3_506.tar
+sha256  bff7909fd698708d15613a4fb977a193cff98f44ef170c2dc1dd502974df75b2  docs/License.txt
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 2df4a2aa84..b1b29d1098 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3.493
-IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tgz
+IOZONE_VERSION = 3.506
+IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tar
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
-# IOzone license details can be found at:
-# http://www.iozone.org/docs/Iozone_License.txt
+IOZONE_LICENSE_FILES = docs/License.txt
 
 # AIO support not available on uClibc, use the linux (non-aio) target.
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
