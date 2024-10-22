Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A45BCDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 170DB60671;
	Tue, 22 Oct 2024 20:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFxqJAYitqsR; Tue, 22 Oct 2024 20:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 161EC60681
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 161EC60681;
	Tue, 22 Oct 2024 20:51:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61D832072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 510D480C87
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3y9aA6PAYot for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:51:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54BEF80B02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54BEF80B02
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54BEF80B02
 for <buildroot@busybox.net>; Tue, 22 Oct 2024 20:51:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso47296405e9.3
 for <buildroot@busybox.net>; Tue, 22 Oct 2024 13:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729630299; x=1730235099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sT9O9KvwoXV5hxeZ8m+5SW74Z0PVcGGn5BqmkqjHgqY=;
 b=YRidhDjmaHSnfI/SZCUKBHU1wA2+xIYJ9tkK1GtEGWj7MBLY5lMT6x8LliCBBgscqm
 RVzJwWfbIuqZiMrngpyHdyGr3rCKeMdzrkV9RVAo1e5//9mvxnUNL/SKitbVQyumC+j2
 mMBJYOlWluWeh/2Dh56Zevhhsbarmip6fUBz5kJaWPpL1hpKBF4SFsZMgnM1dtNz+iC6
 CoWWSMc9KcLzzfsh/kURFsIFkFcq0+dc1WYnTn3Q58S4Y5WOTpRBXcp94FcvDnJIdQ7v
 yQZ/WO5W8HnyIPKmI6+r732QlWnl0sRyhnLQtz+3PjsqdrPd48mFNwhYL4/+OBU4wMCb
 9SJg==
X-Gm-Message-State: AOJu0YwA3c4kjIeo5WSKFiT8jI+1lEqNkpOAz7sZ0qge1PA9d3wsAGVi
 LblNlRyCRuf0YT5f1JcTv9lGJy7Ar5znBfeAyDLeFOTLAH0iJlNd8zWlonpP7QrfIGhR7WSbosk
 E1Q==
X-Google-Smtp-Source: AGHT+IGtUM/nxIhTDXYq0uGTf3Q9/q68/+odTS10rhhstIGz7HLmDVhH/+0t3Lh+LAYfQwsmpQ2eiA==
X-Received: by 2002:a05:600c:1c03:b0:431:5533:8f0d with SMTP id
 5b1f17b1804b1-4318424ea29mr4173465e9.30.1729630299293; 
 Tue, 22 Oct 2024 13:51:39 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f570a97sm97709505e9.9.2024.10.22.13.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 13:51:38 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 22 Oct 2024 22:51:33 +0200
Message-ID: <20241022205133.532205-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1729630299; x=1730235099; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sT9O9KvwoXV5hxeZ8m+5SW74Z0PVcGGn5BqmkqjHgqY=;
 b=MbgD5s78o+Hl8PUmUfzPPFIqxf0SktOpIyWt172VqqhVKVdv3Ma8BK1VTE1JZf+xvR
 7/C4ZolcLjaI17Bz+ceQiPdqnxGDZEAp9WkIQ1vbwUEht0KlIDFL0TIiMos5m70pk5B6
 XN8BtvwBCG3ER+y8fJqrEr+4y3sNtBFRQd6wjGrWA1nnVgOvJb8FFmS0ElOXq9gYLJ9c
 H7OS7Q0e79RYCjfRdLS6euQzWiOi3yidGcg/eC7jozQBjOcc/eOiYUZIDem0ZcGU48CX
 HcE/DOvxrN7tePsOR20ryH/GveBZWPImPvH/nFqMonHtq66tpCWYEXCAiU/ZGlpcRIso
 33Lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=MbgD5s78
Subject: [Buildroot] [PATCH] package/nettle: bump to version 3.10
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/nettle/nettle.hash | 4 ++--
 package/nettle/nettle.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
index 6c2486e26..5b11cd0da 100644
--- a/package/nettle/nettle.hash
+++ b/package/nettle/nettle.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/nettle/nettle-3.9.1.tar.gz.sig
-sha256  ccfeff981b0ca71bbd6fbcb054f407c60ffb644389a5be80d6716d5b550c6ce3  nettle-3.9.1.tar.gz
+# https://ftp.gnu.org/gnu/nettle/nettle-3.10.tar.gz.sig
+sha256  b4c518adb174e484cb4acea54118f02380c7133771e7e9beb98a0787194ee47c  nettle-3.10.tar.gz
 # Locally calculated
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSERv3
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 20f755cc9..22a41ba55 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 3.9.1
+NETTLE_VERSION = 3.10
 NETTLE_SITE = https://ftp.gnu.org/gnu/nettle
 NETTLE_DEPENDENCIES = host-m4 gmp
 NETTLE_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
