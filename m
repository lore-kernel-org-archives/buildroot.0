Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02D1C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 01:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A39B416D4;
	Fri, 23 Sep 2022 01:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A39B416D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ygdIxOatnk4H; Fri, 23 Sep 2022 01:51:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B426416B6;
	Fri, 23 Sep 2022 01:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B426416B6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96FC21BF37E
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 01:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F66740432
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 01:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F66740432
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iantRV1gqStb for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 01:51:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7740A4019E
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7740A4019E
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 01:51:21 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso7410539otb.6
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 18:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=TAAT+WBghxL4hMr+9324wZeEvt2Ls0r6GAnW/UU7s8s=;
 b=yBNYzibnQmG5zJqCcWJfnT/zXy/Hp+fOrk/PCHrvg21mduTOYSSfO65H8Zp3/mrYO5
 atzL+Yn1Sab+51ysc39eJsLHGiYvv83eTEdWAs2nu1TLksw6A2U9U/67pRd699iMQChv
 ZZ2ji8XRApbAjQjFavBrfcHCb9cJLKZgCDJ+M0U6S8taImWvOdjDHqeibLJ+pnid93kb
 uUom1Xy12tNy0gmpsNvT+FbJfOTcxYzBN5r/zc045bSFYOhq8ij5DntmGJ42cdh+3A5L
 0/HSPyqDYREPrVo0DWQyoHnpeEsfBm4BQzskw1veAAH6emKkQ/gFcZ4RRa2mCs/ggL4O
 KeMQ==
X-Gm-Message-State: ACrzQf25uFsWagEc6GjLGm7xir1yxJaXAzUBd5b81xBdm6EfVRHYLxmn
 BhzwtkJCjcjJ9nq/sDmYmr3evJ3BrQEmUg==
X-Google-Smtp-Source: AMsMyM76CYKHc8vNA4K8BPHg73UHRWfra+zbSvOACPrUfuzKXcFXW/QT43ok9+3Dx4HVQk6W4uzvfg==
X-Received: by 2002:a9d:6258:0:b0:655:f63e:8e6d with SMTP id
 i24-20020a9d6258000000b00655f63e8e6dmr3031905otk.166.1663897880105; 
 Thu, 22 Sep 2022 18:51:20 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 c1-20020a056870c08100b00127a91041a9sm4052446oad.38.2022.09.22.18.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 18:51:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 19:51:17 -0600
Message-Id: <20220923015117.3029150-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=TAAT+WBghxL4hMr+9324wZeEvt2Ls0r6GAnW/UU7s8s=;
 b=nLV72FUC0LtCeg4Ms1kz93aYHafHIGIp0UPBBwVXIaYHsT2ul0Hv9tPq0GCBkEBd8q
 IsIDtVLWjOQ9fPPvqHVcA+dpxVrWrS12jyWs1wSSGNqJwJrzUW79vKwEMK9qtGZ1VSvp
 7P39nyD6OQigk4zejPYoc8Qzyc2NaFsj6bb5dIky3eLsnSuVT0BsUav1gypbiiVp07gG
 mlpcb9rTY0gpjWwKSYciAoU2JTfhhP7VCGWf1UxZuGIAbMYeKiRazfOOgimp644i5pFj
 ff+2rcIwAB0FYAiO8pEBB3IdrCpIKE3+hJAxELx469txHR3Gp++vrwOYuAAnyEXC9qDp
 Fhrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nLV72FUC
Subject: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to version
 21.6
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
index 8e5ba09c9d..03138a59e7 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  58c8a18b4ec22655535c493155c5465a8903e8249094ceead87e00763bdbc44f  protobuf-cpp-3.21.5.tar.gz
+sha256  a3c4c104b98a21a577ce5ecc0d9b9f43a359b917d0bcf69467b70dc27416dfdc  protobuf-cpp-3.21.6.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 199e423d71..fbc495c438 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 21.5
+PROTOBUF_VERSION = 21.6
 PROTOBUF_SOURCE = protobuf-cpp-3.$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 1b106445a5..b0662124a9 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4b384ad2bc6832ede8703b4567c47498bccf104cb79fd20d2d2e3069066ae245  protobuf-python-4.21.5.tar.gz
+sha256  a014a0108e18c06a0c0308d92cdcae6ee106e4b02dd2ab1ff7073c4c80153aea  protobuf-python-4.21.6.tar.gz
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
