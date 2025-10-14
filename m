Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA78CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 11:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D493A416AD;
	Tue, 14 Oct 2025 11:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAbcR-pWuFNe; Tue, 14 Oct 2025 11:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE969416C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE969416C8;
	Tue, 14 Oct 2025 11:12:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A7D11C9
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 11:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C45A416C8
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 11:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lihLhqKp3rP9 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 11:12:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E56E0416AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E56E0416AD
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E56E0416AD
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 11:12:25 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46b303f755aso45246375e9.1
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 04:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760440343; x=1761045143;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RWkypqwUS795YtMqNmI0YOfh4+7EZe+uhAXk8pHx+28=;
 b=k3WkkicmiCTaiNq9DWJRTvaTGV4eP+ZkAbDl3pn4kOgUpZvTgRaVatHBwrddsj+gsd
 RbooNfDEUFGQ2vUaEymaPHIT9TwCcYRP2TqlSYXnRIoyzgUM0kGNRhrAf6Rj6Ji4DPA5
 w19ZmZ8KGcTtNx/oVYRajI+1syST551/iaO6ohD/00M6uCGuYYKzzKKJPauo9g550VTL
 4GmlO5/pgH6+bKgz9k40Gu9k/HwUyeL3ZOPJO+H+P50VFPBa937TIMcCTti8eMnDc7FX
 /VVRFs5GsLVvbhfGa5uXiqcio5tjSJ8IDEoOoJvKt7wHBogafP+Iy3mD3F/TOqZbSROM
 hB7Q==
X-Gm-Message-State: AOJu0YzSv5vYy7oPQNRqhxcVS2Jw2CV9+q1i1CYcJ1GIbv1kYgc4vz01
 mIwsj1ZOca7jLmTKRBegSLOZt9tn8cM/Gm+lIlGrNS5epogsf7ab2VyR1O6HLXSC04/ZXwBsYcY
 e9CHJ
X-Gm-Gg: ASbGnct2O4Da/kzSxkRXvYyPwFcTruThmu+n0sg/rBtlfaUL3YhmnuuWQPWYK/7TSFD
 WCOLMVfo2waDg003vyBH/P7DKZu+NWD8VzELGWF4ZbWBeg022iHHa4sXstw1TwKdaZG9elZSRjm
 9XV0hRdOyzFIWjeXS+V8W05M25ZhXM+3DXid26wFMnS9p4tX9dR0PLWyLBtmb/owxZ/b3FImv2j
 XbzapHaKtUb0g8UwToJpxaKLm4UEngV6CTvoJBIoAFV2921p+cfdvK5EXuKCTPP3AXUHnTKbhP9
 IhduUCfJL51o7l6GCldTHnW4k6fWsmvyC/fxvSttMi5Wod26BnwqOPg0fYlxTeshqJdjxBLaVTB
 c6dQlS8nwS+GVTE9oyQNFY9IcGqCYyRyz+32MYpRrOo7cIYglL0iXBv0RmMObQ90AN27pt//6dO
 m+u2Fr3SN7r+lSnzXTy1e1zsfMl6PGSWD43kE=
X-Google-Smtp-Source: AGHT+IGrr202ZZRkeQMb+cT9ZqK2M0PKDrGUbpbDrXrBWb3VildiNpZk4ONShaehVCchlD9uDe8bXw==
X-Received: by 2002:a05:600c:3f1b:b0:46d:5189:3583 with SMTP id
 5b1f17b1804b1-46fa9a20793mr173467705e9.0.1760440343444; 
 Tue, 14 Oct 2025 04:12:23 -0700 (PDT)
Received: from dragon.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb32a84edsm127112145e9.4.2025.10.14.04.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 04:12:23 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Tue, 14 Oct 2025 13:11:59 +0200
Message-ID: <20251014111159.73073-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760440343; x=1761045143; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RWkypqwUS795YtMqNmI0YOfh4+7EZe+uhAXk8pHx+28=;
 b=fCp6zkMxTz7yia83PEqftgvseV0Hus8aV2QTg6bs7GBwUeTQXypGnJyLQhD51gLp6L
 dvmJK7YUy3yYFa2Q92TD79AI7NKs8dq0xRV3EO+INrGB7rrUl1IXfEOzFCr6aL/SgxMM
 oLxpR21otII8ZUzw0syJtfCKho0RcerkAL3T/FOdeKrVo0K/ehmKR0zvT5+HNLd6LfDE
 nwR4pTZOq3oN5gxEmagjb8p02mtzugsVtAuwsm8DNspndmVlEJ/bKG9oOGtHslsoEx7w
 +dKErt9PktOXa78ln4WvjUgnMSIvVa58xQD0ckD70Q1GcsAEB5/2UH9eWmBQcUfcjF8R
 vBHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fCp6zkMx
Subject: [Buildroot] [PATCH for 2025.02.x] package/redis: security bump to
 v7.2.11
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
https://github.com/redis/redis/blob/7.2.11/00-RELEASENOTES

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
index 630f6b6d76..aa3253335e 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  e576ad54bc53770649c556933ecd555b975e3dac422e46356102436a437b43c7  redis-7.2.10.tar.gz
+sha256  2f9886eca68d30114ad6a01da65631f8007d802fd3e6c9fac711251e6390323d  redis-7.2.11.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index a2d4fbe138..cd9736663b 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.10
+REDIS_VERSION = 7.2.11
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
