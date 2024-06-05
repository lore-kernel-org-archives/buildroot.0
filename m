Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E276C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 17:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71B4440081;
	Wed,  5 Jun 2024 17:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2ynlHs4RV2T; Wed,  5 Jun 2024 17:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C07040238
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C07040238;
	Wed,  5 Jun 2024 17:53:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53B381BF5B3
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FF3F41994
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXJeUljzEoAA for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 17:53:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C063541871
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C063541871
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C063541871
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 17:53:24 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-35dce610207so29888f8f.2
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 10:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717610003; x=1718214803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4tIMA+tI7oWAZPlhnLu89t+cuu3N88XgL7gtx8IlsnY=;
 b=ipavP/vOMl/Yjca4zYBT2uZcsPn273q/K5X/4y37LqmzDLJn+n0ZC88BtSEZb90w1V
 8JRfalbc8nkVUAkMSJw1t9WmPn7WtEeka8WGoCSxL3NdwiirwWnrYqBvB0fcv9uO0pBt
 zux9ngfABysmP99tWP0CwwGdZk85mGfSQL4Enq4GbpwpXTBOK2lmEU64uOwLTEFUpR4/
 bUbhFShFJ1iLhAQ0Yl6q9CTcv0biNLSeiOLvvVS6KVF63E6LZ13ST0tAZRroO1vxGNkL
 z+iy19YMjLx/EhXJkA+nv3xIrGxxFmLztuODa+q3j93Vt8XykBdo6nc0LvvYLx2u0wRV
 VCuw==
X-Gm-Message-State: AOJu0YyM1eYmpxY48z7rgBqyGWj2QUCuy/03of+sdWsPxiuUwXRX323r
 utsPjumaxOn8RA3WmEre+78wEc3tif74V5kOaxZPIaMYPxyj140Ww0VPaw==
X-Google-Smtp-Source: AGHT+IEI60AHKMLe5cMV0ENSmpNm5AqDwcEbPXfDNsBoEzJ78pUe6E+r90KuelhZqvGwVOPfh+wNnQ==
X-Received: by 2002:a5d:5f91:0:b0:354:f612:5f7e with SMTP id
 ffacd0b85a97d-35e8ef94989mr3865835f8f.56.1717610002785; 
 Wed, 05 Jun 2024 10:53:22 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04d90a8sm15520821f8f.46.2024.06.05.10.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 10:53:22 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 19:53:13 +0200
Message-ID: <f9e65da986bd67bb665a18db4ac5ebeee91a4758.1717609998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717609998.git.yann.morin.1998@free.fr>
References: <cover.1717609998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717610003; x=1718214803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4tIMA+tI7oWAZPlhnLu89t+cuu3N88XgL7gtx8IlsnY=;
 b=eq8SDsdAPV7xNgDM7C+wqEBgMmaasPg+yef70HiCXMGLJ6SMo1oywHeZxuDAEQN9Tv
 2HsY8RYl1VXTK04eHmlwukCccaYx3bxwFurQHHszsa1nDy2VUSVmBRLWRlYP14lI6J90
 U14fn63KaPzBRbL0tyK2YCF+qFpsaCvusl8GyJ3Xk5HBD7UWAPy8mtZUP614Sy0rhqed
 +m8xkdechOW86uN71WhGbjjgbGvV9/VNKfvpfXuOouT7ppkJ10HjhQZ0fYyVcYKC+kz9
 StissFVKSSKw/5hZrNpTqMA2Hii1L9Ctl5T1hcgJTj0kOGgUPededKMtqHnlzGyusrqE
 sSPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eq8SDsdA
Subject: [Buildroot] [PATCH 01/10 v2] package/liblockfile: drop empty patch
 tarball
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Debian control aarchive does not contain any patch for liblockfile
1.17; it has had no patch since Debian packaged version 1.16-1.1.

Drop the path tarball now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/liblockfile/liblockfile.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index f472809ebc..6535634efa 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -7,7 +7,6 @@
 LIBLOCKFILE_VERSION = 1.17
 LIBLOCKFILE_SOURCE = liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
 LIBLOCKFILE_SITE = http://snapshot.debian.org/archive/debian/20210128T210947Z/pool/main/libl/liblockfile
-LIBLOCKFILE_PATCH = liblockfile_$(LIBLOCKFILE_VERSION)-1.debian.tar.bz2
 
 LIBLOCKFILE_LICENSE = LGPL-2.0+, GPL-2.0+ (dotlockfile)
 LIBLOCKFILE_LICENSE_FILES = COPYRIGHT licenses/GPL-2 licenses/LGPL-2
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
