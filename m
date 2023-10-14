Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB32ACDB465
	for <buildroot@archiver.kernel.org>; Sat, 14 Oct 2023 20:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 197C34019E;
	Sat, 14 Oct 2023 20:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 197C34019E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p1YzyfrexDKD; Sat, 14 Oct 2023 20:36:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B290D4056E;
	Sat, 14 Oct 2023 20:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B290D4056E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0A11BF47E
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 20:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4248B81C20
 for <buildroot@lists.busybox.net>; Sat, 14 Oct 2023 20:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4248B81C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X9PCWj2msAQT for <buildroot@lists.busybox.net>;
 Sat, 14 Oct 2023 20:36:49 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41A1081C19
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 20:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41A1081C19
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32d569e73acso2951474f8f.1
 for <buildroot@buildroot.org>; Sat, 14 Oct 2023 13:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697315807; x=1697920607;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wbcDY+ykN9fCCpmIGU3fhfsD5ZHcealLAyWigLyNPNM=;
 b=Otuf7LX4mNOYmtxtIsNrHxVMlgDTg2o6xK1I5/Y1+zUqQBE7T5sR8iIZoPVNLbOuLv
 owmYevuuZHqZ+HgZwCNQqctUOqeXawyuA9/u0RpHcoAgSMYP2Rhd/OSmqozD/VosBVw3
 1+utMgnq5iV28K/QuNTOL7xcBBM6tDA/ZJwhMvuO+nDU9LUw/W1N0ej8SGELZ6RL1DBB
 ZHc6ZAp4cQG8rKn/J+9qXYDjPvCP45Qey4YpaZ6YMcbD3RBIoeqtSxbwJxkWmj7+eVeq
 um7QQWOkXpfXVyqaSGDN6bOJ+5mxkSjguEzsKvycaRP0Q/B4YI7gYD+6YZ6D9EcSOInl
 XuFg==
X-Gm-Message-State: AOJu0YzsRcCCSE7/AAjnNXklleLEWZbzhGQX5GJIgIRQaWnYEI6nN+1V
 6xkCmP0OOHeQOqE8+bG2czpH/6+pEHs=
X-Google-Smtp-Source: AGHT+IF/EQPNuDIgH+gPqS7EnSJAIZQaV0aaWxA+RXp0a/UMBbH2Kt5NOI6w7w7gRhPpQxRjpwNNCg==
X-Received: by 2002:a5d:6890:0:b0:32d:9d64:b429 with SMTP id
 h16-20020a5d6890000000b0032d9d64b429mr3574675wru.21.1697315806928; 
 Sat, 14 Oct 2023 13:36:46 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8290:3800:a426:a01d:739:9ce4])
 by smtp.gmail.com with ESMTPSA id
 e16-20020adff350000000b0032d96dd703bsm5746936wrp.70.2023.10.14.13.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Oct 2023 13:36:46 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Oct 2023 22:36:45 +0200
Message-Id: <20231014203645.866867-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697315807; x=1697920607; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=wbcDY+ykN9fCCpmIGU3fhfsD5ZHcealLAyWigLyNPNM=;
 b=KPx31pKx5BR4t+lS0M5IdXtrhYsh+3xrqthaEkF0tlhzvJI0cs7bzSPdD0hWFAgu0i
 Rrp93XOnk4vx/l9jRGUbUGfm7k86A+7qqjNTmoytrZlPv/JByNMngDBJ0Ztt4IHKA9Lj
 DZOh9NW6a7RK7GlZoujpqRUId+e1WKw/TrsvkbVSUZAjxx3f71cND0M0F984CqIpOrXR
 93vah/5xsGdjLMuazYRTG0F/Wlzhp9TyHg/fo6q+dsMQYNvT3BetdK45fBGC93Ekg40t
 516VDGIDfNnZF7ydrc4pYy7ryIG34nLrx44CV6bYl9bzQP2m0JiyBzyCCoQSVMmAXpvt
 TY7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KPx31pKx
Subject: [Buildroot] [PATCH] package/gcc: remoce leftover from legacy
 PowerPC patch
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit 0c82f3f63563 (package/gcc: remove powerpc conditional patching
logic), the macro defining the conditional patch was removed, but it was
still referenced and expanded in the apply-patches hook.

Drop that now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/gcc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 4a3b780618..9a164c8374 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -44,7 +44,6 @@ define HOST_GCC_APPLY_PATCHES
 			$(APPLY_PATCHES) $(@D) $${patchdir} \*.patch || exit 1; \
 		fi; \
 	done
-	$(HOST_GCC_APPLY_POWERPC_PATCH)
 endef
 
 HOST_GCC_EXCLUDES = \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
