Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AFAE9A03B
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 06:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEDEC60762;
	Wed, 18 Feb 2026 06:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVfLjq0ZuZR4; Wed, 18 Feb 2026 06:28:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C11256074F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771396122;
	bh=lGZA8E1vwwsFBAVJyXcDPne4O6Mst3GQZfffUveZokA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=QcIi0V5VP3W1qeVW3iOamg2AMSy6qhWLDGq0lZnCQ0ixgVrG+AGj6l3t2oMPKPq9J
	 LCym/a3XQIn1MQ3N8e0XSXSi4DBCAmErU0dV3Do5b60g+mcYx/bIuWnkvxHRojFVXv
	 L340UAYvb9HEuZFEYYTTj2NwL+NLTkxgKga+kr+7+2670YSaBmPuSzEi1SWJIQZwkj
	 /rJroflmWm6eKEVodhnz3WXzLseH83RDheIak5NxVRH/dsUnR+0rUrRPXfEVIAy/BC
	 2R7TP3M/A6o/ncGrAHQ6o2R7t7BG/5UaXvb44Ch2AKGrHOOH2LH6KFFryWffDChRmS
	 d69zbXfD1Yuow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C11256074F;
	Wed, 18 Feb 2026 06:28:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8246270
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 06:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A593740042
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 06:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZ-Nh6XvEYTO for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 06:28:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94F0A4002A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94F0A4002A
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94F0A4002A
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 06:28:39 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-7d4cb7e10efso4415439a34.0
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 22:28:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771396118; x=1772000918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yXRul8xV0plisz5S73MQyZaCtoiISu7vXNt1ImJ8uzc=;
 b=A/q9bwYlD7+mjgfYcjS3Cbp5HbZ9AO8uipcfXHj9uDlvzV51c6IiBTqvC+rTnh2mKg
 FLbU8vhpCTgIwbRc83pYV/BFsP+XKrGgdpVUa1Wvg/a/PTSk6dH//vfMU8Pw0bxwGbrr
 4iaHtFB4PsjsvO/R6XUZ8jWv4Oqg5KrK6+4KWrFRhHuPpxdaKQHB2/fRtny60L9rHcV+
 GqSLBYP/fCBa50F4eS/CSAjEfk7Z+Mk3RlHWk4nY/CIWM0Ze7SpjOmHDuxVv4AQfKpbB
 dPgt3iMPPLyVrBEzTWJSi74ytrR5PfacHFuiUR5CamUGyXxfWEVB86czwBWqG2sarwLZ
 KaWw==
X-Gm-Message-State: AOJu0YwLxnjPtbfKtng4sAiWK4Wmnwk9lVtyR7bwNajayNish4KiYxo6
 TMJu+G1W02VC0cwUUT2zUATUA7HjDBHyG9Ll0Dvl44kpSUtreSbbHk/8gBNzYTsL
X-Gm-Gg: AZuq6aKxAVMneLK0K3/TwRK2i2UZl0pAF3zNd1MRlO0D4n3nTqwQVrt74JFD8jXZLfJ
 tYxS0NLndV9A30RzJO68Ll6HlEnM85hQjs9jJ9R9HVHnlseBvbCsBaFSeEtT/PjzS+aYIpMAsGv
 N45fbYmeU/4qTFzTaCn2EQapj12VCgGvlqukp7FQzOgXvCK5+3ojyVw+rw1t14v7+tdTPVwkutJ
 BTKwMEdivG7TYBSuDc1F+k/OlGWoK014jBFU5pIpJS6N3srO0LLwZ4ILhXLmEc0v4+7a2e/FeUs
 AEjBox0afimtamLVdS1Iwq17qwzdVggBT6zQeoVd27EJeRwMWWEuIVI3hHkjMCbnqqWq7IX4hbV
 h3Cvjd6ArDWsIJ1NeNGdWzrsUW4tjgtDdNmxnDBRos96ADwSZDgY3jXvsJEv8guED6QnpjNoavI
 M9nmW8Q0meiXviCbOSGsz6Ry+Q231tFASGDarka93QGmEDvqFJQUCXuraYsk8hACveM+/tBc4FD
 vovpYB78S2EoKuTVfYB5f8yEq9ie7/TLCHNVbTjxW7Slv0OVjsMy1zcjnYA
X-Received: by 2002:a05:6830:310f:b0:7d1:9217:94e with SMTP id
 46e09a7af769-7d4d0c18eb7mr7793744a34.26.1771396118103; 
 Tue, 17 Feb 2026 22:28:38 -0800 (PST)
Received: from james-x399.localdomain (71-33-158-51.hlrn.qwest.net.
 [71.33.158.51]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7d4d1e6ff70sm10286790a34.16.2026.02.17.22.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 22:28:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Feb 2026 23:28:31 -0700
Message-ID: <20260218062831.545089-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771396118; x=1772000918; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yXRul8xV0plisz5S73MQyZaCtoiISu7vXNt1ImJ8uzc=;
 b=LMTp8H+EY1VP9Srv2XQKXx+EK1T1n5C9hlFIPuv8dZcb9L2QXruHJAbzHj6mpjNn36
 nJc2YThmejh+cEmZfxiiyKyKc1z1gcKwJkEcup4Owjfu2YFjlUVsLlpIl+Uznw1d215v
 Imai99cL0BLQ/WpRna7XDZv0O9P0O8PG8BNU3F7yE6c6E0b7ftrBNN6k/kR6nVvi+rcv
 YNZW2GF2keputiHPXnkBvGtTrUGsHmwMPxXKBFMOOn/sUwZa3RBI/uUcZk26XU6GHTpa
 XXeFy3Tpy3sOz7lfWf8Q2qZhB4WRpqgjgf3WHTyhVQ3vs886ZolmDlcXHi27M4Y+/rxn
 mGCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LMTp8H+E
Subject: [Buildroot] [PATCH 1/1] package/lua: link liblua.so with $(LIBS)
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The shared liblua.so rule omitted $(LIBS), so direct deps like
-lm were not recorded.

Fixes:
Relink `/lib64/liblua.so.5.4.8' with `/lib64/libm.so.6' for IFUNC symbol `sin'

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/lua/5.1.5/0002-shared-libs-for-lua.patch | 2 +-
 package/lua/5.3.6/0002-shared-libs-for-lua.patch | 2 +-
 package/lua/5.4.8/0002-shared-libs-for-lua.patch | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua/5.1.5/0002-shared-libs-for-lua.patch b/package/lua/5.1.5/0002-shared-libs-for-lua.patch
index 5ae0756c4c..0ec6d97391 100644
--- a/package/lua/5.1.5/0002-shared-libs-for-lua.patch
+++ b/package/lua/5.1.5/0002-shared-libs-for-lua.patch
@@ -64,7 +64,7 @@ Index: b/src/Makefile
  	$(RANLIB) $@
  
 +$(LUA_SO): $(CORE_O) $(LIB_O)
-+	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $?
++	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $? $(LIBS)
 +	ln -fs $@.$(PKG_VERSION) $@
 +
 +ifneq (dynamic,$(BUILDMODE))
diff --git a/package/lua/5.3.6/0002-shared-libs-for-lua.patch b/package/lua/5.3.6/0002-shared-libs-for-lua.patch
index 0821007474..6c3efc0a37 100644
--- a/package/lua/5.3.6/0002-shared-libs-for-lua.patch
+++ b/package/lua/5.3.6/0002-shared-libs-for-lua.patch
@@ -64,7 +64,7 @@ Index: b/src/Makefile
  	$(RANLIB) $@
  
 +$(LUA_SO): $(CORE_O) $(LIB_O)
-+	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $?
++	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $? $(LIBS)
 +	ln -fs $@.$(PKG_VERSION) $@
 +
 +ifneq (dynamic,$(BUILDMODE))
diff --git a/package/lua/5.4.8/0002-shared-libs-for-lua.patch b/package/lua/5.4.8/0002-shared-libs-for-lua.patch
index 6115960956..d583b17193 100644
--- a/package/lua/5.4.8/0002-shared-libs-for-lua.patch
+++ b/package/lua/5.4.8/0002-shared-libs-for-lua.patch
@@ -64,7 +64,7 @@ Index: b/src/Makefile
  	$(RANLIB) $@
  
 +$(LUA_SO): $(CORE_O) $(LIB_O)
-+	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $?
++	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $? $(LIBS)
 +	ln -fs $@.$(PKG_VERSION) $@
 +
 +ifneq (dynamic,$(BUILDMODE))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
