Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8592AC83F2F
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52CC7419AB;
	Thu, 29 Aug 2024 14:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UE09gGbN7Z3g; Thu, 29 Aug 2024 14:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0928E41A45
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0928E41A45;
	Thu, 29 Aug 2024 14:50:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 126D81BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D60C4016D
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRAMAyaQ44uT for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3F6940132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3F6940132
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3F6940132
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:32 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4280bca3960so6845715e9.3
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943031; x=1725547831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vDO0H7g6HvOhDLFIQWieU7op6I4zAnpFJIu+1DC2YaQ=;
 b=Olyv6K4vOx3pCbae/a00BiBk+oMfl5HrkoaQzEuu8WZg1a5HAjEqArMzXQThWY3Zdw
 SiuVfvzPfq2Kv4VA13vHqvYRzcrsU09WcuO9mT+ixoYAmocW+7LWFxdPx9kp1YNCG/FA
 J2rbmAdzfvYyA7D4cClkO/utApVb0GKgLUbKaESLRKh6o4uLfw0Opy2lBUn6PDfxzuaO
 5dHMiQYtWb4MBN3NQ0qoQ15Yh/H4VKuJ3dzuuBnFtS+iTziV4AD0xIUA0Hm05+vEV/Fl
 rTeYWr6VKz+T/QngZ17QkaqV7oz/8k5OV/Jy8f0ahqSxVGN+8+UuNYIyPx/XR3Z5gJT5
 qdlw==
X-Gm-Message-State: AOJu0YxhrcmsJWCEsZOMzzhDLD7oWbsNZUi+qVxhpSTlhdDuPBRp4EtU
 +Lhh9C473N6x02H6cvZcPwjNF65l386y8fmEbJo9ZfhpP2xbhMKircSUpQ==
X-Google-Smtp-Source: AGHT+IF97ysyIE2+sHAKQy5Di/6YhHMdOXbaRMvP8552hVhvozIx2uOPFIhtR5JdjmcnjrYSWnKOvQ==
X-Received: by 2002:a05:600c:354b:b0:427:d8fd:42a9 with SMTP id
 5b1f17b1804b1-42bb025d668mr25035535e9.22.1724943030526; 
 Thu, 29 Aug 2024 07:50:30 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:29 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:26 +0200
Message-Id: <20240829144940.209964-11-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943031; x=1725547831; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vDO0H7g6HvOhDLFIQWieU7op6I4zAnpFJIu+1DC2YaQ=;
 b=bCbOR3/Sz6jEUH7C3K+1CFJQ97b/ECClYuwqtvhepp2gofI2IqDNo4S7menC/4NsPm
 koRJJ3Rt5ByhMzfGZKDKexc+XGNOkfJpFWSF8h1HyNCL0zyf+Zobmgic+VuqXGYI74PA
 0VU7XWY3MCdtAyMPFMy04QfAJewL0B6RzhGkNloTCa5HtL8CXRp2UQ5bwid9/4GPCJmL
 1ft7w5RnVpks11HSgV3+fqs0DqaUFQD/2aWwMaTaKl8t3kA5uK/4e7c6Py3HSsdGxYX+
 mocwDKNhAwj3T1PCB5kkAnZFuVJNbdnTtftXfRmfcZetsVlFUowv9SQHxFfvHVnqh3Z0
 mNeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bCbOR3/S
Subject: [Buildroot] [PATCH v2 10/23] package/erlang-p1-stringprep: bump
 version to 1.0.30
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-stringprep/erlang-p1-stringprep.hash | 2 +-
 package/erlang-p1-stringprep/erlang-p1-stringprep.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
index 50a48af0a4..6df5048dce 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  b07daf2148829d513caf2931d463550e70252a78ef99696dcf444d61d93bf940  erlang-p1-stringprep-1.0.29.tar.gz
+sha256  8fc39340e73b0f77c2c77ebb486c5c2309ea3ec46afa16cc03db35d200e3a5f5  erlang-p1-stringprep-1.0.30.tar.gz
 sha256  f44415631770cb818de6d92f3961fdfe6e407a5154f84b87cc06ac27323e919c  LICENSE.ALL
 sha256  42aef2a1337ef1f45ae2832aa5aa268c79b2560fb1f3ebab519629372cb24ffe  LICENSE.TCL
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
index 09e339f57a..4f925c0682 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STRINGPREP_VERSION = 1.0.29
+ERLANG_P1_STRINGPREP_VERSION = 1.0.30
 ERLANG_P1_STRINGPREP_SITE = $(call github,processone,stringprep,$(ERLANG_P1_STRINGPREP_VERSION))
 ERLANG_P1_STRINGPREP_LICENSE = TCL (tools/*.tcl), Apache-2.0 (rest)
 ERLANG_P1_STRINGPREP_LICENSE_FILES = LICENSE.ALL LICENSE.TCL LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
