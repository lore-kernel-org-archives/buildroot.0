Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8EAC4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 18:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81A9C607AD;
	Sat, 27 Apr 2024 18:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HnxYZ9AekuUN; Sat, 27 Apr 2024 18:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E627A60859
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E627A60859;
	Sat, 27 Apr 2024 18:38:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECB391BF3C1
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2739482CDE
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 18:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbb35luuE_Vy for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 18:38:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01F9482CEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01F9482CEC
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01F9482CEC
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 18:38:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-346406a5fb9so2486612f8f.1
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 11:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714243086; x=1714847886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mUGGBxqQTHpZlb7Nq73Jl9sb/L6CYe7+VhBlJbe5kt8=;
 b=wgHR9n6Zm4rsWOfY1ol8c2vhpCIeqswwI0JXIr6PC3DlZQCoXAbSt3lrqQS/JzQyR/
 bw9Csl0h4U8I6Kg6rMrz5Sr16dVXYXxF1mXZ8OsvEWbx99CKUdryKd9CChT5wMZfT8+D
 r6s9xuG4NLkr+HYDjxEWdikE828bx4ImeXXUMY6cUqAU0dI1pIwJWxplGEs7rDZEsAu0
 MWAv8/Bk284TEVYNMiYbfN62f+OGGEg4IC5XkJr0rJsV6CfqRCVttESw49Rc46fz4AKB
 DI8SHdNGDvFqRKNGVCIfTUajv7DlHEvIbQnhnEj85zBPYQ7HzFBYYKpJaneIoryPznHP
 x1zA==
X-Gm-Message-State: AOJu0YyXFJ7kKPQVfRMsK1T/zs5GUKEPqB1hpzyxDXsIaXcpmdGueEfD
 u51uHcmmIlTrmtjc5vqJQoNe9xoekCJgmIoiF1x3N3WpVx5yK8pM7s7YvQ==
X-Google-Smtp-Source: AGHT+IHx2vzKJ8wysu3E4kK9C0M3vetKZGcrgnz6w5rB1uH8c7EiLoAmjS8LL/6i3wWB1Em1D7cAPA==
X-Received: by 2002:adf:9dc4:0:b0:34c:9809:93ac with SMTP id
 q4-20020adf9dc4000000b0034c980993acmr1408713wre.24.1714243085764; 
 Sat, 27 Apr 2024 11:38:05 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 k21-20020adfb355000000b0034c6b368aecsm4136589wrd.26.2024.04.27.11.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 11:38:05 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 20:37:53 +0200
Message-ID: <41552f4a1dc68983bb3edfd6a2b466581f5f91e5.1714243078.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714243078.git.yann.morin.1998@free.fr>
References: <cover.1714243078.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714243086; x=1714847886; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mUGGBxqQTHpZlb7Nq73Jl9sb/L6CYe7+VhBlJbe5kt8=;
 b=VCD+HzmRyDDEKG4BaQubmUnRfgtg3YXfOb8QARXQOIQRRoiAgBQgCnQIit7prwHGdM
 sN/4jSo+U+Oqf5ZHkvuQgr16e98xfL1xFdWO+iAi6Ilu35oQs/RoZGZNk8tkhf8y0yzA
 IxsQL6R7is1OA24eTsLXzDWA3fbe5bolkExwwx3SjMCeWebNtdqu+/8yYGohHeoqD10w
 V5s52enpglLqGripjFuNTdo/uETuVE1hKoD9M9R4SyYTa66jQQUEIzf6YWIB2t1Oj2w/
 bkJPj/q4a9LSQoRasVk4+CIQpjJapRcUdU03Ti4mOaXrZ269gvPipQondg4E1SjeoCn1
 SIhA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VCD+HzmR
Subject: [Buildroot] [PATCH 06/15 v2] package/luajit: use the git download
 for known-reproducible tarball
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
Cc: Francois Perrad <fperrad@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since version 2.1, LuaJIT follows a rolling-release scheme, which means
that any commit is as good as any other; LuaJIT uses the comitter's UNIX
timestamp as its semver patch level. It uses the git-attribute
export-subst for the .relver file that contains the %ct placeholderfor
git-archive to expand it.

We have had various instances of GitHub changing the way it generates
archives on the fly, and although it is hard to foresee a way the UNIX
timestamp could change (it's clearly defined as the number of seconds
elapsed since 1970-01-01T00:00:00Z), it's not inconceivable that GitHub
may decide to no longer expand the export-subst attributes in the
future...

To avoid any confusion, and to be future-proof, switch over to using the
git download helper, which now has support for handling export-subst in
a reproducible way. Drop the post-extract hooks as they are not needed.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Francois Perrad <fperrad@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luajit/luajit.hash | 2 +-
 package/luajit/luajit.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 578bb7a3e2..da243d8c2a 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  b518721280390e4cec1af30f6819d86756ce4234d82410a55a4e121855f64e08  luajit-41fb94defa8f830ce69a8122b03f6ac3216d392a.tar.gz
+sha256  df50bfe78919691ce9a630c8312386a8cb6ca49f327922a833e77656e82ef6c6  luajit-41fb94defa8f830ce69a8122b03f6ac3216d392a-br2.tar.gz
 
 # Locally calculated
 sha256  1130331ac861a4b4520e9c8ad0814efdc6f1e79ea55ea9c460c73733d13ccb5f  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 693e22630b..6b1c6b3386 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 LUAJIT_VERSION = 41fb94defa8f830ce69a8122b03f6ac3216d392a
-LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
+LUAJIT_SITE = https://github.com/LuaJIT/LuaJIT
+LUAJIT_SITE_METHOD = git
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
 LUAJIT_CPE_ID_VENDOR = luajit
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
