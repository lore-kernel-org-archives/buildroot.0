Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27DCCD8C9F
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 09:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56FB0423D3;
	Mon,  8 Jun 2026 09:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiWzBpEM3Gdx; Mon,  8 Jun 2026 09:58:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E20B423D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780912687;
	bh=+Bw/tl9cm2l6CE4P4QJ60y5XWACt9YYzizTTq3lYZRc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=b0kjqNVJkS27j1yfG4nqC9c9gQ1cLJTF8j62NOHnoDP2g/GCIaETJjvn2X6Glz+qc
	 6shV+Z+/cI9AumqEszsB61dIaxgVYWiT8C3CnPxtO1ZGsZ7onWo3vfBm95pBj+X9c4
	 cGgoEkzO0WjzqTuR0osWqVYGrM5uH6Exh6WFAtdrPnoEVzJfJ0n1hFgIsYEwwUv3e8
	 sdxRpcy8R4wprh47ZE4aU02XD44bMGAI7uuQ64cav/1Zcx2iuIvqtRwkE4WoLXgKlE
	 iZw1PlR2MFfaovWZNdPVc8zQAWXb1W60AwWKphOcZ3RksgQ6WpMJ54Nv0saunaFJGN
	 LIuFcPun8iprQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E20B423D5;
	Mon,  8 Jun 2026 09:58:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D45C3187
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 09:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9EDB84B85
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 09:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOeeprsqPX3a for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 09:58:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9A8284B83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9A8284B83
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9A8284B83
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 09:58:03 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso47580165e9.3
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 02:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780912681; x=1781517481;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YoLT7kDr9t51IRdlxuhJ1JlO7DSIomsgyTgjtVj2OGU=;
 b=Jw+sdYUHKG5ZZtE6sjUeSUbMuo0L032xiAHoBtiZgDxkmBogS/fRrziap/miSiB6SN
 /DHOMHnxGZcaWnLXNbpiJWWsQzO2jMNy1wXrW/We6HLW8Q9iRfXvjtM5bFgD5UCk6bw1
 BkJo3W4x0mwIyWaMKkC5NS3xpQOxavqAeG8ZVffrm2WBdkRmfo2KjOLKwQdAnPqpKXqe
 PeCNrkwvWKsiJCWIJeG89HBcGQX/uhdj+U1+T/JzCXQuXnVse+mp4e0Bs6MZ225JcC/s
 /OhVmuszWe5PaMiYcJhKdRDvjz+69NlJXGVPF848RwuNYOVoqccC+3W71XSl2V+kfNFq
 L4tQ==
X-Gm-Message-State: AOJu0YxJ8aMeRucULHAqXhoO2Sxh0Zm0E+4PnXn/WT6bTW2ZBXwJIFHU
 /soFSxfD+v4n53YDDwJNhLxm4JpMVtyppe21WL30F9tsksI+gWYQ1QeqnloEiA2lofGf/lU0kG/
 Buwvw
X-Gm-Gg: Acq92OGgktmuVmnxF5WC3YxfkpdMBIp9Ux9U5ixgMC6UkLpSW7vcTtS7bck7oEw0aue
 Mb2sHoonlImPT/8OmWkPODqfSsQoqG9/guKSLLU1vlaGdh+mzm46nQhm3NGLFIInRqaq0MDhVLV
 uE5ZZUg2zM6Ch2vP2yn9/eDwLF14DuLCRsxeieBXYjh4qaDy8kT6k5gu2pi31XpIMB+BJ85dGeX
 O/fc1QeMiOYingBzrOlj5inzyHMb70ovY0fhFlypqnVGIzwHi7mudG2ih/xPDAskp/eFujbxW5K
 l0FmxQ+pzwDwfpcrr43DjkXBxjrV4YNDx/abI/ZMq1iDq5s7VcPARt+4Np77yDJbdkctcRdxP4R
 ilxUqv7UbnX9K8rgEGDd9CcyfFRaBGqKXk55xfC/CLV5UEoLAhabU+3bJfhZEtICiblk5JA8G1R
 fIR9Rxy1C/8LhrnLmgfaOnFCRkcgh5ReRw6lrMifT7kVh9YHg=
X-Received: by 2002:a05:600c:4e13:b0:490:bd1d:4732 with SMTP id
 5b1f17b1804b1-490c25eea3bmr279553145e9.23.1780912681116; 
 Mon, 08 Jun 2026 02:58:01 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3cbfe4sm388990845e9.7.2026.06.08.02.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 02:58:00 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
	thomas.perale@mind.be
Date: Mon,  8 Jun 2026 11:57:45 +0200
Message-ID: <20260608095745.737902-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780912681; x=1781517481; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YoLT7kDr9t51IRdlxuhJ1JlO7DSIomsgyTgjtVj2OGU=;
 b=c0wKJyUgRVEw0FfaOIINmHhW28oxe6AhbVV7nn8UaHlJQsCJDS8GHfY25WEazFca5k
 GNjdQD4HCr8/Fo/COWJKZwvKXpvZ3Cq5l46pvFAHGjbcfbfIz6AcEmyUBDmN/VfXBhAj
 qeX3pdI21w+Zt7t7/ZMCdHNc8ek/Lv+RbempsRW1tIx3rEzlSeL/77eKuBZlOleUpAiz
 aXwOPIscHuZd3GR5PeBmliXNyTiCLbm+DhOJWzj5/QEdZRcM0kC0LyA+7gb9jGiaT2XR
 EhkCpDEXUXuNGx+pdpgjC8Ip35ov8shzNiqvvNp2SkHE9LpQL9nUWk54iJQNQJ5d11aq
 LP2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=c0wKJyUg
Subject: [Buildroot] [PATCH for 2025.02.x] package/runc: security bump to
 v1.2.9
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues (in v1.2.8):

- CVE-2025-31133: container escape via "masked path" abuse due to mount race
  conditions
  https://github.com/opencontainers/runc/security/advisories/GHSA-9493-h29p-rfm2

- CVE-2025-52565: container escape with malicious config due to /dev/console
  mount and related races
  https://github.com/opencontainers/runc/security/advisories/GHSA-qw9x-cqr3-wc7r

- CVE-2025-52881: container escape and denial of service due to arbitrary
  write gadgets and procfs write redirects
  https://github.com/opencontainers/runc/security/advisories/GHSA-cgrx-mc8f-2prm

There are also numerous bugfixes.

See the releases notes:

- https://github.com/opencontainers/runc/releases/v1.2.5
- https://github.com/opencontainers/runc/releases/v1.2.6
- https://github.com/opencontainers/runc/releases/v1.2.7
- https://github.com/opencontainers/runc/releases/v1.2.8
- https://github.com/opencontainers/runc/releases/v1.2.9

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index d25d8facfd..33850238f3 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9785c144c97974b52b6091b7a79168b73681ff574bc8438b44f3f5f8c112f171  runc-1.2.4-go2.tar.gz
+sha256  8e298469fc729d37920a7ee45c7cd587a4139149abccca485e08d616b80d2fad  runc-1.2.9-go2.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 51ac32de26..0daffa1368 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.2.4
+RUNC_VERSION = 1.2.9
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
