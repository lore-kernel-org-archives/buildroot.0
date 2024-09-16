Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D172BC3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 15:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EDEB40C1F;
	Mon, 16 Sep 2024 15:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHdOR-Ml_Lz3; Mon, 16 Sep 2024 15:12:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E12E340C5C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E12E340C5C;
	Mon, 16 Sep 2024 15:12:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F07B1BF41D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA92140BCC
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5anVksgEYuv for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 15:12:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::642; helo=mail-ej1-x642.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B645A40BC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B645A40BC4
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B645A40BC4
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 15:12:12 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-a8629ddffbaso79720066b.1
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726499530; x=1727104330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z0bQ1TS32VciP22/d4CKhxSVkAebLfiah7yZcucYgPQ=;
 b=lYF7U7MQ1PcuCDqMn+Q8pT5juFiWf7SRU0cnxfSFh4Z4IyZq5vCSqxHnzNZ8qSxDgR
 zGbZIVRDTa5yKx2YSq/xSxj/N6Ruw+Prj4zieWUh53mPsrNt5q3FRYQ1Wgcqy8JJGbb+
 vxgNc0Z0VAve9ZmQ0mCDsyn19hAjowTttmhn63QjHaf0Ec7U7cIIHg1vdNSYpc8XztvK
 4BPpzgqx22PdHAjwu9sWcUHVLbzDIRpV9qfoFIiVO9tnC85dI28cheh3v/fNOXaAEUQp
 ZXe5ZFd6o31hLx7g1tvcwbEBZZFlwWJK83RTRjkH/tmIiNnqhU6HCUOhWzQ0CtBRl/T3
 lWZw==
X-Gm-Message-State: AOJu0YyBhEyk9/x3pBH8vlyITYk1Xgh0zsIiWLx1xJHYfqXCyEbDMzyy
 TlZ2ERg94K5u8TXVpZTc3ieuVGp+4e8H0a60naGkdBRblTY0NFLATBQ/78hj6cxUCkWMlVRlpPD
 krxRVBzaO
X-Google-Smtp-Source: AGHT+IG08BaJY/Vl7Ejk8zb/YMNwaVjsulEf3ELDWI0aEblLWljO8bFDo4pFTTML9yY/PL/bdD+K0Q==
X-Received: by 2002:a17:907:9724:b0:a8a:9054:839b with SMTP id
 a640c23a62f3a-a902960c6famr708128866b.10.1726499529968; 
 Mon, 16 Sep 2024 08:12:09 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f440bsm330460166b.86.2024.09.16.08.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:12:09 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 17:11:55 +0200
Message-ID: <20240916151206.947484-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726499530; x=1727104330;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z0bQ1TS32VciP22/d4CKhxSVkAebLfiah7yZcucYgPQ=;
 b=E2G8c5F8l6pTYbicCRoUkFUyPxixIe10XFQR1cA2Gb6ELqTd2tv1K+LSMbRqDfClyT
 F4l0RBaLxI3kbRJS9IotF9anu7O8gH0KFrR9qVcnPYN5mRYh0K/wZ3oLAz6tFbM3aFXa
 CK7YMNDIyH5vJ0WixlCRqpQcrqK+2UZDyInUQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=E2G8c5F8
Subject: [Buildroot] [PATCH 02/13] package/libsemanage: bump version to 3.7
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Antoine Tenart <atenart@kernel.org>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/libsemanage/libsemanage.hash | 2 +-
 package/libsemanage/libsemanage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 862e49f52e..4d1b2161da 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  41138f46222439e1242f27c1587e95cf54a059259aaf1681db642cc30c4e0d60  libsemanage-3.6.tar.gz
+sha256  e166cae29a417dab008db9ca0874023f353a3017b07693a036ed97487eda35b1  libsemanage-3.7.tar.gz
 
 # Hash for license file
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 7742e7060c..cf9e9c46fa 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 3.6
+LIBSEMANAGE_VERSION = 3.7
 LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEMANAGE_VERSION)
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = LICENSE
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
