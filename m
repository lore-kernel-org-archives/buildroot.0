Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98B3C83F17
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 23:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84A3983C61;
	Tue, 15 Jul 2025 23:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3ehjdUG4s-S; Tue, 15 Jul 2025 23:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE1F283C5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE1F283C5C;
	Tue, 15 Jul 2025 23:05:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8B641C62
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 23:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA16383C5C
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 23:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLzSUndF-nUy for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 23:05:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 181B683C59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 181B683C59
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 181B683C59
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 23:04:59 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-879399faac9so458216139f.3
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 16:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752620699; x=1753225499;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SfwSdI3Zzo/RGI+8fE84dudkL+F3lk6byE0+BB20w4s=;
 b=bdBhPkH/wFhf3BrCZdwZGlelH4hjk9vGEhbpdqjf131KPbHGJVffyJkB70TON2UFVg
 qsDnGTsDLqRfsSs/SoRUQcZjPgdeDFbGBEQ+LqMko0NhklyAY9JJkh584lpX3qHpI7Gc
 2IgkA0rzk6q6HhnZmqm+301AMuC+6n3X9Nr4ot+2T0P5PvHhDLVuGJmaz81ndY6zVRZV
 lham0xKKBzq+cB627RLhpa/pjLDVhtO+N26lEMM+zZKtEavBAEBR1TyEOtoXVe1g///G
 jL/rVIhxZPoADs6K1WiXWJYN6/k12DUZBlfTRsubSq4CydsIfHjAz/oktb7x0rRyxoGB
 uBUQ==
X-Gm-Message-State: AOJu0YzD7qHrdWo85UXCYDBOPiorOfrxNFIlHITdK8vwNcSnzumA+ue0
 7kIEd4gohdsD4umWn06NfWOTutxbFhHfeV/8crAq+zJn8HOlMSQC+Y0sawwDOlb4N18=
X-Gm-Gg: ASbGncseBD6HWox6jy8ojSU9XzBzQq4aJ2WZaFGgdtAVyNDjrOnoOtQDV2Io9u0plH4
 tZuD03Tphsbzuqs82xzu4fkFPh4qeH5j4BbZ27CPtzfMgnqy70HceQLRCyh+AlFv3r/ZRmvjoL7
 7wLztNuVDLZVMwu64UxvbElrY8BpkFpOH6kaTyWkU52v1pSRUqKYqwI6kvQuSDuSG1C9V80idSm
 P3W67K3X9ID6dXNYSbsGY746Mio9Xsx7K6iw8/GxFqpuHJ/Xrni9yJNZLzGOs7yjSQxcUTUPBt9
 5yA4RaTioEFPSPvzAmbmg1bDYXJYUWcgPlh2OpzSIEdN8t1vY521lB3yI/Rme689AeuFAs4wYiA
 s9JFKehd/ujYMBs7AvsW2SDz4k1h+jxgE0KH8HkvdjOjxyL+KZ75N9otmhZIsxeqjQDEfifLVBG
 Q0OBPrj6w=
X-Google-Smtp-Source: AGHT+IHfPAubof+G1mw3vv5Vo7z5hKIuOsWKMFzwuNizYtPr/Apv0Yt99MTQtMi8aFIjgQr1UvFDJw==
X-Received: by 2002:a05:6602:13c5:b0:869:d4de:f7 with SMTP id
 ca18e2360f4ac-879c0935f49mr152205439f.12.1752620698650; 
 Tue, 15 Jul 2025 16:04:58 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-236-108.hlrn.qwest.net.
 [71.218.236.108]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8796bc35d38sm334295539f.33.2025.07.15.16.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 16:04:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 17:04:50 -0600
Message-Id: <20250715230450.757888-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752620699; x=1753225499; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SfwSdI3Zzo/RGI+8fE84dudkL+F3lk6byE0+BB20w4s=;
 b=MhTsaikfEkwd0HiLhbkfm2Ml06EZLPXQd9zbroSGm9ZmgtRPRHGnBp4B9LKiaUNwEd
 ScKNLN7KiNPD95qQ1hjAfJLw5SxiHmWWXh6t5MO1V3LHShTGLpyeXI2OlMqNCxiAX+It
 JSUIh4J0SiTUE71sxw9GfeVEkogb+igfp6Qtd2zzaF4Pa5NGuDw/hj0kNWWVH5aBsxo8
 1ejwvW+VkPxwzEF5JyxlyhwEBez7+D2kXbskqLpggR4nxLJeu4WpZxyMiMZGGbW/E1ZF
 fASqggDGnLRdwaYudi+gUnFYuuWkTANZ44LzaLFmiXZcx0g3Oy8177lyBvg+E8BAhMVm
 4mOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MhTsaikf
Subject: [Buildroot] [PATCH 1/1] package/python-hatch-vcs: bump to version
 0.5.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-hatch-vcs/python-hatch-vcs.hash | 4 ++--
 package/python-hatch-vcs/python-hatch-vcs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatch-vcs/python-hatch-vcs.hash b/package/python-hatch-vcs/python-hatch-vcs.hash
index 55cd3b3e5a..16f08bcc4a 100644
--- a/package/python-hatch-vcs/python-hatch-vcs.hash
+++ b/package/python-hatch-vcs/python-hatch-vcs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatch_vcs/json
-md5  d801fe7c3e5955307748f2790bbb3488  hatch_vcs-0.4.0.tar.gz
-sha256  093810748fe01db0d451fabcf2c1ac2688caefd232d4ede967090b1c1b07d9f7  hatch_vcs-0.4.0.tar.gz
+md5  9a22a9f7203783e526959d34510a9672  hatch_vcs-0.5.0.tar.gz
+sha256  0395fa126940340215090c344a2bf4e2a77bcbe7daab16f41b37b98c95809ff9  hatch_vcs-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  117aa5006d8475562f04442ab06dd2a4c501af3a77255eae0deef1f0c2499a1a  LICENSE.txt
diff --git a/package/python-hatch-vcs/python-hatch-vcs.mk b/package/python-hatch-vcs/python-hatch-vcs.mk
index f63d8b26fe..1fc2a19706 100644
--- a/package/python-hatch-vcs/python-hatch-vcs.mk
+++ b/package/python-hatch-vcs/python-hatch-vcs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCH_VCS_VERSION = 0.4.0
+PYTHON_HATCH_VCS_VERSION = 0.5.0
 PYTHON_HATCH_VCS_SOURCE = hatch_vcs-$(PYTHON_HATCH_VCS_VERSION).tar.gz
-PYTHON_HATCH_VCS_SITE = https://files.pythonhosted.org/packages/f5/c9/54bb4fa27b4e4a014ef3bb17710cdf692b3aa2cbc7953da885f1bf7e06ea
+PYTHON_HATCH_VCS_SITE = https://files.pythonhosted.org/packages/6b/b0/4cc743d38adbee9d57d786fa496ed1daadb17e48589b6da8fa55717a0746
 PYTHON_HATCH_VCS_LICENSE = MIT
 PYTHON_HATCH_VCS_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCH_VCS_SETUP_TYPE = hatch
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
