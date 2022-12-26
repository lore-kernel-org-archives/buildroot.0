Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94A9C4332F
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 07:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DC1B4035A;
	Mon, 26 Dec 2022 07:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DC1B4035A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X0s0ifSD8i3X; Mon, 26 Dec 2022 07:48:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1DB040348;
	Mon, 26 Dec 2022 07:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1DB040348
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9097F1BF228
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 07:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BAE7812D0
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 07:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BAE7812D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DAZFvBGE5Mkq for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 07:48:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D4BD812B7
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D4BD812B7
 for <buildroot@busybox.net>; Mon, 26 Dec 2022 07:48:44 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso609472wms.5
 for <buildroot@busybox.net>; Sun, 25 Dec 2022 23:48:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p3RPMvK5C3FvlNSvxpB1Cg4F9ITMlcU61N+wlik6rNI=;
 b=ddl2rudX5PCJwE4fWgL8s+5hgx9BwCxb9hk4NjkUsxBniozCgUXEe/SvpC8vpsNX/0
 U+3LhclK4UKWtme8NEEKLmJpFl2MnDmpOdr8MCXoQ7ZOepWzFN6HYNsN/jiDPID+MGsS
 2POdh196wEbritozVrkwQiVfTV4GudMpB6RlmpjmeqvcB21Hi4k9GaxTmLhoK5DHwUtE
 PdWTudu6SRXwxgD37GqAvuaQpBXn8xQHS2oPf7ACDgze8QESPCr81ax1skyb+eJ20FIb
 zZ3oK37SXz8SBELDMFgPBTo6gCXJPswMK57fepkHbm6isffyqXLiF5psYzbhHIf2wJKn
 e2uQ==
X-Gm-Message-State: AFqh2kr4ReXh8ohV4+M6QkZTGGAoqCm+K708pqQMBFjGdDPZSNu9Suri
 RBIgGxcvuDiPtHXus78TTtxigH9ldZM=
X-Google-Smtp-Source: AMrXdXu7FQ8VzmV0+djGjjRzrXQPO4Sj/7/vZodyBuTBmY7xCrZlJqzNKrycPWwGYiEpEAUhlQagMw==
X-Received: by 2002:a05:600c:35ca:b0:3d1:f2de:195a with SMTP id
 r10-20020a05600c35ca00b003d1f2de195amr15091659wmq.32.1672040922942; 
 Sun, 25 Dec 2022 23:48:42 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 j5-20020adfea45000000b0024206ed539fsm9603445wrn.66.2022.12.25.23.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 23:48:42 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 26 Dec 2022 08:48:33 +0100
Message-Id: <20221226074833.143668-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p3RPMvK5C3FvlNSvxpB1Cg4F9ITMlcU61N+wlik6rNI=;
 b=G6t2UZzpjEBvbe8/4MSwGLqVuhC8tnWUqfKsnkg/NIc2KbblqPcHJb5VVsc6dXLtJN
 sLosWnZB2S+S0Jr1M7i5sx7Z6TyFTyPGcdB8KnwwpFZxAA7z3/hmsxC4DbDreLNg4aoL
 WeG7JUnD7u6zF/6x7LwWS3RE+4FIvHRIQuuyvRx9eCKHhwyc71uzwTnz5/DjcEx7RKoW
 JnrCMMjqtXpyrpwaDcMk0Y/j7MlQvIzNjdhE8RnAe5zdoEkMxul0SHfa2t0WN4WtmAwk
 J6QIRPp1lF+Y12dW8P8okT2M0INqAHghCP1SPAea0Ov2zT1dKWB67KwE0oFNwZiSDmJr
 OrCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G6t2UZzp
Subject: [Buildroot] [PATCH] package/lua-ev: bump to version 1.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-ev/lua-ev.hash | 4 ++--
 package/lua-ev/lua-ev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-ev/lua-ev.hash b/package/lua-ev/lua-ev.hash
index eb4f4cf74..278f5f8f7 100644
--- a/package/lua-ev/lua-ev.hash
+++ b/package/lua-ev/lua-ev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4e26e05830955fdd882a1b48b535be94356582eea310327f839f830cd9250d3a  lua-ev-339426fbe528f11cb3cd1af69a88f06bba367981.tar.gz
-sha256  c224cc31feec52e33b621ccdbc245e21316a20a134a4cd8706438a3b3382e8ac  README
+sha256  26ac116722a241bf59daf5315ce0ffe751c1babea9a146ffc0a389f1af3facca  lua-ev-1.5.tar.gz
+sha256  3b6f8a25e3443c8be61fc7a91e1d27b5514d489bb3ea5986eace6fe1531aabcc  README
diff --git a/package/lua-ev/lua-ev.mk b/package/lua-ev/lua-ev.mk
index 39394875b..eec078944 100644
--- a/package/lua-ev/lua-ev.mk
+++ b/package/lua-ev/lua-ev.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LUA_EV_VERSION = 339426fbe528f11cb3cd1af69a88f06bba367981
-LUA_EV_SITE = $(call github,brimworks,lua-ev,$(LUA_EV_VERSION))
+LUA_EV_VERSION = 1.5
+LUA_EV_SITE = $(call github,brimworks,lua-ev,v$(LUA_EV_VERSION))
 LUA_EV_DEPENDENCIES = luainterpreter libev
 LUA_EV_LICENSE = MIT
 LUA_EV_LICENSE_FILES = README
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
