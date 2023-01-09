Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F6AC5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 04:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D27A60AF4;
	Mon,  9 Jan 2023 04:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D27A60AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1OHL17oCQMUL; Mon,  9 Jan 2023 04:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1AFD6070A;
	Mon,  9 Jan 2023 04:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1AFD6070A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 658251BF21A
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A59240901
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A59240901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LlV-7hClGNl1 for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 04:59:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA2A440903
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA2A440903
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 04:59:11 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id i1so924461ilu.8
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 20:59:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6CQ5fJ0YgtnEtqjcVXy+Rk6ZVNSZwWEkhnoZkyMu2bE=;
 b=IDWbZbzkDT0/mG+kGy4WyEVBtJwe+ad3tHuDcI0sj/6MWkHzrSdjk0QmKCWyo6aUeO
 PvNEjnk+P+7pj0BYaM8mgboahqCVyp3djIcXBZZZtZkF0BVo1NZLcCpCVURc1pQbdGAi
 MjLABBLWK1Fgl+4Mx+iwrWi7Hw1VZzFDdkKFdHJriSZGwjEqoWLjpYIMoUXi/09s5O00
 86BycHKxwYYE8b8hfBi9ZFb83wzongAWoYtFU6PCiDTO0EaTXLrEAUfE5nlvApVzkCfg
 0eyJaiKOV6XJ0IUCuLV4TmJ8CqZYQnep3yvD6dwBTwmy2LyyFunRUoNZiG6U/icHcnJ5
 rQKA==
X-Gm-Message-State: AFqh2kq4ivOkiLTnAvoTF9YPXOeQptOPT0Pq5wnDa7fY0K0NrD39q6tE
 7RJq7d7i/snbO4y1iBodC/8P439EvHTsH4kV
X-Google-Smtp-Source: AMrXdXvwE2n4nnSJlE1mZKQQdRLlb67uN+yhRz/+g693OI7NNGFpfho6SE0Cc82H+sLW5AeJPct5Pg==
X-Received: by 2002:a92:6e10:0:b0:30c:44bb:8d23 with SMTP id
 j16-20020a926e10000000b0030c44bb8d23mr19038241ilc.2.1673240350503; 
 Sun, 08 Jan 2023 20:59:10 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 c3-20020a029603000000b0038ac01fb3bcsm2491655jai.14.2023.01.08.20.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 20:59:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 21:59:08 -0700
Message-Id: <20230109045908.2502002-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6CQ5fJ0YgtnEtqjcVXy+Rk6ZVNSZwWEkhnoZkyMu2bE=;
 b=E5Zrel0x6SiSmTkbXuv3+JW5omQckhzb+7oJwR0qgj6w4qAn30E4I3I5iApsHpba+N
 5RCdgcp/u075JasX+bendOcu0l6WGAo6DkgiSNTk5rjc1lVbPX41KTXWoMg+P1KWuoXg
 IvZFlIvJse+3cW+Petvfjzcyp7sHQoXE8IDHvXi00TUs1q55LzpDdhp0aQC6BRvFXXQv
 MDF9SvDmbtWjYyXTdV+5Jb0r1rTMtMVNjB8tNicaHWZ/LoAkQJKiVz+Oo5I/f1dVcFEQ
 D41+RmZr1Vibc9WSufKVJnabqYCANLJhpmJEn+4JZt1GB0rf07J15YKmGRmN9/9Q3qFD
 Tovg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=E5Zrel0x
Subject: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to version
 21.12
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
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index f1f5fa77cd..b092c9303f 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  96f0ab99b7414e44e7bf9b218bb59510d61549ca68e648f19e3622f9999bec00  protobuf-cpp-3.21.11.tar.gz
+sha256  4eab9b524aa5913c6fffb20b2a8abf5ef7f95a80bc0701f3a6dbb4c607f73460  protobuf-cpp-3.21.12.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 33a7c40f40..8cd4e99e06 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 21.11
+PROTOBUF_VERSION = 21.12
 PROTOBUF_SOURCE = protobuf-cpp-3.$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index c2afc3955a..e7af678b97 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ae4ca6e1da635f31019d8911923163f372d9d333e8857510f513acba33172d0c  protobuf-python-4.21.11.tar.gz
+sha256  e2b976e67d6fcf7078f799143a73f2a4d9cf3126ca68a1a6f1bda30fe5f3585c  protobuf-python-4.21.12.tar.gz
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
