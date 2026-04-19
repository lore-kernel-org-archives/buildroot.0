Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28329EA719A
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 17:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF513813D7;
	Sun, 19 Apr 2026 17:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtrCcWqcdAMx; Sun, 19 Apr 2026 17:30:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFE3A81415
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776619837;
	bh=FLp8JvndwSPNyDqKpEJ14eQGlHvNLyv+c94ijmQqjCs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eXOxgNDoIBuYujk0Pb85boLXyP+ybhriZ0BfvPx0OBrw0NbUYLpVJlimD0lpEdKTK
	 2wSv8sLWDdDSYkattK+xT4XQ+bkL3f8UhjyDMhdKms3Xq9bypn2eKGEdfXwENuz0EQ
	 IkWJtv/5uQwk8IffQtVEJuPlZXGspfXV+xFcNpbCYuKqqn/tmoEWOLi4rZHC3qWNak
	 Kn/bD+dSQZwup/bPq68EmdW8YTHUbReimtGxKuSxayTYtKZ9e2PrFGLxCuFjxJ0NgH
	 8a2wnzVbuSH4667YUrT5uKTHwp26Ka6FovwwIeITkWVtVUV+f3OegftjK356hlfDd7
	 jNKVzId1qSlsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFE3A81415;
	Sun, 19 Apr 2026 17:30:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 810A5259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 17:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EDFB8150F
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 17:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1QTP3F1FA-A for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 17:30:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97C7181415
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97C7181415
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97C7181415
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 17:30:34 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-82a655cfab5so2236624b3a.1
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 10:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776619833; x=1777224633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w0qxWOiDNHuhsgeedYaQ7KhiokdpK3EpVnKYentFPH4=;
 b=h2+s34Hz5yaY2y+7+MloLoh9t6PVU4IgzLgZvcsBOSQhI5DSt4meKho56bXV5gxwnt
 z86X+4/4PezYS3UoXyhf9ouXyXTSWzF59b5KCV9i78Q0DbU7QnsPgrl4yWRvuY0G/Pog
 50Q1EU60d5hov1u6uYiwAdnZIqWieiMG9B2h9Tuam/j6lvXcsPDmiyYJMMCRLCC3cqy2
 QQLDnKbVXn1tbDwjd/BUkOmmuiJ8QmYxRVE23GG93s7LnyC8NvcrNXwna/yzsHaVpjTt
 WHPU1s2idJWH3YD2f1i9sL8gk+OtPYhcJJFlqstfFLH5cvony/vznY1oqxBSa/+G43Uk
 xl8w==
X-Gm-Message-State: AOJu0YzKLvxJymsayCGqa8fCIv9oC9O4SIW/HfvHPPDDCHP88fbf83Ka
 O1WIQKzphQYpVtbCfHrsOJPcA/enpKZJtTLP87Miua96nLLjYDD7HfowVJbE4y6t
X-Gm-Gg: AeBDieu/NA6w8SSVeQ9+afLPjAN9nPo5+Bna1dlYmS3TvIjWCdVfNB2HsFmSiJtdByb
 x09VB+ruHKj/CHP7VkPwKzTIUeu47ALfNQUIHNDtNIMg7OO1S1s0XNFEy+cPMNXzfBDspE+pQ14
 op62iLPzxUnJNJ++90BVSNGam/zrbW2twLNQsa2k9BML3nFnAhLvmU+eWjKKTSaQZL+ocBj4pSa
 UKTNScBns0z185XQyY/OmlPAPF4o4cVUJqroitjqnPnGzSI/il/sdGIgp1RFtvSqo9LQpvGo/Ub
 L9FWZxB3o4MOZOdOB4hJuR2erNM3RpgNjowt16AemyFzfYY2UEKNichn6PYfqbPm1TAv7ZM6NYk
 S2Dqo4VV+GUvhAKYfzm6cQvsJSOqOHOb5/k+A1sbB69O/dWLS6JSxHWW4hZEJr4o6i3jTxW8mvk
 iW7rZxtML0don95UxOdh22UyJvn4XdI34gbwQo0jF7rS9c/oIyCvg3Wm+8
X-Received: by 2002:a05:6a00:69b2:b0:82f:a6bf:bee7 with SMTP id
 d2e1a72fcca58-82fa6bfcb31mr3093993b3a.49.1776619832834; 
 Sun, 19 Apr 2026 10:30:32 -0700 (PDT)
Received: from fedora ([2409:40e5:112e:daba:4994:b597:7615:a059])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f8e9d35acsm8232039b3a.15.2026.04.19.10.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Apr 2026 10:30:31 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun, 19 Apr 2026 23:00:15 +0530
Message-ID: <20260419173016.53785-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776619833; x=1777224633; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w0qxWOiDNHuhsgeedYaQ7KhiokdpK3EpVnKYentFPH4=;
 b=jSOosKXZYBxkt3D7oOY1aQuJyfuBO9Bv13GeSUC/6affHa3KcUqpTNb6R23QGPCvrt
 c/vzhgOvYqdSs8swwV24PhKBN7uqJZiMb+btho1s4RaTWg7I7EI00EVeJphMN4ZrAuzX
 js9PagDXhz5Z+lq2i2H8SBhv7b+DcVF14h1B4fC8T+m7DmBnBGTVc/be+sQx50odRLLr
 f1gFSmeItmMdf1j5/ZRFCncT4hHOoOyuxhlV62KwWHRjau1gkKsa1IxMjZiA3RmDpA0N
 mxnE5YXv1w//nAml3W/soj9iu0LQ8JzIYO/I4hyAuqqFwmLrKgAsN7DadwuObLOPChcM
 UDTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jSOosKXZ
Subject: [Buildroot] [PATCH] package/fakeroot: bump to version 1.37.2
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

For details see the Debian changelog:
https://tracker.debian.org/fakeroot

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/fakeroot/fakeroot.hash | 5 ++---
 package/fakeroot/fakeroot.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 1f52d37f1a..9fc8e0a54e 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,5 +1,4 @@
-# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.1.2-1.dsc
-sha1  925958f4730b172f4e1ae5dbeb9734f3da95da13  fakeroot_1.37.1.2.orig.tar.gz
-sha256  959496928c8a676ec8377f665ff6a19a707bfad693325f9cc4a4126642f53224  fakeroot_1.37.1.2.orig.tar.gz
+# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.2-1.dsc
+sha256  0eea60fbe89771b88fcf415c8f2f0a6ccfe9edebbcf3ba5dc0212718d98884db  fakeroot_1.37.2.orig.tar.gz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index ea0edb7665..12d7f1c4a1 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.37.1.2
+FAKEROOT_VERSION = 1.37.2
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20250513T025019Z/pool/main/f/fakeroot
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20260401T000000Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
