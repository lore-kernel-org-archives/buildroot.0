Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9960EDEBE6
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 19:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 876F3418BA;
	Tue,  3 Mar 2026 19:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxZtkxcPqVFD; Tue,  3 Mar 2026 19:24:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AA9740AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772565844;
	bh=zerfDthbOH5EF9OPSr8sm03taDfAolaQwL1SfuadXUM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=orf2OgLq/P6LLdspHb0zUAq926DYl2K1ebDOFR3VXlJLOrDcJQ2L2xxXVLgb0Evry
	 R/Rd/7WseGLNSgPnIZZNswA4V8N8kphprOA9EH8NT2OXdmRFbgViIpYdu+KC6tbVyT
	 ma/S+BNEgxBTwDyDWpzQj6RNK5VpCa7xrQtv8IBV4PYwasu71K92fRc5ZM3Or8nHKQ
	 pft+90i1dLHHR88zGlT8VtNfpcp5cxNWTP/NoYvX+CEBz69lWlKQBqAdQoZh45GO4d
	 bTSdEu6HRBmAU+z2Zv70fzxG9Ba8GLkV0BPuvvYs32lN6lm4+uT+gX2iep72MWOrZW
	 5HXMEsXkLSR6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AA9740AE9;
	Tue,  3 Mar 2026 19:24:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B44511EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 19:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A50A82311
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 19:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27_85KTlULrg for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 19:24:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0865E81C21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0865E81C21
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0865E81C21
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 19:24:02 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-824a9348603so2349761b3a.2
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 11:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772565842; x=1773170642;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4JtNRmZ28s0qfYUC1tHxl6wD0UOMN8MT3AxVcgMY+0c=;
 b=f9cmIsk+Ik17qfLGZg9hUmopadj/ds2Z/LYwp9HVFLJ8kz8beo15JOWNxjIqWbiL6T
 GA0m72bRDVBvt+l2eXBbn6KY0IB1TCNzqJxWd+GwDeQWcribxcb30NtDeNzOvLTBRWpL
 9nKKA7LHLvld4AvVvcODQRwccBq8iHIp9XRbXslSUnHUrYlEorQ2YHTG2SGKRZbvCQNe
 9zS3bJrGglhF2/0qhO9E7XAMkqJgG4Qvw03PQUhv+HvjUHX6HU2lWmccqHbtWy6MBchY
 Rr4oGYAAz2hFsxwSCqSlgRfTby06ibnZ9ZbmzZMz5L5rx4LMR09xmq6Y6+5c/8gIgKjA
 82Eg==
X-Gm-Message-State: AOJu0YwsrilaErmp1D/gFGDXXP+Se4i7zWH2+eGUQZGAVkXB1+pHzdvk
 V2BBfOMPpsxQOC6a+usKGl6XSPXpsN+P7eeW9eBC+cbgSBuouFRqQuEKnBcwdzSc
X-Gm-Gg: ATEYQzwmrWEXADvDmfV5UKM/1TjsyiNBVQ7aOaG6ismKPPQnbo6Z4vVkGAwvYiifTj4
 dS6fsRcB1Pa1xmyPALFQingA+cH3Rle+V2fGy/fw3+VqPUjuPZPy4OOSiuJwMK93Y/2pHvZ2YQK
 c5n1VVaJv1u3dyBGt4dTguBeFVJi07u7pNBaigf2q62PRNnFtPFq3Gc+UdPOcnSK4LqPnZ00ZJM
 UdxF/mWYjkpajwmr8rTg0jZmgb5ZfbTN3MT1HPaJxBoMuQ+XV0xvXz6aCxh0904YN3poPGmSED2
 3lg2yY2wn8ki6Xztvn6FBU6BebAFuIIo9fNXeWe+7Yp4Mw/JlpcRaEWgqLFjVXUzsUR3wSeTnL2
 0tB/4zk/Ef0NEJcUP6FKxBrZFcFo9TWtQNoA4AsXU9npFFFOoqvIykzSYAZ+s78HumfCN6IS5iz
 L3uz6v24CgWOb/qOm6JdWVSzyMDkoft3WzPnhCvSVqe+U=
X-Received: by 2002:a05:6a00:3a2a:b0:81f:d605:9c9c with SMTP id
 d2e1a72fcca58-8274d931457mr15807998b3a.11.1772565841695; 
 Tue, 03 Mar 2026 11:24:01 -0800 (PST)
Received: from fedora ([47.31.83.111]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8273a05e831sm16841763b3a.58.2026.03.03.11.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 11:24:01 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 00:53:43 +0530
Message-ID: <20260303192343.1332911-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772565842; x=1773170642; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4JtNRmZ28s0qfYUC1tHxl6wD0UOMN8MT3AxVcgMY+0c=;
 b=cvsIJjz/uy31fFLz2LJa8xhdIFQ375VUQ6IrUDY95ViOdC4u4RJ2CTo1tEvaf4L7mB
 mKTbUy2iZXK+Yi19Y+uYwFd4EotpZ5KQpt4tbhbCpKUKRPPiXvTP52Zy9V69O71xrSrW
 rxrcuyacV2hH2Q2PsmMJc0ZOCNGC4FqZ/PQaGU0u8WxyQOqTn2HhQj/CErhR/aqJYhWc
 klG8hIXP/ADBgD78b62t1TFjLOsh2Bfd+4UtiIdCSpg7OmlauEbmdjf8BKwZKS/+vNj6
 K1xIDd2vaZdZHGlQgCEc5oeV7uh2Nfz5PHXQxh3hYKgEu5i042tHixwrpSDJjWO1ZN1g
 mLJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cvsIJjz/
Subject: [Buildroot] [PATCH 1/1] package/slang: fix statically building with
 musl
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the build failure when using musl libc by adding
the missing -lncurses, which solves the issues  undefined references.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/slang/0002-slsh-static-ncurses.patch | 22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/slang/0002-slsh-static-ncurses.patch

diff --git a/package/slang/0002-slsh-static-ncurses.patch b/package/slang/0002-slsh-static-ncurses.patch
new file mode 100644
index 0000000000..c4bc9170d0
--- /dev/null
+++ b/package/slang/0002-slsh-static-ncurses.patch
@@ -0,0 +1,22 @@
+From 5a90d40e1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Tue, 3 Mar 2026 13:00:00 +0000
+Subject: [PATCH] slsh/Makefile.in: add -lncurses to STATIC_LIBS
+
+When building statically with GNU readline support, -lncurses is
+needed for terminal functions. This patch adds it directly to
+STATIC_LIBS in slsh/Makefile.in.
+
+Upstream: N/A
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ slsh/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/slsh/Makefile.in b/slsh/Makefile.in
+index 38d812a..512fca8 100644
+--- a/slsh/Makefile.in
++++ b/slsh/Makefile.in
+@@ -25,1 +25,1 @@
+-STATIC_LIBS	= @TERMCAP@ @LIBS@ @M_LIB@
++STATIC_LIBS	= @TERMCAP@ @LIBS@ @M_LIB@ -lncurses
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
