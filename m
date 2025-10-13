Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0D5CCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 15:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C165781A92;
	Mon, 13 Oct 2025 15:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJgwmWzhLftK; Mon, 13 Oct 2025 15:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5FDE81764
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5FDE81764;
	Mon, 13 Oct 2025 15:44:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF26BBC
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 15:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0BA660A7E
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 15:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VL3m-z-tjgj2 for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 15:44:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B62E860A5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B62E860A5B
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B62E860A5B
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 15:44:00 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-63b6dfd85d4so4394822a12.1
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 08:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760370238; x=1760975038;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qLySKQtIEEJODoPQ5SiVPZjDPW6ap5gDKM0saUnolU8=;
 b=qwVaZiGQMxieXCxKx5qdGJGfDSPXnLRlRDiUhV8PqzpY8NeTMfodHAERLJ1pGTREAZ
 jEChCOpVTIdaTQpBYKbQvu/9zb0KhY4/pDjHMFZbNj5e/JDqCyglMml3rJ3aqw7FAAZA
 fN2N+dIucPWJ+LkSqMtRFByxgjNsdEu2iUGuh6QrkBh9UwkpLcSnbzbq3/Zx6DjNRZHh
 UZmpu/BL3e6q+U/Z8eD/ULeRNerdbEf4pZ3m4B2t5yHj8MitM3AjFuwWS6zZ3AVSKHGH
 5GimrhSLOAX/VAUTKALxhVTQZUZMaeR5FqRlkmseWkyFkH9v7PLRxD3KxDO39H+QX/ht
 ouoA==
X-Gm-Message-State: AOJu0YwnG7lQDf3r/GRA4egdk/kYt1ddF9MZK/Vb4zMmITaO+6+HPQem
 eSTUV3bWZPSd3ChEiWZrf6lvm7d47PrS7zCcXGj5BcL8WDN541elKHNvBvvnEatNIWWfI7lkZCj
 qoe3I
X-Gm-Gg: ASbGnct7bQtcAMc63p/+7lDMJHf+k/TJNq4Plzn7XnO0pHESJmm45sUtD/I2OAOJx63
 8xS603ko2RUbn/KQqFCZLAWBZ9jYoaDV2zHu1I5CY83EJMeXShYvk20y7m4If3pX2ulKd9UfMLL
 dOPDdg7Y6shAYItu4AnvL2hbgLQTZie9y6BqKT7RfjMvlmN1gQu3yADvzwgSD4L5Nxnr5jIlKLv
 7eH9/36SF/WoraYi2ASFFF2qiG/UH4cvh7/kG5uK0Y6KybTIIhP+EaOkDG764FyPFzfkeojMFJy
 U34Wqc7EexsTGa8MxYbwiAY7ZfuDleJrjmwhingmS5pxOfHw9+Nt3ytBeJGBMrLyx5YxjO0lTau
 6eZWCRQJ0WLvvaOqdo6ifjTmI67KvrWUeTRp1c2EIw5zAQEwv2MY=
X-Google-Smtp-Source: AGHT+IEyCpUqWqUvT9U6mMRGChuR2eEaFSShztvazeYK7hTmbGdR/lt5kNZd8NkQjBTKXv5AHEwdUw==
X-Received: by 2002:a05:6402:1443:b0:63a:5d3:69ef with SMTP id
 4fb4d7f45d1cf-63a05d36dc4mr12757121a12.4.1760370238041; 
 Mon, 13 Oct 2025 08:43:58 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c133412sm8992626a12.32.2025.10.13.08.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 08:43:57 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Mon, 13 Oct 2025 17:43:49 +0200
Message-ID: <20251013154349.107884-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760370238; x=1760975038; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qLySKQtIEEJODoPQ5SiVPZjDPW6ap5gDKM0saUnolU8=;
 b=hA00cD+cEL0xuiDxutG6ckIx2bnpGPHrSxudB7w8BCxrmfkILDbvkdsxN+q62ZOmP3
 O3xAUPjM5O43OOyJ12SOl0YsCvIHSWTCB+fazmNr6Ct3bS7YCvK63b+X18ppyuK41Hy4
 QBLu3GwA6CtXFKVAiqPkXeGKPrL6DworPVYObDHGQS97h1WXvZjW6r0MpeA0B3erSuQY
 bBDwgCQzpRy4H2webWZsqM/oi3VpkwMoxzSYaEvBc88tBSIZ+K4eEgdt19RWo6c2G5XV
 QWzUb+jtHorZCe5XXhPg8/FW/FdlHaN+kMbzZhPSBbWXGgyQzbmOkU0QvyYU2edFXrbe
 zHhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hA00cD+c
Subject: [Buildroot] [PATCH] package/redis: security bump to v8.2.2
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

See the release notes:
https://github.com/redis/redis/blob/8.2.2/00-RELEASENOTES

This fixes the following vulnerabilities (in the Lua scripting engine):
- CVE-2025-46817:
    Redis is an open source, in-memory database that persists on disk.
    Versions 8.2.1 and below allow an authenticated user to use a
    specially crafted Lua script to cause an integer overflow and
    potentially lead to remote code execution The problem exists in all
    versions of Redis with Lua scripting. This issue is fixed in version
    8.2.2.
    https://www.cve.org/CVERecord?id=CVE-2025-46817

- CVE-2025-46818:
    Redis is an open source, in-memory database that persists on disk.
    Versions 8.2.1 and below allow an authenticated user to use a
    specially crafted Lua script to manipulate different LUA objects and
    potentially run their own code in the context of another user. The
    problem exists in all versions of Redis with LUA scripting. This issue
    is fixed in version 8.2.2. A workaround to mitigate the problem
    without patching the redis-server executable is to prevent users from
    executing LUA scripts. This can be done using ACL to block a script by
    restricting both the EVAL and FUNCTION command families.
    https://www.cve.org/CVERecord?id=CVE-2025-46818

- CVE-2025-46819:
    Redis is an open source, in-memory database that persists on disk.
    Versions 8.2.1 and below allow an authenticated user to use a
    specially crafted LUA script to read out-of-bound data or crash the
    server and subsequent denial of service. The problem exists in all
    versions of Redis with Lua scripting. This issue is fixed in version
    8.2.2. To workaround this issue without patching the redis-server
    executable is to prevent users from executing Lua scripts. This can be
    done using ACL to block a script by restricting both the EVAL and
    FUNCTION command families.
    https://www.cve.org/CVERecord?id=CVE-2025-46819

- CVE-2025-49844:
    Redis is an open source, in-memory database that persists on disk.
    Versions 8.2.1 and below allow an authenticated user to use a
    specially crafted Lua script to manipulate the garbage collector,
    trigger a use-after-free and potentially lead to remote code
    execution. The problem exists in all versions of Redis with Lua
    scripting. This issue is fixed in version 8.2.2. To workaround this
    issue without patching the redis-server executable is to prevent users
    from executing Lua scripts. This can be done using ACL to restrict
    EVAL and EVALSHA commands.
    https://www.cve.org/CVERecord?id=CVE-2025-49844

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 74fadfa8c0..beda6bc48c 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  e2c1cb9dd4180a35b943b85dfc7dcdd42566cdbceca37d0d0b14c21731582d3e  redis-8.2.1.tar.gz
+sha256  4e340e8e822a82114b6fb0f7ca581b749fa876e31e36e9fbcb75416bec9d0608  redis-8.2.2.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index f2d7d43b7a..fbad637aff 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.2.1
+REDIS_VERSION = 8.2.2
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
