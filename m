Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7BEC61DD6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 12:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D41B680F53;
	Wed,  2 Sep 2026 12:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPAp6sT04f8j; Wed,  2 Sep 2026 12:11:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788351102;
	bh=IUgfLx/wmhbndQwz5QF4tUz8lB0ZB4shT1IZW25uKbo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=X3E24Hki7OJ2xb6gqK0Sd2P4Y0YDGFthQoG3JVr3yyg5bAsK2mSyZ23mVkRCMUStv
	 XCw7g+gCD7V5fSsL6Qhig6C5rw9H2NlchYoaeyCPLcertCw1mpfPbRm4+aQM+Enp3Z
	 Bun8nYAV1mvU0puPKHBO4OvCx6Th+PNKb8luXwnEr0QR+aL0U/PRfvgwygzYG6bbvE
	 VI+JVGMdq5kerrEiO8KJXoIuaGGf+dlxkX+RdkvH/EOhik79HI2G/UR2fe2GHk7tRI
	 /YyjbwTIfc7FBsIzt1XZCOCyESwzV7l56W3x8DvXLV2yTJDLPRn+JCBMvOwiT85H1u
	 3ioWYN1lnWHqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97D4F80F34;
	Wed,  2 Sep 2026 12:11:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33909465
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 12:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 192866076B
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 12:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEoUbIfvhd4j for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 12:11:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0918360726
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 12:11:39 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49b8e527d63so10740245e9.2
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 05:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788351097; x=1788955897;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qQi9pFH1BIJdw1/fzqZfOvRbtgtEaW6jx3wwH9/SMoc=;
 b=IKGTcAcmuci+MNkGNzlLGagBZwEik6Hf7VnZufwNGXbs+mYi1n+D9xpjoWC38j+kci
 lpjcv+5LexE1VCgRJ2s0zCSh+Z88Nujg4Vt7e4OFmu5gLY9syO8mR8yOJBjhdfOqq8P7
 BHDDHLhoJKEtd+Yw7zPyQp1+unyxzClUeFC0NVX83XnZix6Qqz9+yxFBrQc2Kf5d+Ma1
 A7A8s+xapFW+Hv2AOJAfww0eNkyBYoPkC15zxgIPvkYzFRKSdK1nau8nuc1fDrnrtNCr
 tZt7hc5MO1Ev1flmd4N+SDmO6rchoDR/tS8hDzYhtnDM5QYmgAuGgS9XxgX8bDtMJIJA
 IA2Q==
X-Gm-Message-State: AFuF++nEEor4YBr30v5kKKXVSp+Rs4IjYWQ50VQJ4sjjURTGKCI5G7LH
 DFIXUkYhmeF/+eNj1O3ZvOGoCWTLpJo2CJa5KoDUkRigUzLRvE7uCJbX3wFnANK/I71M9ORxeBU
 JYfYbteQ=
X-Gm-Gg: AR+sD12V4ryiE11p0+DEoyXf6SFqXrHCyODjKFfOxmgPmHKRK4QtV+OyE0vFauKOmb4
 7sfgFWMiuWebtt0mWWQIfsyU1YNjpyfsNlHmZRgXZyrfg/1UiOZr2W8Q5GeZ+E+YlQEMbiYForq
 94tQUqVoWjWJJOTfQ4skTVreZsKi5StC2GfLPf3MKIghwx6huvgU5NHtJNwK6oDiCgwOUXO1ErQ
 7MVwoHcZm1450CCukPDbF2mNJ+zXvnt7Es4s1if5niNonxDaDQJgwi74C29CoqADj/rofSuRXFG
 xzFFKIuvh0gI2mnqXRyJ1izEmpv8WMsgJ4ZmOX+qn5QL+CRbmbcX9vMfE3OD/0UigWFYfr3aK97
 H2Tc8kH0WvitQFN7x3Xxog4PmpHTCfaCbV+eF312tnEP6AQI75F/0P+oG4TJgxJUOhLZfwfvadG
 ldMlQOc2QXds2/StboDXidXvd3R3Xm9tUv3k6Fc9wAOorjpi/hAAz1HhQHyRtJeJo5rZF/Jj+rU
 Zmd
X-Received: by 2002:a05:600c:4743:b0:49c:e3b1:d826 with SMTP id
 5b1f17b1804b1-49ce58195b0mr59478475e9.13.1788351097137; 
 Wed, 02 Sep 2026 05:11:37 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce4776131sm73066255e9.11.2026.09.02.05.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 05:11:36 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 14:11:26 +0200
Message-ID: <20260902121126.184398-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2026.05.x] package/redis: security bump to
 v8.6.6
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
https://github.com/redis/redis/blob/8.6.6/00-RELEASENOTES

This fixes CVE-2026-62356

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index bfe94b8a76..87877c1a4d 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  cd04337495fda9be071d4e1e3c6a61134f83995bd23d1794cad18f878b7012ad  redis-8.6.5.tar.gz
+sha256  8b1b04f77910780a141bef7d66990d2f6171209ce615dbedbfa3b82ebfaf0887  redis-8.6.6.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index b08cf9ab92..88432df3a6 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.6.5
+REDIS_VERSION = 8.6.6
 REDIS_SITE = https://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
